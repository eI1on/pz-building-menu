require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "pert_re-phoenix_2_120",
        "pert_re-phoenix_2_121",
        "pert_re-phoenix_2_122",
        "pert_re-phoenix_2_123",
        "pert_re-phoenix_2_124",
        "pert_re-phoenix_2_125",
        "pert_re-phoenix_2_126",
        "pert_re-phoenix_2_127"
    }

    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsoType", "IsoTelevision", false);
        BM_Utils.setSpriteProperty(props, "CustomItem", "Radio.TvMonster", false);
        props:CreateKeySet();
    end

    sprites = {
        "pert_Christmas_01_0",
        "pert_Christmas_01_2",
        "pert_Christmas_01_4",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.unsetSpriteProperty(props, IsoFlagType.windowW);
        props:CreateKeySet();
    end

    sprites = {
        "pert_Christmas_01_1",
        "pert_Christmas_01_5",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.unsetSpriteProperty(props, IsoFlagType.windowN);
        props:CreateKeySet();
    end

    sprites = {
        "pert_Christmas_01_8",
        "pert_Christmas_01_12",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsoType", "IsoThumpable", false);
        BM_Utils.unsetSpriteProperty(props, IsoFlagType.windowW);
        props:CreateKeySet();
    end

    sprites = {
        "pert_Christmas_01_9",
        "pert_Christmas_01_13",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsoType", "IsoThumpable", false);
        BM_Utils.unsetSpriteProperty(props, IsoFlagType.windowN);
        props:CreateKeySet();
    end
    
    sprites = {
        "pert_Christmas_01_86",
        "pert_Christmas_01_87",
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsoType", "IsoThumpable", false);
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "50", false);
        BM_Utils.setSpriteProperty(props, IsoFlagType.container);
        props:CreateKeySet();
    end
        
    sprites = {
        "pert_Christmas_01_72",
        "pert_Christmas_01_73",
        "pert_Christmas_01_74",
        "pert_Christmas_01_75",
        "pert_Christmas_01_76",
        "pert_Christmas_01_77",
        "pert_Christmas_01_78",
        "pert_Christmas_01_79",
        "pert_Christmas_01_82",
        "pert_Christmas_01_83",
        "pert_Christmas_01_84",
        "pert_Christmas_01_85",

        "pert_Christmas_02_8", -- christams runners
        "pert_Christmas_02_9",
        "pert_Christmas_02_10",
        "pert_Christmas_02_11",
        "pert_Christmas_02_12",
        "pert_Christmas_02_13",
        "pert_Christmas_02_14",
        "pert_Christmas_02_15"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "IsMoveAble", "", false);
        props:CreateKeySet();
    end
end)