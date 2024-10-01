---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addCommercialWallsToMenu()
    local fastFoodPinkWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Pink_Wall",
            "Tooltip_Fast_Food_Pink_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PinkBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Fast_Food_Walls_01_0",
                northSprite = "LC_Fast_Food_Walls_01_1",
                corner = "LC_Fast_Food_Walls_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Pink_Frame",
            "Tooltip_Fast_Food_Pink_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PinkBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Fast_Food_Walls_01_6",
                northSprite = "LC_Fast_Food_Walls_01_7",
                corner = "LC_Fast_Food_Walls_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Pink_Frame",
            "Tooltip_Fast_Food_Pink_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.PinkWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_Fast_Food_Walls_01_4",
                northSprite = "LC_Fast_Food_Walls_01_5",
                corner = "LC_Fast_Food_Walls_01_3"
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Walls"),
        "LC_Fast_Food_Walls_01_0",
        getText("IGUI_BuildingMenuSubCat_Walls_Fast_Food_Pink"),
        "LC_Fast_Food_Walls_01_0",
        fastFoodPinkWalls
    )

    local fastFoodLightYellowWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Light_Yellow_Wall",
            "Tooltip_Fast_Food_Light_Yellow_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Fast_Food_Walls_01_16",
                northSprite = "LC_Fast_Food_Walls_01_17",
                corner = "LC_Fast_Food_Walls_01_19"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Light_Yellow_Frame",
            "Tooltip_Fast_Food_Light_Yellow_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Fast_Food_Walls_01_22",
                northSprite = "LC_Fast_Food_Walls_01_23",
                corner = "LC_Fast_Food_Walls_01_19"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fast_Food_Light_Yellow_Frame",
            "Tooltip_Fast_Food_Light_Yellow_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_Fast_Food_Walls_01_20",
                northSprite = "LC_Fast_Food_Walls_01_21",
                corner = "LC_Fast_Food_Walls_01_19"
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Fast_Food_Light_Yellow"),
        "LC_Fast_Food_Walls_01_16",
        fastFoodLightYellowWalls
    )


    local greasyJoeWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Black_Yellow_Wall",
            "Tooltip_Greasy_Joe_Black_Yellow_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackYellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Greasy_Joe_16",
                northSprite = "LC_Greasy_Joe_17",
                corner = "LC_Greasy_Joe_19"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Black_Yellow_Frame",
            "Tooltip_Greasy_Joe_Black_Yellow_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackYellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Greasy_Joe_20",
                northSprite = "LC_Greasy_Joe_21",
                corner = "LC_Greasy_Joe_19"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Black_Yellow_Frame",
            "Tooltip_Greasy_Joe_Black_Yellow_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BlackYellowWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_Greasy_Joe_24",
                northSprite = "LC_Greasy_Joe_26",
                corner = "LC_Greasy_Joe_19"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Black_Yellow_Frame",
            "Tooltip_Greasy_Joe_Black_Yellow_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BlackYellowWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_Greasy_Joe_25",
                northSprite = "LC_Greasy_Joe_27",
                corner = "LC_Greasy_Joe_19"
            }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Light_Green_Wall",
            "Tooltip_Greasy_Joe_Light_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenWhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Greasy_Joe_48",
                northSprite = "LC_Greasy_Joe_49",
                corner = "LC_Greasy_Joe_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Light_Green_Frame",
            "Tooltip_Greasy_Joe_Light_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenWhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Greasy_Joe_54",
                northSprite = "LC_Greasy_Joe_55",
                corner = "LC_Greasy_Joe_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Greasy_Joe_Light_Green_Frame",
            "Tooltip_Greasy_Joe_Light_Green_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenWhiteWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_Greasy_Joe_52",
                northSprite = "LC_Greasy_Joe_53",
                corner = "LC_Greasy_Joe_51"
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Greasy_Joe"),
        "LC_Greasy_Joe_16",
        greasyJoeWalls
    )



    local function createAndAddWindowWallObjects(subCategory, spriteNumbers, recipe)
        local storefrontWalls = {};
        local baseStorefront = "LC_Storefront_";

        for _, indexes in ipairs(spriteNumbers) do
            table.insert(
                storefrontWalls,
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Storefront_" .. subCategory .. "_Window_Wall",
                    "Tooltip_Storefront_" .. subCategory .. "_Window_Wall",
                    BuildingMenu.onBuildWindowWall,
                    recipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    {
                        sprite = baseStorefront .. indexes[1],
                        northSprite = baseStorefront .. indexes[2],
                    }
                )
            )
        end
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Walls"),
            nil,
            getText("IGUI_BuildingMenuSubCat_Walls_Storefront_" .. subCategory),
            baseStorefront .. spriteNumbers[1][1],
            storefrontWalls
        )
    end

    local function generateSpriteNumbers(start)
        local spriteNumbers = {};
        local offset = -7;
        for set = 0, 1 do
            for i = 0, 2 do
                local base = start + (set * 18);
                table.insert(spriteNumbers, { base + i, base - i + offset });
            end
        end
        return spriteNumbers;
    end

    local storefronts = {
        riflegreen = generateSpriteNumbers(9),
        gravel = generateSpriteNumbers(49),
        judgegrey = generateSpriteNumbers(89),
        riverbed = generateSpriteNumbers(129),
        mulledwine = generateSpriteNumbers(169),
    };

    createAndAddWindowWallObjects("Rifle_Green", storefronts.riflegreen, BuildingMenu.GreenBigWoodWindowWallRecipe);
    createAndAddWindowWallObjects("Gravel", storefronts.gravel, BuildingMenu.GreyWindowBigWoodWallRecipe);
    createAndAddWindowWallObjects("Judge_Grey", storefronts.judgegrey, BuildingMenu.BrownGreyWindowBigWoodWallRecipe);
    createAndAddWindowWallObjects("River_Bed", storefronts.riverbed, BuildingMenu.BlueWindowBigWoodWallRecipe);
    createAndAddWindowWallObjects("Mulled_Wine", storefronts.mulledwine, BuildingMenu.PurpleWindowBigWoodWallRecipe);


    local storefrontWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Wall",
            "Tooltip_Storefront_Rifle_Green_Window_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_CH_31",
                northSprite = "LC_CH_34",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Wall",
            "Tooltip_Storefront_Rifle_Green_Window_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "LC_CH_37",
                northSprite = "LC_CH_40",
            }
        )
    };
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Storefront_Rifle_Green"),
        nil,
        storefrontWalls
    );

    storefrontWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Pillar",
            "Tooltip_Storefront_Storefront_Rifle_Green_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "LC_Walls_171",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Pillar",
            "Tooltip_Storefront_Storefront_Rifle_Green_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "LC_Walls_167",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_164",
                northSprite = "LC_Walls_165",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_186",
                northSprite = "LC_Walls_187",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_188",
                northSprite = "LC_Walls_189",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_190",
                northSprite = "LC_Walls_191",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_192",
                northSprite = "LC_Walls_193",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_206",
                northSprite = "LC_Walls_207",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_208",
                northSprite = "LC_Walls_209",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_210",
                northSprite = "LC_Walls_211",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_212",
                northSprite = "LC_Walls_213",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_214",
                northSprite = "LC_Walls_215",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_216",
                northSprite = "LC_Walls_217",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_218",
                northSprite = "LC_Walls_219",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_220",
                northSprite = "LC_Walls_221",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_222",
                northSprite = "LC_Walls_223",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_224",
                northSprite = "LC_Walls_225",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_226",
                northSprite = "LC_Walls_227",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_230",
                northSprite = "LC_Walls_231",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_232",
                northSprite = "LC_Walls_233",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_234",
                northSprite = "LC_Walls_235",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_236",
                northSprite = "LC_Walls_237",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_254",
                northSprite = "LC_Walls_253",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Wall",
            "Tooltip_Storefront_Rifle_Green_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canScrap = false,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "LC_Walls_255",
                northSprite = "LC_Walls_252",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Door_Frame",
            "Tooltip_Storefront_Rifle_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Walls_238",
                northSprite = "LC_Walls_239",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Door_Frame",
            "Tooltip_Storefront_Rifle_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Walls_242",
                northSprite = "LC_Walls_241",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Door_Frame",
            "Tooltip_Storefront_Rifle_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Walls_243",
                northSprite = "LC_Walls_240",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Door_Frame",
            "Tooltip_Storefront_Rifle_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Walls_246",
                northSprite = "LC_Walls_245",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Door_Frame",
            "Tooltip_Storefront_Rifle_Green_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "LC_Walls_247",
                northSprite = "LC_Walls_244",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_168",
                northSprite = "LC_Walls_169",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_172",
                northSprite = "LC_Walls_173",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_174",
                northSprite = "LC_Walls_175",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_176",
                northSprite = "LC_Walls_177",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_178",
                northSprite = "LC_Walls_179",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_180",
                northSprite = "LC_Walls_181",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_182",
                northSprite = "LC_Walls_183",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_184",
                northSprite = "LC_Walls_185",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_194",
                northSprite = "LC_Walls_195",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_196",
                northSprite = "LC_Walls_197",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_198",
                northSprite = "LC_Walls_199",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_200",
                northSprite = "LC_Walls_201",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_202",
                northSprite = "LC_Walls_203",
                corner = "LC_Walls_171"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_204",
                northSprite = "LC_Walls_205",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_228",
                northSprite = "LC_Walls_229",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_250",
                northSprite = "LC_Walls_249",
                corner = "LC_Walls_167"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Storefront_Rifle_Green_Window_Frame",
            "Tooltip_Storefront_Rifle_Green_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "LC_Walls_251",
                northSprite = "LC_Walls_248",
            }
        ),
    };
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Storefront_Rifle_Green"),
        nil,
        storefrontWalls
    );

    local function createAndAddWallSetObjects(subCategoryName, baseSprite, spriteSets, recipe1, recipe2)
        if spriteSets.pillar then
            local pillars = {};
            for _, index in ipairs(spriteSets.pillar) do
                table.insert(
                    pillars,
                    BuildingMenu.createObject(
                        "Tooltip_BuildingMenuObj_Storefront_" .. subCategoryName .. "_Pillar",
                        "Tooltip_Storefront_" .. subCategoryName .. "_Pillar",
                        BuildingMenu.onBuildWall,
                        recipe2,
                        true,
                        {
                            completionSound = "BuildWoodenStructureLarge",
                            canPassThrough = true,
                            canBarricade = false,
                            isCorner = true,
                            modData = { wallType = "pillar" }
                        },
                        {
                            sprite = baseSprite .. index,
                        }
                    )
                );
            end
            BuildingMenu.addObjectsToCategories(
                "TryHonesty's Tiles",
                getText("IGUI_BuildingMenuCat_Walls"),
                nil,
                getText("IGUI_BuildingMenuSubCat_Walls_Storefront_" .. subCategoryName),
                nil,
                pillars
            );
        end

        if spriteSets.walls then
            local walls = {};
            for _, indexes in ipairs(spriteSets.walls) do
                table.insert(
                    walls,
                    BuildingMenu.createObject(
                        "Tooltip_BuildingMenuObj_Storefront_" .. subCategoryName .. "_Wall",
                        "Tooltip_Storefront_" .. subCategoryName .. "_Wall",
                        BuildingMenu.onBuildWall,
                        recipe1,
                        true,
                        {
                            completionSound = "BuildWoodenStructureLarge",
                            isThumpable = true,
                            canScrap = false,
                            canBarricade = false,
                            modData = { wallType = "wall" }
                        },
                        {
                            sprite = baseSprite .. indexes[1],
                            northSprite = baseSprite .. indexes[2],
                            corner = indexes[3] and (baseSprite .. indexes[3]) or nil,
                        }
                    )
                );
            end
            BuildingMenu.addObjectsToCategories(
                "TryHonesty's Tiles",
                getText("IGUI_BuildingMenuCat_Walls"),
                nil,
                getText("IGUI_BuildingMenuSubCat_Walls_Storefront_" .. subCategoryName),
                nil,
                walls
            );
        end

        if spriteSets.door_frames then
            local door_frames = {};
            for _, indexes in ipairs(spriteSets.door_frames) do
                table.insert(
                    door_frames,
                    BuildingMenu.createObject(
                        "Tooltip_BuildingMenuObj_Storefront_" .. subCategoryName .. "_Door_Frame",
                        "Tooltip_Storefront_" .. subCategoryName .. "_Door_Frame",
                        BuildingMenu.onBuildDoorFrame,
                        recipe1,
                        true,
                        {
                            completionSound = "BuildWoodenStructureLarge",
                            modData = { wallType = "doorframe" }
                        },
                        {
                            sprite = baseSprite .. indexes[1],
                            northSprite = baseSprite .. indexes[2],
                            corner = baseSprite .. indexes[3],
                        }
                    )
                );
            end
            BuildingMenu.addObjectsToCategories(
                "TryHonesty's Tiles",
                getText("IGUI_BuildingMenuCat_Walls"),
                nil,
                getText("IGUI_BuildingMenuSubCat_Walls_Storefront_" .. subCategoryName),
                nil,
                door_frames
            );
        end

        if spriteSets.window_frames then
            local window_frames = {};
            for _, indexes in ipairs(spriteSets.window_frames) do
                table.insert(
                    window_frames,
                    BuildingMenu.createObject(
                        "Tooltip_BuildingMenuObj_Storefront_" .. subCategoryName .. "_Window_Frame",
                        "Tooltip_Storefront_" .. subCategoryName .. "_Window_Frame",
                        BuildingMenu.onBuildWall,
                        recipe1,
                        true,
                        {
                            completionSound = "BuildWoodenStructureLarge",
                            isThumpable = true,
                            canBarricade = true,
                            hoppable = true,
                            modData = { wallType = "windowsframe" }
                        },
                        {
                            sprite = baseSprite .. indexes[1],
                            northSprite = baseSprite .. indexes[2],
                            corner = baseSprite .. indexes[3],
                        }
                    )
                );
            end
            BuildingMenu.addObjectsToCategories(
                "TryHonesty's Tiles",
                getText("IGUI_BuildingMenuCat_Walls"),
                nil,
                getText("IGUI_BuildingMenuSubCat_Walls_Storefront_" .. subCategoryName),
                nil,
                window_frames
            );
        end
    end

    local baseSprite1 = "LC_Walls_01_";
    local baseSprite2 = "LC_Walls_02_";

    local set1 = {
        pillar = {
            11, 7
        },
        walls = {
            { 4,  5,  11 }, { 26, 27, 7 }, { 28, 29, 7 }, { 30, 31, 7 }, { 32, 33, 7 }, { 46, 47, 7 },
            { 48, 49, 7 }, { 50, 51, 7 }, { 52, 53, 7 }, { 54, 55, 7 }, { 56, 57, 7 }, { 58, 59, 11 },
            { 60, 61, 7 }, { 62, 63, 7 }, { 64, 65, 7 }, { 66, 67, 11 }, { 70, 71, 7 }, { 72, 73, 7 },
            { 74, 75, 7 }, { 76, 77, 7 }, { 94, 93, 7 }, { 95, 92, 7 }
        },
        door_frames = {
            { 78, 79, 11 }, { 82, 81, 11 }, { 83, 80, 11 }, { 86, 85, 11 }, { 87, 84, 11 }
        },
        window_frames = {
            { 8,  9,  11 }, { 12, 13, 7 }, { 14, 15, 11 }, { 16, 17, 7 }, { 18, 19, 11 },
            { 20, 21, 7 }, { 22, 23, 11 }, { 24, 25, 7 }, { 34, 35, 7 }, { 36, 37, 11 },
            { 38, 39, 7 }, { 40, 41, 7 }, { 42, 43, 11 }, { 44, 45, 7 }, { 68, 69, 7 },
            { 90, 89, 7 }, { 91, 88, 7 }
        }
    };

    createAndAddWallSetObjects("Gravel", baseSprite1, set1, BuildingMenu.GreyBigWoodWallRecipe,
        BuildingMenu.GreySmallWoodWallRecipe);
    createAndAddWallSetObjects("River_Bed", baseSprite2, set1, BuildingMenu.BlueBigWoodWallRecipe,
        BuildingMenu.BlueSmallWoodWallRecipe);

    local set2 = {
        pillar = {
            131, 127
        },
        walls = {
            { 124, 125, 131 }, { 146, 147, 127 }, { 148, 149, 127 }, { 150, 151, 127 }, { 152, 153, 127 }, { 166, 167, 127 },
            { 168, 169, 127 }, { 170, 171, 127 }, { 172, 173, 127 }, { 174, 175, 127 }, { 176, 177, 127 }, { 178, 179, 131 },
            { 180, 181, 127 }, { 182, 183, 127 }, { 184, 185, 127 }, { 186, 187, 131 }, { 190, 191, 127 }, { 192, 193, 127 },
            { 194, 195, 127 }, { 196, 197, 127 }, { 214, 213, 127 }, { 215, 212, 127 }
        },
        door_frames = {
            { 198, 199, 131 }, { 202, 201, 131 }, { 203, 200, 131 }, { 206, 205, 131 }, { 207, 204, 131 }
        },
        window_frames = {
            { 128, 129, 131 }, { 132, 133, 127 }, { 134, 135, 131 }, { 136, 137, 127 }, { 138, 139, 131 },
            { 140, 141, 127 }, { 142, 143, 131 }, { 144, 145, 127 }, { 154, 155, 127 }, { 156, 157, 131 },
            { 158, 159, 127 }, { 160, 161, 127 }, { 162, 163, 131 }, { 164, 165, 127 }, { 188, 189, 127 },
            { 210, 209, 127 }, { 211, 208, 127 }
        }
    };


    createAndAddWallSetObjects("Judge_Grey", baseSprite1, set2, BuildingMenu.BrownGreyBigWoodWallRecipe,
        BuildingMenu.BrownGreySmallWoodWallRecipe);
    createAndAddWallSetObjects("Mulled_Wine", baseSprite2, set2, BuildingMenu.PurpleBigWoodWallRecipe,
        BuildingMenu.PurpleSmallWoodWallRecipe);


    createAndAddWallSetObjects("Gravel", "LC_Walls_Filler_01_", {
            walls = {
                { 2,  3 }, { 10, 11 }, { 18, 19 }, { 26, 27 }, { 34, 35 },
                { 42, 43 }, { 50, 51 }
            }
        }, BuildingMenu.GreyBigWoodWallRecipe,
        BuildingMenu.GreySmallWoodWallRecipe);
    createAndAddWallSetObjects("River_Bed", "LC_Walls_Filler_01_", {
            walls = {
                { 6,  7 }, { 14, 15 }, { 22, 23 }, { 30, 31 }, { 38, 39 },
                { 46, 47 }, { 54, 55 }
            }
        }, BuildingMenu.BlueBigWoodWallRecipe,
        BuildingMenu.BlueSmallWoodWallRecipe);
    createAndAddWallSetObjects("Judge_Grey", "LC_Walls_Filler_01_", {
            walls = {
                { 4,  5 }, { 12, 13 }, { 20, 21 }, { 28, 29 }, { 36, 37 },
                { 44, 45 }, { 52, 53 }
            }
        }, BuildingMenu.BrownGreyBigWoodWallRecipe,
        BuildingMenu.BrownGreySmallWoodWallRecipe);
    createAndAddWallSetObjects("Mulled_Wine", "LC_Walls_Filler_01_", {
            walls = {
                { 72,  73 }, { 80, 81 }, { 88, 89 }, { 96, 97 }, { 104, 105 },
                { 112, 113 }, { 120, 121 }
            }
        }, BuildingMenu.PurpleBigWoodWallRecipe,
        BuildingMenu.PurpleSmallWoodWallRecipe);
