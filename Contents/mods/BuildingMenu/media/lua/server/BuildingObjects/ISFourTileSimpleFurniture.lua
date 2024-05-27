local BM_Utils = require("BM_Utils")

---@class ISFourTileSimpleFurniture : ISBuildingObject
---@field sprite2 string Sprite for the second tile
---@field sprite3 string Sprite for the third tile
---@field sprite4 string Sprite for the fourth tile
---@field northSprite string North-facing sprite for the main tile
---@field northSprite2 string North-facing sprite for the second tile
---@field northSprite3 string North-facing sprite for the third tile
---@field northSprite4 string North-facing sprite for the fourth tile
ISFourTileSimpleFurniture = ISBuildingObject:derive("ISFourTileSimpleFurniture");

--************************************************************************--
--** ISFourTileSimpleFurniture:new
--**
--************************************************************************--
--           / \
--          / x \  > sprite4
--        / \y-3/
--       / x \ / > sprite3
--     / \y-2/
--    / x \ / > sprite2
--  / \y-1/
-- / x \ / > sprite or northSprite
-- \ y / \
--  \ /x+1\  > northSprite2
--    \ y / \
--     \ /x+2\  > northSprite3
--       \ y / \
--        \ /x+3\ > northSprite4
--          \ y /
--           \ /

---Constructor for ISFourTileSimpleFurniture
---@param sprite string Sprite for the main tile
---@param sprite2 string Sprite for the second tile
---@param sprite3 string Sprite for the third tile
---@param sprite4 string Sprite for the fourth tile
---@param northSprite string North-facing sprite for the main tile
---@param northSprite2 string North-facing sprite for the second tile
---@param northSprite3 string North-facing sprite for the third tile
---@param northSprite4 string North-facing sprite for the fourth tile
---@return ISFourTileSimpleFurniture ISBuildingObject instance
function ISFourTileSimpleFurniture:new(sprite, sprite2, sprite3, sprite4, northSprite, northSprite2, northSprite3,
                                       northSprite4)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;
    o.sprite4 = sprite4;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;
    o.northSprite4 = northSprite4;

    o.isWallLike = false;
    o.thumpDmg = 5;
    o.name = 'Four Tile Furniture';

    o.RENDER_SPRITE_CACHE = {};

    return o;
end

---Creates and places the furniture in the game world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param north boolean Whether the furniture is facing north
---@param sprite string The sprite to use for this object
function ISFourTileSimpleFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    -- determine the positions for the other 3 tiles in the 1x4 formation
    local xa, ya = self:getSquare2Pos(self.sq, north);
    local xb, yb = self:getSquare3Pos(self.sq, north);
    local xc, yc = self:getSquare4Pos(self.sq, north);

    -- define the sprite names for the additional tiles
    local spriteAName = north and self.northSprite2 or self.sprite2;
    local spriteBName = north and self.northSprite3 or self.sprite3;
    local spriteCName = north and self.northSprite4 or self.sprite4;


    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);
    self:createPart(xb, yb, z, north, spriteBName, 3);
    self:createPart(xc, yc, z, north, spriteCName, 4);

    buildUtil.consumeMaterial(self);
end

