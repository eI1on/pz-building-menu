require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "pert_re-phoenix_2_120",
        "pert_re-phoenix_2_121",
        "pert_re-phoenix_2_122",
        "pert_re-phoenix_2_123",
        "pert_re-phoenix_2_124",
        "pert_re-phoenix_2_125",
        "pert_re-phoenix_2_126",
        "pert_re-phoenix_2_127"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsoType", "IsoTelevision", false);
        BM_Utils.setSpriteProperty(props, "CustomItem", "Radio.TvMonster", false);
    end
end)