end

local function addFloorsToMenu()
    local baseFloorName = "LC_Fancyfloor_"
    local dataFloors = {
        checkeredSmall = { 7, 10, 16, 19, 21, },
        checkeredLarge = { 11, 25, 26, 27, 28, 29, 30, 31 },
        diagonal = { 3, 4, 5, 6 },
        special = { 0, 17, 24, 18, },
        others = { 1, 2, 8, 9, 12, 13, 14, 15, 20, 22, 23, 32, 33, 34 }
    }
    local function createAndAddFloorObjects(subCategory, spriteNumbers)
        local floors = {}
        for _, startNumber in ipairs(spriteNumbers) do
            table.insert(
                floors,
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Floor",
                    "Tooltip_Floor_Generic",
                    BuildingMenu.onBuildFloor,
                    BuildingMenu.TwoSpriteFloorRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall"
                    },
                    {
                        sprite = baseFloorName .. startNumber
                    }
                )
            )
        end
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Floors"),
            "LC_Fancyfloor_18",
            getText(subCategory),
            baseFloorName .. spriteNumbers[1],
            floors
        )
    end

    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Checkered_Small", dataFloors.checkeredSmall)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Checkered_Large", dataFloors.checkeredLarge)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Diagonal", dataFloors.diagonal)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_TryHonestys_Special", dataFloors.special)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_TryHonestys_Others", dataFloors.others)
