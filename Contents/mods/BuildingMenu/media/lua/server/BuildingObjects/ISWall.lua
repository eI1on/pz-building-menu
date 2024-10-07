local BM_Utils = require("BM_Utils");

---@class ISWall: ISBuildingObject
ISWall = ISBuildingObject:derive("ISWall");

---Creates a wall and places it in the world
---@param x number The x coordinate in the world
---@param y number The y coordinate in the world
---@param z number The z coordinate (floor level)
---@param north boolean Whether the wall is facing north
---@param sprite string The sprite to use for this object
function ISWall:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);

	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);

	if not self.health then
		self.javaObject:setMaxHealth(self:getHealth());
	else
		self.javaObject:setMaxHealth(self.health);
	end
	self.javaObject:setHealth(self.javaObject:getMaxHealth());

	self.javaObject:setName(self.name);
	self.javaObject:setBreakSound("BreakObject");

	self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex());
	self.sq:RecalcAllWithNeighbours(true);

	buildUtil.checkCorner(x, y, z, north, self, self.javaObject);

	if self.attachedSprites ~= nil then
		local attachedSprites = nil;
		if self.north then
			attachedSprites = self.attachedSprites.northSprite;
		elseif self.west then
			attachedSprites = self.attachedSprites.sprite;
		elseif self.south then
			attachedSprites = self.attachedSprites.southSprite;
		elseif self.east then
			attachedSprites = self.attachedSprites.eastSprite;
		end

		if attachedSprites ~= nil then
			self.javaObject:setAttachedAnimSprite(ArrayList:new());
			for i = 1, #attachedSprites do
				self.javaObject:getAttachedAnimSprite():add(getSprite(attachedSprites[i]):newInstance());
			end
		end
	end

	self.javaObject:transmitCompleteItemToServer();
end

---Checks if there is a corner at the given position
---@param x number The x coordinate in the world
---@param y number The y coordinate in the world
---@param z number The z coordinate (floor level)
---@param north boolean Whether the wall is facing north
function ISWall:checkCorner(x, y, z, north)
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
		ISWall:addCorner(sx, sy, z, north);
	end
end

---Adds a corner wall piece at the specified location
---@param x number The x coordinate in the world
---@param y number The y coordinate in the world
---@param z number The z coordinate (floor level)
---@param north boolean Whether the corner piece is facing north
function ISWall:addCorner(x, y, z, north)
	local sq = getCell():getGridSquare(x, y, z);
	local corner = IsoThumpable.new(getCell(), sq, "TileWalls_51", north, self);
	corner:setCorner(true);
	corner:setCanBarricade(false);
	sq:AddSpecialObject(corner);
	corner:transmitCompleteItemToServer();
end

---Handles the animation when the timed action starts
---@param action ISBaseTimedAction The action being performed
function ISWall:onTimedActionStart(action)
	if self.firstItem == "BlowTorch" then
		ISBuildingObject.onTimedActionStart(self, action);
		return;
	end
	if self.noNeedHammer then
		-- Log Wall
		action:setActionAnim("Loot");
		action.character:SetVariable("LootPosition", "High");
		action:setOverrideHandModels(nil, nil);
		return;
	end
	ISBuildingObject.onTimedActionStart(self, action);
end

---Constructor for ISWall
---@param sprite string
---@param northSprite string
---@param corner string
---@return ISWall ISBuildingObject instance
function ISWall:new(sprite, northSprite, corner)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.corner = corner;
	o.canBarricade = true;
	o.name = "Wooden Wall";
	o.isWallLike = true;
	return o;
end

-- Return the health of the new wall
---@return number health
function ISWall:getHealth()
	if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 700 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	if self.sprite == "carpentry_02_80" then
		return 600 + buildUtil.getWoodHealth(self);
	else
		return 500 + buildUtil.getWoodHealth(self);
	end
end

---@param square IsoGridSquare The square to check for the first part
---@return boolean validity
function ISWall:isValid(square)
	if not self:haveMaterial(square) then return false; end

	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false; end

	for i = 1, square:getObjects():size() do
		local object = square:getObjects():get(i - 1);
		local sprite = object:getSprite();
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and self.north) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not self.north))) or
			((instanceof(object, "IsoThumpable") and (object:getNorth() == self.north)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
			(instanceof(object, "IsoWindow") and object:getNorth() == self.north) or
			(instanceof(object, "IsoDoor") and object:getNorth() == self.north) then
			return false;
		end

		-- Forbid placing walls between parts of multi-tile objects like couches.
		-- TODO: Check for parts being destroyed.
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

	if buildUtil.stairIsBlockingPlacement(square, true, (self.nSprite == 4 or self.nSprite == 2)) then return false; end

	-- if we don't have floor we gonna check if there's a stairs under it, in this case we allow the build
	if not square:hasFloor(self.north) then
		local belowSQ = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1);
		if belowSQ then
			if self.north and not belowSQ:HasStairsWest() then return false; end
			if not self.north and not belowSQ:HasStairsNorth() then return false; end
		end
	end

	return true;
end

--- Renders a ghost tile of the wall for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the wall will be placed
function ISWall:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end

---Returns the index of the object in the square
---@return number index The index of the object in the grid square
function ISWall:getObjectIndex()
	for i = self.sq:getObjects():size(), 1, -1 do
		local object = self.sq:getObjects():get(i - 1);
		local props = object:getProperties();
		if props and props:Is(IsoFlagType.solidfloor) then
			return i;
		end
	end
	return -1;
end
