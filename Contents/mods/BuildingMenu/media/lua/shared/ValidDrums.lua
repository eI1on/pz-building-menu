local customBarrelTiles = {
	{ prefix = "building_menu_barrels_02_"},
}

Events.OnLoadedTileDefinitions.Add(function()
	local toRemove = {}
	for i,pack in ipairs(customBarrelTiles) do
		local tiles = getWorld():getAllTiles(pack.prefix:sub(1, #pack.prefix - 1))
		if tiles then
			pack.first = tiles:get(0):match("^.*_(.*)$") + 0
			pack.last = tiles:get(tiles:size() - 1):match("^.*_(.*)$") + 0
		else
			table.insert(toRemove, i)
		end
	end
	
	for i = #toRemove, 1, -1 do
		table.remove(customBarrelTiles, toRemove[i])
	end
end)

return {customBarrelTiles}