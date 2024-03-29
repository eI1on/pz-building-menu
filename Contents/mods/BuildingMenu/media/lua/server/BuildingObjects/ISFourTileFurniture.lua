---@class ISFourTileFurniture : ISBuildingObject
---@field sprite2 string Sprite for the second tile.
---@field sprite3 string Sprite for the third tile.
---@field sprite4 string Sprite for the fourth tile.
---@field northSprite string North-facing sprite for the main tile.
---@field northSprite2 string North-facing sprite for the second tile.
---@field northSprite3 string North-facing sprite for the third tile.
---@field northSprite4 string North-facing sprite for the fourth tile.
ISFourTileFurniture = ISBuildingObject:derive("ISFourTileFurniture");


--************************************************************************--
--** ISFourTileFurniture:new
--**
--************************************************************************--
--     / \   / \
--    /x-1\ / x \              sprite4             northSprite4
--  / \ y / \y-1/ \
-- /x-1\ / x \ /x+1\    sprite3       sprite/northSprite     northSprite3
-- \y+1/ \ y / \y-1/
--  \ / x \ /x+1\ /            sprite2             northSprite2
--    \y+1/ \ y / 
--     \ /   \ /

---Constructor for ISFourTileFurniture.
---@param name string Name of the furniture.
---@param sprite string Sprite for the main tile.
---@param sprite2 string Sprite for the second tile.
---@param sprite3 string Sprite for the third tile.
---@param sprite4 string Sprite for the fourth tile.
---@param northSprite string North-facing sprite for the main tile.
---@param northSprite2 string North-facing sprite for the second tile.
---@param northSprite3 string North-facing sprite for the third tile.
---@param northSprite4 string North-facing sprite for the fourth tile.
---@return ISFourTileFurniture
function ISFourTileFurniture:new(name, sprite, sprite2, sprite3, sprite4, northSprite, northSprite2, northSprite3, northSprite4)
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

	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	return o;
end

---Creates and places the furniture in the game world.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param north boolean Whether the furniture is facing north.
---@param sprite string The sprite to use for this object.
function ISFourTileFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    local square = cell:getGridSquare(x, y, z)

    -- determine the positions for the other 3 tiles in the 2x2 formation
    local xa, ya = self:getSquare2Pos(square, north)
    local xb, yb = self:getSquare3Pos(square, north)
    local xc, yc = self:getSquare4Pos(square, north)

    -- define the sprite names for the additional tiles
    local spriteAName = north and self.northSprite2 or self.sprite2
    local spriteBName = north and self.northSprite3 or self.sprite3
    local spriteCName = north and self.northSprite4 or self.sprite4

    -- create all 4 parts of the 2x2 furniture
    self:addFurniturePart(x, y, z, north, sprite, 1)
    self:addFurniturePart(xa, ya, z, north, spriteAName, 2)
    self:addFurniturePart(xb, yb, z, north, spriteBName, 3)
    self:addFurniturePart(xc, yc, z, north, spriteCName, 4)

    buildUtil.consumeMaterial(self);
end


---Adds a furniture part to the world.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param north boolean Whether the part is facing north.
---@param sprite string The sprite for this part.
---@param index number The index of the part.
function ISFourTileFurniture:addFurniturePart(x, y, z, north, sprite, index)
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


---Determines the walk-to square for interaction.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@return boolean
function ISFourTileFurniture:walkTo(x, y, z)
	local playerObj = getSpecificPlayer(self.player)
	local square = getCell():getGridSquare(x, y, z)
	local square2 = self:getSquare2(square, self.north)
	if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
		return luautils.walkAdj(playerObj, square)
	end
	return luautils.walkAdj(playerObj, square2)
end


---Removes the furniture part from the ground.
---@param square IsoGridSquare The square from which to remove the furniture.
local function removeItemFromSquare(square)
    for i = 1, square:getSpecialObjects():size() do
        local thump = square:getSpecialObjects():get(i - 1);
        if instanceof(thump, "IsoThumpable") then
            square:transmitRemoveItemFromSquare(thump)
            break
        end
    end
end

---Removes the furniture object from the ground.
---@param square IsoGridSquare The square from which to remove the furniture.
function ISFourTileFurniture:removeFromGround(square)
    local isNorth = self:getNorth()
    local positions = {
        self:getSquare2Pos(square, isNorth),
        self:getSquare3Pos(square, isNorth),
        self:getSquare4Pos(square, isNorth)
    }

    for _, pos in ipairs(positions) do
        local xa, ya = unpack(pos)
        local squareA = getCell():getGridSquare(xa, ya, square:getZ())
        removeItemFromSquare(squareA)
    end
