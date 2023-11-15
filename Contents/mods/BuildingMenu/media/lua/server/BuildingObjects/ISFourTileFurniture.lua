ISFourTileFurniture = ISBuildingObject:derive("ISFourTileFurniture");

--************************************************************************--
--** ISFourTileFurniture:new
--**
--************************************************************************--
--     / \   / \
--    /x-1\ / x \
--  / \ y / \y-1/ \
-- /x-1\ / x \ /x+1\
-- \y+1/ \ y / \y-1/
--  \ / x \ /x+1\ /
--    \y+1/ \ y / 
--     \ /   \ /


function ISFourTileFurniture:new(name, sprite, sprite2, sprite3, sprite4, northSprite, northSprite2, northSprite3, northSprite4)
	local o = {};
	setmetatable(o, self);
	self.__index = self;

	o:init();

	o:setSprite(sprite);
    o.sprite2 = sprite2
    o.sprite3 = sprite3
    o.sprite4 = sprite4

    o.northSprite = northSprite
    o.northSprite2 = northSprite2
    o.northSprite3 = northSprite3
    o.northSprite4 = northSprite4

	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	return o;
end


function ISFourTileFurniture:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    local square = cell:getGridSquare(x, y, z)

    -- determine the positions for the other 3 tiles in the 2x2 formation
    local xa, ya = self:getSquare2Pos(square, north)
    local xb, yb = self:getSquare3Pos(square, north)
    local xc, yc = self:getSquare4Pos(square, north)

    -- define the sprite names for the additional tiles
    local spriteAName = self.sprite2
    local spriteBName = self.sprite3
    local spriteCName = self.sprite4

    if self.north then
        spriteAName = self.northSprite2
        spriteBName = self.northSprite3
        spriteCName = self.northSprite4
    end

    buildUtil.consumeMaterial(self);

    -- create all 4 parts of the 2x2 furniture
    self:addFurniturePart(x, y, z, north, sprite, 1)
    self:addFurniturePart(xa, ya, z, north, spriteAName, 2)
    self:addFurniturePart(xb, yb, z, north, spriteBName, 3)
    self:addFurniturePart(xc, yc, z, north, spriteCName, 4)
end


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


function ISFourTileFurniture:walkTo(x, y, z)
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


-- return the health of the new furniture, it's 400 + 100 per carpentry lvl
function ISFourTileFurniture:getHealth()
    return 400 + buildUtil.getWoodHealth(self);
end


function ISFourTileFurniture:render(x, y, z, square)
    local spriteName
    if not self:partExists(square, 1) then
        spriteName = self:getSprite()
        local sprite = IsoSprite.new()
        sprite:LoadFramesNoDirPageSimple(spriteName)

        local spriteFree = ISBuildingObject.isValid(self, square)

        if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
            spriteFree = false
        end
        if spriteFree then
            sprite:RenderGhostTile(x, y, z)
        else
            sprite:RenderGhostTileRed(x, y, z)
        end

    end
    local spriteAName = self.sprite2
    local spriteBName = self.sprite3
    local spriteCName = self.sprite4

    local spriteAFree = true
    local spriteBFree = true
    local spriteCFree = true

    local xa, ya = self:getSquare2Pos(square, self.north)
    local xb, yb = self:getSquare3Pos(square, self.north)
    local xc, yc = self:getSquare4Pos(square, self.north)

    if self.north then
        spriteName = self.northSprite
        spriteAName = self.northSprite2
        spriteBName = self.northSprite3
        spriteCName = self.northSprite4
    end

    local squareA = getCell():getGridSquare(xa, ya, z)
    if squareA == nil and getWorld():isValidSquare(xa, ya, z) then
        squareA = IsoGridSquare.new(getCell(), nil, xa, ya, z)
        getCell():ConnectNewSquare(squareA, false)
    end

    local squareB = getCell():getGridSquare(xb, yb, z)
    if squareB == nil and getWorld():isValidSquare(xb, yb, z) then
        squareB = IsoGridSquare.new(getCell(), nil, xb, yb, z)
        getCell():ConnectNewSquare(squareB, false)
    end

    local squareC = getCell():getGridSquare(xc, yc, z)
    if squareC == nil and getWorld():isValidSquare(xc, yc, z) then
        squareC = IsoGridSquare.new(getCell(), nil, xc, yc, z)
        getCell():ConnectNewSquare(squareC, false)
    end

    local existsA = self:partExists(squareA, 2)
    local existsB = self:partExists(squareB, 3)
    local existsC = self:partExists(squareC, 4)

    if not existsA and not self.canBeAlwaysPlaced and not buildUtil.canBePlace(self, squareA) then
        spriteAFree = false
    end
    if not existsB and not self.canBeAlwaysPlaced and not buildUtil.canBePlace(self, squareB) then
        spriteBFree = false
    end
    if not existsC and not self.canBeAlwaysPlaced and not buildUtil.canBePlace(self, squareC) then
        spriteCFree = false
    end

    if squareA and not self.canBeAlwaysPlaced and (squareA:isSomethingTo(square) or buildUtil.stairIsBlockingPlacement(squareA, true, self.north)) then
        spriteAFree = false
    end
    if squareB and not self.canBeAlwaysPlaced and (squareB:isSomethingTo(squareA) or buildUtil.stairIsBlockingPlacement(squareB, true, self.north)) then
        spriteBFree = false
    end
    if squareC and not self.canBeAlwaysPlaced and (squareC:isSomethingTo(squareB) or buildUtil.stairIsBlockingPlacement(squareC, true, self.north)) then
        spriteCFree = false
    end

    if not existsA then
        local spriteA = IsoSprite.new()
        spriteA:LoadFramesNoDirPageSimple(spriteAName)
        if spriteAFree then
            spriteA:RenderGhostTile(xa, ya, z)
        else
            spriteA:RenderGhostTileRed(xa, ya, z)
        end
    end
    if not existsB then
        local spriteB = IsoSprite.new()
        spriteB:LoadFramesNoDirPageSimple(spriteBName)
        if spriteBFree then
            spriteB:RenderGhostTile(xb, yb, z)
        else
            spriteB:RenderGhostTileRed(xb, yb, z)
        end
    end
    if not existsC then
        local spriteC = IsoSprite.new()
        spriteC:LoadFramesNoDirPageSimple(spriteCName)
        if spriteCFree then
            spriteC:RenderGhostTile(xc, yc, z)
        else
            spriteC:RenderGhostTileRed(xc, yc, z)
        end
    end
