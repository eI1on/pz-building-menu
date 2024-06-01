local BM_Utils = require("BM_Utils")

---@class ISThreeTileSimpleFurniture : ISBuildingObject
---@field sprite2 string Sprite for the second tile
---@field sprite3 string Sprite for the third tile
---@field northSprite string North-facing sprite for the main tile
---@field northSprite2 string North-facing sprite for the second tile
---@field northSprite3 string North-facing sprite for the third tile
ISThreeTileSimpleFurniture = ISBuildingObject:derive('ISThreeTileSimpleFurniture')

--************************************************************************--
--** ISThreeTileSimpleFurniture:new
--**
--************************************************************************--

--        / \
--       / x \  > sprite3
--     / \y-2/
--    / x \ / > sprite2
--  / \y-1/
-- / x \ / > sprite or northSprite
-- \ y / \
--  \ /x+1\  > northSprite2
--    \ y / \
--     \ /x+2\  > northSprite3
--       \ y /
--        \ /

---Constructor for ISThreeTileSimpleFurniture
---@param sprite string Sprite for the main tile
---@param sprite2 string Sprite for the second tile
---@param sprite3 string Sprite for the third tile
---@param northSprite string North-facing sprite for the main tile
---@param northSprite2 string North-facing sprite for the second tile
---@param northSprite3 string North-facing sprite for the third tile
---@return ISThreeTileSimpleFurniture ISBuildingObject instance
function ISThreeTileSimpleFurniture:new(sprite, sprite2, sprite3, northSprite, northSprite2, northSprite3)
    local o = {};
    setmetatable(o, self);
    self.__index = self;

    o:init();
    o:setSprite(sprite);

    o.sprite2 = sprite2;
    o.sprite3 = sprite3;

    o.northSprite = northSprite;
    o.northSprite2 = northSprite2;
    o.northSprite3 = northSprite3;

    o.isWallLike = false;
    o.thumpDmg = 5;
    o.name = 'Three Tile Furniture';

    o.RENDER_SPRITE_CACHE = {};

    return o;
end

---Creates and places the furniture in the game world
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param north boolean Whether the furniture is facing north
---@param sprite string The sprite to use for this object
function ISThreeTileSimpleFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    -- determine the positions for the other 3 tiles in the 1x4 formation
    local xa, ya = self:getSquare2Pos(self.sq, north);
    local xb, yb = self:getSquare3Pos(self.sq, north);

    -- define the sprite names for the additional tiles
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    self:createFurniturePart(x, y, z, north, sprite, 1);
    self:createFurniturePart(xa, ya, z, north, spriteAName, 2);
    self:createFurniturePart(xb, yb, z, north, spriteBName, 3);

    buildUtil.consumeMaterial(self);
end

--- Adds a furniture part to the specified location
--- @param x integer x coordinate in the world.
--- @param y integer y coordinate in the world.
--- @param z integer z coordinate (floor level).
--- @param north boolean Indicates if the furniture is facing north
--- @param sprite string The sprite for this furniture part
--- @param index integer The index of the furniture part (1, 2, or 3)
function ISThreeTileSimpleFurniture:createFurniturePart(x, y, z, north, sprite, index)
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

---Determines which square the player should walk to in order to interact with the furniture object
---@param x integer The x coordinate in the world
---@param y integer The y coordinate in the world
---@param z integer The z coordinate (floor level)
---@return boolean
function ISThreeTileSimpleFurniture:walkTo(x, y, z)
    local playerObj = getSpecificPlayer(self.player);

    local square = getCell():getGridSquare(x, y, z);
    local square2 = self:getSquare2(square, self.north);

    ---@diagnostic disable-next-line: param-type-mismatch
    if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
        return luautils.walkAdj(playerObj, square);
    end
    return luautils.walkAdj(playerObj, square2);
end

local function removeItemFromSquare(square)
    for i = 1, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i - 1);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump);
            break;
        end
    end
end

---Removes the double furniture object from the ground
---@param square IsoGridSquare The square from which to remove the furniture object
function ISThreeTileSimpleFurniture:removeFromGround(square)
    local isNorth = self:getNorth();
    local positions = {
        self:getSquare2Pos(square, isNorth),
        self:getSquare3Pos(square, isNorth),
    };

    for _, pos in ipairs(positions) do
        ---@diagnostic disable-next-line: param-type-mismatch
        local xa, ya = unpack(pos);
        local squareA = getCell():getGridSquare(xa, ya, square:getZ());
        removeItemFromSquare(squareA);
    end
end

---Calculates the health of the furniture object based on carpentry skill
---@return integer health
function ISThreeTileSimpleFurniture:getHealth()
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

