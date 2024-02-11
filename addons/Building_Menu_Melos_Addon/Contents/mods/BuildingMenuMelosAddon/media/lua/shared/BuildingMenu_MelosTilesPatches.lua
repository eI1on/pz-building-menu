require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    local sprites = {
        "melos_tiles_walls_garage_01_0",
        "melos_tiles_walls_garage_01_1",
        "melos_tiles_walls_garage_01_2",
        "melos_tiles_walls_garage_01_16",
        "melos_tiles_walls_garage_01_17",
        "melos_tiles_walls_garage_01_18",
        "melos_tiles_walls_garage_01_32",
        "melos_tiles_walls_garage_01_33",
        "melos_tiles_walls_garage_01_34",
        "melos_tiles_walls_garage_01_48",
        "melos_tiles_walls_garage_01_49",
        "melos_tiles_walls_garage_01_50",
        "melos_tiles_walls_garage_01_64",
        "melos_tiles_walls_garage_01_65",
        "melos_tiles_walls_garage_01_66",
        "melos_tiles_walls_garage_01_96",
        "melos_tiles_walls_garage_01_97",
        "melos_tiles_walls_garage_01_98",
        "melos_tiles_walls_garage_02_0",
        "melos_tiles_walls_garage_02_1",
        "melos_tiles_walls_garage_02_2",
        "melos_tiles_walls_garage_02_32",
        "melos_tiles_walls_garage_02_33",
        "melos_tiles_walls_garage_02_34",
        "melos_tiles_walls_garage_02_64",
        "melos_tiles_walls_garage_02_65",
        "melos_tiles_walls_garage_02_66",
        "melos_tiles_walls_garage_02_96",
        "melos_tiles_walls_garage_02_97",
        "melos_tiles_walls_garage_02_98"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "WallW", "", false);
        BM_Utils.setSpriteProperty(props, "WallW", "", true);
        props:CreateKeySet();
    end

    sprites = {
        "melos_tiles_walls_garage_01_3",
        "melos_tiles_walls_garage_01_4",
        "melos_tiles_walls_garage_01_5",
        "melos_tiles_walls_garage_01_19",
        "melos_tiles_walls_garage_01_20",
        "melos_tiles_walls_garage_01_21",
        "melos_tiles_walls_garage_01_35",
        "melos_tiles_walls_garage_01_36",
        "melos_tiles_walls_garage_01_37",
        "melos_tiles_walls_garage_01_51",
        "melos_tiles_walls_garage_01_52",
        "melos_tiles_walls_garage_01_53",
        "melos_tiles_walls_garage_01_67",
        "melos_tiles_walls_garage_01_68",
        "melos_tiles_walls_garage_01_69",
        "melos_tiles_walls_garage_01_99",
        "melos_tiles_walls_garage_01_100",
        "melos_tiles_walls_garage_01_101",
        "melos_tiles_walls_garage_02_3",
        "melos_tiles_walls_garage_02_4",
        "melos_tiles_walls_garage_02_5",
        "melos_tiles_walls_garage_02_35",
        "melos_tiles_walls_garage_02_36",
        "melos_tiles_walls_garage_02_37",
        "melos_tiles_walls_garage_02_67",
        "melos_tiles_walls_garage_02_68",
        "melos_tiles_walls_garage_02_69",
        "melos_tiles_walls_garage_02_99",
        "melos_tiles_walls_garage_02_100",
        "melos_tiles_walls_garage_02_101"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "WallN", "", false);
        BM_Utils.setSpriteProperty(props, "WallN", "", true);
        props:CreateKeySet();
    end


    sprites = {
        "melos_tiles_gardencenter_02_104",
        "melos_tiles_gardencenter_02_105",
        "melos_tiles_gardencenter_02_106",
        "melos_tiles_gardencenter_02_107",
        "melos_tiles_gardencenter_02_108",
        "melos_tiles_gardencenter_02_109",
        "melos_tiles_gardencenter_02_110",
        "melos_tiles_gardencenter_02_111",
        "melos_tiles_gardencenter_02_112",
        "melos_tiles_gardencenter_02_113",
        "melos_tiles_gardencenter_02_114",
        "melos_tiles_gardencenter_02_115",
        "melos_tiles_gardencenter_02_116",
        "melos_tiles_gardencenter_02_117",
        "melos_tiles_gardencenter_02_118",
        "melos_tiles_gardencenter_02_119"
    }
    for _, sprite in ipairs(sprites) do
        local props = manager:getSprite(sprite):getProperties();
        BM_Utils.setSpriteProperty(props, "ContainerCapacity", "100", false);
        BM_Utils.setSpriteProperty(props, "container", "logs", false);
        BM_Utils.setSpriteProperty(props, "container", "", true);
        BM_Utils.setSpriteProperty(props, "PickUpTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "PlaceTool", "Hammer", false);
        BM_Utils.setSpriteProperty(props, "IsMovAble", "", false);
        props:CreateKeySet();
    end
end)
