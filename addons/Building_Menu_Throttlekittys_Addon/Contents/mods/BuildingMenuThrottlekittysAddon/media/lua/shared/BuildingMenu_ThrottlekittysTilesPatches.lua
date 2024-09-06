local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "lighting_outdoor_tk_01_12",
        "lighting_outdoor_tk_01_13",
        "lighting_outdoor_tk_01_17",
        "lighting_outdoor_tk_01_14",
        "lighting_outdoor_tk_01_16",
        "lighting_outdoor_tk_01_15",
    }, {
        { "IsMoveAble",   "",            false },
        { "PickUpWeight", "200",         false },
        { "PickUpTool",   "Electrician", false },
        { "PickUpLevel",  "4",           false },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "kitchen_misc_tk_01_12",
        "kitchen_misc_tk_01_13",
        "kitchen_misc_tk_01_14",
        "kitchen_misc_tk_01_15",
    }, nil, {
        "MoveType"
    });
end)
