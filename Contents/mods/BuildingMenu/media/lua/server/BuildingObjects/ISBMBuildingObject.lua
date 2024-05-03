require("BuildingObjects/ISBuildingObject")
require("TimedActions/ISBMBuildAction")

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
	return not item:isBroken()
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
						ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, self.equipBothHandItem, self.equipBothHandItem:getContainer(), playerInv));
					end
					ISInventoryPaneContextMenu.equipWeapon(self.equipBothHandItem, true, true, self.player)
				end
                if self.firstItem then
					local item = nil
					if self.firstPredicate then
						item = playerInv:getFirstTypeEvalArgRecurse(self.firstItem, self.firstPredicate, self.firstArg)
						if not item then
							local groundItems = buildUtil.getMaterialOnGround(square)
							for _,item2 in ipairs(groundItems[self.firstItem]) do
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
                ISTimedActionQueue.add(ISBMBuildAction:new(playerObj, selfCopy, x, y, z, self.north, self:getSprite(), maxTime));
            else
                ISTimedActionQueue.add(ISBuildAction:new(playerObj, selfCopy, x, y, z, self.north, self:getSprite(), maxTime));
            end
		end
	end
end