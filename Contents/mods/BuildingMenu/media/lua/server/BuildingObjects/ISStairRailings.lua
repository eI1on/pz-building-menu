local BM_Utils = require("BM_Utils")

--- @class ISStairRailings : ISBuildingObject
ISStairRailings = ISBuildingObject:derive('ISStairRailings')


--- Initializes a new instance of the ISStairRailings class
--- @param sprite string The primary sprite for the rails
--- @param sprite2 string The second sprite
--- @param sprite3 string The third sprite
--- @param sprite4 string The fourth sprite
--- @param sprite5 string The fifth sprite
--- @param northSprite string North-facing variant of the primary sprite
--- @param northSprite2 string North-facing variant of the second sprite
--- @param northSprite3 string North-facing variant of the third sprite
--- @param northSprite4 string North-facing variant of the fourth sprite
--- @param northSprite5 string North-facing variant of the fifth sprite
--- @return ISStairRailings ISBuildingObject instance
function ISStairRailings:new(sprite, sprite2, sprite3, sprite4, sprite5, northSprite, northSprite2, northSprite3,
                                  northSprite4, northSprite5)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;
    o.sprite4 = sprite4;
    o.sprite5 = sprite5;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;
    o.northSprite4 = northSprite4;
    o.northSprite5 = northSprite5;

    o.consumedItems = {};
    o.isWallLike = true;
    o.thumpDmg = 5;
    o.name = 'Stair Railings';

    o.RENDER_SPRITE_CACHE = {};

    return o;
end


--- Creates the four parts of the garage railing on the map
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate 
--- @param north boolean Whether the railing is facing north
function ISStairRailings:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    local xa, ya, za = self:getSquare2Pos(self.sq, north);
    local xb, yb, zb = self:getSquare3Pos(self.sq, north);
    local xc, yc, zc = self:getSquare4Pos(self.sq, north);
    local xd, yd, zd = self:getSquare5Pos(self.sq, north);

    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;
    local spriteDName = self.sprite5;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
        spriteDName = self.northSprite5;
    end

    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, za, north, spriteAName, 2);
    self:createPart(xb, yb, zb, north, spriteBName, 3);
    self:createPart(xc, yc, zc, north, spriteCName, 4);
    self:createPart(xd, yd, zd, north, spriteDName, 5);
end


--- Adds a single part of the garage railing to the specified location
--- @param x integer x coordinate where the part should be placed
--- @param y integer y coordinate where the part should be placed
--- @param z integer z coordinate 
--- @param north boolean Orientation of the part
--- @param sprite string The sprite for this part
--- @param index integer The index of the part (1-4)
function ISStairRailings:createPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z);
    if square == nil then
        square = IsoGridSquare.new(cell, nil, x, y, z);
        getCell():ConnectNewSquare(square, true);
    end

    if self:partExists(square, index) then return; end

    self.javaObject = IsoThumpable.new(cell, square, sprite, north, self);

    buildUtil.setInfo(self.javaObject, self);

    square:AddSpecialObject(self.javaObject);
    square:RecalcAllWithNeighbours(true);
    self.javaObject:transmitCompleteItemToServer();
end


--- Returns the health of the garage railing based on material and construction
--- @return integer health The calculated health value
function ISStairRailings:getHealth()
    if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 300 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	return 250 + buildUtil.getWoodHealth(self);
end


--- Checks if the specified square is a valid location for placing the garage railing
--- @param square IsoGridSquare The square to check for validity
--- @return boolean validity True if valid, false otherwise
function ISStairRailings:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);
    local xc, yc, zc = self:getSquare4Pos(square, self.north);
    local xd, yd, zd = self:getSquare5Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, za);
    local squareB = getCell():getGridSquare(xb, yb, zb);
    local squareC = getCell():getGridSquare(xc, yc, zc);
    local squareD = getCell():getGridSquare(xd, yd, zd);

    if (not squareA) or (not squareB) or (not squareC) or (not squareD) then return false; end

    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end
    if squareC:isSomethingTo(squareD) then return false; end

    -- check the primary square (part 1)
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) then
        return false;
    end
    -- check validity for additional squares
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
        return false;
    end
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) then
        return false;
    end
    if self:partExists(squareC, 4) or not self:checkSingleTileValidity(squareC) then
        return false;
    end
    if self:partExists(squareD, 5) or not self:checkSingleTileValidity(squareD) then
        return false;
    end
    -- if all checks passed, return true
    return true;
end


--- Renders a ghost tile of the garage railing at the specified location for pre-placement visualization
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate 
--- @param square IsoGridSquare The square where the garage railing will be placed
function ISStairRailings:render(x, y, z, square)
    local haveMaterials = self:haveMaterial(square);

    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;
    local spriteDName = self.sprite5;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
        spriteDName = self.northSprite5;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);
    local xc, yc, zc = self:getSquare4Pos(square, self.north);
    local xd, yd, zd = self:getSquare5Pos(square, self.north);

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
---@diagnostic disable-next-line: param-type-mismatch
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, za);
        getCell():ConnectNewSquare(squareA, false);
    end

    local squareB = getCell():getGridSquare(xb, yb, zb)
    if squareB == nil and getWorld():isValidSquare(xb, yb, zb) then
