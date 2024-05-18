local BM_Utils = require("BM_Utils")

---@class ISDoubleTileContainer : ISBuildingObject
ISDoubleTileContainer = ISBuildingObject:derive("ISDoubleTileContainer");


---Constructor for ISDoubleTileContainer
---@param playerNum integer The player index creating the object
---@param name string The name of the container
---@param sprite string The sprite for the first part of the container
---@param sprite2 string The sprite for the second part of the container
---@param northSprite string The north-facing sprite for the first part
---@param northSprite2 string The north-facing sprite for the second part
---@return ISDoubleTileContainer ISBuildingObject instance
function ISDoubleTileContainer:new(playerNum, name, sprite, sprite2, northSprite, northSprite2)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();

	o:setSprite(sprite);
	o:setNorthSprite(northSprite);

	o.sprite2 = sprite2;
	o.northSprite2 = northSprite2;

	o.name = name;
	o.player = playerNum;

	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = false;

	o.RENDER_SPRITE_CACHE = {};

	return o;
end


---Creates the container and places it in the world
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@param north boolean Whether the container is facing north
---@param sprite string The sprite to use for this object
function ISDoubleTileContainer:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);

	local xa, ya = self:getSquare2Pos(self.sq, north);

	local spriteAName = self.sprite2;

	if self.north then
		spriteAName = self.northSprite2;
	end

	local oldModData = self.modData;
	self.modData = {};

	self:createPart(x, y, z, north, sprite);
	self:createPart(xa, ya, z, north, spriteAName);

	self.modData = oldModData;
	buildUtil.consumeMaterial(self);
end


