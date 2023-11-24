require 'BuildingMenu01_Main'
local RemovableWallVinesTiles = require 'ValidWallVineTiles'
local RemovableWallDetailingTiles = require 'ValidWallDetailingTiles'

local BuildingMenu = getBuildingMenuInstance()

local function isRemovableWallItem(spriteName, patterns)
    for _, pattern in ipairs(patterns) do
        if luautils.stringStarts(spriteName, pattern) then
            return true
        end
    end
    return false
end

function BuildingMenu.doRemoveWallDetailing(playerObj, square, wallDetailing)
    local playerInv = playerObj:getInventory()
    if wallDetailing then
        ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, square))
    else
        if not luautils.walkAdj(playerObj, square, true) then return end
    end
    local handItem = playerObj:getPrimaryHandItem()
    if not handItem or not BuildingMenu.predicateHasTag(handItem, "Hammer") then
		handItem = playerInv:getFirstEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end)
		if not handItem then return end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), handItem, true)
    end
    ISTimedActionQueue.add(ISRemoveWallDetailing:new(playerObj, square, wallDetailing));
end

function BuildingMenu.onRemoveWallDetailing(worldobjects, square, wallDetailing, player)
    local playerObj = getSpecificPlayer(player)
    local bo = ISRemoveWallDetailingCursor:new(playerObj, "wallDetailing")
    getCell():setDrag(bo, player)
end

function BuildingMenu.onToggleThumpableLight(lightSource, player)
    local playerObj = getSpecificPlayer(player)
    if luautils.walkAdj(playerObj, lightSource:getSquare()) then
        ISTimedActionQueue.add(ISToggleLight:new(playerObj, lightSource, 5))
    end
end


function BuildingMenu:onSetOpenSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI
    print("onSetOpenSafe: ", dialog:getCode())
    if thumpable:getLockedByCode() == dialog:getCode() then
        local objSpriteName = thumpable:getSprite():getName()
        local reversedObjSpriteName = BuildingMenu.checkSafeSprite(objSpriteName)

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


function BuildingMenu:onSetCloseSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI
    print("onSetCloseSafe: ", dialog:getCode())
    if dialog:getCode() ~= 0 then
        local objSpriteName = thumpable:getSprite():getName()
        local reversedObjSpriteName = BuildingMenu.checkSafeSprite(objSpriteName)

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


BuildingMenu.onOpenSafeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, BuildingMenu.onSetOpenSafe, player, thump, false);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

BuildingMenu.onSetNewSafeCodeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, BuildingMenu.onSetCloseSafe, player, thump, true);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end

BuildingMenu.onCloseSafeWalkToComplete = function(player, thump)
    local modal = ISMechanicalDialLock:new(0, 0, 300, 430, nil, BuildingMenu.onSetCloseSafe, player, thump, false);
    modal:initialise();
    modal:addToUIManager();
    if JoypadState.players[player+1] then
        setJoypadFocus(player, modal)
    end
end


local function handleSafeInteraction(player, thump, interactionType)
    local playerObj = getSpecificPlayer(player)
    ISTimedActionQueue.clear(playerObj)

    if AdjacentFreeTileFinder.isTileOrAdjacent(playerObj:getCurrentSquare(), thump:getSquare()) then
        BuildingMenu[interactionType](player, thump)
    else
        local adjacent = AdjacentFreeTileFinder.Find(thump:getSquare(), playerObj)
        if adjacent then
            local action = ISWalkToTimedAction:new(playerObj, adjacent)
            action:setOnComplete(BuildingMenu[interactionType], player, thump)
            ISTimedActionQueue.add(action)
        end
    end
end

local BM_SafeSprites = {
             -- closed state sprite = open state sprite
    ["building_menu_dylan_safes_0"] = "building_menu_dylan_safes_2",
    ["building_menu_dylan_safes_1"] = "building_menu_dylan_safes_3",
    ["building_menu_dylan_safes_4"] = "building_menu_dylan_safes_6",
    ["building_menu_dylan_safes_5"] = "building_menu_dylan_safes_7",
    ["building_menu_dylan_safes_8"] = "building_menu_dylan_safes_10",
    ["building_menu_dylan_safes_9"] = "building_menu_dylan_safes_11",
}

