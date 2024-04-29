local BM_Utils = require("BM_Utils");

---@class ISMetalWall: ISBuildingObject
ISMetalWall = ISBuildingObject:derive('ISMetalWall')

--- Create and place a metal wall in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the wall is facing north
--- @param sprite string The sprite to use for the wall
function ISMetalWall:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    self.javaObject:setMaxHealth(self.health or self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setName(self.name);
    self.javaObject:setBreakSound("BreakObject");


    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex());
    self.sq:RecalcAllWithNeighbours(true);

    buildUtil.checkCorner(x, y, z, north, self, self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

--- Constructor for a new metal wall instance
--- @param sprite string Main sprite for the wall
--- @param northSprite string North-facing sprite
--- @param corner string Optional parameter defining corner specifics
--- @return ISMetalWall ISBuildingObject instance
function ISMetalWall:new(sprite, northSprite, corner)
    local o = setmetatable({}, { __index = self });
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.corner = corner;
    o.canBarricade = true;
    o.name = "Metal Wall";
    o.isWallLike = true;
    return o;
end

--- Calculates the health of the metal wall
--- @return integer health The calculated health based on construction skills and traits
function ISMetalWall:getHealth()
    return 400 + BM_Utils.getMetalHealth(self);
end

--- Validates if the metal wall can be placed on the specified square
--- @param square IsoGridSquare The square to validate for placement
--- @return boolean validity Returns true if the wall can be placed, otherwise false
function ISMetalWall:isValid(square)
	if not self:haveMaterial(square) then return false; end

	--	if not buildUtil.canBePlace(self, square) then return false end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false end

	for i = 1, square:getObjects():size() do
		local object = square:getObjects():get(i - 1);
		local sprite = object:getSprite()
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and self.north) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not self.north))) or
			((instanceof(object, "IsoThumpable") and (object:getNorth() == self.north)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
			(instanceof(object, "IsoWindow") and object:getNorth() == self.north) or
			(instanceof(object, "IsoDoor") and object:getNorth() == self.north) then
			return false;
		end

		-- Forbid placing walls between parts of multi-tile objects like couches.
		-- TODO: Check for parts being destroyed.
		local spriteGrid = sprite and sprite:getSpriteGrid()
		if spriteGrid then
			local gridX = spriteGrid:getSpriteGridPosX(sprite)
			local gridY = spriteGrid:getSpriteGridPosY(sprite)
			if self.north and gridY > 0 then
				return false;
			end
			if not self.north and gridX > 0 then
				return false;
			end
		end
	end

	if buildUtil.stairIsBlockingPlacement(square, true, (self.nSprite == 4 or self.nSprite == 2)) then return false; end

	-- if we don't have floor we gonna check if there's a stairs under it, in this case we allow the build
	if not square:hasFloor(self.north) then
		local belowSquare = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1)
		if belowSquare then
			if self.north and not belowSquare:HasStairsWest() then return false; end
			if not self.north and not belowSquare:HasStairsNorth() then return false; end
		end
	end

	return true -- square:isFreeOrMidair(false);
end

--- Renders a ghost tile of the metal wall for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the wall will be placed
function ISMetalWall:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Returns the appropriate index for adding the metal wall to the special object stack of a square
--- @return integer index The index in the special objects array where the wall should be placed
function ISMetalWall:getObjectIndex()
    for i = self.sq:getObjects():size(), 1, -1 do
        local object = self.sq:getObjects():get(i - 1)
        if object:getProperties():Is(IsoFlagType.solidfloor) then
            return i;
        end
    end
    return -1;
end