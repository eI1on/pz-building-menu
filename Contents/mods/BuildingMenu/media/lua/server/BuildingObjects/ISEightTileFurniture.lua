local BM_Utils = require("BM_Utils")

---@class ISEightTileFurniture : ISBuildingObject
---@field sprite string Sprite for the main tile
---@field sprite2 string Sprite for the second tile
---@field sprite3 string Sprite for the third tile
---@field sprite4 string Sprite for the fourth tile
---@field sprite5 string Sprite for the fifth tile
---@field sprite6 string Sprite for the sixth tile
---@field sprite7 string Sprite for the seventh tile
---@field sprite8 string Sprite for the eighth tile
---@field northSprite string North-facing sprite for the main tile
---@field northSprite2 string North-facing sprite for the second tile
---@field northSprite3 string North-facing sprite for the third tile
---@field northSprite4 string North-facing sprite for the fourth tile
---@field northSprite5 string North-facing sprite for the fifth tile
---@field northSprite6 string North-facing sprite for the sixth tile
---@field northSprite7 string North-facing sprite for the seventh tile
---@field northSprite8 string North-facing sprite for the eighth tile
ISEightTileFurniture = ISBuildingObject:derive("ISEightTileFurniture");


--************************************************************************--
--** ISEightTileFurniture:new
--**
--************************************************************************--

--          / \               / \
--         /x-3\             / x \                      sprite6                                        northSprite6
--       / \ y / \         / \y-3/ \
--      /x-3\ /x-2\       / x \ /x+1\           sprite5       sprite7                      northSprite7            northSprite5
--      \y+1/ \ y / \   / \y-2/ \y-3/
--       \ /x-2\ /x-1\ / x \ /x+1\ /                 sprite4         sprite8          northSprite8          northSprite4
--         \y+1/ \ y / \y-1/ \y-2/
--          \ /x-1\ / x \ /x+1\ /                          sprite3       sprite/northSprite     northSprite3
--            \y+1/ \ y / \y-1/
--             \ / x \ /x+1\ /                                     sprite2             northSprite2
--               \y+1/ \ y /
--                \ /   \ /

---Constructor for ISEightTileFurniture
---@param name string Name of the furniture
---@param sprite string Sprite for the main tile
---@param sprite2 string Sprite for the second tile
---@param sprite3 string Sprite for the third tile
---@param sprite4 string Sprite for the fourth tile
---@param sprite5 string Sprite for the fifth tile
---@param sprite6 string Sprite for the sixth tile
---@param sprite7 string Sprite for the seventh tile
---@param sprite8 string Sprite for the eighth tile
---@param northSprite string North-facing sprite for the main tile
---@param northSprite2 string North-facing sprite for the second tile
---@param northSprite3 string North-facing sprite for the third tile
---@param northSprite4 string North-facing sprite for the fourth tile
---@param northSprite5 string North-facing sprite for the fifth tile
---@param northSprite6 string North-facing sprite for the sixth tile
---@param northSprite7 string North-facing sprite for the seventh tile
---@param northSprite8 string North-facing sprite for the eighth tile
---@return ISEightTileFurniture ISBuildingObject instance
function ISEightTileFurniture:new(name, sprite, sprite2, sprite3, sprite4, sprite5, sprite6, sprite7, sprite8,
                                  northSprite, northSprite2, northSprite3,
                                  northSprite4, northSprite5, northSprite6, northSprite7, northSprite8)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;
    o.sprite4 = sprite4;
    o.sprite5 = sprite5;
    o.sprite6 = sprite6;
    o.sprite7 = sprite7;
    o.sprite8 = sprite8;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;
    o.northSprite4 = northSprite4;
    o.northSprite5 = northSprite5;
    o.northSprite6 = northSprite6;
    o.northSprite7 = northSprite7;
    o.northSprite8 = northSprite8;

    o.name = name;
    o.canBarricade = false;
    o.dismantable = true;
    o.blockAllTheSquare = true;
    o.canBeAlwaysPlaced = false;
    o.buildMid = true;

    o.RENDER_SPRITE_CACHE = {};

    return o;
end

