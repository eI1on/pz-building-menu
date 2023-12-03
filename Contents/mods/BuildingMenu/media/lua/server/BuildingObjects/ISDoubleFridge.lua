ISDoubleFridge = ISBuildingObject:derive("ISDoubleFridge");

--************************************************************************--
--** ISDoubleFridge:new
--**
--************************************************************************--
function ISDoubleFridge:new(player, name, sprite1, sprite2, northSprite1, northSprite2)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite1);
	o:setNorthSprite(northSprite1);
	o.player = player;
	o.sprite2 = sprite2;
	o.northSprite2 = northSprite2;
	o.name = name;
	o.canBarricade = false;
	o.dismantable = true;
	o.blockAllTheSquare = true;
	o.canBeAlwaysPlaced = true;
	o.buildLow = false;
	return o;
end

function ISDoubleFridge:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self:setInfo(self.sq, north, sprite, self);

	local spriteAName = self.northSprite2;

	local xa = x;
	local ya = y;

	if north then 
		ya = ya - 1; 
	else
		spriteAName = self.sprite2;
		xa = xa - 1;
	end
	local squareA = cell:getGridSquare(xa, ya, z);

	local oldModData = self.modData
	self.modData = {}
	self:setInfo(squareA, north, spriteAName);

	self.modData = oldModData
	buildUtil.consumeMaterial(self);
end

function ISDoubleFridge:walkTo(x, y, z)
	local playerObj = getSpecificPlayer(self.player)
	local square = getCell():getGridSquare(x, y, z)
	local square2 = self:getSquare2(square, self.north)
	if square:DistToProper(playerObj) < square2:DistToProper(playerObj) then
		return luautils.walkAdj(playerObj, square)
	end
	return luautils.walkAdj(playerObj, square2)
end

function ISDoubleFridge:setInfo(square, north, sprite)
	local thumpable = IsoThumpable.new(getCell(), square, sprite, north, self);

	buildUtil.setInfo(thumpable, self);

	-- local _fridgeInv = ItemContainer.new()
    -- _fridgeInv:setType('fridge')
	-- _fridgeInv:removeAllItems()
    -- _fridgeInv:setCapacity(50)
    -- _fridgeInv:setIsDevice(true)
    -- _fridgeInv:setParent(self.javaObject)
    -- thumpable:setContainer(_fridgeInv)

	-- local _freezerInv = ItemContainer.new()
    -- _freezerInv:setType('freezer')
	-- _freezerInv:removeAllItems()
    -- _freezerInv:setCapacity(20)
    -- _freezerInv:setIsDevice(true)
    -- _freezerInv:setParent(self.javaObject)
    -- thumpable:addSecondaryContainer(_freezerInv)

	thumpable:createContainersFromSpriteProperties()

	for i=1,thumpable:getContainerCount() do
		thumpable:getContainerByIndex(i-1):setExplored(true)
	end

	thumpable:setMaxHealth(self:getHealth());
	thumpable:setHealth(thumpable:getMaxHealth())

	local sharedSprite = getSprite(self:getSprite())
	if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
		local props = ISMoveableSpriteProps.new(sharedSprite)
		self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq))
	end

	thumpable:setBreakSound("BreakObject");
	square:AddSpecialObject(thumpable);
	thumpable:transmitCompleteItemToServer();
end

function ISDoubleFridge:removeFromGround(square)
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
			break
		end
	end

	local xa = square:getX();
	local ya = square:getY();

	if self:getNorth() then
		ya = ya - 1;
	else
		xa = xa - 1;
	end

	square = getCell():getGridSquare(xa, ya, square:getZ());
	for i = 0, square:getSpecialObjects():size() do
		local thump = square:getSpecialObjects():get(i);
		if instanceof(thump, "IsoThumpable") then
			square:transmitRemoveItemFromSquare(thump);
			break
		end
	end
end

function ISDoubleFridge:getHealth()
	return 200 + buildUtil.getWoodHealth(self);
end

function ISDoubleFridge:render(x, y, z, square)

	ISBuildingObject.render(self, x, y, z, square)

	local spriteAName = self.northSprite2;

	local spriteAFree = true;

	local xa, ya, za = self:getSquare2Pos(square, self.north)

	if not self.north then
		spriteAName = self.sprite2;
	end
	local squareA = getCell():getGridSquare(xa, ya, za);

	if not self.canBeAlwaysPlaced and (not squareA or not squareA:isFreeOrMidair(true)) then
		spriteAFree = false;
	end

	if squareA and squareA:isVehicleIntersecting() then spriteAFree = false end

	local spriteA = IsoSprite.new();
	spriteA:LoadFramesNoDirPageSimple(spriteAName);
	if spriteAFree then
		spriteA:RenderGhostTile(xa, ya, za);
	else
		spriteA:RenderGhostTileRed(xa, ya, za);
	end
end

function ISDoubleFridge:isValid(square)
	if not ISBuildingObject.isValid(self, square) then
		return false
    end
    if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
	if square:isVehicleIntersecting() then return false end
	local xa, ya, za = self:getSquare2Pos(square, self.north)
	local squareA = getCell():getGridSquare(xa, ya, za)
	if not squareA or not squareA:isFreeOrMidair(true) or buildUtil.stairIsBlockingPlacement( squareA, true ) then
		return false
	end
	if squareA:isVehicleIntersecting() then return false end
	return true
end

function ISDoubleFridge:getSquare2Pos(square, north)
	local x = square:getX()
	local y = square:getY()
	local z = square:getZ()
	if north then
		y = y - 1
	else
		x = x - 1
	end
	return x, y, z
end

function ISDoubleFridge:getSquare2(square, north)
	local x, y, z = self:getSquare2Pos(square, north)
	return getCell():getGridSquare(x, y, z)
end

