require('BM_Utils')

Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "en_newburbs_windows_01_0",
        "en_newburbs_windows_01_8",
        "en_newburbs_windows_01_16",
        "en_newburbs_windows_01_17",
        "en_newburbs_windows_01_18",
        "en_newburbs_windows_01_19",
        "en_newburbs_windows_01_48",
        "en_newburbs_windows_01_49",
        "en_newburbs_windows_01_50",
        "en_newburbs_windows_01_51",
        "en_newburbs_windows_01_80",
        "en_newburbs_windows_01_81",
        "en_newburbs_windows_01_82",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CustomName", "Window", false);
        BM_Utils.setSpriteProperty(props, "GroupName", "Wooden", false);

        BM_Utils.setSpriteProperty(props, "Facing", "W", false);
        
        BM_Utils.setSpriteProperty(props, "IsClosedState", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "MoveType", "Window", false);
        
        BM_Utils.setSpriteProperty(props, "Noffset", "1", false);

        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Crowbar", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "100", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "WindowN", "WindowN", false);
        BM_Utils.setSpriteProperty(props, "disableFade", "", false);
        
        BM_Utils.setSpriteProperty(props, IsoFlagType.attachedW);

        props:CreateKeySet();
    end

    local sprites = {
        "en_newburbs_windows_01_4",
        "en_newburbs_windows_01_12",
        "en_newburbs_windows_01_20",
        "en_newburbs_windows_01_21",
        "en_newburbs_windows_01_22",
        "en_newburbs_windows_01_23",
        "en_newburbs_windows_01_52",
        "en_newburbs_windows_01_53",
        "en_newburbs_windows_01_54",
        "en_newburbs_windows_01_55",
        "en_newburbs_windows_01_84",
        "en_newburbs_windows_01_85",
        "en_newburbs_windows_01_86",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties()
        BM_Utils.setSpriteProperty(props, "CanBreak", "", false);
        BM_Utils.setSpriteProperty(props, "CustomName", "Window", false);
        BM_Utils.setSpriteProperty(props, "GroupName", "Wooden", false);

        BM_Utils.setSpriteProperty(props, "Facing", "N", false);

        BM_Utils.setSpriteProperty(props, "IsClosedState", "", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "MoveType", "Window", false);
        
        BM_Utils.setSpriteProperty(props, "Woffset", "-1", false);

        BM_Utils.setSpriteProperty(props, "PickUpLevel", "2", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Crowbar", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "100", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "WindowN", "WindowN", false);
        BM_Utils.setSpriteProperty(props, "disableFade", "", false);
        
        BM_Utils.setSpriteProperty(props, IsoFlagType.attachedN);

        props:CreateKeySet();
    end
end)