---Adds a furniture part to the world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param north boolean Whether the part is facing north
---@param sprite string The sprite for this part
---@param index integer The index of the part
function ISFourTileSimpleFurniture:createPart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z);

    -- check if the part already exists on this tile
    if self:partExists(square, index) then return; end

    -- create the furniture part and set its properties
    self.javaObject = IsoThumpable.new(cell, square, sprite, north, self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound("BreakObject");

    buildUtil.setInfo(self.javaObject, self);

    square:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

---Calculates the health of the furniture based on certain conditions. Currently it's 400 + 100 per carpentry lvl
---@return integer health
function ISFourTileSimpleFurniture:getHealth()
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

---Renders the furniture object in the world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param square IsoGridSquare The square where the furniture will be placed
function ISFourTileSimpleFurniture:render(x, y, z, square)
    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
    end


    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);
    local xc, yc, zc = self:getSquare4Pos(square, self.north);

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    if squareA == nil and getWorld():isValidSquare(xa, ya, za) then
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, za);
        getCell():ConnectNewSquare(squareA, false);
    end

    local squareB = getCell():getGridSquare(xb, yb, zb)
    if squareB == nil and getWorld():isValidSquare(xb, yb, zb) then
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, zb);
        getCell():ConnectNewSquare(squareB, false);
    end

    local squareC = getCell():getGridSquare(xc, yc, zc)
    if squareC == nil and getWorld():isValidSquare(xc, yc, zc) then
        squareC = IsoGridSquare.new(getCell(), nil, xc, yc, zc);
        getCell():ConnectNewSquare(squareC, false);
    end

    -- initial checks for the primary square
    local spriteFree = true;
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) then
        spriteFree = false;
    end

    -- check validity for additional squares
    local spriteAFree = true;
    if self:partExists(squareA, 2) or not self:checkSingleTileValidity(squareA) then
        spriteAFree = false;
    end

    local spriteBFree = true;
    if self:partExists(squareB, 3) or not self:checkSingleTileValidity(squareB) then
        spriteBFree = false;
    end

    local spriteCFree = true;
    if self:partExists(squareC, 4) or not self:checkSingleTileValidity(squareC) then
        spriteCFree = false;
    end

    if square:isSomethingTo(squareC) then spriteFree = false; spriteCFree = false; end
    if square:isSomethingTo(squareA) then spriteFree = false; spriteAFree = false; end
    if squareA:isSomethingTo(squareB) then spriteAFree = false; spriteBFree = false; end
    if squareB:isSomethingTo(squareC) then spriteBFree = false; spriteCFree = false; end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z)
        self:renderFloorHelperTile(2, xa, ya, za)
        self:renderFloorHelperTile(3, xb, yb, zb)
        self:renderFloorHelperTile(4, xc, yc, zc)
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
    self:renderPart(spriteCName, xc, yc, zc, spriteCFree);
end


---Renders a ghost tile part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISFourTileSimpleFurniture:renderPart(spriteName, x, y, z, isFree)
    if not self.RENDER_SPRITE_CACHE[spriteName] then
        local sprite = IsoSprite.new()
        sprite:LoadFramesNoDirPageSimple(spriteName)
        self.RENDER_SPRITE_CACHE[spriteName] = sprite
    end
    local sprite = self.RENDER_SPRITE_CACHE[spriteName]
    if isFree then
        sprite:RenderGhostTile(x, y, z)
    else
        sprite:RenderGhostTileRed(x, y, z)
    end
end


---Renders a floor helper tile
---@param index integer The index of the part to check for
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
function ISFourTileSimpleFurniture:renderFloorHelperTile(index, x, y, z)
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


---Checks if a single tile is valid for shelf placement
---@param square IsoGridSquare The square to check
---@return boolean validity
function ISFourTileSimpleFurniture:checkSingleTileValidity(square)
    if not square then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if square:isVehicleIntersecting() then return false; end
    if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
        return false;
    end
    if not square:isFreeOrMidair(true) then return false; end

    -- if all checks passed, return true
    return true;
end

---Checks if the furniture placement is valid
---@param square IsoGridSquare The square to check for the main part
---@return boolean validity
function ISFourTileSimpleFurniture:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);
    local xc, yc = self:getSquare4Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());
    local squareC = getCell():getGridSquare(xc, yc, square:getZ());

    if (not squareA) or (not squareB) or (not squareC) then return false; end

    if square:isSomethingTo(squareC) then return false; end
    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end
    if squareB:isSomethingTo(squareC) then return false; end

    -- check the primary square (part 1)
    if self:partExists(square, 1) or not self:checkSingleTileValidity(square) or not self:haveMaterial(square) then
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
    -- if all checks passed, return true
    return true;
end

---Calculates the position of the second part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the second part
function ISFourTileSimpleFurniture:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end

---Calculates the position of the third part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the third part
function ISFourTileSimpleFurniture:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 2;
    else
        y = y - 2;
    end
    return x, y, z;
end

---Calculates the position of the fourth part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the fourth part
function ISFourTileSimpleFurniture:getSquare4Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 3
    else
        y = y - 3
    end
    return x, y, z
end


---Checks if a part of the furniture already exists on a given square
---@param square IsoGridSquare The square to check
---@param index integer The index of the part to check for
---@return boolean exists
function ISFourTileSimpleFurniture:partExists(square, index)
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
function ISFourTileSimpleFurniture:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
