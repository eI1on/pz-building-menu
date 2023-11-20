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

local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true end
    if test then return ISWorldObjectContextMenu.setTest() end
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()
    local wallVine, wallDetailing

    local hasCuttingTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "CutPlant") end)
    local hasHammerTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end)

    for _, worldObj in ipairs(worldobjects) do
        local attached = worldObj:getAttachedAnimSprite()
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() then
                    local spriteName = sprite:getParentSprite():getName()
                    if hasCuttingTool and isRemovableWallItem(spriteName, RemovableWallVinesTiles) then
                        wallVine = worldObj:getSquare()
                        break
                    elseif hasHammerTool and isRemovableWallItem(spriteName, RemovableWallDetailingTiles) then
                        wallDetailing = worldObj:getSquare()
                        break
                    end
                end
            end
        end
    end

    local thump = nil
    local square = nil
    for _, v in ipairs(worldobjects) do
      square = v:getSquare()
      if instanceof(v, 'IsoThumpable') then
        if not v:haveFuel() then
          if v:getModData()['IsLighting'] then
            thump = v
          end
        end
      end
    end

    if not playerObj:getVehicle() and not test then
        if thump then
            if thump:isLightSourceOn() then
                context:addOption(getText 'ContextMenu_Turn_Off', thump, ISLightContextMenu.onToggleThumpableLight, player)
            elseif thump:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
                context:addOption(getText 'ContextMenu_Turn_On', thump, ISLightContextMenu.onToggleThumpableLight, player)
            end
        end
        if wallVine then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallVine"), worldobjects, ISWorldObjectContextMenu.onRemovePlant, wallVine, true, player)
        end
        if wallDetailing then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallDetailing"), worldobjects, BuildingMenu.onRemoveWallDetailing, wallDetailing, true, player)
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)
