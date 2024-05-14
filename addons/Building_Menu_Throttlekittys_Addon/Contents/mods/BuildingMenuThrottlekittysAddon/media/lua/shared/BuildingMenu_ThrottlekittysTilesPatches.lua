local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "lighting_outdoor_tk_01_12",
        "lighting_outdoor_tk_01_13",
        "lighting_outdoor_tk_01_17",
        "lighting_outdoor_tk_01_14",
        "lighting_outdoor_tk_01_16",
        "lighting_outdoor_tk_01_15",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "PickUpWeight", "200", false);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Electrician", false);
        BM_Utils.setSpriteProperty(props, "PickUpLevel", "4", false);
        props:CreateKeySet();
    end
end)