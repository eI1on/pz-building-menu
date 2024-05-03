--- @class ISWindowWallObj : ISBuildingObject
ISWindowWallObj = ISBuildingObject:derive('ISWindowWallObj')

--- Creates a windowed wall object and places it in the game world
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the windowed wall faces north
--- @param sprite string The sprite to use for this object
function ISWindowWallObj:create(x, y, z, north, sprite)
	local cell = getWorld():getCell()
	self.sq = cell:getGridSquare(x, y, z)

	self.javaObject = IsoWindow.new(getCell(), self.sq, getSprite(sprite), north)
	self.javaObject:getModData().WindowWall = true;

	if self.corner then
		buildUtil.checkCorner(x, y, z, north, self, self.javaObject);
	end

	buildUtil.consumeMaterial(self);

	self.sq:AddSpecialObject(self.javaObject);
	self.javaObject:transmitCompleteItemToServer()
end

--- Checks for corner placement and adds a corner object if applicable
--- @param x number x coordinate
--- @param y number y coordinate
--- @param z number z coordinate
--- @param north boolean Orientation
function ISWindowWallObj:checkCorner(x, y, z, north)
	local found = false;
	local sx = x;
	local sy = y;
	local sq2 = getCell():getGridSquare(x + 1, y - 1, z);
	for i = 0, sq2:getSpecialObjects():size() - 1 do
		local item = sq2:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item:getNorth() ~= north then
			found = true;
			sx = x + 1;
			sy = y;
			break;
		end
	end
	if found then
		ISWindowWallObj:addCorner(sx, sy, z, north);
	end
end

--- Adds a corner object at the specified position
--- @param x number x coordinate
--- @param y number y coordinate
--- @param z number z coordinate
--- @param north boolean Orientation
function ISWindowWallObj:addCorner(x, y, z, north)
	local sq = getCell():getGridSquare(x, y, z);
	local corner = IsoThumpable.new(getCell(), sq, self.corner, north, self);
	corner:setCorner(true);
	corner:setCanBarricade(false);
	sq:AddSpecialObject(corner);
	corner:transmitCompleteItemToServer();
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
	o.corner = nil;
	o.stopOnRun = true;
	o.maxTime = 150;
	return o;
end
