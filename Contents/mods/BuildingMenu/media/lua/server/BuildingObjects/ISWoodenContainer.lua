local BM_Utils = require("BM_Utils")

--- @class ISWoodenContainer : ISBuildingObject
ISWoodenContainer = ISBuildingObject:derive("ISWoodenContainer");

--- Creates a wooden container and places it in the game world
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the container faces north
--- @param sprite string The sprite to use for this object
function ISWoodenContainer:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound("BreakObject");

    if self.containerType then
        local inv = ItemContainer.new();
        inv:setType(self.containerType);

        self.capacity = 50;
        local objSprite = getSprite(sprite);
        if objSprite then
            local objProps = objSprite:getProperties();
            if objProps and objProps:Is("ContainerCapacity") then
                self.capacity = tonumber(objProps:Val("ContainerCapacity")) or self.capacity;
            end
        end

        inv:setCapacity(self.capacity);
        inv:removeAllItems();
        inv:setParent(self.javaObject);
        inv:setExplored(true);
        self.javaObject:setContainer(inv);
    else
        self.javaObject:createContainersFromSpriteProperties();
        for i = 1, self.javaObject:getContainerCount() do
            self.javaObject:getContainerByIndex(i - 1):setExplored(true);
        end
    end

    local isoSprite = getSprite(sprite);
    ---@diagnostic disable-next-line: param-type-mismatch
    if self.sq and isoSprite and isoSprite:getProperties():Is("IsStackable") then
        local props = ISMoveableSpriteProps.new(isoSprite);
        self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq));
    end

    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
    self.sq:RecalcAllWithNeighbours(true);
    self.javaObject:transmitCompleteItemToServer();
end

--- Constructor for creating a new wooden container instance
--- @param sprite string Main sprite for the container
--- @param northSprite string North-facing sprite
--- @return ISWoodenContainer ISBuildingObject instance
function ISWoodenContainer:new(sprite, northSprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.blockAllTheSquare = true;
    o.name = "Container";
    o.dismantable = true;
    o.canBeAlwaysPlaced = false;
    o.canBeLockedByPadlock = true;
    o.buildMid = false;
    return o;
end

--- Returns the health of the wooden container
--- @return number health Health value
function ISWoodenContainer:getHealth()
    if self.usedTools then
        for i, tool in ipairs(self.usedTools) do
            local toolType = tool.toolType;
            if toolType == "BlowTorch" then
                return 350 + BM_Utils.getMetalHealth(self);
            end
        end
    end
    return 350 + buildUtil.getWoodHealth(self);
end

--- Validates the placement of the wooden container
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISWoodenContainer:isValid(square)
    if not square then return false; end
    if square:getObjects():size() > 8 then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if not self:haveMaterial(square) then return false; end

    local canPlace = true;

    local selfProps = getSprite(self:getSprite()):getProperties();
    local selfIsLow = selfProps:Is("IsLow");
    local selfIsHigh = selfProps:Is("IsHigh");

    if selfIsLow or selfIsHigh then
        for i = 0, square:getObjects():size() - 1 do
            local object = square:getObjects():get(i);
            local objectProps = object:getSprite():getProperties();

            -- check if the current object is a container
            if objectProps and objectProps:Is(IsoFlagType.container) then
                local objectIsLow = objectProps:Is("IsLow");
                local objectIsHigh = objectProps:Is("IsHigh");

                -- if both objects are low or both are high, prevent placement
                if (selfIsLow and objectIsLow) or (selfIsHigh and objectIsHigh) then
                    canPlace = false;
                end

                -- if one object is low and the other is high, allow placement
                if (selfIsLow and objectIsHigh) or (selfIsHigh and objectIsLow) then
                    --- this case is allowed, do nothing
                else
                    --- any other case, prevent placement
                    canPlace = false;
                end
            end
        end
    end


    local checkSquare = square;
    if self.east then
        checkSquare = getCell():getGridSquare(square:getX() + 1, square:getY(), square:getZ());
    elseif self.south then
        checkSquare = getCell():getGridSquare(square:getX(), square:getY() + 1, square:getZ());
    end
    if not checkSquare then return false; end

    if self.needToBeAgainstWall then
        for i = 0, checkSquare:getObjects():size() - 1 do
            local obj = checkSquare:getObjects():get(i)
            if ((self.north or self.south) and (obj:getProperties():Is("WallN") or obj:getProperties():Is("WallNW"))) or
                ((self.west or self.east) and (obj:getProperties():Is("WallW") or obj:getProperties():Is("WallNW"))) then
                canPlace = true;
                break;
            else
                canPlace = false;
            end
        end
    end

    local isoSprite = getSprite(self:getSprite());
    if isoSprite and (isoSprite:getProperties():Is("IsStackable") or isoSprite:getProperties():Is("IsMoveAble")) then
        local props = ISMoveableSpriteProps.new(isoSprite);
        return props:canPlaceMoveable("amongus", square, nil);
    end

    if not canPlace then return false; end
    return ISBuildingObject.isValid(self, square);
end

--- Renders a ghost tile of the wooden container for placement preview
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param square IsoGridSquare The square where the container will be placed
function ISWoodenContainer:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end
