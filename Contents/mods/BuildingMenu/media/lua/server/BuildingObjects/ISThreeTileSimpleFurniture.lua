---@class ISThreeTileSimpleFurniture : ISBuildingObject
---@field sprite2 string Sprite for the second tile.
---@field sprite3 string Sprite for the third tile.
---@field northSprite string North-facing sprite for the main tile.
---@field northSprite2 string North-facing sprite for the second tile.
---@field northSprite3 string North-facing sprite for the third tile.
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

---Constructor for ISThreeTileSimpleFurniture.
---@param sprite string Sprite for the main tile.
---@param sprite2 string Sprite for the second tile.
---@param sprite3 string Sprite for the third tile.
---@param northSprite string North-facing sprite for the main tile.
---@param northSprite2 string North-facing sprite for the second tile.
---@param northSprite3 string North-facing sprite for the third tile.
---@return ISThreeTileSimpleFurniture
function ISThreeTileSimpleFurniture:new(sprite, sprite2, sprite3, northSprite, northSprite2, northSprite3)
    local o = {}
    setmetatable(o, self)
    self.__index = self

    o:init()
    o:setSprite(sprite)

    o.sprite2 = sprite2
    o.sprite3 = sprite3

    o.northSprite = northSprite
    o.northSprite2 = northSprite2
    o.northSprite3 = northSprite3
    o.isWallLike = false;
    o.thumpDmg = 5;
    o.name = 'Three Tile Furniture'

    return o
end

---Creates and places the furniture in the game world.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param north boolean Whether the furniture is facing north.
---@param sprite string The sprite to use for this object.
function ISThreeTileSimpleFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    local square = cell:getGridSquare(x, y, z);

    -- determine the positions for the other 3 tiles in the 1x4 formation
    local xa, ya = self:getSquare2Pos(square, north);
    local xb, yb = self:getSquare3Pos(square, north);

    -- define the sprite names for the additional tiles
    local spriteAName = north and self.northSprite2 or self.sprite2;
    local spriteBName = north and self.northSprite3 or self.sprite3;


    self:addFurniturePart(x, y, z, north, sprite, 1)
    self:addFurniturePart(xa, ya, z, north, spriteAName, 2)
    self:addFurniturePart(xb, yb, z, north, spriteBName, 3)

    buildUtil.consumeMaterial(self);
end

function ISThreeTileSimpleFurniture:addFurniturePart(x, y, z, north, sprite, index)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    -- check if the part already exists on this tile
    if self:partExists(self.sq, index) then return; end

    -- create the furniture part and set its properties
    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    buildUtil.setInfo(self.javaObject, self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound("BreakObject");
    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

function ISThreeTileSimpleFurniture:walkTo(x, y, z)
    local playerObj = getSpecificPlayer(self.player)
    local square = getCell():getGridSquare(x, y, z)
    local square2 = self:getSquare2(square, self.north)
    if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
        return luautils.walkAdj(playerObj, square)
    end
    return luautils.walkAdj(playerObj, square2)
end

local function removeItemFromSquare(square)
    for i = 1, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i - 1);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump)
            break
        end
    end
end


function ISThreeTileSimpleFurniture:removeFromGround(square)
    local isNorth = self:getNorth()
    local positions = {
        self:getSquare2Pos(square, isNorth),
        self:getSquare3Pos(square, isNorth),
    }

    for _, pos in ipairs(positions) do
        local xa, ya = unpack(pos)
        local squareA = getCell():getGridSquare(xa, ya, square:getZ())
        removeItemFromSquare(squareA)
    end
end

function ISThreeTileSimpleFurniture:getHealth()
    return 300 + buildUtil.getWoodHealth(self);
end

function ISThreeTileSimpleFurniture:render(x, y, z, square)
    local spriteName = self:getSprite()
    local spriteAName = self.sprite2
    local spriteBName = self.sprite3

    if self.north then
        spriteAName = self.northSprite2
        spriteBName = self.northSprite3
    end

    -- initial checks for the primary square
    local spriteFree = self:checkSingleTileValidity(square)

    -- render primary part
    local sprite = IsoSprite.new()
    sprite:LoadFramesNoDirPageSimple(spriteName)
    if spriteFree then
        sprite:RenderGhostTile(x, y, z)
    else
        sprite:RenderGhostTileRed(x, y, z)
    end

    -- positions for the additional tiles
    local xa, ya, za = self:getSquare2Pos(square, self.north)
    local xb, yb, zb = self:getSquare3Pos(square, self.north)

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    local squareB = getCell():getGridSquare(xb, yb, zb)

    -- check validity for additional squares
    local spriteAFree = self:checkSingleTileValidity(squareA)
    local spriteBFree = self:checkSingleTileValidity(squareB)

    -- render additional parts
    self:renderPart(spriteAName, xa, ya, za, spriteAFree)
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree)
end