end

local function addGarageDoorsToMenu()
    local garageDoors = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Double_Door_Gates"),
            subCategoryIcon = "LC_fencing_56",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Double_Big_Black_Pole_Gate",
                    "Tooltip_Double_Door_Gates",
                    BuildingMenu.onDoubleDoor,
                    BuildingMenu.BlackPoleDoubleDoorGatesRecipe,
                    true,
                    {
                        canBarricade = false,
                        ignoreNorth = true,
                        completionSound = "BuildMetalStructureLargeWiredFence",
                        spriteIndex = 56
                    },
                    {
                        sprite = "LC_fencing_56",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Double_Big_Wooden_Gate",
                    "Tooltip_Double_Door_Gates",
                    BuildingMenu.onDoubleDoor,
                    BuildingMenu.WoodenDoubleDoorGateRecipe,
                    true,
                    {
                        canBarricade = false,
                        ignoreNorth = true,
                        maxTime = 600,
                        completionSound = "BuildWoodenStructureLarge",
                        spriteIndex = 112
                    },
                    {
                        sprite = "LC_fencing_112",
                    }
                ),
            }
        }
    }

    for k, subCatData in pairs(garageDoors) do
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Doors"),
            "LC_fencing_56",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end


    local function create3TileGarageDoor(baseName, startSpriteNumber)
        local spriteData = {
            sprite = baseName .. startSpriteNumber,
            sprite2 = baseName .. (startSpriteNumber + 1),
            sprite3 = baseName .. (startSpriteNumber + 2),
            northSprite = baseName .. (startSpriteNumber + 3),
            northSprite2 = baseName .. (startSpriteNumber + 4),
            northSprite3 = baseName .. (startSpriteNumber + 5)
        }

        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_3_Tiles_Garage_Door",
            "Tooltip_Garage_Door",
            BuildingMenu.onBuild3TileGarageDoor,
            BuildingMenu.GarageDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium"
            },
            spriteData
        )
    end

    local function create4TileGarageDoor(baseName, startSpriteNumber)
        local spriteData = {
            sprite = baseName .. startSpriteNumber,
            sprite2 = baseName .. (startSpriteNumber + 1),
            sprite3 = baseName .. (startSpriteNumber + 1),
            sprite4 = baseName .. (startSpriteNumber + 2),
            northSprite = baseName .. (startSpriteNumber + 3),
            northSprite2 = baseName .. (startSpriteNumber + 4),
            northSprite3 = baseName .. (startSpriteNumber + 4),
            northSprite4 = baseName .. (startSpriteNumber + 5)
        }

        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_4_Tiles_Garage_Door",
            "Tooltip_Garage_Door",
            BuildingMenu.onBuild4TileGarageDoor,
            BuildingMenu.GarageDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium"
            },
            spriteData
        )
    end

    local garageDoorsObjects = {}
    local garageDoorSpriteData = {
        [1] = { [1] = "LC_garage_doors_", [2] = { 0, 16, 32, 48 } },
        [2] = { [1] = "LC_garage_doors_02_", [2] = { 0, 16, 32, 48, 64, 96, 112 } },
        [3] = { [1] = "LC_garage_doors_03_", [2] = { 0, 16, 32, 48, 64, 96, 112 } },
    }

    for _, spriteData in pairs(garageDoorSpriteData) do
        for i, _ in ipairs(spriteData[2]) do
            table.insert(garageDoorsObjects, create3TileGarageDoor(spriteData[1], spriteData[2][i]))
        end
    end


    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
        "LC_garage_doors_0",
        garageDoorsObjects
    )

    garageDoorsObjects = {}
    for _, spriteData in pairs(garageDoorSpriteData) do
        for i, _ in ipairs(spriteData[2]) do
            table.insert(garageDoorsObjects, create4TileGarageDoor(spriteData[1], spriteData[2][i]))
        end
    end

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
        "LC_garage_doors_0",
        garageDoorsObjects
    )
