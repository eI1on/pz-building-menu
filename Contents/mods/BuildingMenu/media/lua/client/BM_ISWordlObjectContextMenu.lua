local WallVinesTiles = require 'BM_ValidWallVineTiles'
local removableWallVinesTiles = WallVinesTiles.getTiles()

local WallDetailingTiles = require 'BM_ValidWallDetailingTiles'
local removableWallDetailingTiles = WallDetailingTiles.getTiles()

local TrafficLineTiles = require 'BM_ValidTrafficLineTiles'
local removableTrafficLineTiles = TrafficLineTiles.getTiles()

---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");

--- Checks if the wall item is removable based on its sprite name and a list of patterns
---@param spriteName string
---@param patterns table<string>
---@return boolean
local function isRemovableDetailItem(spriteName, patterns)
    for _, pattern in ipairs(patterns) do
        if luautils.stringStarts(spriteName, pattern) then
            return true;
        end
    end
    return false;
end

--- Handles the removal of wall detailing
---@param playerObj IsoPlayer
---@param square IsoGridSquare
---@param wallDetailing string
function BuildingMenu.doRemoveWallDetailing(playerObj, square, wallDetailing)
    local playerInv = playerObj:getInventory();

    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, square));

    local handItem = playerObj:getPrimaryHandItem();
    if not handItem or not BuildingMenu.predicateHasTag(handItem, "Hammer") then
        handItem = playerInv:getFirstEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end);
        if not handItem then return; end
        ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), handItem, true);
    end
    ISTimedActionQueue.add(ISRemoveDetail:new(playerObj, square, wallDetailing));
end

--- Handles the removal of traffic lines
---@param playerObj IsoPlayer
---@param square IsoGridSquare
---@param trafficLine string
function BuildingMenu.doRemoveTrafficLine(playerObj, square, trafficLine)
    local playerInv = playerObj:getInventory();

    if not luautils.walkAdj(playerObj, square, true) then return; end

    local handItem = playerObj:getPrimaryHandItem();
    local trowel = playerInv:getFirstTypeRecurse("farming.HandShovel");
    if handItem ~= trowel then
        if not trowel then return; end
        ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), trowel, true);
    end
    ISTimedActionQueue.add(ISRemoveDetail:new(playerObj, square, trafficLine));
end

--- Triggers when removing wall detailing
---@param worldobjects table<integer, IsoObject>
---@param square IsoGridSquare
---@param wallDetailing IsoObject|nil
---@param player integer
function BuildingMenu.onRemoveWallDetailing(worldobjects, square, wallDetailing, player)
    local playerObj = getSpecificPlayer(player);
    local bo = ISRemoveDetailCursor:new(playerObj, "wallDetailing");
    getCell():setDrag(bo, player);
end

--- Triggers when removing traffic lines
---@param worldobjects table<integer, IsoObject>
---@param square IsoGridSquare
---@param trafficLine IsoObject|nil
---@param player integer
function BuildingMenu.onRemoveTrafficLine(worldobjects, square, trafficLine, player)
    local playerObj = getSpecificPlayer(player);
    local bo = ISRemoveDetailCursor:new(playerObj, "trafficLine");
    getCell():setDrag(bo, player);
end

--- Toggles the light of a IsoLightSwitch object
---@param lightSource IsoLightSwitch
---@param player integer
function BuildingMenu.onToggleThumpableLight(lightSource, player)
    local playerObj = getSpecificPlayer(player);
    if luautils.walkAdj(playerObj, lightSource:getSquare()) then
        ISTimedActionQueue.add(ISToggleLight:new(playerObj, lightSource, 5));
    end
end