---Creates and places the furniture in the game world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param north boolean Whether the furniture is facing north
---@param sprite string The sprite to use for this object
function ISEightTileFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    -- determine the positions for the other 7 tiles in the 2x4 formation
    local xa, ya = self:getSquare2Pos(self.sq, north);
    local xb, yb = self:getSquare3Pos(self.sq, north);
    local xc, yc = self:getSquare4Pos(self.sq, north);
    local xd, yd = self:getSquare5Pos(self.sq, north);
    local xe, ye = self:getSquare6Pos(self.sq, north);
    local xf, yf = self:getSquare7Pos(self.sq, north);
    local xg, yg = self:getSquare8Pos(self.sq, north);

    -- define the sprite names for the additional tiles
    local spriteAName = north and self.northSprite2 or self.sprite2;
    local spriteBName = north and self.northSprite3 or self.sprite3;
    local spriteCName = north and self.northSprite4 or self.sprite4;
    local spriteDName = north and self.northSprite5 or self.sprite5;
    local spriteEName = north and self.northSprite6 or self.sprite6;
    local spriteFName = north and self.northSprite7 or self.sprite7;
    local spriteGName = north and self.northSprite8 or self.sprite8;

    -- create all 8 parts of the 2x4 furniture
    self:createPart(x, y, z, north, sprite, 1);
    self:createPart(xa, ya, z, north, spriteAName, 2);
    self:createPart(xb, yb, z, north, spriteBName, 3);
    self:createPart(xc, yc, z, north, spriteCName, 4);
    self:createPart(xd, yd, z, north, spriteDName, 5);
    self:createPart(xe, ye, z, north, spriteEName, 6);
    self:createPart(xf, yf, z, north, spriteFName, 7);
    self:createPart(xg, yg, z, north, spriteGName, 8);

    buildUtil.consumeMaterial(self);
end

---Adds a furniture part to the world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param north boolean Whether the part is facing north
---@param sprite string The sprite for this part
---@param index integer The index of the part
function ISEightTileFurniture:createPart(x, y, z, north, sprite, index)
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

---Determines the walk-to square for interaction
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@return boolean
function ISEightTileFurniture:walkTo(x, y, z)
    local playerObj = getSpecificPlayer(self.player);
    local square = getCell():getGridSquare(x, y, z);
    local square2 = self:getSquare2(square, self.north);
    ---@diagnostic disable-next-line: param-type-mismatch
    if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
        return luautils.walkAdj(playerObj, square);
    end
    return luautils.walkAdj(playerObj, square2);
end

---Removes the furniture part from the ground
---@param square IsoGridSquare The square from which to remove the furniture
local function removeItemFromSquare(square)
    for i = 1, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i - 1);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end
end

---Removes the furniture object from the ground
---@param square IsoGridSquare The square from which to remove the furniture
function ISEightTileFurniture:removeFromGround(square)
    local isNorth = self:getNorth();
    local positions = {
        self:getSquare2Pos(square, isNorth),
        self:getSquare3Pos(square, isNorth),
        self:getSquare4Pos(square, isNorth),
        self:getSquare5Pos(square, isNorth),
        self:getSquare6Pos(square, isNorth),
        self:getSquare7Pos(square, isNorth),
        self:getSquare8Pos(square, isNorth),
    };

    for _, pos in ipairs(positions) do
        ---@diagnostic disable-next-line: param-type-mismatch
        local xa, ya = unpack(pos);
        local squareA = getCell():getGridSquare(xa, ya, square:getZ());
        removeItemFromSquare(squareA);
    end
end

---Calculates the health of the furniture based on certain conditions. Currently it's 400 + 100 per carpentry lvl
---@return integer health
function ISEightTileFurniture:getHealth()
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

