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
        { "Facing",  "S",  false },
        { "Eoffset", "-16",  false },
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
        { "Noffset", "4", false },
        { "Soffset", "-2", false },
        { "Woffset", "2", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_9",
    }, {
        { "Facing",  "S",  false },
        { "Noffset", "6", false },
        { "Eoffset", "2", false },
        { "Woffset", "4", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_13",
    }, {
        { "Facing",  "W",  false },
        { "Noffset", "2", false },
        { "Eoffset", "-2", false },
        { "Soffset", "-4", false },
    });


    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_12",
    }, {
        { "Facing",  "N",  false },
        { "Eoffset", "-4", false },
        { "Soffset", "-2", false },
        { "Woffset", "2", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_8",
    }, {
        { "Facing",  "E",  false },
        { "Noffset", "4", false },
        { "Soffset", "2", false },
        { "Woffset", "6", false },
    });
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "guizi_01_10",
    }, {
        { "Facing",  "S",  false },
        { "Noffset", "2", false },
        { "Eoffset", "-2", false },
        { "Woffset", "4", false },
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
        { "Facing",  "E",  false },
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
end)
