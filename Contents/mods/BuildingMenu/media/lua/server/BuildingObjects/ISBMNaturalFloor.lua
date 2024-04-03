ISBMNaturalFloor = ISBuildingObject:derive("ISBMNaturalFloor");

--************************************************************************--
--** ISBMNaturalFloor:new
--**
--************************************************************************--

function ISBMNaturalFloor:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z)
	if not self.sq then return end
	local floor = self.sq:getFloor()
	if not floor then return end
	self.javaObject = self.sq:addFloor(sprite)
	if not self.javaObject then return end
	if self.item then
		local playerInv = self.character:getInventory()
		for i = 1, self.uses do
			if playerInv:containsRecursive(self.item) then
				self.item:Use()
			else
				break
			end
		end
		if not playerInv:containsRecursive(self.item) then
			self.item = playerInv:getFirstTypeRecurse(self.item:getFullType())
		end
	end
	local playerNum = self.character:getPlayerNum()
	getPlayerInventory(playerNum):refreshBackpacks()
	getPlayerLoot(playerNum):refreshBackpacks()
end

function ISBMNaturalFloor:new(sprite, northSprite, item, uses, character)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.item = item;
	o.uses = uses;
	o.itemType = item and item:getFullType() or "none";
	o.character = character;
	o.noNeedHammer = true;
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

function ISBMNaturalFloor:isValid(square)
	if ISBuildMenu.cheat then return true; end
	local playerInv = self.character:getInventory()
	if CFarmingSystem.instance:getLuaObjectOnSquare(square) then
		return false
	end
	if square and square:getProperties() then
		local props = square:getProperties();
		if props:Is(IsoFlagType.water) then
			return false;
		end
	end
	if self.item ~= nil and square ~= nil and square:getFloor() ~= nil then
		if playerInv:containsRecursive(self.item) then
			return true
		else
			self.item = playerInv:getFirstTypeRecurse(self.itemType)
			return self.item ~= nil
		end
	end
	return false
end

function ISBMNaturalFloor:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square);
end

function ISBMNaturalFloor:walkTo(x, y, z)
	if ISBuildingObject.walkTo(self, x, y, z) then
		if self.item then
			ISWorldObjectContextMenu.transferIfNeeded(self.character, self.item)
		end
		return true
	end
	return false
end

function ISBMNaturalFloor:getFloorType(item)
	if not item then
		return "none";
	end
	if item:getFullType() == "Base.Gravelbag" then
		return "gravel";
	elseif item:getFullType() == "Base.Dirtbag" then
		return "dirt";
	elseif item:getFullType() == "Base.Sandbag" then
		return "sand";
	end
	return "none";
end

function ISBMNaturalFloor.getFloorSpriteNames(square)
	local sprites = {}
	local floor = square:getFloor()
	if floor then
		local sprite = floor:getSprite()
		if sprite and sprite:getName() then
			table.insert(sprites, sprite:getName())
			local attached = floor:getAttachedAnimSprite()
			if attached then
				for i = 1, attached:size() do
					sprite = attached:get(i - 1):getParentSprite()
					if sprite and sprite:getName() then
						table.insert(sprites, sprite:getName())
					end
				end
			end
		end
	end
	return sprites
end