---Renders ghost tiles of the furniture object for placement preview
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param square IsoGridSquare The square where the furniture will be placed
function ISEightTileFurniture:render(x, y, z, square)
    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;
    local spriteCName = self.sprite4;
    local spriteDName = self.sprite5;
    local spriteEName = self.sprite6;
    local spriteFName = self.sprite7;
    local spriteGName = self.sprite8;

    if self.north then
        spriteName = self.northSprite;
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
        spriteCName = self.northSprite4;
        spriteDName = self.northSprite5;
        spriteEName = self.northSprite6;
        spriteFName = self.northSprite7;
        spriteGName = self.northSprite8;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);
    local xc, yc, zc = self:getSquare4Pos(square, self.north);
    local xd, yd, zd = self:getSquare5Pos(square, self.north);
    local xe, ye, ze = self:getSquare6Pos(square, self.north);
    local xf, yf, zf = self:getSquare7Pos(square, self.north);
    local xg, yg, zg = self:getSquare8Pos(square, self.north);

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

    local squareD = getCell():getGridSquare(xd, yd, zd)
    if squareD == nil and getWorld():isValidSquare(xd, yd, zd) then
        squareD = IsoGridSquare.new(getCell(), nil, xd, yd, zd);
        getCell():ConnectNewSquare(squareD, false);
    end

    local squareE = getCell():getGridSquare(xe, ye, ze)
    if squareE == nil and getWorld():isValidSquare(xe, ye, ze) then
        squareE = IsoGridSquare.new(getCell(), nil, xe, ye, ze);
        getCell():ConnectNewSquare(squareE, false);
    end

    local squareF = getCell():getGridSquare(xf, yf, zf)
    if squareF == nil and getWorld():isValidSquare(xf, yf, zf) then
        squareF = IsoGridSquare.new(getCell(), nil, xf, yf, zf);
        getCell():ConnectNewSquare(squareF, false);
    end

    local squareG = getCell():getGridSquare(xg, yg, zg)
    if squareG == nil and getWorld():isValidSquare(xg, yg, zg) then
        squareG = IsoGridSquare.new(getCell(), nil, xg, yg, zg);
        getCell():ConnectNewSquare(squareG, false);
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

    local spriteDFree = true;
    if self:partExists(squareD, 5) or not self:checkSingleTileValidity(squareD) then
        spriteDFree = false;
    end

    local spriteEFree = true;
    if self:partExists(squareE, 6) or not self:checkSingleTileValidity(squareE) then
        spriteEFree = false;
    end

    local spriteFFree = true;
    if self:partExists(squareF, 7) or not self:checkSingleTileValidity(squareF) then
        spriteFFree = false;
    end

    local spriteGFree = true;
    if self:partExists(squareG, 8) or not self:checkSingleTileValidity(squareG) then
        spriteGFree = false;
    end

    if square:isSomethingTo(squareG) then
        spriteFree = false; spriteGFree = false;
    end
    if square:isSomethingTo(squareA) then
        spriteFree = false; spriteAFree = false;
    end
    if squareA:isSomethingTo(squareB) then
        spriteAFree = false; spriteBFree = false;
    end
    if squareB:isSomethingTo(squareC) then
        spriteBFree = false; spriteCFree = false;
    end
    if squareC:isSomethingTo(squareD) then
        spriteCFree = false; spriteDFree = false;
    end
    if squareD:isSomethingTo(squareE) then
        spriteDFree = false; spriteEFree = false;
    end
    if squareE:isSomethingTo(squareF) then
        spriteEFree = false; spriteFFree = false;
    end
    if squareF:isSomethingTo(squareG) then
        spriteFFree = false; spriteGFree = false;
    end

    if squareB:isSomethingTo(squareG) then
        spriteBFree = false; spriteGFree = false;
    end
    if squareC:isSomethingTo(squareF) then
        spriteCFree = false; spriteFFree = false;
    end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z)
        self:renderFloorHelperTile(2, xa, ya, za)
        self:renderFloorHelperTile(3, xb, yb, zb)
        self:renderFloorHelperTile(4, xc, yc, zc)
        self:renderFloorHelperTile(5, xd, yd, zd)
        self:renderFloorHelperTile(6, xe, ye, ze)
        self:renderFloorHelperTile(7, xf, yf, zf)
        self:renderFloorHelperTile(8, xg, yg, zg)
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
    self:renderPart(spriteCName, xc, yc, zc, spriteCFree);
    self:renderPart(spriteDName, xd, yd, zd, spriteDFree);
    self:renderPart(spriteEName, xe, ye, ze, spriteEFree);
    self:renderPart(spriteFName, xf, yf, zf, spriteFFree);
    self:renderPart(spriteGName, xg, yg, zg, spriteGFree);
