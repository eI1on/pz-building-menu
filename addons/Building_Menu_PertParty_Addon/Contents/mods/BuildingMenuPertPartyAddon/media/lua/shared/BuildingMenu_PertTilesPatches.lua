local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_re-phoenix_2_120",
        "pert_re-phoenix_2_121",
        "pert_re-phoenix_2_122",
        "pert_re-phoenix_2_123",
        "pert_re-phoenix_2_124",
        "pert_re-phoenix_2_125",
        "pert_re-phoenix_2_126",
        "pert_re-phoenix_2_127",
    }, {
        { "IsoType",    "IsoTelevision",   false },
        { "CustomItem", "Radio.TvMonster", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_0",
        "pert_Christmas_01_2",
        "pert_Christmas_01_4",
    }, {
        { IsoFlagType.windowW },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_1",
        "pert_Christmas_01_5",
    }, {
        { IsoFlagType.windowN },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_8",
        "pert_Christmas_01_12",
    }, {
        { "IsoType",          "IsoThumpable", false },
        { IsoFlagType.windowW },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_9",
        "pert_Christmas_01_13",
    }, {
        { "IsoType",          "IsoThumpable", false },
        { IsoFlagType.windowN },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_86",
        "pert_Christmas_01_87",
    }, {
        { "IsoType",            "IsoThumpable", false },
        { "IsMoveAble",         "",             false },
        { "ContainerCapacity",  "50",           false },
        { IsoFlagType.container },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_72",
        "pert_Christmas_01_73",
        "pert_Christmas_01_74",
        "pert_Christmas_01_75",
        "pert_Christmas_01_76",
        "pert_Christmas_01_77",
        "pert_Christmas_01_78",
        "pert_Christmas_01_79",
        "pert_Christmas_01_82",
        "pert_Christmas_01_83",
        "pert_Christmas_01_84",
        "pert_Christmas_01_85",

        "pert_Christmas_02_8", -- christams runners
        "pert_Christmas_02_9",
        "pert_Christmas_02_10",
        "pert_Christmas_02_11",
        "pert_Christmas_02_12",
        "pert_Christmas_02_13",
        "pert_Christmas_02_14",
        "pert_Christmas_02_15",
    }, {
        { "IsMoveAble", "", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_bar_01_64",
        "pert_bar_01_72",
        "pert_bar_01_65",
        "pert_bar_01_73",
        "pert_bar_01_66",
        "pert_bar_01_74",
    }, {
        { "GroupName",          "Bar Wall",   false },
        { "CanBreak",           "",           false },
        { "CanScrap",           "",           false },
        { IsoFlagType.container },
        { "container",          "shelves",    false },
        { "ContainerCapacity",  "80",         false },
        { "IsMoveAble",         "",           false },
        { "ItemHeight",         "40",         false },
        { "Material",           "Wood",       false },
        { "Material2",          "Nails",      false },
        { "MoveType",           "WallObject", false },
        { "PickUpLevel",        "3",          false },
        { "PickUpTool",         "Hammer",     false },
        { "PickUpWeight",       "200",        false },
        { "PlaceTool",          "Hammer",     false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "pert_Christmas_01_86",
        "pert_Christmas_01_87",
    }, {
        { "IsoType",            "IsoThumpable", false },
        { "CanBreak",           "",             false },
        { "CanScrap",           "",             false },
        { IsoFlagType.container },
        { "container",          "smallcrate",   false },
        { "ContainerCapacity",  "35",           false },
        { "IsMoveAble",         "",             false },
        { "PickUpWeight",       "20",           false },
    });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "pert_walls_wallpaper_1_82"
    -- }, {
    --     { "CornerWestWall", "pert_walls_wallpaper_1_80", false },
    --     { "CornerNorthWall",  "pert_walls_wallpaper_1_81", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "pert_walls_wallpaper_1_86"
    -- }, {
    --     { "CornerWestWall", "pert_walls_wallpaper_1_84", false },
    --     { "CornerNorthWall",  "pert_walls_wallpaper_1_85", false }
    -- });
end)
