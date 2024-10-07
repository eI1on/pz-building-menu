require("BuildingObjects/ISBuildingObject")

local BM_Logger = require("BM_Logger");

--- Original onJoypadPressButton method from ISBuildingObject
--- @type fun(self:ISBuildingObject, joypadIndex:integer, joypadData:any, button:integer)
local originalOnJoypadPressButton = ISBuildingObject.onJoypadPressButton;

--- Handles joypad button press events specifically for the Building Menu UI
--- @param joypadIndex integer The index of the joypad
--- @param joypadData any Data associated with the joypad
--- @param button integer The button code that was pressed
function ISBuildingObject:onJoypadPressButton(joypadIndex, joypadData, button)
	---@type ISBuildingMenuUI
	local BMUI = ISBuildingMenuUI.instance;
	-- If the B button is pressed and the Building Menu UI instance exists, set focus to it
	if button == Joypad.BButton and BMUI then
		setJoypadFocus(joypadData.player, BMUI);
	end
	-- Call the original method with the current context and passed parameters
	originalOnJoypadPressButton(self, joypadIndex, joypadData, button);
end

local function predicateNotBroken(item)
	return not item:isBroken();
end

function ISBuildingObject:tryBuild(x, y, z)
	local square = getCell():getGridSquare(x, y, z)
	local playerObj = getSpecificPlayer(self.player)
	local playerInv = playerObj:getInventory()
	if ISBuildMenu.cheat or self:walkTo(x, y, z) or ((self.Type == "fishingNet") and (self:isValid(square, true))) then
		if self.dragNilAfterPlace then
			getCell():setDrag(nil, self.player)
		end
		local maxTime = (200 - (playerObj:getPerkLevel(Perks.Woodwork) * 5))
		if self.maxTime then
			maxTime = self.maxTime
		end
		if playerObj:isTimedActionInstant() then
			maxTime = 1
		end
		if self.skipBuildAction then
			self:create(x, y, z, self.north, self:getSprite())
		else
			if not self.noNeedHammer and not ISBuildMenu.cheat then
				local hammer = playerInv:getFirstTagEvalRecurse("Hammer", predicateNotBroken)
				if hammer then
					ISInventoryPaneContextMenu.equipWeapon(hammer, true, false, self.player)
				end
			end
			if not ISBuildMenu.cheat then
				if self.equipBothHandItem then
					if luautils.haveToBeTransfered(playerObj, self.equipBothHandItem) then
						ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, self.equipBothHandItem,
							self.equipBothHandItem:getContainer(), playerInv));
					end
					ISInventoryPaneContextMenu.equipWeapon(self.equipBothHandItem, true, true, self.player)
				end
				if self.firstItem then
					local item = nil
					if self.firstPredicate then
						item = playerInv:getFirstTypeEvalArgRecurse(self.firstItem, self.firstPredicate, self.firstArg)
						if not item then
							local groundItems = buildUtil.getMaterialOnGround(square)
							for _, item2 in ipairs(groundItems[self.firstItem]) do
								if self.firstPredicate(item2, self.firstArg) then
									item = item2
									break
								end
							end
							local time = ISWorldObjectContextMenu.grabItemTime(playerObj, item:getWorldItem())
							ISTimedActionQueue.add(ISGrabItemAction:new(playerObj, item:getWorldItem(), time))
						end
					else
						item = playerInv:getItemFromType(self.firstItem, true, true)
						if not item then
							local groundItems = buildUtil.getMaterialOnGround(square)
							item = groundItems[self.firstItem][1]
							local time = ISWorldObjectContextMenu.grabItemTime(playerObj, item:getWorldItem())
							ISTimedActionQueue.add(ISGrabItemAction:new(playerObj, item:getWorldItem(), time))
						end
					end
					ISInventoryPaneContextMenu.equipWeapon(item, true, false, self.player)
				end
				if self.secondItem then
					local item = playerInv:getItemFromType(self.secondItem, true, true)
					if instanceof(item, "Clothing") then
						if not item:isEquipped() then
							ISInventoryPaneContextMenu.wearItem(item, self.player)
						end
					else
						ISInventoryPaneContextMenu.equipWeapon(item, false, false, self.player)
					end
				end
			end

			local selfCopy = copyTable(self);
			setmetatable(selfCopy, getmetatable(self, true));

			if self.modData and self.modData.isBuiltObject then
				ISTimedActionQueue.add(ISBMBuildAction:new(playerObj, selfCopy, x, y, z, self.north, self:getSprite(),
					maxTime));
			else
				ISTimedActionQueue.add(ISBuildAction:new(playerObj, selfCopy, x, y, z, self.north, self:getSprite(),
					maxTime));
			end
		end
	end
