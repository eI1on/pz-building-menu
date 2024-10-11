local BM_Utils = require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "en_newburbs_windows_01_0",
        "en_newburbs_windows_01_8",
        "en_newburbs_windows_01_16",
        "en_newburbs_windows_01_17",
        "en_newburbs_windows_01_18",
        "en_newburbs_windows_01_19",
        "en_newburbs_windows_01_48",
        "en_newburbs_windows_01_49",
        "en_newburbs_windows_01_50",
        "en_newburbs_windows_01_51",
        "en_newburbs_windows_01_80",
        "en_newburbs_windows_01_81",
        "en_newburbs_windows_01_82",
    }, {
        { "CanBreak",           "",        false },
        { "CustomName",         "Window",  false },
        { "GroupName",          "Wooden",  false },
        { "Facing",             "W",       false },
        { "IsClosedState",      "",        false },
        { "IsMoveAble",         "",        false },
        { "MoveType",           "Window",  false },
        { "Noffset",            "1",       false },
        { "PickUpLevel",        "2",       false },
        { "PickUpTool",         "Crowbar", false },
        { "PickUpWeight",       "100",     false },
        { "PlaceTool",          "Hammer",  false },
        { "WindowN",            "WindowN", false },
        { "disableFade",        "",        false },
        { IsoFlagType.attachedW },
    }, nil);

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "en_newburbs_windows_01_4",
        "en_newburbs_windows_01_12",
        "en_newburbs_windows_01_20",
        "en_newburbs_windows_01_21",
        "en_newburbs_windows_01_22",
        "en_newburbs_windows_01_23",
        "en_newburbs_windows_01_52",
        "en_newburbs_windows_01_53",
        "en_newburbs_windows_01_54",
        "en_newburbs_windows_01_55",
        "en_newburbs_windows_01_84",
        "en_newburbs_windows_01_85",
        "en_newburbs_windows_01_86",
    }, {
        { "CanBreak",           "",        false },
        { "CustomName",         "Window",  false },
        { "GroupName",          "Wooden",  false },
        { "Facing",             "N",       false },
        { "IsClosedState",      "",        false },
        { "IsMoveAble",         "",        false },
        { "MoveType",           "Window",  false },
        { "Woffset",            "-1",      false },
        { "PickUpLevel",        "2",       false },
        { "PickUpTool",         "Crowbar", false },
        { "PickUpWeight",       "100",     false },
        { "PlaceTool",          "Hammer",  false },
        { "WindowN",            "WindowN", false },
        { "disableFade",        "",        false },
        { IsoFlagType.attachedN },
    }, nil);

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_01_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_01_0", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_01_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_01_34"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_01_32", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_01_33", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_01_66"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_01_64", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_01_65", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_01_98"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_01_96", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_01_97", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_02_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_02_0", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_02_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_02_34"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_02_32", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_02_33", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_02_66"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_02_64", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_02_65", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_02_98"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_02_96", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_02_97", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_03_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_03_0", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_03_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_03_34"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_03_32", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_03_33", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_03_66"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_03_64", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_03_65", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_03_98"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_03_96", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_03_97", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_04_2" }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_04_0", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_04_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_04_98"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_04_96", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_04_97", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_04_34"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_04_32", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_04_33", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_interiors_04_66"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_interiors_04_64", false },
    --     { "CornerNorthWall", "en_newburbs_interiors_04_65", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_01_white_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_01_white_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_01_white_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_02_lightgray_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_02_lightgray_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_02_lightgray_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_03_eggshell_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_03_eggshell_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_03_eggshell_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_04_warmgray_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_04_warmgray_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_04_warmgray_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_05_red_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_05_red_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_05_red_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_06_orange_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_06_orange_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_06_orange_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_07_redbrown_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_07_redbrown_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_07_redbrown_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_08_brown_2"
    -- }, {
    --     { "CornerWestWall",  "en_newburbs_walls_08_brown_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_08_brown_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "en_newburbs_walls_09_tan_2" }, {
    --     { "CornerWestWall",  "en_newburbs_walls_09_tan_0", false },
    --     { "CornerNorthWall", "en_newburbs_walls_09_tan_1", false }
    -- });
end)
