MechanicalDialLock = MechanicalDialLock or {}


--- A table mapping safe sprites from closed to open states and vice versa.
-- ["closed state sprite"] = "open state sprite"
---@type table<string, string>
SafeSprites = {
    ["building_menu_dylan_safes_0"] = "building_menu_dylan_safes_2",
    ["building_menu_dylan_safes_1"] = "building_menu_dylan_safes_3",
    ["building_menu_dylan_safes_4"] = "building_menu_dylan_safes_6",
    ["building_menu_dylan_safes_5"] = "building_menu_dylan_safes_7",
    ["building_menu_dylan_safes_8"] = "building_menu_dylan_safes_10",
    ["building_menu_dylan_safes_9"] = "building_menu_dylan_safes_11",
}


--- Opens the safe when the correct combination is entered.
---@param dialLockUI ISMechanicalDialLock
---@param player integer
---@param thumpable IsoThumpable
function MechanicalDialLock:onSetOpenSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI
    if thumpable:getLockedByCode() == dialog:getCode() then
        local objSpriteName = thumpable:getSprite():getName()
        local reversedObjSpriteName = MechanicalDialLock.checkSafeSprite(objSpriteName)

        thumpable:setSprite(reversedObjSpriteName);
        thumpable:getSprite():setName(reversedObjSpriteName);
        thumpable:transmitUpdatedSpriteToServer();
        thumpable:transmitUpdatedSpriteToClients();
        thumpable:setLockedByCode(0);
        thumpable:setCanBeLockByPadlock(false);

        local pdata = getPlayerData(player:getPlayerNum());
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks()
    end
end


--- Closes the safe.
---@param dialLockUI ISMechanicalDialLock
---@param player integer
---@param thumpable IsoThumpable
function MechanicalDialLock:onSetCloseSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI
    if dialog:getCode() ~= 0 then
        local objSpriteName = thumpable:getSprite():getName()
        local reversedObjSpriteName = MechanicalDialLock.checkSafeSprite(objSpriteName)

        thumpable:setSprite(reversedObjSpriteName);
        thumpable:getSprite():setName(reversedObjSpriteName);
        thumpable:transmitUpdatedSpriteToServer();
        thumpable:transmitUpdatedSpriteToClients();
        thumpable:setLockedByCode(dialog:getCode());
        thumpable:setCanBeLockByPadlock(false);

        local pdata = getPlayerData(player:getPlayerNum());
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks()
    end
end

--- Triggers when the player completes walking to the safe to open it.
---@param player integer
---@param thump IsoThumpable
MechanicalDialLock.onOpenSafeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, MechanicalDialLock.onSetOpenSafe, player, thump, false);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

--- Sets a new safe code after walking to the safe is complete.
---@param player integer
---@param thump IsoThumpable
MechanicalDialLock.onSetNewSafeCodeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, MechanicalDialLock.onSetCloseSafe, player, thump, true);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

--- Triggers when the player completes walking to the safe to close it.
---@param player integer
---@param thump IsoThumpable
MechanicalDialLock.onCloseSafeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, MechanicalDialLock.onSetCloseSafe, player, thump, false);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

--- Handles the interaction with a safe, including walking to it if needed.
---@param player integer
---@param thump IsoThumpable
---@param interactionType string
local function handleSafeInteraction(player, thump, interactionType)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)

    if AdjacentFreeTileFinder.isTileOrAdjacent(playerObj:getCurrentSquare(), thump:getSquare()) then
        MechanicalDialLock[interactionType](player, thump)
    else
        local adjacent = AdjacentFreeTileFinder.Find(thump:getSquare(), playerObj)
        if adjacent then
            local action = ISWalkToTimedAction:new(playerObj, adjacent)
            action:setOnComplete(MechanicalDialLock[interactionType], player, thump)
            ISTimedActionQueue.add(action)
        end
    end
end


--- Checks if the given sprite name is a safe and returns the corresponding open/close sprite.
---@param spriteName string
---@return string|nil
function MechanicalDialLock.checkSafeSprite(spriteName)
    for closedSprite, openSprite in pairs(SafeSprites) do
        if closedSprite == spriteName then
            return openSprite
        elseif openSprite == spriteName then
            return closedSprite
        end
    end
    return nil
end

--- Determines if the safe is open based on the sprite name.
---@param spriteName string
---@return boolean|nil
function MechanicalDialLock.isSafeOpen(spriteName)
    for closedSprite, openSprite in pairs(SafeSprites) do
        if openSprite == spriteName then
            return true
        elseif closedSprite == spriteName then
            return false
        end
    end
    return nil
end


--- Handles the creation of context menu options for world objects.
---@param player integer
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end
    if test then return ISWorldObjectContextMenu.setTest() end

    local playerObj = getSpecificPlayer(player)
    local safe = nil
    local objSpriteName = nil

    for _, worldObj in ipairs(worldobjects) do
        if instanceof(worldObj, 'IsoThumpable') then
            local textureName = worldObj:getTextureName()
            if textureName then
                objSpriteName = MechanicalDialLock.checkSafeSprite(textureName)
                if objSpriteName and not safe then
                    safe = worldObj
                    break
                end
            end
        end
    end

    if safe and not playerObj:getVehicle() and not test then
        if objSpriteName then
            context:removeOptionByName(getText("ContextMenu_PutPadlock"))
            context:removeOptionByName(getText("ContextMenu_PutCombinationPadlock"))
            context:removeOptionByName(getText("ContextMenu_RemovePadlock"))
            context:removeOptionByName(getText("ContextMenu_RemoveCombinationPadlock"))

            -- Determine if the safe is open or closed using the sprite name
            local isSafeOpen = MechanicalDialLock.isSafeOpen(objSpriteName)
            
            if safe:canBeLockByPadlock() then
                -- Set Safe Code option
                context:addOptionOnTop(getText("ContextMenu_Set_Safe_Code"), worldobjects, function()
                    handleSafeInteraction(player, safe, "onSetNewSafeCodeWalkToComplete")
                end)
            else
                -- Open Safe option
                if not isSafeOpen then
                    context:addOptionOnTop(getText("ContextMenu_Open_Safe"), worldobjects, function()
                        handleSafeInteraction(player, safe, "onOpenSafeWalkToComplete")
                    end)
                end
                -- Close Safe options
                if isSafeOpen then
                    context:addOptionOnTop(getText("ContextMenu_Reset_Lock"), worldobjects, function()
                        safe:getModData().code = nil
                        safe:setLockedByCode(0)
                        safe:setCanBeLockByPadlock(true)
                    end)
                    context:addOptionOnTop(getText("ContextMenu_Close_Safe"), worldobjects, function()
                        handleSafeInteraction(player, safe, "onCloseSafeWalkToComplete")
                    end)
                end
            end
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)




local function addSafesToBuildingMenu()
    local safes = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_2",
                northSprite = "building_menu_dylan_safes_3",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_6",
                northSprite = "building_menu_dylan_safes_7",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_10",
                northSprite = "building_menu_dylan_safes_11",
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Containers"),
        "",
        getText("IGUI_BuildingMenuSubCat_Containers_Safes"),
        "building_menu_dylan_safes_0",
        safes
    )
end

local function addCategoriesToBuildingMenu()
    if getActivatedMods():contains("BuildingMenu") then
        addSafesToBuildingMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)