end

local function addHighFencesToMenu()
    local highFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brick_and_Concrete_High_Fence",
            "",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_41",
                sprite2 = "LC_fencing_43",
                northSprite = "LC_fencing_40",
                northSprite2 = "LC_fencing_39",
                corner = "LC_fencing_38"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brick_and_Concrete_High_Fence_Corner",
            "",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "LC_fencing_42" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brick_and_Concrete_High_Fence_Corner",
            "",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "LC_fencing_45" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brick_and_Concrete_High_Fence_Post",
            "",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "LC_fencing_38" }
        ),





        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_with_Arched_Drainage",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Arched_Drainage",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_64",
                sprite2 = "LC_fencing_65",
                northSprite = "LC_fencing_66",
                northSprite2 = "LC_fencing_67",
                corner = "LC_fencing_69"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Corner_with_Arched_Drainage",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Arched_Drainage",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_68" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Pillar",
            "",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFencePostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_69" }
        ),


        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_72",
                sprite2 = "LC_fencing_73",
                northSprite = "LC_fencing_74",
                northSprite2 = "LC_fencing_75",
                corner = "LC_fencing_69"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Corner",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_76" }
        ),



        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_with_Climbing_Ivy",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Climbing_Vines",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_80",
                sprite2 = "LC_fencing_81",
                northSprite = "LC_fencing_82",
                northSprite2 = "LC_fencing_83",
                corner = "LC_fencing_85"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Corner_with_Climbing_Ivy",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Climbing_Vines",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_84" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Pillar_with_Climbing_Vines",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Climbing_Vines",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFencePostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_85" }
        ),


        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_with_Hedge",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Hedge",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_88",
                sprite2 = "LC_fencing_89",
                northSprite = "LC_fencing_90",
                northSprite2 = "LC_fencing_83",
                corner = "LC_fencing_85"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_High_Fence_Corner_with_Hedge",
            "Tooltip_BuildingMenuObj_Decorative_Wrought_Iron_and_Brick_with_Hedge",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_92" }
        ),


        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Simple_Wrought_Iron_and_Brick_High_Fence",
            "Tooltip_BuildingMenuObj_Simple_Wrought_Iron_and_Brick",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "LC_fencing_96",
                sprite2 = "LC_fencing_97",
                northSprite = "LC_fencing_98",
                northSprite2 = "LC_fencing_99",
                corner = "LC_fencing_69"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Simple_Wrought_Iron_and_Brick_High_Fence_Corner",
            "Tooltip_BuildingMenuObj_Simple_Wrought_Iron_and_Brick",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                hoppable = false
            },
            { sprite = "LC_fencing_100" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "LC_fencing_40",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_High"),
        "LC_fencing_40",
        highFences
    )
end

