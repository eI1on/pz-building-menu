local BM_Utils = require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    -- grouped sprite operations to reuse local variables
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "industry_ddd_01_4",
        "industry_ddd_01_12",
        "industry_ddd_01_5",
        "industry_ddd_01_13",
        "industry_ddd_01_6",
        "industry_ddd_01_14",
        "industry_ddd_01_7",
        "industry_ddd_01_15",

        "industry_ddd_01_53",
        "industry_ddd_01_61",
        "industry_ddd_01_54",
        "industry_ddd_01_62",
        "industry_ddd_01_55",
        "industry_ddd_01_63",

        "industry_ddd_01_52",
        "industry_ddd_01_60",
        "industry_ddd_01_59",
        "industry_ddd_01_58",
        "industry_ddd_01_57",
        "industry_ddd_01_56",
    }, {
        { "CanScrap",           "",       false },
        { "IsMoveAble",         "",       false },
        { "PickUpLevel",        "2",      false },
        { "PickUpTool",         "Hammer", false },
        { "PickUpWeight",       "200",    false },
        { "PlaceTool",          "Hammer", false },
        { IsoFlagType.container },
        { "container",          "crate",  false },
        { "ContainerCapacity",  "50",     false },
    });

    -- Not working, idk why.
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "building_menu_03_ddd_Forest_Survival_0",
        "edit_ddd_RUS_Forest Survival_01_12"
    }, {
        { "FlatTextureOffset", "-7", false }
    }, {
        IsoFlagType.windowW
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "building_menu_03_ddd_Forest_Survival_1",
        "edit_ddd_RUS_Forest Survival_01_13"
    }, {
        { "FlatTextureOffset", "-8", false }
    }, {
        IsoFlagType.windowN
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "edit_ddd_RUS_Forest Survival_01_16",
        "edit_ddd_RUS_Forest Survival_01_17",
        "edit_ddd_RUS_Forest Survival_01_18",
        "edit_ddd_RUS_Forest Survival_01_19",
        "edit_ddd_RUS_Forest Survival_01_20",
        "edit_ddd_RUS_Forest Survival_01_21",
    }, {
        { "RoofGroup",             "1", false },
        { IsoFlagType.ForceAmbient }
    }, nil);

    for i = 1, 5 do
        for j = 24, 55 do
            BM_Utils.setOrUnsetSpriteProperties(manager, {
                string.format("d_furniture_bedroom_0%d_%d", i, j)
            }, {
                { "ContainerPosition",  "Low",      false },
                { IsoFlagType.container },
                { "container",          "wardrobe", false },
                { "ContainerCapacity",  "50",       false },
            }, nil);
        end

        for j = 62, 63 do
            BM_Utils.setOrUnsetSpriteProperties(manager, {
                string.format("d_furniture_bedroom_0%d_%d", i, j)
            }, {
                { "ContainerPosition",  "Low",      false },
                { IsoFlagType.container },
                { "container",          "wardrobe", false },
                { "ContainerCapacity",  "50",       false },
            }, nil);
        end
    end

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "edit_ddd_RUS_furniture_storage_03_40",
        "edit_ddd_RUS_furniture_storage_03_41",
        "edit_ddd_RUS_furniture_storage_03_42",
        "edit_ddd_RUS_furniture_storage_03_43",
        "edit_ddd_RUS_furniture_storage_03_88",
        "edit_ddd_RUS_furniture_storage_03_89",
        "edit_ddd_RUS_furniture_storage_03_91",
        "edit_ddd_RUS_furniture_storage_03_90",
    }, {
        { "ContainerPosition",  "Low",      false },
        { IsoFlagType.container },
        { "container",          "wardrobe", false },
        { "ContainerCapacity",  "50",       false },
    }, nil);

    local dataCounters = { 2, 3, 10, 11, 18, 19, 26, 27, 34, 35, 42, 43, 50, 51, 58, 59 };
    local sprites = {};
    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber + 2);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber + 4);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber - 2);
    end
    BM_Utils.setOrUnsetSpriteProperties(manager, sprites, {
        { "ContainerPosition",  "High",       false },
        { "IsHigh",             "",           false },
        { "MoveType",           "WallObject", false },
        { "ScrapSize",          "Small",      false },
        { IsoFlagType.container },
        { "container",          "counter",    false },
        { "ContainerCapacity",  "50",         false },
    }, nil);

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "furniture_storage_ddd_01_4",
        "furniture_storage_ddd_01_9",
    }, {
        { "IsLow",              "",       false },
        { "IsTable",            "",       false },
        { "IsStackable",        "",       false },
        { "Surface",            "16",     false },
        { IsoFlagType.container },
        { "container",          "locker", false },
        { "ContainerCapacity",  "30",     false },
        { "ContainerPosition",  "Low",    false },
    }, nil);

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "furniture_storage_ddd_01_7",
        "furniture_storage_ddd_01_8",
    }, {
        { "GroupName",          "Pallet",            false },
        { "CustomName",         "with Small Crates", false },
        { "IsLow",              "",                  false },
        { "IsTable",            "",                  false },
        { "IsStackable",        "",                  false },
        { "Surface",            "32",                false },
        { IsoFlagType.container },
        { "container",          "locker",            false },
        { "ContainerCapacity",  "80",                false },
        { "ContainerPosition",  "Low",               false },
    }, nil);

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "edit_ddd_RUS_furniture_storage_03_40",
        "edit_ddd_RUS_furniture_storage_03_41",
        "edit_ddd_RUS_furniture_storage_03_42",
        "edit_ddd_RUS_furniture_storage_03_43",
        "edit_ddd_RUS_furniture_storage_03_88",
        "edit_ddd_RUS_furniture_storage_03_89",
        "edit_ddd_RUS_furniture_storage_03_90",
        "edit_ddd_RUS_furniture_storage_03_91",
    }, {
        { "BlocksPlacement",   "",         false },
        { "CanBreak",          "",         false },
        { "CanScrap",          "",         false },
        { "ContainerCapacity", "25",       false },
        { "Material",          "Wood",     false },
        { "Material2",         "Nails",    false },
        { "PickUpLevel",       "2",        false },
        { "PickUpTool",        "Hammer",   false },
        { "IsMoveAble",        "",         false },
        { "PickUpWeight",      "200",      false },
        { "PlaceTool",         "Hammer",   false },
        { "ScrapSize",         "Large",    false },
        { "Surface",           "15",       false },
        { "Container",         "wardrobe", false },
    }, nil);

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "d_furniture_kitchen_01_0",
        "d_furniture_kitchen_01_1",
        "d_furniture_kitchen_01_2",
        "d_furniture_kitchen_01_3",
        "d_furniture_kitchen_01_4",
        "d_furniture_kitchen_01_5",
        "d_furniture_kitchen_01_6",
        "d_furniture_kitchen_01_7",
        "d_furniture_kitchen_01_112",
        "d_furniture_kitchen_01_113",
    }, {
        { "ContainerPosition", "High",     false },
        { "container",         "overhead", false },
    }, {
        IsoFlagType.solidtrans,
        IsoFlagType.attachedW,
        IsoFlagType.attachedN,
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "furniture_storage_ddd_01_14",
        "furniture_storage_ddd_01_15",
    }, nil, {
        "PickUpLevel",
        "PickUpTool",
        "PlaceTool",
    });
end)
