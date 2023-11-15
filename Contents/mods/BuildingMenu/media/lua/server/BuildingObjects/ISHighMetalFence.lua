ISHighMetalFence = ISBuildingObject:derive('ISHighMetalFence')

function ISHighMetalFence:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)

    local xa, ya = self:getSquare2Pos(self.sq, north)

    if self.north then
        self:addPart(x - 1, y + 1, z, north, self.northSprite1)
        self:addPart(xa - 2, ya, z, north, self.northSprite2)
    else
        self:addPart(x, y - 1, z, north, self.sprite1)
        self:addPart(xa + 1, ya - 2, z, north, self.sprite2)
    end

    buildUtil.consumeMaterial(self)
end

function ISHighMetalFence:addPart(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    local sq = cell:getGridSquare(x, y, z)
    if not north then
        sq = cell:getGridSquare(x, y + 1, z)
    else
        sq = cell:getGridSquare(x + 1, y - 1, z)
    end

    self.javaObject = IsoThumpable.new(cell, sq, sprite, north, self)
    buildUtil.setInfo(self.javaObject, self);
    self.javaObject:setThumpSound("ZombieThumpMetal")

    sq:AddSpecialObject(self.javaObject)
    self.javaObject:transmitCompleteItemToServer()
end

function ISHighMetalFence:checkCorner(x,y,z,north)
	local found = false;
	local sx = x;
	local sy = y;
	local sq2 = getCell():getGridSquare(x + 1, y - 1, z);
	for i = 0, sq2:getSpecialObjects():size() - 1 do
		local item = sq2:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item:getNorth() ~= north  then
			found = true;
			sx = x + 1;
			sy = y;
			break;
		end
	end
	if found then
		ISHighMetalFence:addCorner(sx,sy,z,north);
	end
end

function ISHighMetalFence:addCorner(x,y,z, north)
	local sq = getCell():getGridSquare(x, y, z);
	local corner = IsoThumpable.new(getCell(), sq, "TileWalls_51", north, self);
	corner:setCorner(true);
	corner:setCanBarricade(false);
	sq:AddSpecialObject(corner);
	corner:transmitCompleteItemToServer();
end

function ISHighMetalFence:getHealth()
    return 200 + buildUtil.getWoodHealth(self)
end

function ISHighMetalFence:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
    local spriteAName = self.northSprite2

    local spriteAFree = true

    local xa, ya, za = self:getSquare2Pos(square, self.north)

    if not self.north then
        spriteAName = self.sprite2
    end

    local squareA = getCell():getGridSquare(xa, ya, za)

    if not self.canBeAlwaysPlaced and (not squareA or not squareA:isFreeOrMidair(true)) then
        spriteAFree = false
    end

    if squareA and squareA:isVehicleIntersecting() then
        spriteAFree = false
    end

    local spriteA = IsoSprite.new()
    spriteA:LoadFramesNoDirPageSimple(spriteAName)
    if spriteAFree then
        if not self.north then
            spriteA:RenderGhostTile(xa + 1, ya - 1, za)
        else
            spriteA:RenderGhostTile(xa - 1, ya - 1, za)
        end
    else
        if not self.north then
            spriteA:RenderGhostTileRed(xa + 1, ya - 1, za)
        else
            spriteA:RenderGhostTileRed(xa - 1, ya - 1, za)
        end
    end
end

function ISHighMetalFence:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false
    end

    if buildUtil.stairIsBlockingPlacement(square, true) then
        return false
    end

    if square:isVehicleIntersecting() then
        return false
    end

    local xa, ya, za = self:getSquare2Pos(square, self.north)
    local squareA = getCell():getGridSquare(xa, ya, za)
    if not squareA or not squareA:isFreeOrMidair(true) or buildUtil.stairIsBlockingPlacement(squareA, true) then
        return false
    end

    if squareA:isVehicleIntersecting() then
        return false
    end

    return true
end

function ISHighMetalFence:getSquare2Pos(square, north)
    local x = square:getX()
    local y = square:getY()
    local z = square:getZ()

    if north then
        y = y + 1
    else
        x = x - 1
    end

    return x, y, z
end

function ISHighMetalFence:new(sprite1, sprite2, northSprite1, northSprite2)
    local o = {}

    setmetatable(o, self)
    self.__index = self

    o:init()
    o:setSprite(sprite1)
    o:setNorthSprite(northSprite1)

    o.sprite1 = sprite1
    o.sprite2 = sprite2
    o.northSprite1 = northSprite1
    o.northSprite2 = northSprite2
    o.corner = corner

    return o
end