--- Renders a ghost tile of the furniture object for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the furniture object will be placed
function ISThreeTileSimpleFurniture:render(x, y, z, square)
    local haveMaterials = self:haveMaterial(square);

    local spriteName = self:getSprite();
    local spriteAName = self.sprite2;
    local spriteBName = self.sprite3;

    if self.north then
        spriteAName = self.northSprite2;
        spriteBName = self.northSprite3;
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north);
    local xb, yb, zb = self:getSquare3Pos(square, self.north);

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

    if square:isSomethingTo(squareA) then
        spriteFree = false; spriteAFree = false;
    end
    if squareA:isSomethingTo(squareB) then
        spriteAFree = false; spriteBFree = false;
    end

    -- render floor helpers if enabled
    if self.renderFloorHelper then
        self:renderFloorHelperTile(1, x, y, z);
        self:renderFloorHelperTile(2, xa, ya, za);
        self:renderFloorHelperTile(3, xb, yb, zb);
    end

    self:renderPart(spriteName, x, y, z, spriteFree);
    self:renderPart(spriteAName, xa, ya, za, spriteAFree);
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree);
end

---Renders a part of the furniture
---@param spriteName string The name of the sprite to render
---@param x integer x coordinate in the world
---@param y integer y coordinate in the world
---@param z integer z coordinate (floor level)
---@param isFree boolean Whether the tile is free to place the part
function ISThreeTileSimpleFurniture:renderPart(spriteName, x, y, z, isFree)
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
function ISThreeTileSimpleFurniture:renderFloorHelperTile(index, x, y, z)
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
function ISThreeTileSimpleFurniture:checkSingleTileValidity(square)
    if not square then return false; end

    -- ISBuildingObject:isValid without the check for materials on square, we only check for the first part of the obj
    if self.notExterior and not square:Is(IsoFlagType.exterior) then return false end
    if square:isVehicleIntersecting() then return false end
    if self.canBeAlwaysPlaced then
        -- even if we can place this item everywhere, we can't place 2 same objects on the same tile
        for i = 0, square:getObjects():size() - 1 do
            local obj = square:getObjects():get(i);
            if self:getSprite() == obj:getTextureName() then
                return false
            end
        end
        return true
    end
    local blockedByCharacters = self.isWallLike ~= true;
    if not square:isFreeOrMidair(blockedByCharacters) or not buildUtil.canBePlace(self, square) then return false; end

    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
        return false;
    end

    -- if all checks passed, return true
    return true;
end

---Checks if the furniture placement is valid
---@param square IsoGridSquare The square to check for the main part
---@return boolean validity
function ISThreeTileSimpleFurniture:isValid(square)
    if not square then return false; end
    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then return false; end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya = self:getSquare2Pos(square, self.north);
    local xb, yb = self:getSquare3Pos(square, self.north);

    local squareA = getCell():getGridSquare(xa, ya, square:getZ());
    local squareB = getCell():getGridSquare(xb, yb, square:getZ());

    if (not squareA) or (not squareB) then return false; end

    if square:isSomethingTo(squareA) then return false; end
    if squareA:isSomethingTo(squareB) then return false; end

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
    -- if all checks passed, return true
    return true;
end

---Calculates the position of the second part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the second part
function ISThreeTileSimpleFurniture:getSquare2Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 1;
    else
        y = y - 1;
    end
    return x, y, z;
end

---Return the square for the second part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return IsoGridSquare square Square for the second part of the furniture
function ISThreeTileSimpleFurniture:getSquare2(square, north)
    local x, y, z = self:getSquare2Pos(square, north);
    return getCell():getGridSquare(x, y, z);
end

---Calculates the position of the third part of the furniture
---@param square IsoGridSquare The square of the main part
---@param north boolean Whether the furniture is facing north
---@return integer x, integer y, integer z coordinates for the third part
function ISThreeTileSimpleFurniture:getSquare3Pos(square, north)
    local x, y, z = square:getX(), square:getY(), square:getZ();

    if north then
        x = x + 2;
    else
        y = y - 2;
    end
    return x, y, z;
end


---Checks if a part of the furniture already exists on a given square
---@param square IsoGridSquare The square to check
---@param index integer The index of the part to check for
---@return boolean exists
function ISThreeTileSimpleFurniture:partExists(square, index)
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
function ISThreeTileSimpleFurniture:getSpriteNameForPart(index, north)
    if index == 1 or index == nil then index = ""; end
    if north then
        return self["northSprite" .. index];
    else
        return self["sprite" .. index];
    end
end
