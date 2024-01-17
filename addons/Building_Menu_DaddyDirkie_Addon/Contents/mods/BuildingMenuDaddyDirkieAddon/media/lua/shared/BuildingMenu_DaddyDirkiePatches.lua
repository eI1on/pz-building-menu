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
        BM_Utils.setSpriteProperty(props, "container", "crate", false);
        BM_Utils.setSpriteProperty(props, "container", "", true);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "IsMovAble", "", true);
    end
end)
