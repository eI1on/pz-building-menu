local BM_Utils = require("BM_Utils");

--- @class ISWindowWallObj : ISBuildingObject
ISWindowWallObj = ISBuildingObject:derive('ISWindowWallObj')

--- Creates a window wall object and places it in the game world
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the window wall faces north
--- @param sprite string The sprite to use for this object
function ISWindowWallObj:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);

	if not BM_Utils.checkCorner(x, y, z, north, self) then
		self.javaObject = IsoWindow.new(cell, self.sq, getSprite(sprite), north);
		BM_Utils.setAttachedSprites(self, false);
		BM_Utils.checkPillar(x, y, z, north, self);
	end

	self.javaObject:getModData().WindowWall = true;
	buildUtil.consumeMaterial(self);

	self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex());
	self.sq:RecalcAllWithNeighbours(true);

	self.javaObject:transmitCompleteItemToServer();
end

--- Validates the placement of the windowed wall
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISWindowWallObj:isValid(square)
	if not self:haveMaterial(square) then return false; end

	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false; end

	if buildUtil.stairIsBlockingPlacement(square, true, (self.nSprite == 4 or self.nSprite == 2)) then return false; end

	if not square:hasFloor(self.north) then
		local belowSquare = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1);
		if belowSquare then
			if self.north and not belowSquare:HasStairsWest() then return false; end
			if not self.north and not belowSquare:HasStairsNorth() then return false; end
		end
	end

	if self.canBeAlwaysPlaced then return true; end

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

--- Renders a ghost tile of the windowed wall for placement preview
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param square IsoGridSquare The square where the windowed wall will be placed
function ISWindowWallObj:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for creating a new windowed wall object instance
--- @param sprite string Main sprite for the windowed wall
--- @param northSprite string North-facing sprite
--- @param playerNum integer The player index who is building the window wall
--- @return ISWindowWallObj ISBuildingObject instance
function ISWindowWallObj:new(sprite, northSprite, playerNum)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.player = playerNum;
	o.canBarricade = true;
	o.dismantable = true;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 150;
	return o;
end

---Returns the index of the object in the square
---@return number index The index of the object in the grid square
function ISWindowWallObj:getObjectIndex()
	for i = self.sq:getObjects():size(), 1, -1 do
		local object = self.sq:getObjects():get(i - 1);
		local props = object:getProperties();
		if props and props:Is(IsoFlagType.solidfloor) then
			return i;
		end
	end
	return -1;
end
