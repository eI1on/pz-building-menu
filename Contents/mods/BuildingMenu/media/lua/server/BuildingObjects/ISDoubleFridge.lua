--- @class ISDoubleFridge : ISBuildingObject
ISDoubleFridge = ISBuildingObject:derive("ISDoubleFridge");

---Constructor for ISDoubleFridge
---@param playerNum integer The player index creating the double fridge
---@param name string The name of the double fridge
---@param sprite string The sprite for the first part of the double fridge
---@param sprite2 string The sprite for the second part of the double fridge
---@param northSprite string The north-facing sprite for the first part
---@param northSprite2 string The north-facing sprite for the second part
---@return ISDoubleFridge ISBuildingObject instance
function ISDoubleFridge:new(playerNum, name, sprite, sprite2, northSprite, northSprite2)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.player = playerNum;
	o.sprite2 = sprite2;
	o.northSprite2 = northSprite2;
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = false;
	return o;
end

---Creates the double fridge and places it in the world
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@param north boolean Whether the double fridge is facing north
---@param sprite string The sprite to use for this object
function ISDoubleFridge:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self:createPart(self.sq, north, sprite);

	local spriteAName = self.northSprite2;

	local xa = x;
	local ya = y;

	if north then
		ya = ya - 1;
	else
		spriteAName = self.sprite2;
		xa = xa - 1;
	end
	local squareA = cell:getGridSquare(xa, ya, z);

	local oldModData = self.modData;
	self.modData = {};
	self:createPart(squareA, north, spriteAName);

	self.modData = oldModData;
	buildUtil.consumeMaterial(self);
end

---Determines which square the player should walk to in order to interact with the double fridge
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@return boolean
function ISDoubleFridge:walkTo(x, y, z)
	local playerObj = getSpecificPlayer(self.player);
	local square = getCell():getGridSquare(x, y, z);
	local square2 = self:getSquare2(square, self.north);
	if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
		return luautils.walkAdj(playerObj, square);
	end
	return luautils.walkAdj(playerObj, square2);
end

---Sets information for the double fridge object
---@param square IsoGridSquare The square where the double fridge will be placed
---@param north boolean Whether the double fridge is facing north
---@param sprite string The sprite to use for this part of the double fridge
function ISDoubleFridge:createPart(square, north, sprite)
	local thumpable = IsoThumpable.new(getCell(), square, sprite, north, self);

	buildUtil.setInfo(thumpable, self);

	thumpable:createContainersFromSpriteProperties();

	for i = 1, thumpable:getContainerCount() do
		thumpable:getContainerByIndex(i - 1):setExplored(true);
	end

	thumpable:setMaxHealth(self:getHealth());
	thumpable:setHealth(thumpable:getMaxHealth());

	local sharedSprite = getSprite(self:getSprite());
	if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
		local props = ISMoveableSpriteProps.new(sharedSprite);
		self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq));
	end

	thumpable:setBreakSound("BreakObject");
	square:AddSpecialObject(thumpable);
	thumpable:transmitCompleteItemToServer();
end

---Removes the double fridge object from the ground
---@param square IsoGridSquare The square from which to remove the double fridge
function ISDoubleFridge:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
			break;
		end
	end

	local xa = square:getX();
	local ya = square:getY();

	if self:getNorth() then
		ya = ya - 1;
	else
		xa = xa - 1;
	end

	square = getCell():getGridSquare(xa, ya, square:getZ());
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
			break;
		end
	end
end

---Calculates the health of the double fridge based on carpentry skill
---@return integer health
function ISDoubleFridge:getHealth()
	return 400 + buildUtil.getWoodHealth(self);
end

