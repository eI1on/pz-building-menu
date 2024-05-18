local BM_Utils = require("BM_Utils")

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

    o.sprite2 = sprite2;
    o.northSprite2 = northSprite2;

    o.isWallLike = true;

    o.RENDER_SPRITE_CACHE = {};

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
    self.sq = cell:getGridSquare(x, y, z);

    local xa, ya = self:getSquare2Pos(self.sq, north);

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
    local square = cell:getGridSquare(x, y, z);

    if self:partExists(square, index) then return; end

    self.javaObject = IsoThumpable.new(cell, square, sprite, north, self);
    self.javaObject:setThumpSound("ZombieThumpMetal");
    self.javaObject:setHealth(self:getHealth());

    buildUtil.setInfo(self.javaObject, self);

    square:AddSpecialObject(self.javaObject, self:getObjectIndex(square));
    square:RecalcAllWithNeighbours(true);
    self.javaObject:transmitCompleteItemToServer();
end

--- Returns the health of the fence based on material properties
--- @return integer health The calculated health of the fence
function ISHighMetalFence:getHealth()
    if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 700 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 700 + buildUtil.getWoodHealth(self);
end

--- Renders the fence as a ghost tile at the specified location
--- This function is typically called to show where the fence will be placed
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the fence will be placed
function ISHighMetalFence:render(x, y, z, square)
    local haveMaterials = self:haveMaterial(square);

    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
---@diagnostic disable-next-line: param-type-mismatch
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, za);
        getCell():ConnectNewSquare(squareA, false);
    end

    -- initial checks for the primary square
    local spriteFree = true;
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) or not haveMaterials then
        spriteFree = false;
    end

    -- check validity for additional squares
    local spriteAFree = true;
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) or not haveMaterials then
        spriteAFree = false;
    end

    if square:isSomethingTo(squareA) then spriteFree = false; spriteAFree = false; end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z);
        self:renderFloorHelperTile(2, xa, ya, za);
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
end


---Renders a ghost tile part of the high metal wall
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISHighMetalFence:renderPart(spriteName, x, y, z, isFree)
    if not self.RENDER_SPRITE_CACHE[spriteName] then
        local sprite = IsoSprite.new();
        sprite:LoadFramesNoDirPageSimple(spriteName);
        self.RENDER_SPRITE_CACHE[spriteName] = sprite;
    end
    local sprite = self.RENDER_SPRITE_CACHE[spriteName];
    if isFree then
        sprite:RenderGhostTile(x, y, z);
    else
        sprite:RenderGhostTileRed(x, y, z);
    end
end


---Renders a floor helper tile
---@param index integer The index of the part to check for
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
function ISHighMetalFence:renderFloorHelperTile(index, x, y, z)
    local helperSpriteName = 'carpentry_02_56';
    if not self.RENDER_SPRITE_FLOOR_CACHE then
        self.RENDER_SPRITE_FLOOR_CACHE = {};
    end
    if not self.RENDER_SPRITE_FLOOR_CACHE[index] then
        self.RENDER_SPRITE_FLOOR_CACHE[index] = IsoSprite.new();
        self.RENDER_SPRITE_FLOOR_CACHE[index]:LoadFramesNoDirPageSimple(helperSpriteName);
    end
    self.RENDER_SPRITE_FLOOR_CACHE[index]:RenderGhostTile(x, y, z);
end


-- function to check objects in a square
local function checkObjects(square, isNorth)
	for i=1,square:getObjects():size() do
		local object = square:getObjects():get(i-1);
		local sprite = object:getSprite();
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and isNorth) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not isNorth))) or
				((instanceof(object, "IsoThumpable") and (object:getNorth() == isNorth)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
				(instanceof(object, "IsoWindow") and object:getNorth() == isNorth) or
				(instanceof(object, "IsoDoor") and object:getNorth() == isNorth) then
			return false;
		end
		local spriteGrid = sprite and sprite:getSpriteGrid();
		if spriteGrid then
			local gridX = spriteGrid:getSpriteGridPosX(sprite);
			local gridY = spriteGrid:getSpriteGridPosY(sprite);
			if isNorth and gridY > 0 then
				return false;
			end
			if not isNorth and gridX > 0 then
				return false;
			end
		end
	end
    return true;
end

---Checks if a single tile is valid for furniture placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISHighMetalFence:checkSingleTileValidity(square)
    if not square then return false; end
	if square:isVehicleIntersecting() then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true, self.north) then return false; end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

    -- if we don't have floor we gonna check if there's a stairs under it, in this case we allow the build
	if not square:hasFloor(self.north) then
		local belowSQ = getCell():getGridSquare(square:getX(), square:getY(), square:getZ()-1)
		if belowSQ then
			if self.north and not belowSQ:HasStairsWest() then return false; end
			if not self.north and not belowSQ:HasStairsNorth() then return false; end
		end
	end

    -- if all checks passed, return true
    return checkObjects(square, self.north);
end


--- Validates if the fence can be placed at the given square
--- @param square IsoGridSquare The square to check for placement validity
--- @return boolean validity Returns true if the fence can be placed, otherwise false
function ISHighMetalFence:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, za);

    if not squareA then return false; end

    if square:isSomethingTo(squareA) then return false; end

    -- check the primary square (part 1)
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) then
        return false;
    end
    -- check validity for additional squares
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
        return false;
    end
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

function ISHighMetalFence:getObjectIndex(square)
	for i = square:getObjects():size(),1,-1 do
		local object = square:getObjects():get(i-1);
		local props = object:getProperties();
		if props and props:Is(IsoFlagType.solidfloor) then
			return i;
		end
	end
	return -1;
end
