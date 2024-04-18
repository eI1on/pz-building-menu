ISWoodenDoor = ISBuildingObject:derive("ISWoodenDoor");

--************************************************************************--
--** ISWoodenDoor:new
--**
--************************************************************************--


local function safeCallMethod(object, methodName, ...)
    if type(object[methodName]) == "function" then
        return object[methodName](object, ...)
    end
end

---Creates a door and places it in the world.
---@param x number The x-coordinate in the world.
---@param y number The y-coordinate in the world.
---@param z number The z-coordinate (floor level).
---@param north boolean Whether the double fridge is facing north.
---@param sprite string The sprite to use for this object.
function ISWoodenDoor:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();
	self.sq = cell:getGridSquare(x, y, z);
	local openSprite = self.openSprite;
	if north then
		openSprite = self.openNorthSprite;
	end

	self.javaObject = IsoDoor.new(cell, self.sq, sprite, north, self);
	local isoOpenSprite = getSprite(openSprite);
	isoOpenSprite:setName(openSprite);
	self.javaObject:setOpenSprite(isoOpenSprite);

	-- self.javaObject = IsoThumpable.new(cell, self.sq, sprite, openSprite, north, self);

	local consumedItems = buildUtil.consumeMaterial(self);
	-- the wooden wall have 200 base health + 100 per carpentry lvl

    safeCallMethod(self.javaObject, "setName", self.name);
	safeCallMethod(self.javaObject, "setHealth", self:getHealth());
    safeCallMethod(self.javaObject, "setBreakSound", "BreakDoor");

	-- add the item to the ground
    self.sq:AddSpecialObject(self.javaObject);
    -- set the key id if we had one
    for _,item in ipairs(consumedItems) do
		if item:getType() == "Doorknob" and item:getKeyId() ~= -1 then
			self.javaObject:setKeyId(item:getKeyId())
		end
    end
	self.javaObject:transmitCompleteItemToServer();
end

---Constructor for ISWoodenDoor
---@param sprite string
---@param northSprite string
---@param openSprite string
---@param openNorthSprite string
---@return ISDoubleFridge
function ISWoodenDoor:new(sprite, northSprite, openSprite, openNorthSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.openSprite = openSprite;
	o.openNorthSprite = openNorthSprite;
	o.isDoor = true;
	o.thumpDmg = 5;
	o.name = "Wooden Door";
	o.isWallLike = true
	return o;
end

-- Return the health of the new wall, it's 300 + 100 per carpentry lvl
---@return number
function ISWoodenDoor:getHealth()
	return 300 + buildUtil.getWoodHealth(self);
end

---Valid only if it's on a door frame
---@param square IsoGridSquare The square to check for the first part.
---@return boolean
function ISWoodenDoor:isValid(square)
	if not self:haveMaterial(square) then return false end
	if not square:isFreeOrMidair(false) or not square:hasFloor(self.north) then return false end
	if square:isVehicleIntersecting() then return false end
	local hasFrame = false
	local hasDoor = false
	for i = 0, square:getSpecialObjects():size() - 1 do
		local item = square:getSpecialObjects():get(i);
		if instanceof(item, "IsoThumpable") and item:isDoorFrame() and item:getNorth() == self.north then
			hasFrame = true
		end
		if instanceof(item, "IsoThumpable") and item:isDoor() and item:getNorth() == self.north then
			hasDoor = true
		end
	end
	for i=0,square:getObjects():size()-1 do
		local o = square:getObjects():get(i)
		if instanceof(o, 'IsoObject') then
			if self.north and o:getType() == IsoObjectType.doorFrN then
				hasFrame = true
			end
			if not self.north and o:getType() == IsoObjectType.doorFrW then
				hasFrame = true
			end
			local sprite = o:getSprite()
			if self.north and sprite and sprite:getProperties():Is("DoorWallN") then
				hasFrame = true
			end
			if not self.north and sprite and sprite:getProperties():Is("DoorWallW") then
				hasFrame = true
			end
		end
		if instanceof(o, 'IsoDoor') and o:getNorth() == self.north then
			hasDoor = true
		end
	end

    if self.dontNeedFrame then return not hasDoor; end
	return hasFrame and not hasDoor
end

-- used to render more tile for example
function ISWoodenDoor:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end