end


---Calculates the health of the furniture based on certain conditions. Currently it's 400 + 100 per carpentry lvl
---@return number
function ISFourTileFurniture:getHealth()
    return 400 + buildUtil.getWoodHealth(self);
end

---Renders the furniture object in the world.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param square IsoGridSquare The square where the furniture will be placed.
function ISFourTileFurniture:render(x, y, z, square)
    local spriteName = self:getSprite()
    local spriteAName = self.sprite2
    local spriteBName = self.sprite3
    local spriteCName = self.sprite4

    if self.north then
        spriteAName = self.northSprite2
        spriteBName = self.northSprite3
        spriteCName = self.northSprite4
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
    local xc, yc, zc = self:getSquare4Pos(square, self.north)

    -- squares for the additional tiles
    local squareA = getCell():getGridSquare(xa, ya, za)
    local squareB = getCell():getGridSquare(xb, yb, zb)
    local squareC = getCell():getGridSquare(xc, yc, zc)

    -- check validity for additional squares
    local spriteAFree = self:checkSingleTileValidity(squareA)
    local spriteBFree = self:checkSingleTileValidity(squareB)
    local spriteCFree = self:checkSingleTileValidity(squareC)

    -- render additional parts
    self:renderPart(spriteAName, xa, ya, za, spriteAFree)
    self:renderPart(spriteBName, xb, yb, zb, spriteBFree)
    self:renderPart(spriteCName, xc, yc, zc, spriteCFree)
end

---Renders a part of the furniture.
---@param spriteName string The name of the sprite to render.
---@param x number X-coordinate in the world.
---@param y number Y-coordinate in the world.
---@param z number Z-coordinate (floor level).
---@param isFree boolean Whether the tile is free to place the part.
function ISFourTileFurniture:renderPart(spriteName, x, y, z, isFree)
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
function ISFourTileFurniture:checkSingleTileValidity(square)
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
function ISFourTileFurniture:isValid(square)
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
    local xc, yc = self:getSquare4Pos(square, self.north)

    local squareA = getCell():getGridSquare(xa, ya, square:getZ())
    local squareB = getCell():getGridSquare(xb, yb, square:getZ())
    local squareC = getCell():getGridSquare(xc, yc, square:getZ())

    if (not squareA) or (not squareB) or (not squareC) then
        return false
    end

    if squareA:isSomethingTo(square) then return false; end
    if squareB:isSomethingTo(squareA) then return false; end
    if squareC:isSomethingTo(squareB) then return false; end

    -- check validity for additional squares
    local spriteAFree = self:checkSingleTileValidity(squareA)
    local spriteBFree = self:checkSingleTileValidity(squareB)
    local spriteCFree = self:checkSingleTileValidity(squareC)

    if not spriteAFree or not spriteBFree or not spriteCFree then
        return false;
    end
    -- if all checks passed, return true
    return true
end


---Calculates the position of the second part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return number X, number Y, number Z coordinates for the second part.
function ISFourTileFurniture:getSquare2Pos(square, north)
    local x, y = square:getX(), square:getY()
    if north then
        x = x + 1
    else
        y = y + 1
    end
    return x, y, square:getZ()
end

---Calculates the position of the third part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return number X, number Y, number Z coordinates for the third part.
function ISFourTileFurniture:getSquare3Pos(square, north)
    local x, y = square:getX(), square:getY()
    if north then
        x = x + 1
        y = y - 1
    else
        x = x - 1
        y = y + 1
    end
    return x, y, square:getZ()
end

---Calculates the position of the fourth part of the furniture.
---@param square IsoGridSquare The square of the main part.
---@param north boolean Whether the furniture is facing north.
---@return number X, number Y, number Z coordinates for the fourth part.
function ISFourTileFurniture:getSquare4Pos(square, north)
    local x, y = square:getX(), square:getY()
    if north then
        y = y - 1
    else
        x = x - 1
    end
    return x, y, square:getZ()
end


function ISFourTileFurniture:getSquare2(square, north)
	local x, y, z = self:getSquare2Pos(square, north)
	return getCell():getGridSquare(x, y, z)
end


---Checks if a part of the furniture already exists on a given square.
---@param square IsoGridSquare The square to check.
---@param index number The index of the part to check for.
---@return boolean
function ISFourTileFurniture:partExists(square, index)
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
function ISFourTileFurniture:getSpriteNameForPart(index, north)
    if north then
        return self["northSprite" .. index]
    else
        return self["sprite" .. index]
    end
end