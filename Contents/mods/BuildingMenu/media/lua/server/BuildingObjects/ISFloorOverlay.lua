--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISFloorOverlay = ISBuildingObject:derive("ISFloorOverlay");

--************************************************************************--
--** ISFloorOverlay:new
--**
--************************************************************************--
function ISFloorOverlay:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self.javaObject = IsoObject.new(cell, self.sq, sprite, north, self);
	buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
	
	self.javaObject:transmitCompleteItemToServer();
end

function ISFloorOverlay:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
		end
	end
end

function ISFloorOverlay:new(name, sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.name = name;
	o.canBarricade = false;
	o.dismantable = false;
	o.blockAllTheSquare = false;
	o.canBeAlwaysPlaced = true;
	o.buildLow = true;
	o.canPassThrough = true;
	o.needToBeAgainstWall = false;
	return o;
end

-- return the health of the new container, it's 100 + 100 per carpentry lvl
function ISFloorOverlay:getHealth()
	return 100 + buildUtil.getWoodHealth(self);
end

function ISFloorOverlay:isValid(square)
	if not ISBuildingObject.isValid(self, square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false end
	if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    return true;
end

function ISFloorOverlay:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
