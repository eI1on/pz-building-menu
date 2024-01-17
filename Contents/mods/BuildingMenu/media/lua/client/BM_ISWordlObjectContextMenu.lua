require 'BuildingMenu01_Main'
local RemovableWallVinesTiles = require 'BM_ValidWallVineTiles'
local RemovableWallDetailingTiles = require 'BM_ValidWallDetailingTiles'
local RemovableTrafficLineTiles = require'BM_ValidTrafficLineTiles'

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()

--- Checks if the wall item is removable based on its sprite name and a list of patterns.
---@param spriteName string
---@param patterns table
---@return boolean
local function isRemovableDetailItem(spriteName, patterns)
    for _, pattern in ipairs(patterns) do
        if luautils.stringStarts(spriteName, pattern) then
            return true
        end
    end
    return false
end

--- Handles the removal of wall detailing.
---@param playerObj IsoPlayer
---@param square IsoGridSquare
---@param wallDetailing string
function BuildingMenu.doRemoveWallDetailing(playerObj, square, wallDetailing)
    local playerInv = playerObj:getInventory();
    
    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, square));

    local handItem = playerObj:getPrimaryHandItem()
    if not handItem or not BuildingMenu.predicateHasTag(handItem, "Hammer") then
		handItem = playerInv:getFirstEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end);
		if not handItem then return end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), handItem, true);
    end
    ISTimedActionQueue.add(ISRemoveDetail:new(playerObj, square, wallDetailing));
end

--- Handles the removal of traffic lines.
---@param playerObj IsoPlayer
---@param square IsoGridSquare
---@param trafficLine string
function BuildingMenu.doRemoveTrafficLine(playerObj, square, trafficLine)
    local playerInv = playerObj:getInventory()

    if not luautils.walkAdj(playerObj, square, true) then return end

    local handItem = playerObj:getPrimaryHandItem();
    local trowel = playerInv:getFirstTypeRecurse("farming.HandShovel");
    if handItem ~=  trowel then
		if not trowel then return end
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), trowel, true);
    end
    ISTimedActionQueue.add(ISRemoveDetail:new(playerObj, square, trafficLine));
end


--- Triggers when removing wall detailing.
---@param worldobjects table
---@param square IsoGridSquare
---@param wallDetailing IsoObject|nil
---@param player integer
function BuildingMenu.onRemoveWallDetailing(worldobjects, square, wallDetailing, player)
    local playerObj = getSpecificPlayer(player)
    local bo = ISRemoveDetailCursor:new(playerObj, "wallDetailing")
    getCell():setDrag(bo, player)
end


--- Triggers when removing traffic lines.
---@param worldobjects table
---@param square IsoGridSquare
---@param trafficLine IsoObject|nil
---@param player integer
function BuildingMenu.onRemoveTrafficLine(worldobjects, square, trafficLine, player)
    local playerObj = getSpecificPlayer(player)
    local bo = ISRemoveDetailCursor:new(playerObj, "trafficLine")
    getCell():setDrag(bo, player)
end


--- Toggles the light of a thumpable object.
---@param lightSource IsoThumpable
---@param player integer
function BuildingMenu.onToggleThumpableLight(lightSource, player)
    local playerObj = getSpecificPlayer(player)
    if luautils.walkAdj(playerObj, lightSource:getSquare()) then
        ISTimedActionQueue.add(ISToggleLight:new(playerObj, lightSource, 5))
    end
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
    local playerInv = playerObj:getInventory()
    local hasCuttingTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "CutPlant") end)
    local hasHammerTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end)
    local hasTrowelTool = playerInv:getFirstTypeRecurse("farming.HandShovel")
    local thump, wallVine, wallDetailing, trafficLine, safe = nil, nil, nil, nil, nil

    for _, worldObj in ipairs(worldobjects) do
        local attached = worldObj:getAttachedAnimSprite()
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() then
                    local spriteName = sprite:getParentSprite():getName()
                    if hasCuttingTool and isRemovableDetailItem(spriteName, RemovableWallVinesTiles) then
                        wallVine = worldObj:getSquare()
                    end
                    if hasHammerTool and isRemovableDetailItem(spriteName, RemovableWallDetailingTiles) then
                        wallDetailing = worldObj:getSquare()
                    end
                    if hasTrowelTool and isRemovableDetailItem(spriteName, RemovableTrafficLineTiles) then
                        trafficLine = worldObj:getSquare()
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
        if trafficLine then
            context:addOptionOnTop(getText("ContextMenu_RemoveTrafficLine"), worldobjects, BuildingMenu.onRemoveTrafficLine, trafficLine, true, player)
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)