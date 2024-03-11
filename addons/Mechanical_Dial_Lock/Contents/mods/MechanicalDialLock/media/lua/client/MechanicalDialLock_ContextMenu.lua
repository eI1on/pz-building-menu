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

-- Function to rebuild lookup tables
---@type function
local function rebuildLookupTables()
    MechanicalDialLock.OpenToClosedSprites = {}
    MechanicalDialLock.ClosedToOpenSprites = {}

    for closed, open in pairs(SafeSprites) do
        MechanicalDialLock.ClosedToOpenSprites[closed] = open
        MechanicalDialLock.OpenToClosedSprites[open] = closed
    end
end
-- Initial building of lookup tables
rebuildLookupTables()

-- Metatable to catch modifications to SafeSprites
local safeSpritesMetatable = {
    __newindex = function(t, key, value)
        -- Perform the actual addition/alteration
        rawset(t, key, value)

        -- Rebuild lookup tables whenever SafeSprites is modified
        rebuildLookupTables()
    end
}

-- Set the metatable for SafeSprites
setmetatable(SafeSprites, safeSpritesMetatable)


--- Opens the safe when the correct combination is entered.
---@param dialLockUI ISMechanicalDialLock
---@param player integer
---@param thumpable IsoThumpable
function MechanicalDialLock:onSetOpenSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI;
    if thumpable:getLockedByCode() == dialog:getCode() then
        local safeSpriteName = thumpable:getSprite():getName();
        local reversedSafeSpriteName = MechanicalDialLock.reverseSafeSprite(safeSpriteName);

        thumpable:setSprite(reversedSafeSpriteName);
        thumpable:getSprite():setName(reversedSafeSpriteName);
        thumpable:transmitUpdatedSpriteToServer();
        thumpable:transmitUpdatedSpriteToClients();
        thumpable:setLockedByCode(0);
        thumpable:setCanBeLockByPadlock(false);

        local pdata = getPlayerData(player:getPlayerNum());
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks();
    end
end


--- Closes the safe.
---@param dialLockUI ISMechanicalDialLock
---@param player integer
---@param thumpable IsoThumpable
function MechanicalDialLock:onSetCloseSafe(dialLockUI, player, thumpable)
    local dialog = dialLockUI
    if dialog:getCode() ~= 0 then
        local safeSpriteName = thumpable:getSprite():getName();
        local reversedSafeSpriteName = MechanicalDialLock.reverseSafeSprite(safeSpriteName);

        thumpable:setSprite(reversedSafeSpriteName);
        thumpable:getSprite():setName(reversedSafeSpriteName);
        thumpable:transmitUpdatedSpriteToServer();
        thumpable:transmitUpdatedSpriteToClients();
        thumpable:setLockedByCode(dialog:getCode());
        thumpable:setCanBeLockByPadlock(false);

        local pdata = getPlayerData(player:getPlayerNum());
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks();
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
        setJoypadFocus(player, modal);
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
        setJoypadFocus(player, modal);
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
        setJoypadFocus(player, modal);
    end
end

--- Handles the interaction with a safe, including walking to it if needed.
---@param player integer
---@param thump IsoThumpable
---@param interactionType string
local function handleSafeInteraction(player, thump, interactionType)
    local playerObj = getSpecificPlayer(player);
    ISTimedActionQueue.clear(playerObj);

    if AdjacentFreeTileFinder.isTileOrAdjacent(playerObj:getCurrentSquare(), thump:getSquare()) then
        MechanicalDialLock[interactionType](player, thump);
    else
        local adjacent = AdjacentFreeTileFinder.Find(thump:getSquare(), playerObj);
        if adjacent then
            local action = ISWalkToTimedAction:new(playerObj, adjacent);
            action:setOnComplete(MechanicalDialLock[interactionType], player, thump);
            ISTimedActionQueue.add(action);
        end
    end
end


function MechanicalDialLock.rebuildLookupTables()
    MechanicalDialLock.OpenToClosedSprites = {}
    MechanicalDialLock.ClosedToOpenSprites = {}

    for closed, open in pairs(SafeSprites) do
        MechanicalDialLock.ClosedToOpenSprites[closed] = open
        MechanicalDialLock.OpenToClosedSprites[open] = closed
    end
end


--- Checks if the given sprite name is a safe and returns the corresponding open/close sprite.
---@param spriteName string
---@return string|nil
function MechanicalDialLock.reverseSafeSprite(spriteName)
    return MechanicalDialLock.ClosedToOpenSprites[spriteName] or MechanicalDialLock.OpenToClosedSprites[spriteName]
end


--- Determines if the safe is open based on the sprite name.
---@param spriteName string
---@return boolean|nil
function MechanicalDialLock.isSafeOpen(spriteName)
    return MechanicalDialLock.OpenToClosedSprites[spriteName] ~= nil
end


--- Determines if the safe is open based on the sprite name.
---@param spriteName string
---@return boolean|nil
function MechanicalDialLock.isSafeSprite(spriteName)
    return MechanicalDialLock.ClosedToOpenSprites[spriteName] ~= nil or MechanicalDialLock.OpenToClosedSprites[spriteName] ~= nil
end

--- Handles the creation of context menu options for world objects.
---@param player integer
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true; end
    if test then return ISWorldObjectContextMenu.setTest(); end

    local playerObj = getSpecificPlayer(player);
    local safe = nil;
    local safeSpriteName = nil;

    for _, worldObj in ipairs(worldobjects) do
        if instanceof(worldObj, 'IsoThumpable') then
            local textureName = worldObj:getTextureName();
            if textureName then
                local isSafe = MechanicalDialLock.isSafeSprite(textureName);
                if isSafe and not safe then
                    safeSpriteName = textureName;
                    safe = worldObj;
                    break
                end
            end
        end
    end

    if safe and not playerObj:getVehicle() and not test then
        if safeSpriteName then
            context:removeOptionByName(getText("ContextMenu_PutPadlock"))
            context:removeOptionByName(getText("ContextMenu_PutCombinationPadlock"))
            context:removeOptionByName(getText("ContextMenu_RemovePadlock"))
            context:removeOptionByName(getText("ContextMenu_RemoveCombinationPadlock"))

            -- Determine if the safe is open or closed using the sprite name
            local isSafeOpen = MechanicalDialLock.isSafeOpen(safeSpriteName)
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