end

---Renders a ghost tile part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISEightTileFurniture:renderPart(spriteName, x, y, z, isFree)
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
function ISEightTileFurniture:renderFloorHelperTile(index, x, y, z)
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
function ISEightTileFurniture:checkSingleTileValidity(square)
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

---Checks if the furniture placement is valid
---@param square IsoGridSquare The square to check for the main part
---@return boolean validity
function ISEightTileFurniture:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);
    local xc, yc = self:getSquare4Pos(square, self.north);
    local xd, yd = self:getSquare5Pos(square, self.north);
    local xe, ye = self:getSquare6Pos(square, self.north);
    local xf, yf = self:getSquare7Pos(square, self.north);
    local xg, yg = self:getSquare8Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());
    local squareC = getCell():getGridSquare(xc, yc, square:getZ());
    local squareD = getCell():getGridSquare(xd, yd, square:getZ());
    local squareE = getCell():getGridSquare(xe, ye, square:getZ());
    local squareF = getCell():getGridSquare(xf, yf, square:getZ());
    local squareG = getCell():getGridSquare(xg, yg, square:getZ());

    if (not squareA) or (not squareB) or (not squareC) or (not squareD) or (not squareE) or (not squareF) or (not squareG) then return false; end

    if square:isSomethingTo(squareG) then return false; end
    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end
    if squareB:isSomethingTo(squareC) then return false; end
    if squareC:isSomethingTo(squareD) then return false; end
    if squareD:isSomethingTo(squareE) then return false; end
    if squareE:isSomethingTo(squareF) then return false; end
    if squareF:isSomethingTo(squareG) then return false; end

    if squareB:isSomethingTo(squareG) then return false; end
    if squareC:isSomethingTo(squareF) then return false; end

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
    if self:partExists(squareD, 5) or not self:checkSingleTileValidity(squareD) then
        return false;
    end
    if self:partExists(squareE, 6) or not self:checkSingleTileValidity(squareE) then
        return false;
    end
    if self:partExists(squareF, 7) or not self:checkSingleTileValidity(squareF) then
        return false;
    end
    if self:partExists(squareG, 8) or not self:checkSingleTileValidity(squareG) then
        return false;
    end
    -- if all checks passed, return true
    return true;
end

---Calculates the position of the second part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the second part
function ISEightTileFurniture:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        x = x + 1;
    else
        y = y + 1;
    end
    return x, y, z;
end

---Calculates the position of the third part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the third part
function ISEightTileFurniture:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        x = x + 1
        y = y - 1
    else
        x = x - 1
        y = y + 1
    end
    return x, y, z;
end

---Calculates the position of the fourth part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the fourth part
function ISEightTileFurniture:getSquare4Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        x = x + 1
        y = y - 2
    else
        x = x - 2
        y = y + 1
    end
    return x, y, z;
end

---Calculates the position of the fifth part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the fifth part
function ISEightTileFurniture:getSquare5Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        x = x + 1
        y = y - 3
    else
        x = x - 3
        y = y + 1
    end
    return x, y, z;
end

---Calculates the position of the sixth part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the sixth part
function ISEightTileFurniture:getSquare6Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        y = y - 3
    else
        x = x - 3
    end
    return x, y, z;
end

---Calculates the position of the seventh part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the seventh part
function ISEightTileFurniture:getSquare7Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        y = y - 2
    else
        x = x - 2
    end
    return x, y, z;
end

---Calculates the position of the eigth part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the eigth part
function ISEightTileFurniture:getSquare8Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();
    if north then
        y = y - 1
    else
        x = x - 1
    end
    return x, y, z;
end

---@param square IsoGridSquare
---@return IsoGridSquare square
function ISEightTileFurniture:getSquare2(square, north)
    local x, y, z = self:getSquare2Pos(square, north);
    return getCell():getGridSquare(x, y, z);
end

---Checks if a part of the furniture already exists on a given square
---@param square IsoGridSquare The square to check
---@param index integer The index of the part to check for
---@return boolean exists
function ISEightTileFurniture:partExists(square, index)
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
---@param index integer|string The index of the part
---@param north boolean The orientation of the part
---@return string spriteName The sprite name
function ISEightTileFurniture:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
