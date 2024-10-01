---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addGreenhouseWallsToMenu()
    local whiteWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Wall1",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_commercial_02_55",
                northSprite = "walls_commercial_02_54",
                corner = "walls_exterior_house_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Wall2",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_commercial_02_51",
                northSprite = "walls_commercial_02_50",
                corner = "walls_exterior_house_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Wall3",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_commercial_02_52",
                northSprite = "walls_commercial_02_49",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Wall4",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_commercial_02_53",
                northSprite = "walls_commercial_02_48",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Door_Frame1",
            "Tooltip_White_Frame_Glass_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "walls_greenhouse_01_9",
                northSprite = "walls_greenhouse_01_8",
                corner = "walls_exterior_house_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Pillar",
            "Tooltip_White_Frame_Glass_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "walls_exterior_house_01_35" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_1",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_0", northSprite = "roof_walls_greenhouse_01_13" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_2",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_1", northSprite = "roof_walls_greenhouse_01_12" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_3",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_2", northSprite = "roof_walls_greenhouse_01_11" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_4",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_8", northSprite = "roof_walls_greenhouse_01_5" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_5",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_9", northSprite = "roof_walls_greenhouse_01_4" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_Slope_Wall_6",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_10", northSprite = "roof_walls_greenhouse_01_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_End_Medium",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_14", northSprite = "roof_walls_greenhouse_01_6" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Frame_Glass_Roof_End_Big",
            "Tooltip_White_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_15", northSprite = "roof_walls_greenhouse_01_7" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Walls"),
        "walls_greenhouse_01_25",
        getText("IGUI_BuildingMenuSubCat_Walls_White_Panel"),
        "walls_commercial_02_55",
        whiteWalls
    )


    local brownWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Wall1",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BrownBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_7",
                northSprite = "walls_greenhouse_01_6",
                corner = "walls_exterior_house_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Wall2",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BrownBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_3",
                northSprite = "walls_greenhouse_01_2",
                corner = "walls_exterior_house_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Wall3",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BrownBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_4",
                northSprite = "walls_greenhouse_01_1",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Wall4",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BrownBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_5",
                northSprite = "walls_greenhouse_01_0",
                corner = "walls_exterior_house_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Door_Frame1",
            "Tooltip_Brown_Frame_Glass_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "walls_greenhouse_01_11",
                northSprite = "walls_greenhouse_01_10",
                corner = "walls_exterior_house_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Pillar",
            "Tooltip_Brown_Frame_Glass_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "walls_exterior_house_01_51" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_1",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_16", northSprite = "roof_walls_greenhouse_01_29" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_2",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_17", northSprite = "roof_walls_greenhouse_01_28" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_3",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_18", northSprite = "roof_walls_greenhouse_01_27" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_4",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_24", northSprite = "roof_walls_greenhouse_01_21" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_5",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_25", northSprite = "roof_walls_greenhouse_01_20" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_Slope_Wall_6",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_26", northSprite = "roof_walls_greenhouse_01_19" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_End_Medium",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_30", northSprite = "roof_walls_greenhouse_01_22" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Frame_Glass_Roof_End_Big",
            "Tooltip_Brown_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_31", northSprite = "roof_walls_greenhouse_01_23" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Walls"),
        "walls_greenhouse_01_25",
        getText("IGUI_BuildingMenuSubCat_Walls_Brown_Frame_Glass"),
        "walls_greenhouse_01_7",
        brownWalls
    )


    local greenWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Wall1",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_25",
                northSprite = "walls_greenhouse_01_24",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Wall2",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_21",
                northSprite = "walls_greenhouse_01_20",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Wall3",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_22",
                northSprite = "walls_greenhouse_01_19",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Wall4",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreenBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "walls_greenhouse_01_23",
                northSprite = "walls_greenhouse_01_18",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Door_Frame1",
            "Tooltip_Green_Frame_Glass_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "walls_greenhouse_01_17",
                northSprite = "walls_greenhouse_01_16",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Pillar",
            "Tooltip_Green_Frame_Glass_Pillar",
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
            { sprite = "location_shop_greenes_01_12" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_1",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_32", northSprite = "roof_walls_greenhouse_01_45" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_2",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_33", northSprite = "roof_walls_greenhouse_01_44" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_3",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_34", northSprite = "roof_walls_greenhouse_01_43" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_4",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_40", northSprite = "roof_walls_greenhouse_01_37" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_5",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_41", northSprite = "roof_walls_greenhouse_01_36" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_Slope_Wall_6",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_42", northSprite = "roof_walls_greenhouse_01_35" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_End_Medium",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_46", northSprite = "roof_walls_greenhouse_01_38" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Frame_Glass_Roof_End_Big",
            "Tooltip_Green_Frame_Glass_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_47", northSprite = "roof_walls_greenhouse_01_39" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Walls"),
        "walls_greenhouse_01_25",
        getText("IGUI_BuildingMenuSubCat_Walls_Green_Frame_Glass"),
        "walls_greenhouse_01_25",
        greenWalls
    )


    local blackWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_1",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_48", northSprite = "roof_walls_greenhouse_01_61" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_2",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_49", northSprite = "roof_walls_greenhouse_01_60" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_3",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_50", northSprite = "roof_walls_greenhouse_01_59" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_4",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_56", northSprite = "roof_walls_greenhouse_01_53" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_5",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_57", northSprite = "roof_walls_greenhouse_01_52" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_Slope_Wall_6",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_58", northSprite = "roof_walls_greenhouse_01_51" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_End_Medium",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_63", northSprite = "roof_walls_greenhouse_01_54" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Black_Frame_Glass_Roof_End_Big",
            "Tooltip_Black_Wood_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "roof_walls_greenhouse_01_62", northSprite = "roof_walls_greenhouse_01_55" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Black_Frame_Glass"),
        nil,
        blackWalls
    )
