--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

ISDoubleFridge = ISBuildingObject:derive("ISDoubleFridge");

--************************************************************************--
--** ISDoubleFridge:new
--**
--************************************************************************--
function ISDoubleFridge:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	self:setInfo(self.sq, north, sprite, self);

	-- name of our 2 sprites needed for the rest of the furniture
	local spriteAName = self.northSprite2;

	local xa = x;
	local ya = y;

	-- we get the x and y of our next tile (depend if we're placing the furniture north or not)
	if north then
		ya = ya - 1;
	else
		-- if we're not north we also change our sprite
		spriteAName = self.sprite2;
		xa = xa - 1;
	end
	local squareA = cell:getGridSquare(xa, ya, z);

	local oldModData = self.modData
	self.modData = {}
	self:setInfo(squareA, north, spriteAName, self);

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
	-- add furniture to our ground
	local thumpable = IsoThumpable.new(getCell(), square, sprite, north, self);
	-- name of the item for the tooltip
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


	-- the furniture have 200 base health + 100 per carpentry lvl
	thumpable:setMaxHealth(self:getHealth());
	thumpable:setHealth(thumpable:getMaxHealth())

	local sharedSprite = getSprite(self:getSprite())
	if self.sq and sharedSprite and sharedSprite:getProperties():Is("IsStackable") then
		local props = ISMoveableSpriteProps.new(sharedSprite)
		self.javaObject:setRenderYOffset(props:getTotalTableHeight(self.sq))
	end

	-- the sound that will be played when our furniture will be broken
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

-- return the health of the new furniture, it's 200 + 100 per carpentry lvl
function ISDoubleFridge:getHealth()
	return 200 + buildUtil.getWoodHealth(self);
end

function ISDoubleFridge:render(x, y, z, square)
	-- render the first part
	ISBuildingObject.render(self, x, y, z, square)
	-- render the other part of the furniture
	-- name of our 2 sprites needed for the rest of the furniture
	local spriteAName = self.northSprite2;

	local spriteAFree = true;

	-- we get the x and y of our next tile (depend if we're placing the object north or not)
	local xa, ya, za = self:getSquare2Pos(square, self.north)

	-- if we're not north we also change our sprite
	if not self.north then
		spriteAName = self.sprite2;
	end
	local squareA = getCell():getGridSquare(xa, ya, za);

	-- test if the square are free to add our furniture
	if not self.canBeAlwaysPlaced and (not squareA or not squareA:isFreeOrMidair(true)) then
		spriteAFree = false;
	end

	if squareA and squareA:isVehicleIntersecting() then spriteAFree = false end

	-- render our second tile object
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

