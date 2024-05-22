local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "DylansRandomFurniture01_8",
        "DylansRandomFurniture01_9"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
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
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "80", false);
        props:CreateKeySet();
    end

    sprites = {
        "BlackCoffeeCo01_8",
        "BlackCoffeeCo01_9",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "locker", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "80", false);
        props:CreateKeySet();
    end

    sprites = {
        "DylansRandomFurniture01_13",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "Toolbox", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "25", false);
        props:CreateKeySet();
    end
end)