local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "LC_Bitch_n_dogfood_01_0",
        "LC_industrial_stuff_01_0",
        "LC_industrial_stuff_01_48",
        "LC_industrial_stuff_01_51",
        "LC_industrial_stuff_01_56",
        "LC_industrial_stuff_01_59",
        "LC_industrial_stuff_01_64",
        "LC_industrial_stuff_01_67",
        "LC_industrial_stuff_01_72",
        "LC_industrial_stuff_01_75",
        "LC_industrial_stuff_01_80",
        "LC_industrial_stuff_01_83",
        "LC_industrial_stuff_01_88",
        "LC_industrial_stuff_01_91",
        "LC_industrial_stuff_01_96",
        "LC_industrial_stuff_01_99",
        "LC_industrial_stuff_01_104",
        "LC_industrial_stuff_01_107",
        "LC_industrial_stuff_01_112",
        "LC_industrial_stuff_01_115",
        "LC_industrial_stuff_01_120",
        "LC_industrial_stuff_01_123"
    }, {
        { "ContainerCapacity", "100", false },
    }
    );
end)
