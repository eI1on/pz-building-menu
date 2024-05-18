local BM_Utils = require("BM_Utils")

---@class ISFridge : ISBuildingObject
ISFridge = ISBuildingObject:derive("ISFridge");

--- Creates and initializes a fridge in the game world at the specified location
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Whether the fridge is facing north
--- @param sprite string The sprite to use for this object
function ISFridge:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	self.javaObject:setMaxHealth(self:getHealth());
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	self.javaObject:setBreakSound("BreakObject");

	self.javaObject:createContainersFromSpriteProperties();
	for i = 1, self.javaObject:getContainerCount() do
		self.javaObject:getContainerByIndex(i - 1):setExplored(true);
	end

	local sharedSprite = getSprite(self:getSprite());
	if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
		local props = ISMoveableSpriteProps.new(sharedSprite);
		self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq));
	end

	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);

	self.sq:AddSpecialObject(self.javaObject);
	self.sq:RecalcAllWithNeighbours(true);
	self.javaObject:transmitCompleteItemToServer();
end

--- Constructor for creating a new instance of ISFridge
--- @param playerNum integer The player index who is building the fridge
--- @param name string The name of the fridge
--- @param sprite string The sprite for the main body of the fridge
--- @param northSprite string The sprite when the fridge is facing north
--- @return ISFridge ISBuildingObject instance
function ISFridge:new(playerNum, name, sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.player = playerNum;
	o.isContainer = true;
	o.blockAllTheSquare = true;
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.canBeAlwaysPlaced = true;
	o.canBeLockedByPadlock = true;
	o.buildMid = true;
	return o;
end

--- Calculates the health of the fridge based on construction skills
--- @return integer health The total health of the fridge
function ISFridge:getHealth()
    if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 300 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 300 + buildUtil.getWoodHealth(self);
end

--- Determines if the fridge can be placed at the specified square
--- @param square IsoGridSquare The square to check
--- @return boolean validity True if the fridge can be placed, false otherwise
function ISFridge:isValid(square)
	if not square then return false; end
	if not ISBuildingObject.isValid(self, square) then return false; end
	if self.needToBeAgainstWall then
		for i = 0, square:getObjects():size() - 1 do
			local obj = square:getObjects():get(i);
			if (self.north and obj:getProperties():Is("WallN")) or (not self.north and obj:getProperties():Is("WallW")) then
				return true;
			end
		end
		return false;
	else
		local sharedSprite = getSprite(self:getSprite());
		if square and sharedSprite and sharedSprite:getProperties():Is("IsMoveAble") then
			local props = ISMoveableSpriteProps.new(sharedSprite);
			return props:canPlaceMoveable("bogus", square, nil);
		end
		if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
	end
	return true;
end

--- Renders the fridge as a ghost tile at the specified location
--- This function is typically called to show where the fridge will be placed
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the fridge will be placed
function ISFridge:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end
