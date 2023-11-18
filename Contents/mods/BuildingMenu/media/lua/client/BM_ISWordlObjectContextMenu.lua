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

local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
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

    if not playerObj:getVehicle() then
        if wallVine and not test then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallVine"), worldobjects, ISWorldObjectContextMenu.onRemovePlant, wallVine, true, player)
        end
        if wallDetailing and not test then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallDetailing"), worldobjects, BuildingMenu.onRemoveWallDetailing, wallDetailing, true, player)
        end
    end
end

Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)