---@diagnostic disable-next-line: param-type-mismatch
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, zb);
        getCell():ConnectNewSquare(squareB, false);
    end

    local squareC = getCell():getGridSquare(xc, yc, zc)
    if squareC == nil and getWorld():isValidSquare(xc, yc, zc) then
---@diagnostic disable-next-line: param-type-mismatch
        squareC = IsoGridSquare.new(getCell(), nil, xc, yc, zc);
        getCell():ConnectNewSquare(squareC, false);
    end

    local squareD = getCell():getGridSquare(xd, yd, zd)
    if squareD == nil and getWorld():isValidSquare(xd, yd, zd) then
---@diagnostic disable-next-line: param-type-mismatch
        squareD = IsoGridSquare.new(getCell(), nil, xd, yd, zd);
        getCell():ConnectNewSquare(squareD, false);
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

    local spriteBFree = true;
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) or not haveMaterials then
        spriteBFree = false;
    end

    local spriteCFree = true;
    if self:partExists(squareC, 4) or not self:checkSingleTileValidity(squareC) or not haveMaterials then
        spriteCFree = false;
    end

    local spriteDFree = true;
    if self:partExists(squareD, 4) or not self:checkSingleTileValidity(squareD) or not haveMaterials then
        spriteDFree = false;
    end

    if square:isSomethingTo(squareA) then spriteFree = false; spriteAFree = false; end
    if squareA:isSomethingTo(squareB) then spriteAFree = false; spriteBFree = false; end
    if squareC:isSomethingTo(squareD) then spriteCFree = false; spriteDFree = false; end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z);
        self:renderFloorHelperTile(2, xa, ya, za);
        self:renderFloorHelperTile(3, xb, yb, zb);
        self:renderFloorHelperTile(4, xc, yc, zc);
        self:renderFloorHelperTile(5, xd, yd, zd);
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
    self:renderPart(spriteCName, xc, yc, zc, spriteCFree);
    self:renderPart(spriteDName, xd, yd, zd, spriteDFree);
end


---Renders a ghost tile part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate 
---@param isFree boolean Whether the tile is free to place the part
function ISStairRailings:renderPart(spriteName, x, y, z, isFree)
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
---@param z integer z coordinate 
function ISStairRailings:renderFloorHelperTile(index, x, y, z)
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


---Checks if a single tile is valid for furniture placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISStairRailings:checkSingleTileValidity(square)
    if not square then return false; end

    -- ISBuildingObject:isValid without the check for materials on square, we only check for the first part of the obj 
---@diagnostic disable-next-line: param-type-mismatch
    if self.notExterior and not square:Is(IsoFlagType.exterior) then return false; end
	if square:isVehicleIntersecting() then return false end
	if self.canBeAlwaysPlaced then
		-- even if we can place this item everywhere, we can't place 2 same objects on the same tile
		for i=0,square:getObjects():size()-1 do
			local obj = square:getObjects():get(i);
			if self:getSprite() == obj:getTextureName() then
				return false
			end
		end
		return true
	end
	local blockedByCharacters = self.isWallLike ~= true;
    if not square:isFreeOrMidair(blockedByCharacters) or not buildUtil.canBePlace(self, square) then return false; end

    -- if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
        return false;
    end

    -- if all checks passed, return true
    return true;
end


--- Calculates the world coordinates for the second part of the garage railing based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the railing is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the second part
function ISStairRailings:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x - 1;
    else
        y = y - 1;
    end
    return x, y, z;
end


--- Calculates the world coordinates for the third part of the garage railing based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the railing is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the third part
function ISStairRailings:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x - 2;
    else
        y = y - 2;
    end
    return x, y, z;
end


--- Calculates the world coordinates for the fourth part of the garage railing based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the railing is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the fourth part
function ISStairRailings:getSquare4Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x - 1;
    else
        y = y - 1;
    end
    z = z + 1;

    return x, y, z;
end


--- Calculates the world coordinates for the fifth part of the garage railing based on its orientation
--- @param square IsoGridSquare The square where the main part is placed
--- @param north boolean True if the railing is facing north, affecting the calculation of positions
--- @return integer x, integer y, integer z The world coordinates (x, y, z) for the fifth part
function ISStairRailings:getSquare5Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x - 2;
    else
        y = y - 2;
    end
    z = z + 1;

    return x, y, z;
end


--- Checks if a specific part of the garage railing already exists at a given square
--- This is used to prevent duplicating parts on the same square and ensures each part is unique
--- @param square IsoGridSquare The square to check for existing parts
--- @param index integer|string|nil The index of the part to check (1-4)
--- @return boolean exists True if the part exists, false otherwise
function ISStairRailings:partExists(square, index)
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
---@param index integer|string|nil The index of the part
---@param north boolean The orientation of the part
---@return string spriteName The sprite name
function ISStairRailings:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