local function addTablesToMenu()
    local tables = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Furniture_Large_Tables"),
            subCategoryIcon = "LC_Greasy_Joe_22",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_largeTableDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge"
                    },
                    {
                        sprite = "LC_Greasy_Joe_23",
                        sprite2 = "LC_Greasy_Joe_22",
                        northSprite = "LC_Greasy_Joe_30",
                        northSprite2 = "LC_Greasy_Joe_31"
                    }
                ),
            }
        },
    }
    for k, subCatData in pairs(tables) do
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Furniture"),
            "LC_Greasy_Joe_22",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addBedsToMenu()
    local function createBed(spriteIndex, isESfacing)
        if isESfacing then
            return BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildFourTileFurniture,
                BuildingMenu.DoubleBedRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = "LC_bedroom1_" .. spriteIndex,
                    sprite2 = "LC_bedroom1_" .. (spriteIndex - 1),
                    sprite3 = "LC_bedroom1_" .. (spriteIndex - 3),
                    sprite4 = "LC_bedroom1_" .. (spriteIndex - 2),
                    northSprite = "LC_bedroom1_" .. (spriteIndex - 7),
                    northSprite2 = "LC_bedroom1_" .. (spriteIndex - 6),
                    northSprite3 = "LC_bedroom1_" .. (spriteIndex - 4),
                    northSprite4 = "LC_bedroom1_" .. (spriteIndex - 5),
                }
            )
        else
            return BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildFourTileFurniture,
                BuildingMenu.DoubleBedRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = "LC_bedroom1_" .. spriteIndex,
                    sprite2 = "LC_bedroom1_" .. (spriteIndex - 2),
                    sprite3 = "LC_bedroom1_" .. (spriteIndex - 3),
                    sprite4 = "LC_bedroom1_" .. (spriteIndex - 1),
                    northSprite = "LC_bedroom1_" .. (spriteIndex + 1),
                    northSprite2 = "LC_bedroom1_" .. (spriteIndex + 3),
                    northSprite3 = "LC_bedroom1_" .. (spriteIndex + 4),
                    northSprite4 = "LC_bedroom1_" .. (spriteIndex + 2),
                }
            )
        end
    end

    local beds = {};
    table.insert(beds,
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildFourTileFurniture,
            BuildingMenu.DoubleBedRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "LC_bedroom1_23",
                sprite2 = "LC_bedroom1_22",
                sprite3 = "LC_bedroom1_20",
                sprite4 = "LC_bedroom1_21",
                northSprite = "LC_bedroom1_16",
                northSprite2 = "LC_bedroom1_17",
                northSprite3 = "LC_bedroom1_19",
                northSprite4 = "LC_bedroom1_18"
            }
        )
    )
    table.insert(beds,
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildFourTileFurniture,
            BuildingMenu.DoubleBedRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "LC_bedroom1_27",
                sprite2 = "LC_bedroom1_26",
                sprite3 = "LC_bedroom1_24",
                sprite4 = "LC_bedroom1_25",
                northSprite = "LC_bedroom1_29",
                northSprite2 = "LC_bedroom1_28",
                northSprite3 = "LC_bedroom1_30",
                northSprite4 = "LC_bedroom1_31"
            }
        )
    )


    local bedsIndices = { { 23, true }, { 27, false }, { 167, true }, { 171, false }, { 183, true }, { 187, false }, { 199, true }, { 203, false }, { 215, true }, { 219, false }, { 231, true }, { 235, false }, { 247, true }, { 251, false } };
    for _, indexData in ipairs(bedsIndices) do
        table.insert(beds, createBed(indexData[1], indexData[2]))
    end


    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Furniture"),
        "LC_bedroom1_23",
        getText("IGUI_BuildingMenuSubCat_Furniture_Large_Beds"),
        "LC_bedroom1_23",
        beds
    )
end

local function addSeatingFurnitureToMenu()
    local couches = {};
    local couchesIndices = { 3, 11, 63, 69, 75, 81, 87, 93, 99, 105, 111, 117, 123, 129, 135, 141, 147, 153 };

    for _, spriteIndex in ipairs(couchesIndices) do
        table.insert(couches, BuildingMenu.createObject(
            "",
            "Tooltip_craft_woodenChairDesc",
            BuildingMenu.onBuildThreeTileSimpleFurniture,
            BuildingMenu.CouchRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
            },
            {
                sprite = "LC_bedroom1_" .. spriteIndex,
                sprite2 = "LC_bedroom1_" .. (spriteIndex + 1),
                sprite3 = "LC_bedroom1_" .. (spriteIndex + 2),
                northSprite = "LC_bedroom1_" .. (spriteIndex - 3),
                northSprite2 = "LC_bedroom1_" .. (spriteIndex - 2),
                northSprite3 = "LC_bedroom1_" .. (spriteIndex - 1),
            }
        ))
    end

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Couches"),
        "LC_bedroom1_62",
        couches
    )

    local chairs = {};
    local chairsIndices = { 33, 37, 41, 45, 49, 53, 57 };

    for _, spriteIndex in ipairs(chairsIndices) do
        table.insert(chairs, BuildingMenu.createObject(
            "",
            "Tooltip_craft_woodenChairDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PaddedChairRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_bedroom1_" .. spriteIndex,
                northSprite = "LC_bedroom1_" .. (spriteIndex - 1),
                eastSprite = "LC_bedroom1_" .. (spriteIndex + 2),
                southSprite = "LC_bedroom1_" .. (spriteIndex + 1),
            }
        ))
    end

    table.insert(chairs, BuildingMenu.createObject(
        "",
        "Tooltip_craft_woodenChairDesc",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.PaddedChairRecipe,
        true,
        {
            completionSound = "BuildWoodenStructureLarge",
            canPassThrough = true,
            isThumpable = true,
            isCorner = true
        },
        {
            sprite = "LC_Decorative_Accessories_01_25",
            northSprite = "LC_Decorative_Accessories_01_24",
            eastSprite = "LC_Decorative_Accessories_01_27",
            southSprite = "LC_Decorative_Accessories_01_26",
        }
    ))

    table.insert(chairs, BuildingMenu.createObject(
        "",
        "Tooltip_craft_woodenChairDesc",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.PaddedChairRecipe,
        true,
        {
            completionSound = "BuildWoodenStructureLarge",
            canPassThrough = true,
            isThumpable = true,
            isCorner = true
        },
        {
            sprite = "LC_Decorative_Accessories_01_34",
            northSprite = "LC_Decorative_Accessories_01_33",
            eastSprite = "LC_Decorative_Accessories_01_36",
            southSprite = "LC_Decorative_Accessories_01_35",
        }
    ))

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Chairs"),
        "LC_bedroom1_45",
        chairs
    )
end

local function addBookshelvesToMenu()
    local bookshelves = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "LC_Club_52",
                sprite2 = "LC_Club_51",
                northSprite = "LC_Club_49",
                northSprite2 = "LC_Club_50"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Bookshelves"),
        "LC_Club_52",
        bookshelves
    )
