local OpenableContainers = {};

-- [closed] = [open] sprite pairs
---@type table<string, string>
local OpenableContainersSprites = {
    ["trash_containers_tk_01_32"] = "trash_containers_tk_01_24",
    ["trash_containers_tk_01_33"] = "trash_containers_tk_01_25",
    ["trash_containers_tk_01_36"] = "trash_containers_tk_01_28",
    ["trash_containers_tk_01_37"] = "trash_containers_tk_01_29",
    ["trash_containers_tk_01_56"] = "trash_containers_tk_01_48",
    ["trash_containers_tk_01_57"] = "trash_containers_tk_01_49",
    ["trash_containers_tk_01_60"] = "trash_containers_tk_01_52",
    ["trash_containers_tk_01_61"] = "trash_containers_tk_01_53",
    ["trash_containers_tk_01_34"] = "trash_containers_tk_01_26",
    ["trash_containers_tk_01_35"] = "trash_containers_tk_01_27",
    ["trash_containers_tk_01_38"] = "trash_containers_tk_01_30",
    ["trash_containers_tk_01_39"] = "trash_containers_tk_01_31",
    ["trash_containers_tk_01_58"] = "trash_containers_tk_01_50",
    ["trash_containers_tk_01_59"] = "trash_containers_tk_01_51",
    ["trash_containers_tk_01_62"] = "trash_containers_tk_01_54",
    ["trash_containers_tk_01_63"] = "trash_containers_tk_01_55",
};


-- Function to rebuild lookup tables
---@type function
local function rebuildLookupTables()
    OpenableContainers.OpenToClosedSprites = {};
    OpenableContainers.ClosedToOpenSprites = {};

    for closed, open in pairs(OpenableContainersSprites) do
        OpenableContainers.ClosedToOpenSprites[closed] = open;
        OpenableContainers.OpenToClosedSprites[open] = closed;
    end
end
-- Initial building of lookup tables
rebuildLookupTables();


--- Adds new sprite pairs to the local table and rebuilds the lookup tables
---@param spritePairs table|string
---@param openSprite string|nil
function OpenableContainers.addSpritePair(spritePairs, openSprite)
    if type(spritePairs) == "table" then
        for closed, open in pairs(spritePairs) do
            OpenableContainersSprites[closed] = open;
        end
    elseif type(spritePairs) == "string" and type(openSprite) == "string" then
        OpenableContainersSprites[spritePairs] = openSprite;
    end
    rebuildLookupTables();
end

-- USAGE:
-- local OpenableContainers = require "BuildingMenu_ThrottlekittysTiles_ContextMenu"

-- -- Adding individual sprite pairs
-- OpenableContainers.addSpritePair("new_closed_sprite", "new_open_sprite")

-- -- Adding multiple sprite pairs
-- OpenableContainers.addSpritePair({
--     ["another_closed_sprite"] = "another_open_sprite",
--     ["yet_another_closed_sprite"] = "yet_another_open_sprite"
-- })


-- Metatable to catch modifications to OpenableContainersSprites
local openableContainersSpritesMetatable = {
    __newindex = function(t, key, value)
        -- Perform the actual addition/alteration
        rawset(t, key, value);

        -- Rebuild lookup tables whenever OpenableContainersSprites is modified
        rebuildLookupTables();
    end
}

-- Set the metatable for OpenableContainersSprites
setmetatable(OpenableContainersSprites, openableContainersSpritesMetatable);

--- Checks if the given sprite name is an openable openableContainer and returns the corresponding open/close sprite
---@param spriteName string
---@return string|nil
function OpenableContainers.reverseContainerSprite(spriteName)
    return OpenableContainers.ClosedToOpenSprites[spriteName] or OpenableContainers.OpenToClosedSprites[spriteName];
end

--- Determines if the openableContainer is open based on the sprite name
---@param spriteName string
---@return boolean|nil
function OpenableContainers.isContainerOpen(spriteName)
    return OpenableContainers.OpenToClosedSprites[spriteName] ~= nil;
end

--- Determines if the sprite is an openable openableContainer based on the sprite name
---@param spriteName string
---@return boolean|nil
function OpenableContainers.isContainerSprite(spriteName)
    return OpenableContainers.ClosedToOpenSprites[spriteName] ~= nil or
    OpenableContainers.OpenToClosedSprites[spriteName] ~= nil;
end

