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

    local sharedSprite = getSprite(self:getSprite())
    if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
        local props = ISMoveableSpriteProps.new(sharedSprite)
        self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq))
    end

    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
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
    o.isContainer = true;
    o.blockAllTheSquare = true;
    o.name = "Wooden Crate";
    o.dismantable = true;
    o.canBeAlwaysPlaced = true;
    o.canBeLockedByPadlock = true;
    o.buildLow = true;
    return o;
end

--- Returns the health of the wooden container
--- @return number health Health value
function ISWoodenContainer:getHealth()
    return 200 + buildUtil.getWoodHealth(self);
end

--- Validates the placement of the wooden container
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISWoodenContainer:isValid(square)
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if not self:haveMaterial(square) then return false; end


    local sharedSprite = getSprite(self:getSprite())
    if sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
        local props = ISMoveableSpriteProps.new(sharedSprite);
        return props:canPlaceMoveable("amongus", square, nil);
    end

    local selfProps = getSprite(self:getSprite()):getProperties();
    local selfIsLow = selfProps:Is("IsLow");
    local selfIsHigh = selfProps:Is("IsHigh");
    local canPlace = true;

    if square then
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