---Sets information for the container object
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Indicates if the part is facing north
---@param sprite string The sprite to use for this part of the container
function ISDoubleTileContainer:createPart(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	local square = cell:getGridSquare(x, y, z);

	local thumpable = IsoThumpable.new(cell, square, sprite, north, self);
	thumpable:setMaxHealth(self:getHealth());
	thumpable:setHealth(thumpable:getMaxHealth())
	thumpable:setBreakSound("BreakObject");

	if self.containerType then
		local inv = ItemContainer.new();
		inv:setType(self.containerType);
		inv:setCapacity(self.capacity or 50);
		inv:removeAllItems();
		inv:setParent(self.javaObject);
		inv:setExplored(true);
		thumpable:setContainer(inv);
	else
		thumpable:createContainersFromSpriteProperties();
		for i = 1, thumpable:getContainerCount() do
			thumpable:getContainerByIndex(i - 1):setExplored(true);
		end
	end

	local sharedSprite = getSprite(sprite);
	---@diagnostic disable-next-line: param-type-mismatch
	if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
		local props = ISMoveableSpriteProps.new(sharedSprite);
		thumpable:setRenderYOffset(props:getTotalTableHeight(self.sq));
	end

	buildUtil.setInfo(thumpable, self);

	square:AddSpecialObject(thumpable);
    square:RecalcAllWithNeighbours(true);
	thumpable:transmitCompleteItemToServer();
end


---Determines which square the player should walk to in order to interact with the container
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@return boolean
function ISDoubleTileContainer:walkTo(x, y, z)
	local playerObj = getSpecificPlayer(self.player);
	local square = getCell():getGridSquare(x, y, z);
	local square2 = self:getSquare2(square, self.north);
	---@diagnostic disable-next-line: param-type-mismatch
	if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
		return luautils.walkAdj(playerObj, square);
	end
	return luautils.walkAdj(playerObj, square2);
end


---Removes the container object from the ground
---@param square IsoGridSquare The square from which to remove the container
function ISDoubleTileContainer:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
			break
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


---Calculates the health of the container based on certain conditions
---@return integer health
function ISDoubleTileContainer:getHealth()
	if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 500 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 500 + buildUtil.getWoodHealth(self);
end


--- Renders a ghost tile of the container for placement preview
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@param square IsoGridSquare The square where the container will be placed
function ISDoubleTileContainer:render(x, y, z, square)
	local haveMaterials = self:haveMaterial(square);

	local spriteName = self:getSprite();
	local spriteAName = self.sprite2;

	if self.north then
		spriteAName = self.northSprite2;
	end

	-- positions for the additional tiles
	local xa, ya, za = self:getSquare2Pos(square, self.north);

	-- squares for the additional tiles
	local squareA = getCell():getGridSquare(xa, ya, za)
	if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
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

	if square:isSomethingTo(squareA) then
		spriteFree = false; spriteAFree = false;
	end

	-- render floor helpers if enabled
	if self.renderFloorHelper then
		self:renderFloorHelperTile(1, x, y, z);
		self:renderFloorHelperTile(2, xa, ya, za);
	end

	self:renderPart(spriteName, x, y, z, spriteFree);
	self:renderPart(spriteAName, xa, ya, za, spriteAFree);
end


---Renders a part of the container
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISDoubleTileContainer:renderPart(spriteName, x, y, z, isFree)
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
function ISDoubleTileContainer:renderFloorHelperTile(index, x, y, z)
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


---Checks if a single tile is valid for container placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISDoubleTileContainer:checkSingleTileValidity(square)
	if not square then return false; end

	-- ISBuildingObject:isValid without the check for materials on square, we only check for the first part of the obj
	if self.notExterior and not square:Is(IsoFlagType.exterior) then return false; end
	if square:isVehicleIntersecting() then return false; end
	if self.canBeAlwaysPlaced then
		-- even if we can place this item everywhere, we can't place 2 same objects on the same tile
		for i = 0, square:getObjects():size() - 1 do
			local obj = square:getObjects():get(i);
			if self:getSprite() == obj:getTextureName() then
				return false;
			end
		end
		return true;
	end
	local blockedByCharacters = self.isWallLike ~= true;
	if not square:isFreeOrMidair(blockedByCharacters) or not buildUtil.canBePlace(self, square) then return false; end

	if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	local sharedSprite = getSprite(self:getSprite());
	local selfProps = sharedSprite:getProperties();

	if square and selfProps then
		---@diagnostic disable-next-line: param-type-mismatch
		local selfIsLow, selfIsHigh = selfProps:Is("IsLow"), selfProps:Is("IsHigh");
		return checkSquare(square, selfIsLow, selfIsHigh);
	end
	return false;
end


---Checks if the container placement is valid considering both parts
---@param square IsoGridSquare The square to check for the first part
---@return boolean validity
function ISDoubleTileContainer:isValid(square)
	if not square then return false; end
	-- basic checks for the primary square
	if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

	-- checks for additional squares
	local xa, ya = self:getSquare2Pos(square, self.north);
	local squareA = getCell():getGridSquare(xa, ya, square:getZ());

	if (not squareA) then return false; end

	if square:isSomethingTo(squareA) then return false; end

	-- check the primary square (part 1)
	if self:partExists(square, 1) or not self:checkSingleTileValidity(square) or not self:haveMaterial(square) then
		return false;
	end
	-- check validity for additional squares
	if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
		return false;
	end
	-- if all checks passed, return true
	return true;
end


---Calculates the position of the second part of the container
---@param square IsoGridSquare The square of the first part
---@param north boolean Whether the container is facing north
---@return integer x, integer y, integer z The x, y, and z coordinates for the second part
function ISDoubleTileContainer:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

	if north then
		y = y - 1;
	else
		x = x - 1;
	end
	return x, y, z;
end


---Retrieves the square for the second part of the container
---@param square IsoGridSquare The square of the first part
---@param north boolean Whether the container is facing north
---@return IsoGridSquare square
function ISDoubleTileContainer:getSquare2(square, north)
	local x, y, z = self:getSquare2Pos(square, north);
	return getCell():getGridSquare(x, y, z);
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
function ISDoubleTileContainer:partExists(square, index)
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
function ISDoubleTileContainer:getSpriteNameForPart(index, north)
	if index == 1 or index == nil then index = ""; end
	if north then
		return self["northSprite" .. index];
	else
		return self["sprite" .. index];
	end
end