--- Opens or closes the openableContainer based on its current state
---@param playerObj IsoPlayer
---@param openableContainer IsoThumpable
function OpenableContainers.toggleContainer(playerObj, openableContainer)
    local currentSpriteName = openableContainer:getSprite():getName();
    local newSpriteName = OpenableContainers.reverseContainerSprite(currentSpriteName);

    if newSpriteName then
        openableContainer:setSprite(newSpriteName);
        openableContainer:getSprite():setName(newSpriteName);
        openableContainer:setSpriteFromName(newSpriteName);
        if isClient() then openableContainer:transmitUpdatedSpriteToServer(); end
        openableContainer:transmitUpdatedSpriteToClients();
    end

    local firstSquare = openableContainer:getSquare();
    local secondSquare;
    local spriteProps = getSprite(currentSpriteName):getProperties();
    local gridPos = spriteProps:Val("SpriteGridPos");
    if not gridPos then return; end

    local cell = getCell();
    local objectFacing = spriteProps:Val("Facing");

    if objectFacing == "E" or objectFacing == "W" then
        if gridPos == "0,1" then
            secondSquare = cell:getGridSquare(firstSquare:getX(), firstSquare:getY() - 1, firstSquare:getZ());
        elseif gridPos == "0,0" then
            secondSquare = cell:getGridSquare(firstSquare:getX(), firstSquare:getY() + 1, firstSquare:getZ());
        end
    elseif objectFacing == "S" or objectFacing == "N" then
        if gridPos == "0,0" then
            secondSquare = cell:getGridSquare(firstSquare:getX() + 1, firstSquare:getY(), firstSquare:getZ());
        elseif gridPos == "1,0" then
            secondSquare = cell:getGridSquare(firstSquare:getX() - 1, firstSquare:getY(), firstSquare:getZ());
        end
    end

    if secondSquare then
        local worldobjects = secondSquare:getSpecialObjects();
        for i = 1, worldobjects:size() do
            local worldObj = worldobjects:get(i - 1);
            if worldObj then
                local secondTileSpriteName = worldObj:getSprite():getName();
                local newSecondTileSpriteName = OpenableContainers.reverseContainerSprite(secondTileSpriteName);
                if newSecondTileSpriteName then
                    worldObj:setSprite(newSecondTileSpriteName);
                    worldObj:getSprite():setName(newSecondTileSpriteName);
                    worldObj:setSpriteFromName(newSecondTileSpriteName);
                    if isClient() then worldObj:transmitUpdatedSpriteToServer(); end
                    worldObj:transmitUpdatedSpriteToClients();
                end
            end
        end
    end
end

function OpenableContainers.onToggleContainer(_, openableContainer, player)
    local playerObj = getSpecificPlayer(player);
    local dir = nil;
    local props = openableContainer:getSprite() and openableContainer:getSprite():getProperties()
    if props and props:Is(IsoFlagType.attachedN) then
        dir = IsoDirections.N;
    elseif props and props:Is(IsoFlagType.attachedS) then
        dir = IsoDirections.S;
    elseif props and props:Is(IsoFlagType.attachedW) then
        dir = IsoDirections.W;
    elseif props and props:Is(IsoFlagType.attachedE) then
        dir = IsoDirections.E;
    end
    if dir then
        local adjacent = AdjacentFreeTileFinder.FindEdge(openableContainer:getSquare(), dir, playerObj, true);
        if adjacent then
            if adjacent ~= playerObj:getCurrentSquare() then
                ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, adjacent));
            end
            ISTimedActionQueue.add(ISOpenOpenableContainer:new(playerObj, openableContainer));
            return;
        end
    end
    if openableContainer:getSquare() and luautils.walkAdj(playerObj, openableContainer:getSquare()) then
        ISTimedActionQueue.add(ISOpenOpenableContainer:new(playerObj, openableContainer));
    end
end

--- Handles the creation of context menu options for world objects
---@param player integer
---@param context ISContextMenu
---@param worldobjects table
---@param test boolean
local function onFillWorldObjectContextMenu(player, context, worldobjects, test)
    if test and ISWorldObjectContextMenu.Test then return true; end
    if test then return ISWorldObjectContextMenu.setTest(); end

    local playerObj = getSpecificPlayer(player);
    if playerObj:getVehicle() then return; end

    local openableContainer, textureName = nil, nil;

    for _, worldObj in ipairs(worldobjects) do
        if instanceof(worldObj, 'IsoThumpable') then
            textureName = worldObj:getTextureName();
            if textureName then
                local isContainer = OpenableContainers.isContainerSprite(textureName);
                if isContainer and not openableContainer then
                    openableContainer = worldObj;
                    break;
                end
            end
        end
    end

    if openableContainer then
        local isContainerOpen = OpenableContainers.isContainerOpen(textureName);
        if not isContainerOpen then
            context:addOptionOnTop(getText("ContextMenu_Open_Container"), worldobjects,
                OpenableContainers.onToggleContainer, openableContainer, player);
        end
        if isContainerOpen then
            context:addOptionOnTop(getText("ContextMenu_Close_Container"), worldobjects,
                OpenableContainers.onToggleContainer, openableContainer, player);
        end
    end
end
Events.OnFillWorldObjectContextMenu.Add(onFillWorldObjectContextMenu)

return OpenableContainers