--- Handles the creation of context menu options for world objects
---@param player integer
---@param context ISContextMenu
---@param worldobjects table<integer, IsoObject>
---@param test boolean
local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true; end
    if test then return ISWorldObjectContextMenu.setTest(); end

    local playerObj = getSpecificPlayer(player);
    local playerInv = playerObj:getInventory();
    local hasCuttingTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "CutPlant") end);
    local hasHammerTool = playerInv:containsEvalRecurse(function(item) return BuildingMenu.predicateHasTag(item, "Hammer") end);
    local hasTrowelTool = playerInv:getFirstTypeRecurse("farming.HandShovel");
    local genPoweredLightingObj, wallVine, wallDetailing, trafficLine, thumpableLightSource = nil, nil, nil, nil, nil;

    for _, worldObj in ipairs(worldobjects) do
        local attached = worldObj:getAttachedAnimSprite();
        if attached then
            for n = 1, attached:size() do
                local sprite = attached:get(n - 1);
                if sprite and sprite:getParentSprite() then
                    local spriteName = sprite:getParentSprite():getName();
                    if spriteName then
                        if hasCuttingTool and isRemovableDetailItem(spriteName, removableWallVinesTiles) then
                            wallVine = worldObj:getSquare();
                        end
                        if hasHammerTool and isRemovableDetailItem(spriteName, removableWallDetailingTiles) then
                            wallDetailing = worldObj:getSquare();
                        end
                        if hasTrowelTool and isRemovableDetailItem(spriteName, removableTrafficLineTiles) then
                            trafficLine = worldObj:getSquare();
                        end
                    end
                end
            end
        end
        if instanceof(worldObj, "IsoThumpable") and not worldObj:isDoor() then
            if worldObj:getLightSource() then
                thumpableLightSource = worldObj;
            end
        end
        if instanceof(worldObj, 'IsoLightSwitch') then
            if worldObj:getModData()['IsLighting'] then
                genPoweredLightingObj = worldObj;
                ---@cast genPoweredLightingObj IsoLightSwitch
            end
        end
    end

    if thumpableLightSource then
        if (thumpableLightSource:getLightSourceFuel() and thumpableLightSource:haveFuel()) or not thumpableLightSource:getLightSourceFuel() then
			if thumpableLightSource:isLightSourceOn() then
				if test == true then return true; end
                local offContextOption = context:getOptionFromName(getText("ContextMenu_Turn_Off"));
                if offContextOption then
                    offContextOption.iconTexture = getTexture("media/ui/light_bulb_off.png");
                end
			elseif thumpableLightSource:getLifeLeft() > 0 then
				if test == true then return true; end
                local onContextOption = context:getOptionFromName(getText("ContextMenu_Turn_On"));
                if onContextOption then
                    onContextOption.iconTexture = getTexture("media/ui/light_bulb_on.png");
                end
			end
        end
    end

    local option = nil;
    if not playerObj:getVehicle() and not test then
        if genPoweredLightingObj then
            context:removeOptionByName(getText("ContextMenu_Turn_Off"));
            context:removeOptionByName(getText("ContextMenu_Turn_On"));
            if genPoweredLightingObj:isActivated() then
                option = context:insertOptionBefore(getText("ContextMenu_Walk_to"), getText('ContextMenu_Turn_Off'), genPoweredLightingObj, BuildingMenu.onToggleThumpableLight, player);
                option.iconTexture = getTexture("media/ui/light_bulb_off.png");
            elseif genPoweredLightingObj:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
                option = context:insertOptionBefore(getText("ContextMenu_Walk_to"), getText('ContextMenu_Turn_On'), genPoweredLightingObj, BuildingMenu.onToggleThumpableLight, player);
                option.iconTexture = getTexture("media/ui/light_bulb_on.png");
            end
        end
        if wallVine then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallVine"), worldobjects,
                ISWorldObjectContextMenu.onRemovePlant, wallVine, true, player);
        end
        if wallDetailing then
            context:addOptionOnTop(getText("ContextMenu_RemoveWallDetailing"), worldobjects,
                BuildingMenu.onRemoveWallDetailing, wallDetailing, true, player);
        end
        if trafficLine then
            context:addOptionOnTop(getText("ContextMenu_RemoveTrafficLine"), worldobjects,
                BuildingMenu.onRemoveTrafficLine, trafficLine, true, player);
        end
    end

end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)
