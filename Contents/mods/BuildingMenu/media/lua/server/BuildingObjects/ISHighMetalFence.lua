---@class ISHighMetalFence : ISBuildingObject
ISHighMetalFence = ISBuildingObject:derive("ISHighMetalFence")

--- Constructor for creating a new instance of ISHighMetalFence
--- @param sprite string The sprite for the main body of the fence
--- @param sprite2 string The sprite for the second part of the fence
--- @param northSprite string The north-facing sprite for the main part
--- @param northSprite2 string The north-facing sprite for the second part
--- @return ISHighMetalFence ISBuildingObject instance
function ISHighMetalFence:new(sprite, sprite2, northSprite, northSprite2)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);

    o.sprite = sprite;
    o.sprite2 = sprite2;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;

    return o;
end

--- Creates and places the fence parts in the game world at the specified location
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Whether the fence is facing north
--- @param sprite string The sprite to use for this object
function ISHighMetalFence:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z)
    local xa, ya = self:getSquare2Pos(square, north);
    local spriteAName = self.sprite2;

    if self.north then
        spriteAName = self.northSprite2;
    end

    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);

    buildUtil.consumeMaterial(self);
end

--- Adds a fence part to the world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Whether the part is facing north
--- @param sprite string The sprite for this part
--- @param index integer The index of the part
function ISHighMetalFence:createPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);
    if self:partExists(self.sq, index) then return; end

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    self.javaObject:setThumpSound("ZombieThumpMetal");
    self.javaObject:setHealth(self:getHealth());

    buildUtil.setInfo(self.javaObject, self);

    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

--- Returns the health of the fence based on material properties
--- @return integer health The calculated health of the fence
function ISHighMetalFence:getHealth()
    return 500 + buildUtil.getWoodHealth(self);
end

--- Renders the fence as a ghost tile at the specified location
--- This function is typically called to show where the fence will be placed
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the fence will be placed
function ISHighMetalFence:render(x, y, z, square)
    local spriteName;
    if not self:partExists(square, 1) then
        spriteName = self:getSprite();
        local sprite = IsoSprite.new();
        sprite:LoadFramesNoDirPageSimple(spriteName);

        local spriteFree = ISBuildingObject.isValid(self, square);
        if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
            spriteFree = false;
        end
        if spriteFree then
            sprite:RenderGhostTile(x, y, z);
        else
            sprite:RenderGhostTileRed(x, y, z);
        end
    end


    local spriteAName = self.sprite2;
    local xa, ya = self:getSquare2Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, z);
    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
    end

    if squareA == nil and getWorld():isValidSquare(xa, ya, z) then
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, z);
        getCell():ConnectNewSquare(squareA, false);
    end

    local spriteAFree = true;
    local existsA = self:partExists(squareA, 2);
    if not existsA and not buildUtil.canBePlace(self, squareA) then
        spriteAFree = false;
    end

    if squareA and (squareA:isSomethingTo(square) or buildUtil.stairIsBlockingPlacement(squareA, true, self.north)) then
        spriteAFree = false;
    end

    if not existsA then
        local spriteA = IsoSprite.new();
        spriteA:LoadFramesNoDirPageSimple(spriteAName);
        if spriteAFree then
            spriteA:RenderGhostTile(xa, ya, z);
        else
            spriteA:RenderGhostTileRed(xa, ya, z);
        end
    end
end


---Checks if a single tile is valid for furniture placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISHighMetalFence:checkSingleTileValidity(square)
    if not square then return false; end
	if not self:haveMaterial(square) then return false; end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end
	if square:isVehicleIntersecting() then return false; end

    -- if all checks passed, return true
    return true;
end


--- Validates if the fence can be placed at the given square
--- @param square IsoGridSquare The square to check for placement validity
--- @return boolean validity Returns true if the fence can be placed, otherwise false
function ISHighMetalFence:isValid(square)
    -- check the primary square (part 1)
    if not self:partExists(square, 1) and not self:checkSingleTileValidity(square) then
        return false;
    end

    -- function to check objects in a square
    local function checkObjects(sq)
        for i = 1, sq:getObjects():size() do
            local object = sq:getObjects():get(i - 1);
            local sprite = object:getSprite();

            if sprite then
                local properties = sprite:getProperties();
                local spriteGrid = sprite:getSpriteGrid();
                if (properties:Is(IsoFlagType.collideN) and self.north) or
                    (properties:Is(IsoFlagType.collideW) and not self.north) or
                    (spriteGrid and ((self.north and spriteGrid:getSpriteGridPosY(sprite) > 0) or
                        (not self.north and spriteGrid:getSpriteGridPosX(sprite) > 0))) then
                    return false;
                end
            end

            if instanceof(object, "IsoThumpable") and object:getNorth() == self.north and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare() then return false; end

            if (instanceof(object, "IsoWindow") or instanceof(object, "IsoDoor")) and object:getNorth() == self.north then return false; end

            local spriteGrid = sprite and sprite:getSpriteGrid();
            if spriteGrid then
                local gridX = spriteGrid:getSpriteGridPosX(sprite);
                local gridY = spriteGrid:getSpriteGridPosY(sprite);
                if self.north and gridY > 0 then
                    return false;
                end
                if not self.north and gridX > 0 then
                    return false;
                end
            end
        end
        return true;
    end

    -- check current square
    if not checkObjects(square) then return false; end
    -- check for stair blocking
    if buildUtil.stairIsBlockingPlacement(square, true, self.north) then return false; end

    -- check adjacent square
    local xa, ya = self:getSquare2Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    if not squareA or not squareA:hasFloor(self.north) or (not self:partExists(squareA, 2) and not squareA:isFreeOrMidair(false)) then
        return false;
    end

    -- check objects in adjacent square
    if not checkObjects(squareA) then return false; end
    -- check stair blocking in adjacent square
    if buildUtil.stairIsBlockingPlacement(squareA, true, self.north) then return false; end

    return true;
end

--- Calculates the position for the second part of the fence based on orientation
--- @param square IsoGridSquare The square of the main part
--- @param north boolean Whether the fence is facing north
--- @return integer x, integer y, integer z coordinates for the second part
function ISHighMetalFence:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end

local function safeCallMethod(object, methodName, ...)
    if type(object[methodName]) == "function" then
        return object[methodName](object, ...);
    end
end

---Checks if a part of the furniture already exists on a given square
---@param square IsoGridSquare The square to check
---@param index integer The index of the part to check for
---@return boolean exists
function ISHighMetalFence:partExists(square, index)
    local objects = square:getSpecialObjects();
    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        local sprite = object:getSprite();
        if object and sprite then
            local spriteName = sprite:getName();
            local isObjectNorth = safeCallMethod(object, "getNorth");
            local expectedSpriteName = self:getSpriteNameForPart(index, isObjectNorth);
            if spriteName == expectedSpriteName then
                return true;
            end
        end
    end
    return false;
end


---Gets the sprite name for a part based on its index and orientation
---@param index integer The index of the part
---@param north boolean The orientation of the part
---@return string spriteName The sprite name
function ISHighMetalFence:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
