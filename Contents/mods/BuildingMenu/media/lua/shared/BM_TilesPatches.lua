require('BM_Utils')


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
        BM_Utils.setSpriteProperty(props, "CustomName", "Large White Window", false);
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
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "4", false);
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
        "fixtures_bathroom_02_25"
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
        "location_farm_accesories_01_11"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "officedrawers", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
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
        "location_community_medical_01_155",
        "location_community_medical_01_154",
        "location_community_medical_01_152",
        "location_community_medical_01_153",
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
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, "IsLow", "", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "logs", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "200", false);
        props:CreateKeySet();
    end

    sprites = {
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

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false);
        BM_Utils.setSpriteProperty(props, "IsLow", "", false);
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        BM_Utils.setSpriteProperty(props, "container", "logs", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "200", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "75", false);
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
end)
