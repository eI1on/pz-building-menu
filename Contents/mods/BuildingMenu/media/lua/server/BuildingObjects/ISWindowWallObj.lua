ISWindowWallObj = ISBuildingObject:derive('ISWindowWallObj')

function ISWindowWallObj:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)

    self.javaObject = IsoWindow.new(getCell(), self.sq, getSprite(sprite), north)
	buildUtil.consumeMaterial(self)
	self.javaObject:getModData().WindowWall = true;
    self.sq:AddSpecialObject(self.javaObject)

    buildUtil.checkCorner(x,y,z,north,self, self.javaObject);

    self.javaObject:transmitCompleteItemToServer()
end

function ISWindowWallObj:checkCorner(x,y,z,north)
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
		ISWindowWallObj:addCorner(sx,sy,z,north);
	end
end

function ISWindowWallObj:addCorner(x,y,z, north)
	local sq = getCell():getGridSquare(x, y, z);
	local corner = IsoThumpable.new(getCell(), sq, "TileWalls_51", north, self);
	corner:setCorner(true);
	corner:setCanBarricade(false);
	sq:AddSpecialObject(corner);
	corner:transmitCompleteItemToServer();
end

function ISWindowWallObj:isValid(square)

	if not self:haveMaterial(square) then return false end

	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false end

    if buildUtil.stairIsBlockingPlacement( square, true, (self.nSprite==4 or self.nSprite==2) ) then return false; end

	if not square:hasFloor(self.north) then
		local belowSQ = getCell():getGridSquare(square:getX(), square:getY(), square:getZ()-1)
		if belowSQ then
			if self.north and not belowSQ:HasStairsWest() then return false; end
			if not self.north and not belowSQ:HasStairsNorth() then return false; end
		end
	end

	if self.canBeAlwaysPlaced then return true end

	for i=1,square:getObjects():size() do
		local object = square:getObjects():get(i-1);
		local sprite = object:getSprite()
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and self.north) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not self.north))) or
				((instanceof(object, "IsoThumpable") and (object:getNorth() == self.north)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
				(instanceof(object, "IsoWindow") and object:getNorth() == self.north) or
				(instanceof(object, "IsoDoor") and object:getNorth() == self.north) then
			return false;
		end

		local spriteGrid = sprite and sprite:getSpriteGrid()
		if spriteGrid then
			local gridX = spriteGrid:getSpriteGridPosX(sprite)
			local gridY = spriteGrid:getSpriteGridPosY(sprite)
			if self.north and gridY > 0 then
				return false;
			end
			if not self.north and gridX > 0 then
				return false;
			end
		end
	end

	return true
end

function ISWindowWallObj:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square)
end

function ISWindowWallObj:new(sprite, northSprite, player)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o:init()
    o:setSprite(sprite)
    o:setNorthSprite(northSprite)
    o.player = player
    o.canBarricade = true
    o.dismantable = true
    o.stopOnWalk = true
    o.stopOnRun = true
    o.maxTime = 150
    return o
end
