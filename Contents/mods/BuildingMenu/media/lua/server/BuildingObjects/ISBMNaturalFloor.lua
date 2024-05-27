---@class ISBMNaturalFloor : ISBuildingObject
ISBMNaturalFloor = ISBuildingObject:derive("ISBMNaturalFloor");

--- Creates a new floor object at the specified location. If the prerequisites are not met (e.g., no existing floor), the function returns early
---@param x integer The x coordinate of the square
---@param y integer The y coordinate of the square
---@param z integer The z coordinate (floor level)
---@param north boolean If the object is aligned to the north
---@param sprite string The sprite to use for the floor
function ISBMNaturalFloor:create(x, y, z, north, sprite)
	local cell = getWorld():getCell();

	self.sq = cell:getGridSquare(x, y, z);
	if not self.sq then return; end

	local floor = self.sq:getFloor();
	if not floor then return; end

	self.javaObject = self.sq:addFloor(sprite);
	if not self.javaObject then return; end

	if self.item then
		local playerInv = self.playerObj:getInventory();
		for i = 1, self.uses do
			if playerInv:containsRecursive(self.item) then
				self.item:Use();
			else
				break;
			end
		end
		if not playerInv:containsRecursive(self.item) then
			self.item = playerInv:getFirstTypeRecurse(self.item:getFullType());
		end
	end

	local playerNum = self.playerObj:getPlayerNum();
	getPlayerInventory(playerNum):refreshBackpacks();
	getPlayerLoot(playerNum):refreshBackpacks();
end

--- Constructor for the ISBMNaturalFloor class
---@param sprite string The primary sprite for the object
---@param northSprite string The sprite used when the object is aligned north
---@param item InventoryItem The item required to create this object
---@param uses integer How many uses are used from the item when creating this object
---@param playerObj IsoPlayer The player instance creating the object
---@return ISBMNaturalFloor ISBuildingObject instance
function ISBMNaturalFloor:new(sprite, northSprite, item, uses, playerObj)
	local o = {};
	setmetatable(o, self);
	self.__index = self;

	o:init();

	o:setSprite(sprite);
	o:setNorthSprite(northSprite);

	o.item = item;
	o.uses = uses;
	o.itemType = item and item:getFullType() or "none";
	o.playerObj = playerObj;
	o.actionAnim = CharacterActionAnims.Pour;
	o.floorType = o:getFloorType(item);

	o.craftingBank = "DropSoilFromDirtBag";
	if o.floorType == "gravel" then
		o.craftingBank = "DropSoilFromGravelBag";
	elseif o.floorType == "sand" then
		o.craftingBank = "DropSoilFromSandBag";
	end
	return o;
end

--- Checks if the placement of a floor is valid
---@param square IsoGridSquare The square to check for validity
---@return boolean validity Whether the floor can be placed
function ISBMNaturalFloor:isValid(square)
	if ISBuildMenu.cheat then return true; end
	local playerInv = self.playerObj:getInventory();

	if CFarmingSystem.instance:getLuaObjectOnSquare(square) then
		return false;
	end

	if square and square:getProperties() then
		local props = square:getProperties();
		if props:Is(IsoFlagType.water) then
			return false;
		end
	end

	if self.item ~= nil and square ~= nil and square:getFloor() ~= nil then
		if playerInv:containsRecursive(self.item) then
			return true;
		else
			self.item = playerInv:getFirstTypeRecurse(self.itemType);
			return self.item ~= nil;
		end
	end
	return false;
end

--- Renders a ghost tile of the ISBMNaturalFloor, delegates to the superclass
---@param x integer The x coordinate to render
---@param y integer The y coordinate to render
---@param z integer The z coordinate (floor level) to render
---@param square IsoGridSquare The square where the object will be rendered
function ISBMNaturalFloor:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end

--- Determines the floor type based on the item used to create the floor
---@param item InventoryItem The item used to create the floor
---@return string type The type of floor ("gravel", "dirt", "sand", or "none")
function ISBMNaturalFloor:getFloorType(item)
	if not item then return "none"; end
	if item:getFullType() == "Base.Gravelbag" then
		return "gravel";
	elseif item:getFullType() == "Base.Dirtbag" then
		return "dirt";
	elseif item:getFullType() == "Base.Sandbag" then
		return "sand";
	end
	return "none";
end

--- Utility function to get all the sprite names for a floor tile
---@param square IsoGridSquare The square to check
---@return table<string> sprites List of sprite names for the floor tile
function ISBMNaturalFloor.getFloorSpriteNames(square)
	local sprites = {};
	local floor = square:getFloor();
	if floor then
		local sprite = floor:getSprite();
		if sprite and sprite:getName() then
			table.insert(sprites, sprite:getName());
			local attached = floor:getAttachedAnimSprite();
			if attached then
				for i = 1, attached:size() do
					sprite = attached:get(i - 1):getParentSprite();
					if sprite and sprite:getName() then
						table.insert(sprites, sprite:getName());
					end
				end
			end
		end
	end
	return sprites;
end
