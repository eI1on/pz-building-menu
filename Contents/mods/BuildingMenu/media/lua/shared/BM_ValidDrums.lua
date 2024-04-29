--- @module BM_ValidDrums
-- This module defines configurations for custom barrel tiles in the game
local CustomBarrelTiles = {}

--- Stores configurations for custom barrel tiles
-- Each entry specifies a prefix used to identify relevant tile sprites
CustomBarrelTiles = {
    --- @field prefix string The prefix of the sprite names for barrels.
    { prefix = "building_menu_barrels_02_" },
}

--- Event handler for when tile definitions are loaded in the game
-- It adjusts the `first` and `last` properties for each barrel configuration
-- based on the actual tiles available in the game that match the prefix
Events.OnLoadedTileDefinitions.Add(function()
    local toRemove = {}

    -- Iterate through each barrel tile configuration
    for i, pack in ipairs(CustomBarrelTiles) do
        local prefixWithoutLastChar = pack.prefix:sub(1, -2) -- Remove the last character from the prefix
        local tiles = getWorld():getAllTiles(prefixWithoutLastChar) -- Retrieve all tiles matching the adjusted prefix

        -- If matching tiles are found, set the `first` and `last` indices based on the sprite names
        if tiles and tiles:size() > 0 then
            pack.first = tonumber(tiles:get(0):match("_(%d+)$"))
            pack.last = tonumber(tiles:get(tiles:size() - 1):match("_(%d+)$"))
        else
            table.insert(toRemove, i) -- Mark for removal if no tiles found
        end
    end

    -- Remove any configurations that did not match any tiles
    for i = #toRemove, 1, -1 do
        table.remove(CustomBarrelTiles, toRemove[i])
    end
end)

--- Returns the configurations for custom barrel tiles
--- @return table The list of configurations for custom barrels
return CustomBarrelTiles
