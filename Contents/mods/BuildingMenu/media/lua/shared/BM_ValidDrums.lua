CustomBarrelTiles = {
    { prefix = "building_menu_barrels_02_"},
}

Events.OnLoadedTileDefinitions.Add(function()
    local toRemove = {}
    for i, pack in ipairs(CustomBarrelTiles) do
        local prefixWithoutLastChar = pack.prefix:sub(1, -2)
        local tiles = getWorld():getAllTiles(prefixWithoutLastChar)
        if tiles and tiles:size() > 0 then
            pack.first = tonumber(tiles:get(0):match("_(%d+)$"))
            pack.last = tonumber(tiles:get(tiles:size() - 1):match("_(%d+)$"))
        else
            table.insert(toRemove, i)
        end
    end

    for i = #toRemove, 1, -1 do
        table.remove(CustomBarrelTiles, toRemove[i])
    end
end)

return {CustomBarrelTiles}