end

local function addKitchenCountersToMenu()
    local kitchenCounters = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            {
                sprite = "LC_Kitchen_01_9",
                northSprite = "LC_Kitchen_01_8",
                eastSprite = "LC_Kitchen_01_11",
                southSprite = "LC_Kitchen_01_14"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            {
                sprite = "LC_Kitchen_01_15",
                northSprite = "LC_Kitchen_01_10",
                eastSprite = "LC_Kitchen_01_12",
                southSprite = "LC_Kitchen_01_13"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        "LC_Kitchen_01_9",
        getText("IGUI_BuildingMenuSubCat_Containers_Residential"),
        "LC_Kitchen_01_9",
        kitchenCounters
    )


    kitchenCounters = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                renderFloorHelper = true
            },
            { sprite = "LC_Kitchen_01_17", northSprite = "LC_Kitchen_01_16" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        "LC_Kitchen_01_17",
        getText("IGUI_BuildingMenuSubCat_Containers_Upper_Counters"),
        "LC_Kitchen_01_17",
        kitchenCounters
    )
end

local function addCommercialCountersToMenu()
    local commercialCounters = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Containers_Restaurant"),
            subCategoryIcon = "LC_Greasy_Joe_3",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.CounterRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true
                    },
                    {
                        sprite = "LC_Greasy_Joe_3",
                        northSprite = "LC_Greasy_Joe_5",
                        eastSprite = "LC_Greasy_Joe_7",
                        southSprite = "LC_Greasy_Joe_1"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.CounterRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true
                    },
                    {
                        sprite = "LC_Greasy_Joe_2",
                        northSprite = "LC_Greasy_Joe_4",
                        eastSprite = "LC_Greasy_Joe_6",
                        southSprite = "LC_Greasy_Joe_0"
                    }
                ),
            }
        },
    }
    for k, subCatData in pairs(commercialCounters) do
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Containers"),
            "LC_Greasy_Joe_3",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addCratesToMenu()
    local crate = {
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_Bitch_n_dogfood_01_0" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_0" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_48" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_51" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_56" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_59" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_64" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_67" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_72" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_75" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_80" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_83" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_88" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_91" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_96" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_99" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_104" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_107" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_112" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_115" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_120" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_123" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_29", northSprite = "LC_industrial_stuff_01_28" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_31", northSprite = "LC_industrial_stuff_01_30" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_33", northSprite = "LC_industrial_stuff_01_32" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_35", northSprite = "LC_industrial_stuff_01_34" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_37", northSprite = "LC_industrial_stuff_01_36" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_39", northSprite = "LC_industrial_stuff_01_38" }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            { sprite = "LC_industrial_stuff_01_41", northSprite = "LC_industrial_stuff_01_40" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        "LC_Bitch_n_dogfood_01_0",
        getText("IGUI_BuildingMenuSubCat_Containers_Crates"),
        "LC_Bitch_n_dogfood_01_0",
        crate
    )
end

local function addContainersOthersToMenu()
    local containersOthers = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
            },
            {
                sprite = "LC_Decorative_Accessories_01_3",
                sprite2 = "LC_Decorative_Accessories_01_2",
                northSprite = "LC_Decorative_Accessories_01_0",
                northSprite2 = "LC_Decorative_Accessories_01_1"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canBeLockedByPadlock = false,
                renderFloorHelper = true,
                needToBeAgainstWall = true,
            },
            { sprite = "LC_Decorative_Accessories_01_12", northSprite = "LC_Decorative_Accessories_01_13" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Others"),
        "LC_Decorative_Accessories_01_3",
        containersOthers
    )
end

local function addClothesRacksToMenu()
    local clothesRacks = {
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildClothingRack,
            BuildingMenu.ClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_4",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "LC_Clothing_Store_01_13",
                northSprite = "LC_Clothing_Store_01_12",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "LC_Clothing_Store_01_15",
                northSprite = "LC_Clothing_Store_01_14",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "LC_Clothing_Store_01_21",
                sprite2 = "LC_Clothing_Store_01_20",
                northSprite = "LC_Clothing_Store_01_22",
                northSprite2 = "LC_Clothing_Store_01_23"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildClothingRack,
            BuildingMenu.ClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = true,
                needToBeAgainstWall = true,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_38",
                northSprite = "LC_Clothing_Store_01_36",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildClothingRack,
            BuildingMenu.ClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = true,
                needToBeAgainstWall = true,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_39",
                northSprite = "LC_Clothing_Store_01_37",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildClothingRack,
            BuildingMenu.ClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = true,
                needToBeAgainstWall = true,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_42",
                northSprite = "LC_Clothing_Store_01_40",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildClothingRack,
            BuildingMenu.ClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = true,
                needToBeAgainstWall = true,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_43",
                northSprite = "LC_Clothing_Store_01_41",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.DoubleClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_17",
                sprite2 = "LC_Clothing_Store_01_16",
                northSprite = "LC_Clothing_Store_01_18",
                northSprite2 = "LC_Clothing_Store_01_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_ClothesStand",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.DoubleClothingRackRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "LC_Clothing_Store_01_35",
                sprite2 = "LC_Clothing_Store_01_34",
                northSprite = "LC_Clothing_Store_01_32",
                northSprite2 = "LC_Clothing_Store_01_33"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Clothing"),
        "LC_Clothing_Store_01_4",
        clothesRacks
    )
end

local function addTrashCansToMenu()
    local function createTrashCan(spriteIndex, isLarge)
        if isLarge then
            return BuildingMenu.createObject(
                "",
                "Tooltip_Counter_Generic",
                BuildingMenu.onBuildDoubleMetalShelf,
                BuildingMenu.GarbageBinBigRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureMedium",
                    renderFloorHelper = false,
                    buildMid = true,
                },
                {
                    sprite = "LC_Trash_Containers_" .. spriteIndex,
                    sprite2 = "LC_Trash_Containers_" .. (spriteIndex - 1),
                    northSprite = "LC_Trash_Containers_" .. (spriteIndex + 1),
                    northSprite2 = "LC_Trash_Containers_" .. (spriteIndex + 2)
                }
            )
        else
            return BuildingMenu.createObject(
                "",
                "Tooltip_RecyclingBin",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.GarbageBinSmallRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureMedium",
                    blockAllTheSquare = true,
                    canBeLockedByPadlock = true
                },
                {
                    sprite = "LC_Trash_Containers_" .. spriteIndex,
                    northSprite = "LC_Trash_Containers_" .. (spriteIndex - 1),
                    eastSprite = "LC_Trash_Containers_" .. (spriteIndex + 2),
                    southSprite = "LC_Trash_Containers_" .. (spriteIndex + 1)
                }
            )
        end
    end

    local trashCans = {}

    -- Small trash cans (single sprites)
    local smallTrashCanIndices = { 57, 61, 65, 69, 73, 77 }
    for _, index in ipairs(smallTrashCanIndices) do
        table.insert(trashCans, createTrashCan(index, false))
    end

    table.insert(trashCans, BuildingMenu.createObject(
        "",
        "Tooltip_Counter_Generic",
        BuildingMenu.onBuildWoodenContainer,
        BuildingMenu.GarbageBinSmallRecipe,
        true,
        {
            completionSound = "BuildMetalStructureMedium",
            blockAllTheSquare = true,
            canBeLockedByPadlock = true
        },
        { sprite = "LC_Trash_Containers_80" }
    ))

    -- Large trash cans (double sprites)
    local largeTrashCanIndices = { 1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53 }
    for _, index in ipairs(largeTrashCanIndices) do
        table.insert(trashCans, createTrashCan(index, true))
    end


    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Trash_Cans"),
        "LC_Trash_Containers_57",
        trashCans
    )
