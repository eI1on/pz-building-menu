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

    props = manager:getSprite(sprite):getProperties();
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
end)
