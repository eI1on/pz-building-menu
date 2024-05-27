local BM_Utils = require("BM_Utils")

--- @class ISBathtub : ISBuildingObject
ISBathtub = ISBuildingObject:derive("ISBathtub");


--- Constructor for the ISBathtub class
--- @param playerNum integer The player index creating the bathtub
--- @param name string The name of the bathtub object
--- @param sprite string The sprite for the bathtub when not facing north
--- @param sprite2 string The second sprite for the bathtub
--- @param northSprite string The sprite for the bathtub when facing north
--- @param northSprite2 string The second north-facing sprite for the bathtub
--- @return ISBathtub ISBuildingObject instance
function ISBathtub:new(playerNum, name, sprite, sprite2, northSprite, northSprite2)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();

    o:setSprite(sprite);
    o:setNorthSprite(northSprite);

    o.sprite2 = sprite2;
    o.northSprite2 = northSprite2;

    o.player = playerNum;
    o.name = name;

    o.canBarricade = false;
    o.dismantable = true;
    o.blockAllTheSquare = true;
    o.canBeAlwaysPlaced = false;

    return o;
end


--- Creates a bathtub at the specified location
--- @param x integer The x coordinate of the location
--- @param y integer The y coordinate of the location
--- @param z integer The z coordinate of the location
--- @param north boolean Whether the bathtub is facing north
--- @param sprite string The sprite name for the bathtub
function ISBathtub:create(x, y, z, north, sprite)
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


--- Configures and places a thumpable object at a given location
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Whether the object faces north
--- @param sprite string The sprite to use for this object
function ISBathtub:createPart(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	local square = cell:getGridSquare(x, y, z);

    local thumpable = IsoThumpable.new(cell, square, sprite, north, self);
    thumpable:setMaxHealth(self:getHealth());
    thumpable:setHealth(thumpable:getMaxHealth());
    thumpable:setBreakSound("BreakObject");

    buildUtil.setInfo(thumpable, self);

    square:AddSpecialObject(thumpable);
    square:RecalcAllWithNeighbours(true);
    thumpable:transmitCompleteItemToServer();
end


--- Removes the bathtub from the ground
--- @param square IsoGridSquare The square from which to remove the bathtub
function ISBathtub:removeFromGround(square)
    for i = 0, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end

    local xa, ya = square:getX(), square:getY();
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


--- Calculates the health of the bathtub based on carpentry skill
--- @return integer health The calculated health
function ISBathtub:getHealth()
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


--- Renders a ghost tile of the bathtub for placement preview
--- @param x integer The x coordinate where to render
--- @param y integer The y coordinate where to render
--- @param z integer The z coordinate where to render
--- @param square IsoGridSquare The square where the rendering takes place
function ISBathtub:render(x, y, z, square)
    -- prepare the rendering for the first part of the shelf
    local spriteName = self:getSprite();
    if not self.RENDER_SPRITE then
        self.RENDER_SPRITE = IsoSprite.new();
    end
    if self.RENDER_SPRITE_NAME ~= spriteName then
        self.RENDER_SPRITE:LoadFramesNoDirPageSimple(spriteName);
        self.RENDER_SPRITE_NAME = spriteName;
    end

    -- check validity for the first part of the shelf
    local canPlaceFirstPart = (not self:partExists(square, 1) and self:checkSingleTileValidity(square));

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

    -- check validity for the second part of the shelf
    local canPlaceSecondPart = (not self:partExists(squareA, 2) and self:checkSingleTileValidity(squareA));

    -- render the second part with appropriate color
    if canPlaceSecondPart then
        self.RENDER_SPRITE_A:RenderGhostTile(xa, ya, za);
    else
        self.RENDER_SPRITE_A:RenderGhostTileRed(xa, ya, za);
    end

    -- optionally render a floor helper for each part
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


--- Determines if the placement of the bathtub is valid
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity True if placement is valid, false otherwise
function ISBathtub:isValid(square)
	if not square then return false; end
	-- basic checks for the primary square
	if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    if not square or (self:partExists(square, 1) and not self:checkSingleTileValidity(square)) then
        return false;
    end

    -- check adjacent square
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local squareA = getCell():getGridSquare(xa, ya, za);
    if not squareA or (self:partExists(squareA, 2) and not self:checkSingleTileValidity(squareA)) then
        return false;
    end
    return true;
end


---Checks if a single tile is valid for furniture placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISBathtub:checkSingleTileValidity(square)
    if not square then return false; end
    if not ISBuildingObject.isValid(self, square) then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
        return false;
    end
    if not square:isFreeOrMidair(true) then return false; end

    -- if all checks passed, return true
    return true;
end


--- Calculates the coordinates for the second square based on the orientation
--- @param square IsoGridSquare The reference square
--- @param north boolean The orientation
--- @return integer x, integer y, integer z The x, y, and z coordinates of the second square
function ISBathtub:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        y = y - 1;
    else
        x = x - 1;
    end
    return x, y, z;
end


--- Retrieves the second square based on the orientation
--- @param square IsoGridSquare The reference square
--- @param north boolean The orientation
--- @return IsoGridSquare square The second square
function ISBathtub:getSquare2(square, north)
    local x, y, z = self:getSquare2Pos(square, north);
    return getCell():getGridSquare(x, y, z);
end


---Checks if a part of the furniture already exists on a given square
---@param square IsoGridSquare The square to check
---@param index integer The index of the part to check for
---@return boolean exists
function ISBathtub:partExists(square, index)
    local objects = square:getSpecialObjects();
    for i = 0, objects:size() - 1 do
        local object = objects:get(i);
        local sprite = object:getSprite();
        if object and sprite then
            local spriteName = sprite:getName();
            local isObjectNorth = BM_Utils.safeCallMethod(object, "getNorth");
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
function ISBathtub:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