end

local function addRugsToMenu()
    local rugs = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_6",
                northSprite = "LC_rugs_4",
                eastSprite = "LC_rugs_5",
                southSprite = "LC_rugs_7"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_3",
                northSprite = "LC_rugs_1",
                eastSprite = "LC_rugs_2",
                southSprite = "LC_rugs_0"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_9",
                northSprite = "LC_rugs_11",
                eastSprite = "LC_rugs_10",
                southSprite = "LC_rugs_8"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_12",
            }
        ),


        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_22",
                northSprite = "LC_rugs_20",
                eastSprite = "LC_rugs_21",
                southSprite = "LC_rugs_23"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_19",
                northSprite = "LC_rugs_17",
                eastSprite = "LC_rugs_18",
                southSprite = "LC_rugs_16"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_25",
                northSprite = "LC_rugs_27",
                eastSprite = "LC_rugs_26",
                southSprite = "LC_rugs_24"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_28",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Rug_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_rugs_29"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Decorations"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Decorations_Rugs"),
        "LC_rugs_6",
        rugs
    )
end

local function addPostersAndSignsToMenu()
    local postersAndSigns = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Decorations_Posters"),
            subCategoryIcon = "LC_Clothing_Store_01_25",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Greasy_Joe_13",
                        northSprite = "LC_Greasy_Joe_14"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Greasy_Joe_37",
                        northSprite = "LC_Greasy_Joe_36"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Greasy_Joe_39",
                        northSprite = "LC_Greasy_Joe_38"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Clothing_Store_01_25",
                        sprite2 = "LC_Clothing_Store_01_24",
                        northSprite = "LC_Clothing_Store_01_26",
                        northSprite2 = "LC_Clothing_Store_01_27",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Clothing_Store_01_29",
                        northSprite = "LC_Clothing_Store_01_28"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Clothing_Store_01_31",
                        northSprite = "LC_Clothing_Store_01_30"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_8",
                        northSprite = "LC_Club_7"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_10",
                        northSprite = "LC_Club_9"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_12",
                        northSprite = "LC_Club_11"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_14",
                        northSprite = "LC_Club_13"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_16",
                        northSprite = "LC_Club_15"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_18",
                        northSprite = "LC_Club_17"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_20",
                        northSprite = "LC_Club_19"
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Decorations_Signs"),
            subCategoryIcon = "LC_Club_57",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = false,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = false,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Greasy_Joe_64",
                        northSprite = "LC_Greasy_Joe_65"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Police_Station_01_1",
                        northSprite = "LC_Police_Station_01_0"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_57",
                        northSprite = "LC_Club_58"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Club_59",
                        northSprite = "LC_Club_60"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Bitch_n_dogfood_01_8",
                        northSprite = "LC_Bitch_n_dogfood_01_9"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Bitch_n_dogfood_01_11",
                        sprite2 = "LC_Bitch_n_dogfood_01_10",
                        northSprite = "LC_Bitch_n_dogfood_01_12",
                        northSprite2 = "LC_Bitch_n_dogfood_01_13",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Sign",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildFourTileSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_CH_18",
                        sprite2 = "LC_CH_19",
                        sprite3 = "LC_CH_20",
                        sprite4 = "LC_CH_21",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Sign",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildFourTileSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_CH_64",
                        sprite2 = "LC_CH_65",
                        sprite3 = "LC_CH_66",
                        sprite4 = "LC_CH_67",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Sign",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildFourTileSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_CH_68",
                        sprite2 = "LC_CH_69",
                        sprite3 = "LC_CH_70",
                        sprite4 = "LC_CH_71",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Sign",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildFourTileSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_CH_72",
                        sprite2 = "LC_CH_73",
                        sprite3 = "LC_CH_74",
                        sprite4 = "LC_CH_75",
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Sign",
                    "Tooltip_Signs_Generic",
                    BuildingMenu.onBuildFourTileSimpleFurniture,
                    BuildingMenu.SignRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isCorner = true,
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = true,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_CH_90",
                        sprite2 = "LC_CH_91",
                        sprite3 = "LC_CH_92",
                        sprite4 = "LC_CH_93",
                    }
                ),
            }
        },
    }

    for k, subCatData in pairs(postersAndSigns) do
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_Decorations"),
            "LC_Clothing_Store_01_25",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addCurtainsToMenu()
    local curtainTypes = {
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 20, 22, 21, 23 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 44, 46, 45, 47 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 68, 70, 69, 71 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 92, 93, 94, 95 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 116, 117, 118, 119 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 140, 142, 141, 143 } },
        { prefix = "LC_fixtures_windows_curtains_01_", offsets = { 164, 166, 165, 167 } },
    };

    local curtains = {};

    local function createCurtainObject(typeInfo)
        local sprites = {
            sprite = typeInfo.prefix .. typeInfo.offsets[1],
            northSprite = typeInfo.prefix .. typeInfo.offsets[2],
            eastSprite = typeInfo.prefix .. typeInfo.offsets[3],
            southSprite = typeInfo.prefix .. typeInfo.offsets[4]
        };
        return BuildingMenu.createObject(
            "",
            "Tooltip_Curtains_Generic",
            BuildingMenu.onBuildCurtain,
            BuildingMenu.CurtainsRecipe,
            true,
            {},
            sprites
        );
    end

    for _, typeInfo in ipairs(curtainTypes) do
        table.insert(curtains, createCurtainObject(typeInfo));
    end

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Decorations"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Decorations_Curtains"),
        "LC_fixtures_windows_curtains_01_20",
        curtains
    );
end

