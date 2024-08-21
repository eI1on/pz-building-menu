local BM_Utils = require('BM_Utils')


Events.OnInitWorld.Add(function()
    BM_Utils.addValuesToPropertyMap("container", {
        "clothingrack"
    })
    BM_Utils.addValuesToPropertyMap("ContainerCapacity", {
        "25", "30", "35", "40", "50", "80", "200"
    })
    BM_Utils.addValuesToPropertyMap("ItemHeight", {
        "100"
    })
end)


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "location_military_generic_01_23",
        "location_military_generic_01_22",
        "location_military_generic_01_30",
        "location_military_generic_01_31",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "100", false);
        props:CreateKeySet();
    end

    sprites = {
        "fixtures_windows_01_72",
        "fixtures_windows_01_73"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "4", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Crowbar", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "MoveType", "Window", false);
        BM_Utils.setSpriteProperty(props, "CustomName", "Window", false);
        BM_Utils.setSpriteProperty(props, "GroupName", "Wooden", false);
        props:CreateKeySet();
    end

    sprites = {
        "construction_01_19",
        "construction_01_20",
        "construction_01_25",
        "construction_01_26"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.unsetSpriteProperty(props, "BlocksPlacement");
        BM_Utils.unsetSpriteProperty(props, IsoFlagType.solidtrans);
        props:CreateKeySet();
    end

    local props = manager:getSprite("fencing_01_96"):getProperties();
    BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
    BM_Utils.setSpriteProperty(props, "IsLow", "", false);
    BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false);
    BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
    BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
    props:CreateKeySet();


    sprites = {
        "location_business_distillery_01_0",
        "location_business_distillery_01_1",
        "location_business_distillery_01_2",
        "location_business_distillery_01_3",
        "location_business_distillery_01_4",
        "location_business_distillery_01_5",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Mid", false);
        BM_Utils.setSpriteProperty(props, "IsHigh", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "crate", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end


    sprites = {
        "location_hospitality_sunstarmotel_02_21",
        "location_hospitality_sunstarmotel_02_22",
        "location_hospitality_sunstarmotel_02_23",
        "location_hospitality_sunstarmotel_02_20",
        "location_restaurant_pizzawhirled_01_35",
        "location_restaurant_pizzawhirled_01_37",
        "location_restaurant_pizzawhirled_01_39",
        "location_restaurant_pizzawhirled_01_33",
        "location_restaurant_pizzawhirled_01_34",
        "location_restaurant_pizzawhirled_01_36",
        "location_restaurant_pizzawhirled_01_38",
        "location_restaurant_pizzawhirled_01_32",
        "location_restaurant_diner_01_27",
        "location_restaurant_diner_01_29",
        "location_restaurant_diner_01_31",
        "location_restaurant_diner_01_25",
        "location_restaurant_diner_01_26",
        "location_restaurant_diner_01_28",
        "location_restaurant_diner_01_30",
        "location_restaurant_diner_01_24",
        "location_shop_generic_01_19",
        "location_shop_generic_01_21",
        "location_shop_generic_01_23",
        "location_shop_generic_01_17",
        "location_shop_generic_01_18",
        "location_shop_generic_01_20",
        "location_shop_generic_01_22",
        "location_shop_generic_01_16",
        "location_business_bank_01_43",
        "location_business_bank_01_42",
        "location_business_bank_01_45",
        "location_business_bank_01_44",
        "fixtures_bathroom_02_24",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "counter", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end


    sprites = {
        "location_farm_accesories_01_8",
        "location_farm_accesories_01_9",
        "location_farm_accesories_01_10",
        "location_farm_accesories_01_11",
        "fixtures_bathroom_02_25"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "crate", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "40", false);
        props:CreateKeySet();
    end

    sprites = {
        "location_community_medical_01_37",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "sidetable", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "30", false);
        props:CreateKeySet();
    end

    sprites = {
        "location_community_school_01_4",
        "location_community_school_01_5",
        "location_community_school_01_6",
        "location_community_school_01_7",
        "location_community_school_01_12",
        "location_community_school_01_13",
        "location_community_school_01_14",
        "location_community_school_01_15"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "desk", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end

    sprites = {
        "trashcontainers_01_32",
        "trashcontainers_01_33",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "High", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "bin", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end

    sprites = {
        "location_business_bank_01_40",
        "location_business_bank_01_41"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "High", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "shelves", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end

    sprites = {
        "camping_01_24",
        "camping_01_25",
        "camping_01_28",
        "camping_01_29",
        "camping_01_34",
        "camping_01_35",
        "camping_01_38",
        "camping_01_39",

        "camping_01_26",
        "camping_01_27",
        "camping_01_30",
        "camping_01_31",
        "camping_01_32",
        "camping_01_33",
        "camping_01_36",
        "camping_01_37",
        "camping_01_40",
        "camping_01_41",
        "camping_01_42",
        "camping_01_43",
    }

    -- for _, sprite in ipairs(sprites) do
    --     local props = manager:getSprite(sprite):getProperties();
    --     BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
    --     BM_Utils.setSpriteProperty(props, "IsLow", "", false);
    --     BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
    --     BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
    --     BM_Utils.setSpriteProperty(props, IsoFlagType.container);
    --     BM_Utils.setSpriteProperty(props, "container", "logs", false);
    --     BM_Utils.setSpriteProperty(props, "ContainerCapacity", "200", false);
    --     BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
    --     BM_Utils.setSpriteProperty(props, "PickUpWeight", "75", false);
    --     props:CreateKeySet();
    -- end


    sprites = {
        "location_shop_generic_01_35",
        "location_shop_generic_01_34",
        "location_shop_generic_01_32",
        "location_shop_generic_01_33",

        "location_restaurant_pie_01_51",
        "location_restaurant_pie_01_50",
        "location_restaurant_pie_01_48",
        "location_restaurant_pie_01_49"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "displaycasebakery", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "100", false);
        props:CreateKeySet();
    end


    sprites = {
        "fixtures_railings_01_27",
        "fixtures_railings_01_35",
        "fixtures_railings_01_67",
        "fixtures_railings_01_75",
        "construction_01_3"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "HitByCar", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        props:CreateKeySet();
    end

    sprites = {
        "fixtures_railings_01_27",
        "fixtures_railings_01_24",
        "fixtures_railings_01_25",
        "fixtures_railings_01_26",
        "fixtures_railings_01_34",
        "fixtures_railings_01_64",
        "fixtures_railings_01_65",
        "fixtures_railings_01_66",
        "fixtures_railings_01_74",
        "construction_01_0",
        "construction_01_1"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "HitByCar", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "Material2", "Nails", false);
        BM_Utils.setSpriteProperty(props, "CloseSneakBonus", "250", false);
        BM_Utils.setSpriteProperty(props, "FenceTypeLow", "Wood", false);
        props:CreateKeySet();
    end

    sprites = {
        "fixtures_railings_01_31",
        "fixtures_railings_01_39",
        "fixtures_railings_01_115",
        "fixtures_railings_01_119",
        "industry_railroad_05_43",
        "industry_bunker_01_27"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "HitByCar", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalBars", false);
        props:CreateKeySet();
    end

    sprites = {
        "fixtures_railings_01_28",
        "fixtures_railings_01_29",
        "fixtures_railings_01_30",
        "fixtures_railings_01_36",
        "fixtures_railings_01_37",
        "fixtures_railings_01_38",
        "fixtures_railings_01_112",
        "fixtures_railings_01_113",
        "fixtures_railings_01_116",
        "fixtures_railings_01_117",
        "industry_railroad_05_40",
        "industry_railroad_05_41",
        "industry_bunker_01_24",
        "industry_bunker_01_25"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "HitByCar", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalBars", false);
        BM_Utils.setSpriteProperty(props, "CloseSneakBonus", "250", false);
        BM_Utils.setSpriteProperty(props, "FenceTypeLow", "MetalGate", false);
        props:CreateKeySet();
    end


    sprites = {
        "floors_interior_tilesandwood_01_0",
        "floors_interior_tilesandwood_01_1",
        "floors_interior_tilesandwood_01_2",
        "floors_interior_tilesandwood_01_3",
        "floors_interior_tilesandwood_01_4",
        "floors_interior_tilesandwood_01_5",
        "floors_interior_tilesandwood_01_6",
        "floors_interior_tilesandwood_01_7",
        "floors_interior_tilesandwood_01_8",
        "floors_interior_tilesandwood_01_9",
        "floors_interior_tilesandwood_01_10",
        "floors_interior_tilesandwood_01_11",
        "floors_interior_tilesandwood_01_12",
        "floors_interior_tilesandwood_01_13",
        "floors_interior_tilesandwood_01_14",
        "floors_interior_tilesandwood_01_16",
        "floors_interior_tilesandwood_01_17",
        "floors_interior_tilesandwood_01_18",
        "floors_interior_tilesandwood_01_19",
        "floors_interior_tilesandwood_01_20",
        "floors_interior_tilesandwood_01_21",
        "floors_interior_tilesandwood_01_22",
        "floors_interior_tilesandwood_01_23",
        "floors_interior_tilesandwood_01_24",
        "floors_interior_tilesandwood_01_25",
        "floors_interior_tilesandwood_01_28",
        "floors_interior_tilesandwood_01_29",
        "floors_interior_tilesandwood_01_30",
        "floors_interior_tilesandwood_01_31",
        "floors_interior_tilesandwood_01_40",
        "floors_interior_tilesandwood_01_41",
        "floors_interior_tilesandwood_01_42",
        "floors_interior_tilesandwood_01_43",
        "floors_interior_tilesandwood_01_44",
        "floors_interior_tilesandwood_01_45",
        "floors_interior_tilesandwood_01_46",
        "floors_interior_tilesandwood_01_47",
        "floors_interior_tilesandwood_01_48",
        "floors_interior_tilesandwood_01_49",
        "floors_interior_tilesandwood_01_50",
        "floors_interior_tilesandwood_01_51",
        "floors_interior_tilesandwood_01_52",
        "industry_railroad_05_45"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "Material2", "Nails", false);
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Small", false);
        props:CreateKeySet();
    end


    sprites = {
        "floors_interior_carpet_01_0",
        "floors_interior_carpet_01_1",
        "floors_interior_carpet_01_2",
        "floors_interior_carpet_01_3",
        "floors_interior_carpet_01_4",
        "floors_interior_carpet_01_5",
        "floors_interior_carpet_01_6",
        "floors_interior_carpet_01_7",
        "floors_interior_carpet_01_8",
        "floors_interior_carpet_01_9",
        "floors_interior_carpet_01_10",
        "floors_interior_carpet_01_11",
        "floors_interior_carpet_01_12",
        "floors_interior_carpet_01_13",
        "floors_interior_carpet_01_14",
        "floors_interior_carpet_01_15",
        "location_shop_greenes_01_32"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Fabric", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Cutter", false);
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Small", false);
        props:CreateKeySet();
    end


    sprites = {
        "industry_01_37",
        "industry_01_38",
        "industry_01_39",
        "industry_01_12",
        "industry_01_13",
        "industry_01_7",
        "industry_01_6",
        "industry_railroad_05_22",
        "industry_railroad_05_23",
        "industry_railroad_05_38",
        "industry_railroad_05_39",
        "fixtures_escalators_01_3",
        "fixtures_escalators_01_12",
        "fixtures_escalators_01_4",
        "fixtures_escalators_01_11",
        "fixtures_escalators_01_5",
        "fixtures_escalators_01_13",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalPlates", false);
        BM_Utils.setSpriteProperty(props, "Material2", "MetalScrap", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Crowbar", false);
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Small", false);
        props:CreateKeySet();
    end


    sprites = {
        "floors_interior_tilesandwood_01_0",
        "floors_interior_tilesandwood_01_1",
        "floors_interior_tilesandwood_01_2",
        "floors_interior_tilesandwood_01_3",
        "floors_interior_tilesandwood_01_4",
        "floors_interior_tilesandwood_01_5",
        "floors_interior_tilesandwood_01_6",
        "floors_interior_tilesandwood_01_7",
        "floors_interior_tilesandwood_01_8",
        "floors_interior_tilesandwood_01_9",
        "floors_interior_tilesandwood_01_10",
        "floors_interior_tilesandwood_01_11",
        "floors_interior_tilesandwood_01_12",
        "floors_interior_tilesandwood_01_13",
        "floors_interior_tilesandwood_01_14",
        "floors_interior_tilesandwood_01_16",
        "floors_interior_tilesandwood_01_17",
        "floors_interior_tilesandwood_01_18",
        "floors_interior_tilesandwood_01_19",
        "floors_interior_tilesandwood_01_20",
        "floors_interior_tilesandwood_01_21",
        "floors_interior_tilesandwood_01_22",
        "floors_interior_tilesandwood_01_23",
        "floors_interior_tilesandwood_01_24",
        "floors_interior_tilesandwood_01_28",
        "floors_interior_tilesandwood_01_29",
        "floors_interior_tilesandwood_01_30",
        "floors_interior_tilesandwood_01_31",
        "location_restaurant_spiffos_01_39"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "Material2", "Nails", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Small", false);
        props:CreateKeySet();
    end

    sprites = {
        "walls_decoration_01_65",
        "walls_decoration_01_64",
        "walls_decoration_01_66",
        "walls_decoration_01_67",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "CustomName", "Banner", false);
        props:CreateKeySet();
    end

    sprites = {
        "location_community_medical_01_152",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Mid", false);
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
        BM_Utils.setSpriteProperty(props, "Facing", "E", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "ItemHeight", "100", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalPlates", false);
        BM_Utils.setSpriteProperty(props, "Material2", "MetalBars", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "300", false);
        BM_Utils.setSpriteProperty(props, "Soffset", "2", false);
        BM_Utils.setSpriteProperty(props, "SpriteGridPos", "0,1", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "counter", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.solidtrans, nil, true);
        props:CreateKeySet();
    end
    sprites = {
        "location_community_medical_01_153",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Mid", false);
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
        BM_Utils.setSpriteProperty(props, "Facing", "E", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "ItemHeight", "100", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalPlates", false);
        BM_Utils.setSpriteProperty(props, "Material2", "MetalBars", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "300", false);
        BM_Utils.setSpriteProperty(props, "Soffset", "1", false);
        BM_Utils.setSpriteProperty(props, "SpriteGridPos", "0,0", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "counter", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.solidtrans, nil, true);
        props:CreateKeySet();
    end

    
    sprites = {
        "location_community_medical_01_155",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Mid", false);
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
        BM_Utils.setSpriteProperty(props, "Facing", "E", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "ItemHeight", "100", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalPlates", false);
        BM_Utils.setSpriteProperty(props, "Material2", "MetalBars", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "300", false);
        BM_Utils.setSpriteProperty(props, "Eoffset", "-2", false);
        BM_Utils.setSpriteProperty(props, "SpriteGridPos", "1,0", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "counter", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.solidtrans, nil, true);
        props:CreateKeySet();
    end
    sprites = {
        "location_community_medical_01_154",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Mid", false);
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false);
        BM_Utils.setSpriteProperty(props, "Facing", "E", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "ItemHeight", "100", false);
        BM_Utils.setSpriteProperty(props, "Material", "MetalPlates", false);
        BM_Utils.setSpriteProperty(props, "Material2", "MetalBars", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "300", false);
        BM_Utils.setSpriteProperty(props, "Eoffset", "-1", false);
        BM_Utils.setSpriteProperty(props, "SpriteGridPos", "0,0", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "counter", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.solidtrans, nil, true);
        props:CreateKeySet();
    end

    sprites = {
        "location_sewer_01_16",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "Material", "Nails", false);
        BM_Utils.setSpriteProperty(props, "WindowW", "", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.collideW);
        BM_Utils.setSpriteProperty(props, IsoFlagType.transparentW);
        BM_Utils.setSpriteProperty(props, IsoFlagType.cutW);
        BM_Utils.setSpriteProperty(props, IsoFlagType.canPathW);
        BM_Utils.setSpriteProperty(props, IsoFlagType.WindowW);
        props:CreateKeySet();
    end

    sprites = {
        "location_sewer_01_17",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false);
        BM_Utils.setSpriteProperty(props, "Material", "Nails", false);
        BM_Utils.setSpriteProperty(props, "WindowN", "", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.collideN);
        BM_Utils.setSpriteProperty(props, IsoFlagType.transparentN);
        BM_Utils.setSpriteProperty(props, IsoFlagType.cutN);
        BM_Utils.setSpriteProperty(props, IsoFlagType.canPathN);
        BM_Utils.setSpriteProperty(props, IsoFlagType.WindowN);
        props:CreateKeySet();
    end

    sprites = {
        "floors_rugs_01_60",
        "floors_rugs_01_61",
        "floors_rugs_01_62",
        "floors_rugs_01_87",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.unsetSpriteProperty(props, "IsMoveAble");
        BM_Utils.unsetSpriteProperty(props, "MoveType");
        props:CreateKeySet();
    end

    sprites = {
        "fixtures_bathroom_01_52",
        "fixtures_bathroom_01_53",
        "fixtures_bathroom_01_54",
        "fixtures_bathroom_01_55",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "waterAmount", "100", false);
        BM_Utils.setSpriteProperty(props, "waterMaxAmount", "100", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.solidtrans);
        BM_Utils.setSpriteProperty(props, IsoFlagType.waterPiped);
        props:CreateKeySet();
    end
end)
