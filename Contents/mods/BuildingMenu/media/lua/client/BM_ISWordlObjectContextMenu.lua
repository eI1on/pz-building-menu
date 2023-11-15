local RemovableWallVinesTiles = require 'ValidWallVineTiles'

local function predicateCutPlant(item)
    return not item:isBroken() and item:hasTag("CutPlant")
end

local onFillWorldObjectContextMenu = function(player, context, worldobjects, test)
    local playerObj = getSpecificPlayer(player);
	local playerInv = playerObj:getInventory();
    local wallVine
    local hasCuttingTool = playerInv:containsEvalRecurse(predicateCutPlant)
    for i,v in ipairs(worldobjects) do
        local attached = v:getAttachedAnimSprite()
        if hasCuttingTool and attached then
            for n=1,attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName()
                    for _, pattern in ipairs(RemovableWallVinesTiles) do
                        if luautils.stringStarts(spriteName, pattern) then
                            wallVine = v:getSquare()
                            break
                        end
                    end
                end
            end
        end
    end
    if wallVine and not playerObj:getVehicle() then
        if test == true then return true; end
        context:addOptionOnTop(getText("ContextMenu_RemoveWallVine"), worldobjects, ISWorldObjectContextMenu.onRemovePlant, wallVine, true, player);
    end
end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)