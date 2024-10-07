local BM_Utils = require("BM_Utils");

ISDoorFrame = ISBuildingObject:derive("ISDoorFrame");

---Creates a doorframe and places it in the world
---@param x number The x coordinate in the world
---@param y number The y coordinate in the world
---@param z number The z coordinate (floor level)
---@param north boolean Whether the door frame is facing north
---@param sprite string The sprite to use for this object
function ISDoorFrame:create(x, y, z, north, sprite)
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

	self.sq:AddSpecialObject(self.javaObject);
	self.sq:RecalcAllWithNeighbours(true);

	buildUtil.checkCorner(x, y, z, north, self, self.javaObject);

	if self.attachedSprites ~= nil then
		local attachedSprites = nil;
		if self.north then
			attachedSprites = self.attachedSprites.northSprite;
		elseif self.west then
			attachedSprites = self.attachedSprites.sprite;
		elseif self.south then
			attachedSprites = self.attachedSprites.southSprite;
		elseif self.east then
			attachedSprites = self.attachedSprites.eastSprite;
		end

		if attachedSprites ~= nil then
			self.javaObject:setAttachedAnimSprite(ArrayList:new());
			for i = 1, #attachedSprites do
				self.javaObject:getAttachedAnimSprite():add(getSprite(attachedSprites[i]):newInstance());
			end
		end
	end

	self.javaObject:transmitCompleteItemToServer();
end

---Constructor for ISDoorFrame
---@param sprite string
---@param northSprite string
---@param corner string
---@return ISWall ISBuildingObject instance
function ISDoorFrame:new(sprite, northSprite, corner)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.corner = corner;
	o.canPassThrough = true;
	o.isDoorFrame = true;
	o.name = "Door_Frame";
	o.isThumpable = false;
	o.isWallLike = true;
	return o;
end

-- Return the health of the new wall
---@return number health
function ISDoorFrame:getHealth()
	if self.usedTools then
		for i, tool in ipairs(self.usedTools) do
			local toolType = tool.toolType;
			if toolType == "BlowTorch" then
				return 700 + BM_Utils.getMetalHealth(self);
			end
		end
	end
	if self.sprite == "carpentry_02_80" then
		return 600 + buildUtil.getWoodHealth(self);
	else
		return 500 + buildUtil.getWoodHealth(self);
	end
end

---@param square IsoGridSquare The square to check for the first part
---@return boolean validity
function ISDoorFrame:isValid(square)
	if not self:haveMaterial(square) then return false; end
	if not buildUtil.canBePlace(self, square) then return false; end
	if buildUtil.stairIsBlockingPlacement(square, true, self.north) then return false; end
	if not square:hasFloor(self.north) then return false; end
	return square:isFreeOrMidair(false);
end

--- Renders a ghost tile of the wall for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the wall will be placed
function ISDoorFrame:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end
