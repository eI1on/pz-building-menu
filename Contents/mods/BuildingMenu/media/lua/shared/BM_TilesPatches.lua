require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "location_military_generic_01_23",
        "location_military_generic_01_22",
        "location_military_generic_01_30",
        "location_military_generic_01_31",
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "100", false);
    end

    sprites = {
        "fixtures_windows_01_72",
        "fixtures_windows_01_73"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Crowbar", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
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
    end
end)