local function addOtherDecorationsToMenu()
    local otherDecorations = {
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.FishTankRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true,
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {
                sprite = "LC_Decorative_Accessories_01_7",
                sprite2 = "LC_Decorative_Accessories_01_6",
                northSprite = "LC_Decorative_Accessories_01_4",
                northSprite2 = "LC_Decorative_Accessories_01_5",
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.FishTankRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true,
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {
                sprite = "LC_Decorative_Accessories_01_11",
                sprite2 = "LC_Decorative_Accessories_01_10",
                northSprite = "LC_Decorative_Accessories_01_8",
                northSprite2 = "LC_Decorative_Accessories_01_9",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Decorations"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Decorations_Others"),
        "LC_Decorative_Accessories_01_9",
        otherDecorations
    )
end

local function addFridgeAppliancesToMenu()
    local function createFridgeObject(sprite, northSprite, eastSprite, southSprite)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildSimpleFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildHigh = true,
                renderFloorHelper = false,
                dismantable = true
            },
            {
                sprite = sprite,
                northSprite = northSprite,
                eastSprite = eastSprite,
                southSprite = southSprite
            }
        )
    end

    local spriteConfigurations = {
        { "LC_Club_30", "LC_Club_29", "LC_Club_32", "LC_Club_31" },
    }

    local fridgesObjects = {}
    for _, config in ipairs(spriteConfigurations) do
        table.insert(fridgesObjects, createFridgeObject(unpack(config)))
    end

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "LC_Club_30",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "LC_Club_30",
        fridgesObjects
    )
end

local function addCookingAppliancesToMenu()
    local cookingObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildOven,
            BuildingMenu.OvenRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false
            },
            {
                sprite = "LC_Kitchen_01_1",
                northSprite = "LC_Kitchen_01_0",
                eastSprite = "LC_Kitchen_01_3",
                southSprite = "LC_Kitchen_01_2"
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "LC_Kitchen_01_1",
        getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
        "LC_Kitchen_01_1",
        cookingObjects
    )
end

local function addChinatownObjectsToMenu()
    local chairs = {
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_woodenChairDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PaddedChairRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_Chinatown_2",
                northSprite = "LC_Chinatown_1",
                eastSprite = "LC_Chinatown_3",
                southSprite = "LC_Chinatown_0"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_woodenChairDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "LC_Chinatown_7",
                sprite2 = "LC_Chinatown_6",
                northSprite = "LC_Chinatown_4",
                northSprite2 = "LC_Chinatown_5"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_TryHonestys_Chinatown"),
        "LC_Chinatown_104",
        getText("IGUI_BuildingMenuSubCat_Furniture_Chairs"),
        "LC_Chinatown_2",
        chairs
    )

    local postersAndSigns = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Decorations_Posters"),
            subCategoryIcon = "LC_Chinatown_13",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_12",
                        northSprite = "LC_Chinatown_14"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_13",
                        northSprite = "LC_Chinatown_15"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_16",
                        northSprite = "LC_Chinatown_17"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_18",
                        northSprite = "LC_Chinatown_19"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_20",
                        northSprite = "LC_Chinatown_21"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_22",
                        northSprite = "LC_Chinatown_23"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_24",
                        northSprite = "LC_Chinatown_25"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_26",
                        northSprite = "LC_Chinatown_27"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_28",
                        northSprite = "LC_Chinatown_29"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Posters_Generic",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.PostersRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        needToBeAgainstWall = true,
                        blockAllTheSquare = false,
                        renderFloorHelper = false,
                        canPassThrough = true,
                        canBarricade = false
                    },
                    {
                        sprite = "LC_Chinatown_30",
                        northSprite = "LC_Chinatown_31"
                    }
                ),
            }
        },
    }

    for k, subCatData in pairs(postersAndSigns) do
        BuildingMenu.addObjectsToCategories(
            "TryHonesty's Tiles",
            getText("IGUI_BuildingMenuCat_TryHonestys_Chinatown"),
            nil,
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end

    local decorativeObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true,
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {
                sprite = "LC_Chinatown_57",
                sprite2 = "LC_Chinatown_58",
                northSprite = "LC_Chinatown_60",
                northSprite2 = "LC_Chinatown_59"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wing_Chun_Wooden_Dummy",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                renderFloorHelper = false,
                canBeAlwaysPlaced = false,
                blockAllTheSquare = true,
                canBeLockedByPadlock = false
            },
            {
                sprite = "LC_Chinatown_55",
                northSprite = "LC_Chinatown_56",
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.VaseRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                renderFloorHelper = false,
                canBeAlwaysPlaced = false,
                blockAllTheSquare = false,
                canBeLockedByPadlock = false
            },
            {
                sprite = "LC_Chinatown_42",
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.VaseRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                renderFloorHelper = false,
                canBeAlwaysPlaced = false,
                blockAllTheSquare = false,
                canBeLockedByPadlock = false
            },
            {
                sprite = "LC_Chinatown_43",
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildFourTileSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true
            },
            {
                sprite = "LC_Chinatown_38",
                sprite2 = "LC_Chinatown_39",
                sprite3 = "LC_Chinatown_40",
                sprite4 = "LC_Chinatown_41",
                northSprite = "LC_Chinatown_34",
                northSprite2 = "LC_Chinatown_35",
                northSprite3 = "LC_Chinatown_36",
                northSprite4 = "LC_Chinatown_37"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "TryHonesty's Tiles",
        getText("IGUI_BuildingMenuCat_TryHonestys_Chinatown"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Chinatown_Decorative_Objects"),
        "LC_Chinatown_34",
        decorativeObjects
    )
end


local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.commercialWallsSubCategory then
        addCommercialWallsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.highFencesSubCategory then
        addHighFencesToMenu()
    end
    if SandboxVars.BuildingMenu.floorsCategory then
        addFloorsToMenu()
    end
    if SandboxVars.BuildingMenu.seatingFurnitureSubCategory then
        addSeatingFurnitureToMenu()
    end
    if SandboxVars.BuildingMenu.bookshelvesSubCategory then
        addBookshelvesToMenu()
    end
    if SandboxVars.BuildingMenu.rugsSubCategory then
        addRugsToMenu()
    end
    if SandboxVars.BuildingMenu.tablesSubCategory then
        addTablesToMenu()
    end
    if SandboxVars.BuildingMenu.bedsSubCategory then
        addBedsToMenu()
    end
    if SandboxVars.BuildingMenu.kitchenCountersSubCategory then
        addKitchenCountersToMenu()
    end
    if SandboxVars.BuildingMenu.commercialCountersSubCategory then
        addCommercialCountersToMenu()
    end
    if SandboxVars.BuildingMenu.cratesSubCategory then
        addCratesToMenu()
    end
    if SandboxVars.BuildingMenu.clothesRacksSubCategory then
        addClothesRacksToMenu()
    end
    if SandboxVars.BuildingMenu.trashCansSubCategory then
        addTrashCansToMenu()
    end
    if SandboxVars.BuildingMenu.containersOthersSubCategory then
        addContainersOthersToMenu()
    end
    if SandboxVars.BuildingMenu.curtainsSubCategory then
        addCurtainsToMenu()
    end
    if SandboxVars.BuildingMenu.postersAndSignsSubCategory then
        addPostersAndSignsToMenu()
    end
    if SandboxVars.BuildingMenu.otherDecorationsSubCategory then
        addOtherDecorationsToMenu()
    end
    if SandboxVars.BuildingMenu.cookingAppliances then
        addCookingAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.tryHonestyChinatown then
        addChinatownObjectsToMenu()
    end
end
Events.OnInitializeBuildingMenuObjects.Add(addCategoriesToBuildingMenu)
