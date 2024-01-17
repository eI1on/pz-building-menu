require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "DylansRandomFurniture01_8",
        "DylansRandomFurniture01_9"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
    end

    sprites = {
        "DarthGunStore_8",
        "DarthGunStore_9",
        "DarthGunStore_10",
        "DarthGunStore_11",
        "DarthGunStore_12",
        "DarthGunStore_13",
        "DarthGunStore_14",
        "DarthGunStore_15"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "80", false);
    end
end)