---Renders a part of the furniture.
---@param spriteName string The name of the sprite to render.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param isFree boolean Whether the tile is free to place the part.
function ISThreeTileSimpleFurniture:renderPart(spriteName, x, y, z, isFree)
    local sprite = IsoSprite.new()
    sprite:LoadFramesNoDirPageSimple(spriteName)
    if isFree then
        sprite:RenderGhostTile(x, y, z)
    else
        sprite:RenderGhostTileRed(x, y, z)
    end
end

---Checks if a single tile is valid for shelf placement.
---@param square IsoGridSquare The square to check.
---@return boolean
function ISThreeTileSimpleFurniture:checkSingleTileValidity(square)
    if not square then return false end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false end
    if square:isVehicleIntersecting() then return false end
    -- check if the square is free or midair
    if not square:isFreeOrMidair(true) then return false end

    -- if all checks passed, return true
    return true
end

---Checks if the furniture placement is valid.
---@param square IsoGridSquare The square to check for the main part.
---@return boolean
function ISThreeTileSimpleFurniture:isValid(square)
    if not square then return false; end

    -- basic checks for the primary square
    if not self:haveMaterial(square) or not square:hasFloor(self.north) then
        return false
    end

    -- check the primary square (part 1)
    if not self:partExists(square, 1) and not self:checkSingleTileValidity(square) then
        return false
    end

    -- checks for additional squares (parts 2, 3, 4)
    local xa, ya = self:getSquare2Pos(square, self.north)
    local xb, yb = self:getSquare3Pos(square, self.north)

    local squareA = getCell():getGridSquare(xa, ya, square:getZ())
    local squareB = getCell():getGridSquare(xb, yb, square:getZ())

    if (not squareA) or (not squareB) then
        return false
    end

    if squareA:isSomethingTo(square) then return false; end
    if squareB:isSomethingTo(squareA) then return false; end

    -- check validity for additional squares
    local spriteAFree = self:checkSingleTileValidity(squareA)
    local spriteBFree = self:checkSingleTileValidity(squareB)

    if not spriteAFree or not spriteBFree then
        return false;
    end
    -- if all checks passed, return true
    return true
end

---Calculates the position of the second part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return number X, number Y, number Z coordinates for the second part.
function ISThreeTileSimpleFurniture:getSquare2Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        x = x + 1
    else
        y = y - 1
    end
    return x, y, z
end

---Return the square for the second part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return IsoGridSquare square Square for the second part of the furniture.
function ISThreeTileSimpleFurniture:getSquare2(square, north)
    local x, y, z = self:getSquare2Pos(square, north)
    return getCell():getGridSquare(x, y, z)
end

---Calculates the position of the third part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return number X, number Y, number Z coordinates for the third part.
function ISThreeTileSimpleFurniture:getSquare3Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        x = x + 2
    else
        y = y - 2
    end
    return x, y, z
end

---Checks if a part of the furniture already exists on a given square.
---@param square IsoGridSquare The square to check.
---@param index number The index of the part to check for.
---@return boolean
function ISThreeTileSimpleFurniture:partExists(square, index)
    local objects = square:getSpecialObjects()
    for i = 0, objects:size() - 1 do
        local object = objects:get(i)
        local sprite = object:getSprite()
        if object and sprite then
            local spriteName = sprite:getName()
            local expectedSpriteName = self:getSpriteNameForPart(index, object:getNorth())
            if spriteName == expectedSpriteName then
                return true
            end
        end
    end
    return false
end

---Gets the sprite name for a part based on its index and orientation.
---@param index number The index of the part.
---@param north boolean The orientation of the part.
---@return string The sprite name.
function ISThreeTileSimpleFurniture:getSpriteNameForPart(index, north)
    if north then
        return self["northSprite" .. index]
    else
        return self["sprite" .. index]
    end
end
