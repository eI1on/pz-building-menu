local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
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
        "melos_tiles_walls_garage_02_98",
    }, {
        { "WallW", "", false }, {
        "WallW", "", true },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
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
        "melos_tiles_walls_garage_02_101",
    }, {
        { "WallN", "", false }, {
        "WallN", "", true },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
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
        "melos_tiles_gardencenter_02_119",
    }, {
        { "ContainerCapacity", "200", false }, {
        "container", "logs", false }, {
        "IsMoveAble", "", false }, {
        "CanBreak", "", false }, {
        IsoFlagType.container },
    });

    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "melos_tiles_furniture_seating_01_48",
        "melos_tiles_furniture_seating_01_49",
        "melos_tiles_furniture_seating_01_50",
        "melos_tiles_furniture_seating_01_51",
        "melos_tiles_furniture_seating_01_56",
        "melos_tiles_furniture_seating_01_57",
        "melos_tiles_furniture_seating_01_58",
        "melos_tiles_furniture_seating_01_59",
    }, {
        { "CanScrap", "", false }, {
        "MetalBars", "", false }, {
        "PickUpTool", "Hammer", false }, {
        "PlaceTool", "Hammer", false }, {
        "IsMoveAble", "", false },
    });

    local function setSpriteProperties(baseSpriteName, startNumbers, offsets)
        for _, startNumber in ipairs(startNumbers) do
            for i, offset in ipairs(offsets) do
                local spriteName = baseSpriteName .. tostring(startNumber + (i - 1));
                local sprite = manager:getSprite(spriteName);
                if sprite then
                    local props = sprite:getProperties();
                    BM_Utils.setSpriteProperty(props, offset[1], offset[2], false);
                    props:CreateKeySet();
                end
            end
        end
    end

    local offsets = {
        { "Noffset", "1" }, {
        "Woffset", "-1" }, {
        "Noffset", "1" }, {
        "Woffset", "-1" }
    };

    -- for Rustic Windows
    local startNumbers = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120 };
    setSpriteProperties("melos_tiles_windows_03_", startNumbers, offsets);

    startNumbers[#startNumbers] = nil; -- remove the last element for the next sets, as they only go to 112

    -- for Modern Extended 1 and Modern Extended 2
    for _, suffix in ipairs({ "", "a", "b", "c" }) do
        setSpriteProperties("melos_tiles_windows_06" .. suffix .. "_", startNumbers, offsets);
    end

    BM_Utils.setOrUnsetSpriteProperties(manager, {
            "melos_tiles_gardencenter_01_22",
            "melos_tiles_gardencenter_01_23"
        }, nil, {
            "TileOverlay"
        }
    );

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_castle_01_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_castle_01_0", false },
    --     { "CornerNorthWall",  "melos_tiles_castle_01_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_castle_01_34"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_castle_01_32", false },
    --     { "CornerNorthWall",  "melos_tiles_castle_01_33", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_castle_01_38"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_castle_01_36", false },
    --     { "CornerNorthWall",  "melos_tiles_castle_01_37", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01a_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01a_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01a_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01b_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01b_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01b_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01c_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01c_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01c_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01d_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01d_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01d_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01e_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01e_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01e_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01f_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01f_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01f_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01g_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01g_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01g_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_brick_01h_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_brick_01h_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_brick_01h_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01a_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01a_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01a_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01b_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01b_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01b_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01c_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01c_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01c_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01d_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01d_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01d_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01e_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01e_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01e_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01f_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01f_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01f_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01g_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01g_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01g_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01h_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01h_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01h_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01i_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01i_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01i_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_01j_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_01j_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_01j_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_08_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_08_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_08_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_01_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_01_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_01_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_02_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_02_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_02_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_09_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_09_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_09_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_04_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_04_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_04_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_03_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_03_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_03_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_05_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_05_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_05_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_10_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_10_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_10_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_07_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_07_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_07_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_11_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_11_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_11_1", false }
    -- });

    -- BM_Utils.setOrUnsetSpriteProperties(manager, {
    --     "melos_tiles_walls_bathroom_ddd_add_12_2"
    -- }, {
    --     { "CornerWestWall", "melos_tiles_walls_bathroom_ddd_add_12_0", false },
    --     { "CornerNorthWall",  "melos_tiles_walls_bathroom_ddd_add_12_1", false }
    -- });
end)