end

-- helper function to check if the sprite exists
function ISBuildingObject:isValidSprite(direction)
	local spriteMap = {
		[1] = self.sprite,
		[2] = self.northSprite,
		[3] = self.eastSprite,
		[4] = self.southSprite
	};
	return spriteMap[direction] ~= nil;
end

-- rotate the buildable depending on the position of the mouse
function ISBuildingObject:rotateMouse(x, y)
	if self.square then
		-- start to get the direction the mouse is compared to the selected square for the item
		local difx = x - self.square:getX();
		local dify = y - self.square:getY();

		-- determine the direction based on the mouse position relative to the square
		if difx < 0 and math.abs(difx) > math.abs(dify) and self:isValidSprite(1) then
			self.nSprite = 1;
		elseif difx > 0 and math.abs(difx) > math.abs(dify) and self:isValidSprite(3) then
			self.nSprite = 3;
		elseif dify < 0 and math.abs(difx) < math.abs(dify) and self:isValidSprite(2) then
			self.nSprite = 2;
		elseif dify > 0 and math.abs(difx) < math.abs(dify) and self:isValidSprite(4) then
			self.nSprite = 4;
		end
	end
end

-- rotate the sprite to the next valid position
function ISBuildingObject:rotateSprite(direction)
	local originalSprite = self.nSprite;
	local spriteFound = false;

	for i = 1, 4 do
		self.nSprite = self.nSprite + direction;
		if self.nSprite > 4 then
			self.nSprite = 1;
		elseif self.nSprite < 1 then
			self.nSprite = 4;
		end

		if self:isValidSprite(self.nSprite) then
			spriteFound = true;
			break;
		end
	end

	-- if no valid sprite was found, revert to the original sprite
	if not spriteFound then self.nSprite = originalSprite; end
end

function ISBuildingObject:rotateKey(key)
	if key == getCore():getKey("Rotate building") then
		self:rotateSprite(1);
	end
end

function ISBuildingObject:onJoypadPressButton(joypadIndex, joypadData, button)
	local playerObj = getSpecificPlayer(joypadData.player);

	if button == Joypad.AButton then
		if self.canBeBuild then
			self:tryBuild(self.xJoypad, self.yJoypad, self.zJoypad);
		end
	end

	if button == Joypad.BButton then
		getCell():setDrag(nil, joypadData.player);
	end

	if button == Joypad.YButton then
		if self.isYButtonResetCursor then
			self.xJoypad = self.character:getCurrentSquare():getX();
			self.yJoypad = self.character:getCurrentSquare():getY();
		end
	end

	if button == Joypad.RBumper then
		self:rotateSprite(1);
	end

	if button == Joypad.LBumper then
		self:rotateSprite(-1);
	end
end

--- @type fun(self:ISBuildingObject, x:integer, y:integer, z:integer, square:IsoGridSquare)
local originalRender = ISBuildingObject.render;

--- @param x integer
--- @param y integer
--- @param z integer
--- @param square IsoGridSquare
function ISBuildingObject:render(x, y, z, square)
	local res = originalRender(self, x, y, z, square);

	if self.attachedSprites then
		local attachedSprites = nil;

		if self.west then
			attachedSprites = self.attachedSprites.sprite;
		elseif self.north then
			attachedSprites = self.attachedSprites.northSprite;
		elseif self.east then
			attachedSprites = self.attachedSprites.eastSprite;
		elseif self.south then
			attachedSprites = self.attachedSprites.southSprite;
		end

		if attachedSprites then
			for i = 1, #attachedSprites do
				local spriteName = attachedSprites[i];

				if not self.RENDER_SPRITE_CACHE then
					self.RENDER_SPRITE_CACHE = {};
				end
				if not self.RENDER_SPRITE_CACHE[spriteName] then
					local sprite = IsoSprite.new();
					sprite:LoadFramesNoDirPageSimple(spriteName);
					self.RENDER_SPRITE_CACHE[spriteName] = sprite;
				end

				local sprite = self.RENDER_SPRITE_CACHE[spriteName];
				sprite:RenderGhostTile(x, y, z);
			end
		end
	end

	return res;
end
