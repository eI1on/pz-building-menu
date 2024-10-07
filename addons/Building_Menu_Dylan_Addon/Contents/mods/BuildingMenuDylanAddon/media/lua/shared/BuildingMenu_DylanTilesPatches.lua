local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "DylansRandomFurniture01_8",
        "DylansRandomFurniture01_9",
    }, {
        { "ContainerCapacity", "50", false }
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "DarthGunStore_8",
        "DarthGunStore_9",
        "DarthGunStore_10",
        "DarthGunStore_11",
        "DarthGunStore_12",
        "DarthGunStore_13",
        "DarthGunStore_14",
        "DarthGunStore_15",
    }, {
        { "ContainerCapacity", "80", false }
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "BlackCoffeeCo01_8",
        "BlackCoffeeCo01_9",
    }, {
        { IsoFlagType.container },
        { "container",          "locker", false },
        { "ContainerCapacity",  "80",     false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "DylansRandomFurniture01_13",
    }, {
        { IsoFlagType.container },
        { "container",          "toolbox", false },
        { "ContainerCapacity",  "25",      false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "DylansRandomFurniture01_10",
        "DylansRandomFurniture01_11",
        "DylansRandomFurniture01_12",
        "DylansRandomFurniture01_13",
    }, {
        { IsoFlagType.solidtrans },
    },{
        IsoFlagType.solid,
    });
end)