---Renders a ghost tile of the double fridge for placement preview
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@param square IsoGridSquare The square where the double fridge will be placed
function ISDoubleFridge:render(x, y, z, square)
	-- prepare the rendering for the first part of the double fridge
	local spriteName = self:getSprite();
	if not self.RENDER_SPRITE then
		self.RENDER_SPRITE = IsoSprite.new();
	end
	if self.RENDER_SPRITE_NAME ~= spriteName then
		self.RENDER_SPRITE:LoadFramesNoDirPageSimple(spriteName);
		self.RENDER_SPRITE_NAME = spriteName;
	end

	-- check validity for the first part of the double fridge
	local canPlaceFirstPart = self:checkSingleTileValidity(square);

	-- render the first part with appropriate color
	if canPlaceFirstPart then
		self.RENDER_SPRITE:RenderGhostTile(x, y, z);
	else
		self.RENDER_SPRITE:RenderGhostTileRed(x, y, z);
	end

	-- determine the position and sprite for the second part
	local xa, ya, za = self:getSquare2Pos(square, self.north);
	local spriteAName = self.north and self.northSprite2 or self.sprite2;
	local squareA = getCell():getGridSquare(xa, ya, za);

	-- initialize and load the second part sprite
	if not self.RENDER_SPRITE_A then
		self.RENDER_SPRITE_A = IsoSprite.new();
	end
	self.RENDER_SPRITE_A:LoadFramesNoDirPageSimple(spriteAName);

	-- check validity for the second part of the double fridge
	local canPlaceSecondPart = self:checkSingleTileValidity(squareA);

	-- render the second part with appropriate color
	if canPlaceSecondPart then
		self.RENDER_SPRITE_A:RenderGhostTile(xa, ya, za);
	else
		self.RENDER_SPRITE_A:RenderGhostTileRed(xa, ya, za);
	end

	-- optionally draw a floor helper for each part
	if self.renderFloorHelper then
		if not self.RENDER_SPRITE_FLOOR then
			self.RENDER_SPRITE_FLOOR = IsoSprite.new();
			self.RENDER_SPRITE_FLOOR:LoadFramesNoDirPageSimple('carpentry_02_56');
		end
		self.RENDER_SPRITE_FLOOR:RenderGhostTile(x, y, z);

		if not self.RENDER_SPRITE_FLOOR_A then
			self.RENDER_SPRITE_FLOOR_A = IsoSprite.new();
			self.RENDER_SPRITE_FLOOR_A:LoadFramesNoDirPageSimple('carpentry_02_56');
		end
		self.RENDER_SPRITE_FLOOR_A:RenderGhostTile(xa, ya, za);
	end
end

local function checkSquare(squareToCheck, selfIsLow, selfIsHigh)
	local canPlace = true;
	if squareToCheck then
		for i = 0, squareToCheck:getObjects():size() - 1 do
			local object = squareToCheck:getObjects():get(i);
			if object then
				local objSprite = object:getSprite();
				local objectProps = objSprite:getProperties();

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
	end
	return canPlace;
end

---Checks if a single tile is valid for double fridge placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISDoubleFridge:checkSingleTileValidity(square)
	if not square then return false; end
	if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
	if square:isVehicleIntersecting() then return false; end
	if not square:isFreeOrMidair(true) then return false; end

	local sharedSprite = getSprite(self:getSprite());
	local selfProps = sharedSprite:getProperties();
	local selfIsLow, selfIsHigh = selfProps:Is("IsLow"), selfProps:Is("IsHigh");

	return checkSquare(square, selfIsLow, selfIsHigh);
end

---Checks if the double fridge placement is valid considering both parts
---@param square IsoGridSquare The square to check for the first part
---@return boolean validity
function ISDoubleFridge:isValid(square)
	if not square then return false; end
	if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
	if square:isVehicleIntersecting() then return false; end
	if not square:isFreeOrMidair(true) then return false; end

	local xa, ya, za = self:getSquare2Pos(square, self.north);
	local squareA = getCell():getGridSquare(xa, ya, za);

	if not squareA or not squareA:isFreeOrMidair(true) or buildUtil.stairIsBlockingPlacement(squareA, true) or squareA:isVehicleIntersecting() then
		return false;
	end

	local sharedSprite = getSprite(self:getSprite());
	local selfProps = sharedSprite:getProperties();

	local selfIsLow = selfProps:Is("IsLow");
	local selfIsHigh = selfProps:Is("IsHigh");

	return checkSquare(square, selfIsLow, selfIsHigh) and checkSquare(squareA, selfIsLow, selfIsHigh);
end

--- Retrieves the position for the second part of the double fridge based on orientation
--- @param square IsoGridSquare The square for the first part
--- @param north boolean Whether the fridge is oriented northward
--- @return integer x, integer y, integer z The coordinates for the second part
function ISDoubleFridge:getSquare2Pos(square, north)
	local x = square:getX();
	local y = square:getY();
	local z = square:getZ();
	if north then
		y = y - 1;
	else
		x = x - 1;
	end
	return x, y, z;
end

--- Retrieves the square for the second part of the double fridge
--- @param square IsoGridSquare The square for the first part
--- @param north boolean Whether the fridge is oriented northward
--- @return IsoGridSquare square The square for the second part
function ISDoubleFridge:getSquare2(square, north)
	local x, y, z = self:getSquare2Pos(square, north);
	return getCell():getGridSquare(x, y, z);
end
