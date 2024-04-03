require 'BM_Utils'

ISMetalWall = ISBuildingObject:derive("ISMetalWall");

--************************************************************************--
--** ISMetalWall:new
--**
--************************************************************************--
function ISMetalWall:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
	buildUtil.setInfo(self.javaObject, self);
	buildUtil.consumeMaterial(self);
	if not self.health then
		self.javaObject:setMaxHealth(self:getHealth());
	else
		self.javaObject:setMaxHealth(self.health);
	end
	self.javaObject:setHealth(self.javaObject:getMaxHealth());
	self.javaObject:setName(self.name);

	self.javaObject:setBreakSound("BreakObject");

	self.sq:AddSpecialObject(self.javaObject, self:getObjectIndex());
	self.sq:RecalcAllWithNeighbours(true);

	buildUtil.checkCorner(x, y, z, north, self, self.javaObject);

	self.javaObject:transmitCompleteItemToServer();
end

function ISMetalWall:new(sprite, northSprite, corner)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.corner = corner;
	o.canBarricade = true;
	o.name = "Metal Wall";
	o.isWallLike = true
	return o;
end

-- return the health of the new wall, it's 400 + 60 per metalwelding lvl + 100 for handy trait
function ISMetalWall:getHealth()
	return 400 + BM_Utils.getMetalHealth(self);
end

function ISMetalWall:isValid(square)
	if not self:haveMaterial(square) then return false end

	--	if not buildUtil.canBePlace(self, square) then return false end
	if isClient() and SafeHouse.isSafeHouse(square, getSpecificPlayer(self.player):getUsername(), true) then
		return false;
	end

	if square:isVehicleIntersecting() then return false end

	for i = 1, square:getObjects():size() do
		local object = square:getObjects():get(i - 1);
		local sprite = object:getSprite()
		if (sprite and ((sprite:getProperties():Is(IsoFlagType.collideN) and self.north) or
				(sprite:getProperties():Is(IsoFlagType.collideW) and not self.north))) or
			((instanceof(object, "IsoThumpable") and (object:getNorth() == self.north)) and not object:isCorner() and not object:isFloor() and not object:isBlockAllTheSquare()) or
			(instanceof(object, "IsoWindow") and object:getNorth() == self.north) or
			(instanceof(object, "IsoDoor") and object:getNorth() == self.north) then
			return false;
		end

		-- Forbid placing walls between parts of multi-tile objects like couches.
		-- TODO: Check for parts being destroyed.
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

	if buildUtil.stairIsBlockingPlacement(square, true, (self.nSprite == 4 or self.nSprite == 2)) then return false; end

	-- if we don't have floor we gonna check if there's a stairs under it, in this case we allow the build
	if not square:hasFloor(self.north) then
		local belowSQ = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1)
		if belowSQ then
			if self.north and not belowSQ:HasStairsWest() then return false; end
			if not self.north and not belowSQ:HasStairsNorth() then return false; end
		end
	end

	return true -- square:isFreeOrMidair(false);
end

function ISMetalWall:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

function ISMetalWall:getObjectIndex()
	for i = self.sq:getObjects():size(), 1, -1 do
		local object = self.sq:getObjects():get(i - 1)
		local props = object:getProperties()
		if props and props:Is(IsoFlagType.solidfloor) then
			return i
		end
	end
	return -1
end
