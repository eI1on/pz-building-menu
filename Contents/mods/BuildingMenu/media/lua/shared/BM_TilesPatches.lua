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
        BM_Utils.setSpriteProperty(props, "container", "crate", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        props:CreateKeySet();
    end
end)
