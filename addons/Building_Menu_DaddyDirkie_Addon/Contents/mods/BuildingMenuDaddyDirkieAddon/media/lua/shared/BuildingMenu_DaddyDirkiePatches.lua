require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
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
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "container", "", false);
        BM_Utils.setSpriteProperty(props, "container", "crate", true);
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false)
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false)
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false)
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false)
        props:CreateKeySet();
    end

    -- -- Not working, idk why.
    -- sprites = {
    --     "building_menu_03_ddd_Forest_Survival_1",
    -- }
    -- for _, sprite in ipairs(sprites) do
    --     local props = manager:getSprite(sprite):getProperties()
    --     BM_Utils.unsetSpriteProperty(props, IsoFlagType.windowN);
    --     props:CreateKeySet();
    -- end


    sprites = {
        "edit_ddd_RUS_Forest Survival_01_16",
        "edit_ddd_RUS_Forest Survival_01_17",
        "edit_ddd_RUS_Forest Survival_01_18",
        "edit_ddd_RUS_Forest Survival_01_19",
        "edit_ddd_RUS_Forest Survival_01_20",
        "edit_ddd_RUS_Forest Survival_01_21",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "RoofGroup", "1", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.ForceAmbient);
        props:CreateKeySet();
    end


    for i = 1, 5 do
        for j = 24, 55 do
            local sprite = string.format("d_furniture_bedroom_0%d_%d", i, j)
            local props = manager:getSprite(sprite):getProperties()
            BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
            BM_Utils.setSpriteProperty(props, IsoFlagType.container)
            BM_Utils.setSpriteProperty(props, "container", "wardrobe", false)
            BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false)
            props:CreateKeySet()
        end
        
        for j = 62, 63 do
            local sprite = string.format("d_furniture_bedroom_0%d_%d", i, j)
            local props = manager:getSprite(sprite):getProperties()
            BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
            BM_Utils.setSpriteProperty(props, IsoFlagType.container)
            BM_Utils.setSpriteProperty(props, "container", "wardrobe", false)
            BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false)
            props:CreateKeySet()
        end

    end

    sprites = {
        "edit_ddd_RUS_furniture_storage_03_40",
        "edit_ddd_RUS_furniture_storage_03_41",
        "edit_ddd_RUS_furniture_storage_03_42",
        "edit_ddd_RUS_furniture_storage_03_43",
        "edit_ddd_RUS_furniture_storage_03_89",
        "edit_ddd_RUS_furniture_storage_03_88",
        "edit_ddd_RUS_furniture_storage_03_91",
        "edit_ddd_RUS_furniture_storage_03_90"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "wardrobe", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false)
        props:CreateKeySet()
    end

    local dataCounters = {2, 3, 10, 11, 18, 19, 26, 27, 34, 35, 42, 43, 50, 51, 58, 59}
    sprites = {}
    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber + 2);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber + 4);
        table.insert(sprites, "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber - 2);
    end
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "High", false)
        BM_Utils.setSpriteProperty(props, "IsHigh", "", false)
        BM_Utils.setSpriteProperty(props, "MoveType", "WallObject", false)
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Small", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "counter", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false)
        props:CreateKeySet()
    end

    
    sprites = {
        "furniture_storage_ddd_01_4",
        "furniture_storage_ddd_01_9"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "IsLow", "", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "16", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "locker", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "30", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        props:CreateKeySet()
    end


    sprites = {
        "furniture_storage_ddd_01_7",
        "furniture_storage_ddd_01_8"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "GroupName", "Pallet", false)
        BM_Utils.setSpriteProperty(props, "CustomName", "with Small Crates", false)
        BM_Utils.setSpriteProperty(props, "IsLow", "", false)
        BM_Utils.setSpriteProperty(props, "IsTable", "", false)
        BM_Utils.setSpriteProperty(props, "IsStackable", "", false)
        BM_Utils.setSpriteProperty(props, "Surface", "32", false)
        BM_Utils.setSpriteProperty(props, IsoFlagType.container)
        BM_Utils.setSpriteProperty(props, "container", "locker", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "80", false)
        BM_Utils.setSpriteProperty(props, "ContainerPosition", "Low", false)
        props:CreateKeySet()
    end


    sprites = {
        "edit_ddd_RUS_furniture_storage_03_89",
        "edit_ddd_RUS_furniture_storage_03_88",
        "edit_ddd_RUS_furniture_storage_03_91",
        "edit_ddd_RUS_furniture_storage_03_90",
        "edit_ddd_RUS_furniture_storage_03_41",
        "edit_ddd_RUS_furniture_storage_03_40",
        "edit_ddd_RUS_furniture_storage_03_43",
        "edit_ddd_RUS_furniture_storage_03_42"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "BlocksPlacement", "", false)
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false)
        BM_Utils.setSpriteProperty(props, "CanScrap", "", false)
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "25", false)
        BM_Utils.setSpriteProperty(props, "Material", "Wood", false)
        BM_Utils.setSpriteProperty(props, "Material2", "Nails", false)
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false)
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false)
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false)
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false)
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false)
        BM_Utils.setSpriteProperty(props, "ScrapSize", "Large", false)
        BM_Utils.setSpriteProperty(props, "Surface", "15", false)
        BM_Utils.setSpriteProperty(props, "Container", "wardrobe", false)
        props:CreateKeySet()
    end

end)
