require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    -- local sprites = {
    --     "DylansGardenStuff02_48",
    --     "DylansGardenStuff02_53",
    --     "DylansGardenStuff02_54",
    --     "DylansGardenStuff02_55",
    --     "DylansGardenStuff02_56",
    --     "DylansGardenStuff02_57",
    --     "DylansGardenStuff02_58",
    --     "DylansGardenStuff02_59",
    --     "DylansGardenStuff02_60",
    --     "DylansGardenStuff02_61"
    -- }
    -- for _, sprite in ipairs(sprites) do
    --     local props = manager:getSprite(sprite):getProperties()
    --     BM_Utils.setSpriteProperty(props, "IsMovAble", "", true); -- not working
    -- end

    local sprites = {
        "DylansRandomFurniture01_8",
        "DylansRandomFurniture01_9"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
    end
end)