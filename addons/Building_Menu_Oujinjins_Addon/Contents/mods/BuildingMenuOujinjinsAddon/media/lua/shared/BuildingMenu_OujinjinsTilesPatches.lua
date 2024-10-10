local BM_Utils = require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    local props;

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_generic_1_40",
        "Chinatown_EX_generic_1_41",
    }, {
        { "IsMoveAble",         "",           false },
        { "IsStackable",        "",           false },
        { "PickUpWeight",       "25",         false },
        { "IsTable",            "",           false },
        { "Surface",            "12",         false },
        { IsoFlagType.container },
        { "container",          "smallcrate", false },
        { "ContainerCapacity",  "25",         false },
        { "ContainerPosition",  "Low",        false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_generic_1_42",
        "Chinatown_EX_generic_1_43",
    }, {
        { "IsMoveAble",         "",           false },
        { "IsStackable",        "",           false },
        { "PickUpWeight",       "35",         false },
        { "IsTable",            "",           false },
        { "Surface",            "16",         false },
        { IsoFlagType.container },
        { "container",          "smallcrate", false },
        { "ContainerCapacity",  "40",         false },
        { "ContainerPosition",  "Low",        false },
    });

    props = manager:getSprite("Industry_1_8"):getProperties();
    BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
    BM_Utils.setSpriteProperty(props, "IsStackable", "", false);
    BM_Utils.setSpriteProperty(props, "PickUpWeight", "45", false);
    BM_Utils.setSpriteProperty(props, "IsTable", "", false);
    BM_Utils.setSpriteProperty(props, "Surface", "28", false);
    BM_Utils.setSpriteProperty(props, IsoFlagType.container);
    BM_Utils.setSpriteProperty(props, "container", "smallcrate", false);
    BM_Utils.setSpriteProperty(props, "ContainerCapacity", "40", false);
    BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
    BM_Utils.unsetSpriteProperty(props, "IsLow");
    props:CreateKeySet();

    props = manager:getSprite("Industry_1_9"):getProperties();
    BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
    BM_Utils.setSpriteProperty(props, "IsStackable", "", false);
    BM_Utils.setSpriteProperty(props, "PickUpWeight", "25", false);
    BM_Utils.setSpriteProperty(props, "IsTable", "", false);
    BM_Utils.setSpriteProperty(props, "Surface", "16", false);
    BM_Utils.setSpriteProperty(props, IsoFlagType.container);
    BM_Utils.setSpriteProperty(props, "container", "smallcrate", false);
    BM_Utils.setSpriteProperty(props, "ContainerCapacity", "25", false);
    BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
    BM_Utils.unsetSpriteProperty(props, "IsLow");
    props:CreateKeySet();

    props = manager:getSprite("Industry_3_9"):getProperties();
    BM_Utils.setSpriteProperty(props, "Facing", "E", false);
    BM_Utils.setSpriteProperty(props, "Soffset", "-1", false);
    props:CreateKeySet();

    props = manager:getSprite("Industry_3_8"):getProperties();
    BM_Utils.setSpriteProperty(props, "Facing", "S", false);
    BM_Utils.setSpriteProperty(props, "Eoffset", "1", false);
    props:CreateKeySet();



    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_military_1_8",
        "Chinatown_EX_military_1_16",
    }, {
        { "Facing",  "W", false },
        { "Eoffset", "3", false },
        { "Noffset", "2", false },
        { "Soffset", "1", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_military_1_9",
        "Chinatown_EX_military_1_17",
    }, {
        { "Facing",  "S",  false },
        { "Eoffset", "2",  false },
        { "Noffset", "1",  false },
        { "Woffset", "-1", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_military_1_10",
        "Chinatown_EX_military_1_18",
    }, {
        { "Facing",  "N",  false },
        { "Eoffset", "1",  false },
        { "Soffset", "-1", false },
        { "Woffset", "-2", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_military_1_11",
        "Chinatown_EX_military_1_19",
    }, {
        { "Facing",  "E",  false },
        { "Noffset", "-1", false },
        { "Soffset", "-2", false },
        { "Woffset", "-3", false },
    });


    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_0",
    }, {
        { "Facing",  "E",  false },
        { "Soffset", "16", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_16",
    }, {
        { "Facing",  "S",   false },
        { "Eoffset", "-16", false },
    });


    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_15",
    }, {
        { "Facing",  "N",  false },
        { "Eoffset", "-4", false },
        { "Soffset", "-6", false },
        { "Woffset", "-2", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_11",
    }, {
        { "Facing",  "E",  false },
        { "Noffset", "4",  false },
        { "Soffset", "-2", false },
        { "Woffset", "2",  false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_9",
    }, {
        { "Facing",  "S", false },
        { "Noffset", "6", false },
        { "Eoffset", "2", false },
        { "Woffset", "4", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_13",
    }, {
        { "Facing",  "W",  false },
        { "Noffset", "2",  false },
        { "Eoffset", "-2", false },
        { "Soffset", "-4", false },
    });


    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_12",
    }, {
        { "Facing",  "N",  false },
        { "Eoffset", "-4", false },
        { "Soffset", "-2", false },
        { "Woffset", "2",  false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_8",
    }, {
        { "Facing",  "E", false },
        { "Noffset", "4", false },
        { "Soffset", "2", false },
        { "Woffset", "6", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_10",
    }, {
        { "Facing",  "S",  false },
        { "Noffset", "2",  false },
        { "Eoffset", "-2", false },
        { "Woffset", "4",  false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_14",
    }, {
        { "Facing",  "W",  false },
        { "Noffset", "-2", false },
        { "Eoffset", "-6", false },
        { "Soffset", "-4", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_generic_1_40",
        "Chinatown_EX_generic_1_44",
        "Chinatown_EX_generic_1_48",
        "Chinatown_EX_generic_1_52",

        "Chinatown_EX_generic_1_42",
        "Chinatown_EX_generic_1_46",
        "Chinatown_EX_generic_1_50",
        "Chinatown_EX_generic_1_54",
    }, {
        { "Facing",  "E", false },
        { "Soffset", "1", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_generic_1_41",
        "Chinatown_EX_generic_1_45",
        "Chinatown_EX_generic_1_49",
        "Chinatown_EX_generic_1_53",

        "Chinatown_EX_generic_1_43",
        "Chinatown_EX_generic_1_47",
        "Chinatown_EX_generic_1_51",
        "Chinatown_EX_generic_1_55",
    }, {
        { "Facing",  "S",  false },
        { "Eoffset", "-1", false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_home_2_33",
        "Chinatown_EX_home_2_32",
        "Chinatown_EX_home_2_35",
        "Chinatown_EX_home_2_34",
        "Chinatown_EX_home_2_37",
        "Chinatown_EX_home_2_36",
        "Chinatown_EX_home_2_39",
        "Chinatown_EX_home_2_38",
    }, {
        { "Material",    "Wood",   false },
        { "Material2",   "Nails",  false },
        { "PickUpTool",  "Hammer", false },
        { "PlaceTool",   "Hammer", false },
        { "PickUpLevel", "4",      false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Chinatown_EX_generic_1_83",
        "Chinatown_EX_generic_1_82",
        "Chinatown_EX_generic_1_80",
        "Chinatown_EX_generic_1_81",
        "Chinatown_EX_generic_1_85",
        "Chinatown_EX_generic_1_84",
        "Chinatown_EX_generic_1_86",
        "Chinatown_EX_generic_1_87",
    }, {
        { "Material",    "Wood",   false },
        { "Material2",   "Nails",  false },
        { "CanBreak",    "",       false },
        { "CanScrap",    "",       false },
        { "ScrapSize",   "Large",  false },
        { "PickUpTool",  "Hammer", false },
        { "PickUpLevel", "4",      false },
    });


    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_0",
        "guizi_01_16",
        "guizi_01_5",
        "guizi_01_8",
        "guizi_01_10",
        "guizi_01_14",
        "guizi_01_12",
        "guizi_01_11",
        "guizi_01_9",
        "guizi_01_13",
        "guizi_01_15",
        "Industry_1_30",
        "Industry_1_31",
        "Industry_1_56",
        "Industry_1_57",
        "Chinatown_EX_military_1_1",
        "Chinatown_EX_military_1_0",
        "Chinatown_EX_military_1_2",
        "Chinatown_EX_military_1_3",
        "Chinatown_EX_military_1_25",
        "Chinatown_EX_military_1_24",
        "Chinatown_EX_military_1_26",
        "Chinatown_EX_military_1_27",
        "Vaulttec_2_1",
        "Vaulttec_2_0",
        "Vaulttec_2_2",
        "Vaulttec_2_3",
        "Vaulttec_2_6",
        "Vaulttec_2_7",
        "Vaulttec_3_34",
        "Vaulttec_3_35",
        "Vaulttec_3_48",
        "Vaulttec_3_49",
        "Vaulttec_3_28",
        "Vaulttec_3_29",
        "Vaulttec_3_26",
        "Vaulttec_3_27",
        "Vaulttec_5_9",
        "Vaulttec_5_8",
        "Vaulttec_5_16",
        "Vaulttec_5_17",
        "Vaulttec_6_16",
        "Vaulttec_6_17",
    }, {
        { "Material",  "MetalPlates",      false },
        { "Material2", "SmallMetalPlates", false },
        { "Material3", "MetalScrap",       false },
        { "CanBreak",  "",                 false },
        { "CanScrap",  "",                 false },
        { "ScrapSize", "Large",            false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "Guizi_tiles_01_7",
        "Guizi_tiles_01_6",
        "Guizi_tiles_01_0",
        "Guizi_tiles_01_1",
        "Chinatown_EX_military_1_11",
        "Chinatown_EX_military_1_10",
        "Chinatown_EX_military_1_8",
        "Chinatown_EX_military_1_9",
    }, {
        { "Material",  "MetalBars",        false },
        { "Material2", "SmallMetalPlates", false },
        { "Material3", "MetalScrap",       false },
        { "CanBreak",  "",                 false },
        { "CanScrap",  "",                 false },
        { "ScrapSize", "Large",            false },
    });
end)