end


function ISFourTileFurniture:isValid(square)
    if not self:haveMaterial(square) or not square:hasFloor(self.north) or square:isVehicleIntersecting() then
        return false
    end
    if not self:partExists(square, 1) and not square:isFreeOrMidair(false) then
		return false
	end

    local function checkAndPlace(square, partIndex)
        if not self:partExists(square, partIndex) and not buildUtil.canBePlace(self, square) then
            return false
        end
        return true
    end

    local function checkStairBlockingPlacement(square)
        if buildUtil.stairIsBlockingPlacement(square, true, self.north) then
            return false
        end
        return true
    end

    local xa, ya = self:getSquare2Pos(square, self.north)
    local xb, yb = self:getSquare3Pos(square, self.north)
    local xc, yc = self:getSquare4Pos(square, self.north)
    local squareA = getCell():getGridSquare(xa, ya, square:getZ())
    local squareB = getCell():getGridSquare(xb, yb, square:getZ())
    local squareC = getCell():getGridSquare(xc, yc, square:getZ())

    if not squareA or not squareB or not squareC then
        return false
    end

    if not checkAndPlace(squareA, 2) or not checkAndPlace(squareB, 3) or not checkAndPlace(squareC, 4) then
        return false
    end

    if squareA:isSomethingTo(square) or squareB:isSomethingTo(squareA) or squareC:isSomethingTo(squareB) then
        return false
    end

    if not checkStairBlockingPlacement(square) or not checkStairBlockingPlacement(squareA) or not checkStairBlockingPlacement(squareB) or not checkStairBlockingPlacement(squareC) then
        return false
    end

    return true
end


function ISFourTileFurniture:getSquare2Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        x = x+1
    else
        y = y+1
    end

    return x, y, z
end


function ISFourTileFurniture:getSquare3Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        x = x+1
        y = y-1
    else
        x = x-1
        y = y+1
    end

    return x, y, z
end


function ISFourTileFurniture:getSquare4Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        y =y-1
    else
        x = x-1
    end

    return x, y, z
end


function ISFourTileFurniture:getSquare2(square, north)
	local x, y, z = self:getSquare2Pos(square, north)
	return getCell():getGridSquare(x, y, z)
end


function ISFourTileFurniture:partExists(square, index)
    local spriteName = self.north and self["northSprite" .. index] or self["sprite" .. index]
    local objects = square:getSpecialObjects()

    for i = 1, objects:size() do
        local object = objects:get(i - 1)
        if object and object:getObjectIndex() and object:getSprite() and object:getSprite():getName() then
            local objNorth = object.getNorth and object:getNorth() or nil
            if object:getObjectIndex() == index and objNorth == self.north and object:getSprite():getName() == spriteName then
                return true
            end
        end
    end

    return false
end