end

local function addDoorsToMenu()
    local doors = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Door",
            "Tooltip_Green_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.GreenWoodenDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "walls_greenhouse_01_12",
                northSprite = "walls_greenhouse_01_13",
                openSprite = "walls_greenhouse_01_14",
                openNorthSprite = "walls_greenhouse_01_15"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Doors"),
        "walls_greenhouse_01_12",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "walls_greenhouse_01_12",
        doors
    )
end

local function addRoofingToMenu()
    local greenRoofs = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Glass_Roof",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.RoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            { sprite = "roofs_greenhouse_01_10", northSprite = "roofs_greenhouse_01_13" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Glass_Roof_Pitched_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_32", northSprite = "roofs_greenhouse_01_37" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Glass_Roof_Pitched_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_33", northSprite = "roofs_greenhouse_01_36" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Glass_Roof_Pitched_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_34", northSprite = "roofs_greenhouse_01_35" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_39", northSprite = "roofs_greenhouse_01_38" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_47", northSprite = "roofs_greenhouse_01_46" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Roofing"),
        "roofs_greenhouse_01_37",
        getText("IGUI_BuildingMenuSubCat_Roofing_Green_Roofs"),
        "roofs_greenhouse_01_37",
        greenRoofs
    )


    local whiteRoofs = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Glass_Roof",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.RoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            { sprite = "roofs_greenhouse_01_8", northSprite = "roofs_greenhouse_01_11" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Glass_Roof_Pitched_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_0", northSprite = "roofs_greenhouse_01_5" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Glass_Roof_Pitched_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_1", northSprite = "roofs_greenhouse_01_4" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Glass_Roof_Pitched_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_2", northSprite = "roofs_greenhouse_01_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_7", northSprite = "roofs_greenhouse_01_6" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_15", northSprite = "roofs_greenhouse_01_14" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Roofing"),
        "roofs_greenhouse_01_37",
        getText("IGUI_BuildingMenuSubCat_Roofing_White_Roofs"),
        "roofs_greenhouse_01_37",
        whiteRoofs
    )


    local brownRoofs = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Glass_Roof",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.RoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            { sprite = "roofs_greenhouse_01_9", northSprite = "roofs_greenhouse_01_12" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Glass_Roof_Pitched_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_16", northSprite = "roofs_greenhouse_01_21" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Glass_Roof_Pitched_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_17", northSprite = "roofs_greenhouse_01_20" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Glass_Roof_Pitched_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_18", northSprite = "roofs_greenhouse_01_19" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_23", northSprite = "roofs_greenhouse_01_22" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Patio_Shingles_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.GlassRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "roofs_greenhouse_01_31", northSprite = "roofs_greenhouse_01_30" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Roofing"),
        "roofs_greenhouse_01_37",
        getText("IGUI_BuildingMenuSubCat_Roofing_Brown_Roofs"),
        "roofs_greenhouse_01_37",
        brownRoofs
    )
end

local function addArchitecturePlusToMenu()
    local architecturePlusObj = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Curb",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_26", northSprite = "location_community_park_01_27" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Curb",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_29", northSprite = "location_community_park_01_28" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Curb_Corner",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_25" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Curb_Corner",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_24" }
        ),


        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Curb",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_34", northSprite = "location_community_park_01_35" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Curb",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_37", northSprite = "location_community_park_01_36" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Curb_Corner",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_33" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Curb_Corner",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "location_community_park_01_32" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Narrow_Wooden_Curb",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "walls_greenhouse_01_27", northSprite = "walls_greenhouse_01_26" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Narrow_Curb_Corner",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            { sprite = "walls_greenhouse_01_28" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_ArchitecturePlus"),
        "location_community_park_01_26",
        getText("IGUI_BuildingMenuSubCat_ArchitecturePlus_Floor_Molding"),
        "location_community_park_01_26",
        architecturePlusObj
    )
end

local function addFencesToMenu()
    local architecturePlusObj = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Low_Fence",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            { sprite = "walls_greenhouse_01_65", northSprite = "walls_greenhouse_01_64" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Low_Fence_Corner",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_67" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Low_Fence_Pillar",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_66" }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Low_Fence",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            { sprite = "walls_greenhouse_01_69", northSprite = "walls_greenhouse_01_68" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Low_Fence_Corner",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_71" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Low_Fence_Pillar",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_70" }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Low_Fence",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            { sprite = "walls_greenhouse_01_73", northSprite = "walls_greenhouse_01_72" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Low_Fence_Corner",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_75" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Low_Fence_Pillar",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_74" }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Low_Fence",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            { sprite = "walls_greenhouse_01_77", northSprite = "walls_greenhouse_01_76" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Low_Fence_Corner",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_79" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Brown_Low_Fence_Pillar",
            "Tooltip_Low_Fence",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "walls_greenhouse_01_78" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Greenhouse",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "walls_greenhouse_01_69",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_Low"),
        "walls_greenhouse_01_69",
        architecturePlusObj
    )
end

local function addCategoriesToBuildingMenu()
    addGreenhouseWallsToMenu()
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.roofsCategory then
        addRoofingToMenu()
    end
    if SandboxVars.BuildingMenu.architecturePlusCategory then
        addArchitecturePlusToMenu()
    end
    if SandboxVars.BuildingMenu.lowAndRailingFencesSubCategory then
        addFencesToMenu()
    end
end
Events.OnInitializeBuildingMenuObjects.Add(addCategoriesToBuildingMenu)