function BuildingMenu.checkSafeSprite(spriteName)
    for closedSprite, openSprite in pairs(BM_SafeSprites) do
        if closedSprite == spriteName then
            return openSprite
        elseif openSprite == spriteName then
            return closedSprite
        end
    end
    return nil
end

function BuildingMenu.isSafeOpen(spriteName)
    for closedSprite, openSprite in pairs(BM_SafeSprites) do
        if openSprite == spriteName then
            return true
        elseif closedSprite == spriteName then
            return false
        end
    end
    return nil
end


local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end
    if test then return ISWorldObjectContextMenu.setTest() end

    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    local hasCuttingTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "CutPlant") end)
    local hasHammerTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end)
    local thump, wallVine, wallDetailing, safe = nil, nil, nil, nil

    for _, worldObj in ipairs(worldobjects) do
        local attached = worldObj:getAttachedAnimSprite()
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() then
                    local spriteName = sprite:getParentSprite():getName()
                    if hasCuttingTool and isRemovableWallItem(spriteName, RemovableWallVinesTiles) then
                        wallVine = worldObj:getSquare()
                    elseif hasHammerTool and isRemovableWallItem(spriteName, RemovableWallDetailingTiles) then
                        wallDetailing = worldObj:getSquare()
                    end
                end
            end
        end

        if instanceof(worldObj, 'IsoThumpable') then
            if not worldObj:haveFuel() and worldObj:getModData()['IsLighting'] then
                thump = worldObj
            elseif worldObj:getTextureName() and luautils.stringStarts(worldObj:getTextureName(), "building_menu_dylan_safes_") and not safe then
                safe = worldObj
            end
        end
    end

    if not playerObj:getVehicle() and not test then
        if thump then
            if thump:isLightSourceOn() then
                context:addOption(getText 'ContextMenu_Turn_Off', thump, BuildingMenu.onToggleThumpableLight, player)
            elseif thump:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
                context:addOption(getText 'ContextMenu_Turn_On', thump, BuildingMenu.onToggleThumpableLight, player)
            end
        end
        if wallVine then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallVine"), worldobjects, ISWorldObjectContextMenu.onRemovePlant, wallVine, true, player)
        end
        if wallDetailing then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallDetailing"), worldobjects, BuildingMenu.onRemoveWallDetailing, wallDetailing, true, player)
        end
        if safe then
            local objSpriteName = safe:getSprite():getName()
            if BuildingMenu.checkSafeSprite(objSpriteName) then
                context:removeOptionByName(getText("ContextMenu_PutPadlock"))
                context:removeOptionByName(getText("ContextMenu_PutCombinationPadlock"))
                context:removeOptionByName(getText("ContextMenu_RemovePadlock"))
                context:removeOptionByName(getText("ContextMenu_RemoveCombinationPadlock"))
                
                if safe:canBeLockByPadlock() then
                    context:addOptionOnTop(getText("ContextMenu_Set_Safe_Code"), worldobjects, function()
                        handleSafeInteraction(player, safe, "onSetNewSafeCodeWalkToComplete")
                    end);
                else
                    -- Open Safe
                    if not BuildingMenu.isSafeOpen(objSpriteName) then
                        context:addOptionOnTop(getText("ContextMenu_Open_Safe"), worldobjects, function()
                            handleSafeInteraction(player, safe, "onOpenSafeWalkToComplete")
                        end);
                    end
                    -- Close Safe
                    if BuildingMenu.isSafeOpen(objSpriteName) then
                        context:addOptionOnTop(getText("ContextMenu_Reset_Lock"), worldobjects, function()
                            safe:getModData().code = nil;
                            safe:setLockedByCode(0);
                            safe:setCanBeLockByPadlock(true);
                        end);
                        context:addOptionOnTop(getText("ContextMenu_Close_Safe"), worldobjects, function()
                            handleSafeInteraction(player, safe, "onCloseSafeWalkToComplete")
                        end);
                    end
                end
            end
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)
