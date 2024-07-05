---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addMelosWallsCastleToMenu()
    local melosWallsCastle = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Glass_Wall",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteTurquoiseWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_castle_01_0",
                northSprite = "melos_tiles_castle_01_1",
                corner = "melos_tiles_castle_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Glass_Wall_Corner",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteTurquoiseWindowBigWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_castle_01_2",
                corner = "melos_tiles_castle_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Wood_Pillar",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_22",
                northSprite = "melos_tiles_castle_01_21",
                eastSprite = "melos_tiles_castle_01_23",
                southSprite = "melos_tiles_castle_01_20"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Wood_Beam",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_16", northSprite = "melos_tiles_castle_01_17" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Wood_Beam_Corner",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_18" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Wood_Beam_Small_Corner",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_19" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_White_Wood_Pillar",
            "Tooltip_Melos_Generic_Castle",
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
            {
                sprite = "melos_tiles_castle_01_30",
                northSprite = "melos_tiles_castle_01_29",
                eastSprite = "melos_tiles_castle_01_31",
                southSprite = "melos_tiles_castle_01_28"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_White_Wood_Beam",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_24", northSprite = "melos_tiles_castle_01_25" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_White_Wood_Beam_Corner",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_26" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_White_Wood_Beam_Small_Corner",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_27" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Wall_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_castle_01_32",
                northSprite = "melos_tiles_castle_01_33",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Wall_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_castle_01_36",
                northSprite = "melos_tiles_castle_01_37",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Door_Frame_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_42",
                northSprite = "melos_tiles_castle_01_43",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Door_Frame_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_46",
                northSprite = "melos_tiles_castle_01_47",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Simple_Window_Frame_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_40",
                northSprite = "melos_tiles_castle_01_41",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Simple_Window_Frame_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_44",
                northSprite = "melos_tiles_castle_01_45",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Large_Window_Frame_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_48",
                northSprite = "melos_tiles_castle_01_49",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Large_Window_Frame_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_50",
                northSprite = "melos_tiles_castle_01_51",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Double_Window_Frame_1L",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_56",
                northSprite = "melos_tiles_castle_01_59",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Double_Window_Frame_1R",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_57",
                northSprite = "melos_tiles_castle_01_58",
                corner = "melos_tiles_castle_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Double_Window_Frame_2L",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_60",
                northSprite = "melos_tiles_castle_01_63",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Double_Window_Frame_2R",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_castle_01_61",
                northSprite = "melos_tiles_castle_01_62",
                corner = "melos_tiles_castle_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Post_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_77" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Post_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_79" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_castle_01_64",
                northSprite = "melos_tiles_castle_01_65",
                corner = "melos_tiles_castle_01_77"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_castle_01_68",
                northSprite = "melos_tiles_castle_01_69",
                corner = "melos_tiles_castle_01_79"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Gap_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_castle_01_72",
                northSprite = "melos_tiles_castle_01_73",
                corner = "melos_tiles_castle_01_77"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Gap_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_castle_01_74",
                northSprite = "melos_tiles_castle_01_75",
                corner = "melos_tiles_castle_01_79"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Corner_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_76" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Fence_Corner_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_78" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_U_Door_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_88", northSprite = "melos_tiles_castle_01_91" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_U_Door_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            { sprite = "melos_tiles_castle_01_89", northSprite = "melos_tiles_castle_01_90" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_Door_1L",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_80",
                northSprite = "melos_tiles_castle_01_83",
                corner = "melos_tiles_castle_01_98"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_Door_1R",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_81",
                northSprite = "melos_tiles_castle_01_82",
                corner = "melos_tiles_castle_01_98"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_Door_2L",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_84",
                northSprite = "melos_tiles_castle_01_87",
                corner = "melos_tiles_castle_01_106"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_Door_2R",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_85",
                northSprite = "melos_tiles_castle_01_86",
                corner = "melos_tiles_castle_01_106"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_92",
                northSprite = "melos_tiles_castle_01_93",
                corner = "melos_tiles_castle_01_98"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Archway_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_castle_01_94",
                northSprite = "melos_tiles_castle_01_95",
                corner = "melos_tiles_castle_01_106"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Edge_Pillar_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_97",
                northSprite = "melos_tiles_castle_01_96"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Pillar_1",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_98"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Edge_Pillar_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_100",
                northSprite = "melos_tiles_castle_01_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Pillar_2",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Edge_Pillar_3",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_105",
                northSprite = "melos_tiles_castle_01_104"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Pillar_3",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_106"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Edge_Pillar_4",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_108",
                northSprite = "melos_tiles_castle_01_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Castle_Stone_Pillar_4",
            "Tooltip_Melos_Generic_Castle",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_castle_01_109"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        "melos_tiles_castle_01_0",
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Castle"),
        "melos_tiles_castle_01_0",
        melosWallsCastle
    )
end

local function addMelosWallsCinderblockToMenu()
    local melosWallsWhiteCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Wall",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_0",
                northSprite = "melos_tiles_walls_bathroom_01a_1",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Wall",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_6",
                northSprite = "melos_tiles_walls_bathroom_01a_7",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Door_Frame",
            "Tooltip_Melos_White_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_10",
                northSprite = "melos_tiles_walls_bathroom_01a_11",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Door_Frame",
            "Tooltip_Melos_White_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_10",
                northSprite = "melos_tiles_walls_bathroom_01a_11",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Door_Frame",
            "Tooltip_Melos_White_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_12",
                northSprite = "melos_tiles_walls_bathroom_01a_15",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Door_Frame",
            "Tooltip_Melos_White_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_13",
                northSprite = "melos_tiles_walls_bathroom_01a_14",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_8",
                northSprite = "melos_tiles_walls_bathroom_01a_9",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_4",
                northSprite = "melos_tiles_walls_bathroom_01a_5",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_16",
                northSprite = "melos_tiles_walls_bathroom_01a_21",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_17",
                northSprite = "melos_tiles_walls_bathroom_01a_20",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_18",
                northSprite = "melos_tiles_walls_bathroom_01a_19",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_22",
                northSprite = "melos_tiles_walls_bathroom_01a_23",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_24",
                northSprite = "melos_tiles_walls_bathroom_01a_29",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_25",
                northSprite = "melos_tiles_walls_bathroom_01a_28",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Window_Frame",
            "Tooltip_Melos_White_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_26",
                northSprite = "melos_tiles_walls_bathroom_01a_27",
                corner = "melos_tiles_walls_bathroom_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Pillar",
            "Tooltip_Melos_White_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Fence_Post",
            "Tooltip_Melos_White_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01a_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Fence",
            "Tooltip_Melos_White_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01a_84",
                northSprite = "melos_tiles_walls_bathroom_01a_85",
                corner = "melos_tiles_walls_bathroom_01a_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Fence_Corner",
            "Tooltip_Melos_White_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01a_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_106", northSprite = "melos_tiles_walls_bathroom_01a_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_105", northSprite = "melos_tiles_walls_bathroom_01a_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_104", northSprite = "melos_tiles_walls_bathroom_01a_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_96", northSprite = "melos_tiles_walls_bathroom_01a_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_97", northSprite = "melos_tiles_walls_bathroom_01a_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_98", northSprite = "melos_tiles_walls_bathroom_01a_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_112", northSprite = "melos_tiles_walls_bathroom_01a_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_113", northSprite = "melos_tiles_walls_bathroom_01a_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_White_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01a_114", northSprite = "melos_tiles_walls_bathroom_01a_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Cinderblock"),
        "melos_tiles_walls_bathroom_01a_0",
        melosWallsWhiteCinderblock
    )

    local melosWallsGreyCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Wall",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_0",
                northSprite = "melos_tiles_walls_bathroom_01b_1",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Wall",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_6",
                northSprite = "melos_tiles_walls_bathroom_01b_7",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Door_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_10",
                northSprite = "melos_tiles_walls_bathroom_01b_11",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Door_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_10",
                northSprite = "melos_tiles_walls_bathroom_01b_11",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Door_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_12",
                northSprite = "melos_tiles_walls_bathroom_01b_15",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Door_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_13",
                northSprite = "melos_tiles_walls_bathroom_01b_14",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_8",
                northSprite = "melos_tiles_walls_bathroom_01b_9",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_4",
                northSprite = "melos_tiles_walls_bathroom_01b_5",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_16",
                northSprite = "melos_tiles_walls_bathroom_01b_21",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_17",
                northSprite = "melos_tiles_walls_bathroom_01b_20",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_18",
                northSprite = "melos_tiles_walls_bathroom_01b_19",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_22",
                northSprite = "melos_tiles_walls_bathroom_01b_23",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_24",
                northSprite = "melos_tiles_walls_bathroom_01b_29",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_25",
                northSprite = "melos_tiles_walls_bathroom_01b_28",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Window_Frame",
            "Tooltip_Melos_Grey_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_26",
                northSprite = "melos_tiles_walls_bathroom_01b_27",
                corner = "melos_tiles_walls_bathroom_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Pillar",
            "Tooltip_Melos_Grey_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Fence_Post",
            "Tooltip_Melos_Grey_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01b_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Fence",
            "Tooltip_Melos_Grey_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01b_84",
                northSprite = "melos_tiles_walls_bathroom_01b_85",
                corner = "melos_tiles_walls_bathroom_01b_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Grey_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01b_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_106", northSprite = "melos_tiles_walls_bathroom_01b_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_105", northSprite = "melos_tiles_walls_bathroom_01b_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_104", northSprite = "melos_tiles_walls_bathroom_01b_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_96", northSprite = "melos_tiles_walls_bathroom_01b_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_97", northSprite = "melos_tiles_walls_bathroom_01b_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_98", northSprite = "melos_tiles_walls_bathroom_01b_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_112", northSprite = "melos_tiles_walls_bathroom_01b_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_113", northSprite = "melos_tiles_walls_bathroom_01b_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Grey_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigStoneWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01b_114", northSprite = "melos_tiles_walls_bathroom_01b_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Grey_Cinderblock"),
        "melos_tiles_walls_bathroom_01b_0",
        melosWallsGreyCinderblock
    )

    local melosWallsBlackCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Wall",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_0",
                northSprite = "melos_tiles_walls_bathroom_01c_1",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Wall",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_6",
                northSprite = "melos_tiles_walls_bathroom_01c_7",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Door_Frame",
            "Tooltip_Melos_Black_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_10",
                northSprite = "melos_tiles_walls_bathroom_01c_11",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Door_Frame",
            "Tooltip_Melos_Black_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_10",
                northSprite = "melos_tiles_walls_bathroom_01c_11",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Door_Frame",
            "Tooltip_Melos_Black_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_12",
                northSprite = "melos_tiles_walls_bathroom_01c_15",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Door_Frame",
            "Tooltip_Melos_Black_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_13",
                northSprite = "melos_tiles_walls_bathroom_01c_14",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_8",
                northSprite = "melos_tiles_walls_bathroom_01c_9",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_4",
                northSprite = "melos_tiles_walls_bathroom_01c_5",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_16",
                northSprite = "melos_tiles_walls_bathroom_01c_21",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_17",
                northSprite = "melos_tiles_walls_bathroom_01c_20",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_18",
                northSprite = "melos_tiles_walls_bathroom_01c_19",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_22",
                northSprite = "melos_tiles_walls_bathroom_01c_23",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_24",
                northSprite = "melos_tiles_walls_bathroom_01c_29",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_25",
                northSprite = "melos_tiles_walls_bathroom_01c_28",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Window_Frame",
            "Tooltip_Melos_Black_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_26",
                northSprite = "melos_tiles_walls_bathroom_01c_27",
                corner = "melos_tiles_walls_bathroom_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Pillar",
            "Tooltip_Melos_Black_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Fence_Post",
            "Tooltip_Melos_Black_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01c_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Fence",
            "Tooltip_Melos_Black_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01c_84",
                northSprite = "melos_tiles_walls_bathroom_01c_85",
                corner = "melos_tiles_walls_bathroom_01c_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Black_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01c_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_106", northSprite = "melos_tiles_walls_bathroom_01c_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_105", northSprite = "melos_tiles_walls_bathroom_01c_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_104", northSprite = "melos_tiles_walls_bathroom_01c_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_96", northSprite = "melos_tiles_walls_bathroom_01c_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_97", northSprite = "melos_tiles_walls_bathroom_01c_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_98", northSprite = "melos_tiles_walls_bathroom_01c_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_112", northSprite = "melos_tiles_walls_bathroom_01c_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_113", northSprite = "melos_tiles_walls_bathroom_01c_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Black_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Black_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01c_114", northSprite = "melos_tiles_walls_bathroom_01c_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Black_Cinderblock"),
        "melos_tiles_walls_bathroom_01c_0",
        melosWallsBlackCinderblock
    )

    local melosWallsSwampCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Wall",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_0",
                northSprite = "melos_tiles_walls_bathroom_01d_1",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Wall",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_6",
                northSprite = "melos_tiles_walls_bathroom_01d_7",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Door_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_10",
                northSprite = "melos_tiles_walls_bathroom_01d_11",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Door_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_10",
                northSprite = "melos_tiles_walls_bathroom_01d_11",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Door_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_12",
                northSprite = "melos_tiles_walls_bathroom_01d_15",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Door_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_13",
                northSprite = "melos_tiles_walls_bathroom_01d_14",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_8",
                northSprite = "melos_tiles_walls_bathroom_01d_9",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_4",
                northSprite = "melos_tiles_walls_bathroom_01d_5",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_16",
                northSprite = "melos_tiles_walls_bathroom_01d_21",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_17",
                northSprite = "melos_tiles_walls_bathroom_01d_20",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_18",
                northSprite = "melos_tiles_walls_bathroom_01d_19",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_22",
                northSprite = "melos_tiles_walls_bathroom_01d_23",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_24",
                northSprite = "melos_tiles_walls_bathroom_01d_29",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_25",
                northSprite = "melos_tiles_walls_bathroom_01d_28",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Window_Frame",
            "Tooltip_Melos_Swamp_Cinderblock_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_01d_26",
                northSprite = "melos_tiles_walls_bathroom_01d_27",
                corner = "melos_tiles_walls_bathroom_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Pillar",
            "Tooltip_Melos_Swamp_Cinderblock_Pillar",
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
            { sprite = "melos_tiles_walls_bathroom_01d_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Fence_Post",
            "Tooltip_Melos_Swamp_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01d_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Fence",
            "Tooltip_Melos_Swamp_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01d_84",
                northSprite = "melos_tiles_walls_bathroom_01d_85",
                corner = "melos_tiles_walls_bathroom_01d_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Swamp_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01d_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_106", northSprite = "melos_tiles_walls_bathroom_01d_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_105", northSprite = "melos_tiles_walls_bathroom_01d_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_104", northSprite = "melos_tiles_walls_bathroom_01d_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_96", northSprite = "melos_tiles_walls_bathroom_01d_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_97", northSprite = "melos_tiles_walls_bathroom_01d_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_98", northSprite = "melos_tiles_walls_bathroom_01d_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_112", northSprite = "melos_tiles_walls_bathroom_01d_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_113", northSprite = "melos_tiles_walls_bathroom_01d_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Swamp_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Swamp_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01d_114", northSprite = "melos_tiles_walls_bathroom_01d_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Swamp_Cinderblock"),
        "melos_tiles_walls_bathroom_01d_0",
        melosWallsSwampCinderblock
    )

    local melosWallsYellowCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Wall",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
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
                sprite = "melos_tiles_walls_bathroom_01e_0",
                northSprite = "melos_tiles_walls_bathroom_01e_1",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Wall",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
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
                sprite = "melos_tiles_walls_bathroom_01e_6",
                northSprite = "melos_tiles_walls_bathroom_01e_7",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Door_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_10",
                northSprite = "melos_tiles_walls_bathroom_01e_11",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Door_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_10",
                northSprite = "melos_tiles_walls_bathroom_01e_11",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Door_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_12",
                northSprite = "melos_tiles_walls_bathroom_01e_15",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Door_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_13",
                northSprite = "melos_tiles_walls_bathroom_01e_14",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_8",
                northSprite = "melos_tiles_walls_bathroom_01e_9",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_4",
                northSprite = "melos_tiles_walls_bathroom_01e_5",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_16",
                northSprite = "melos_tiles_walls_bathroom_01e_21",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_17",
                northSprite = "melos_tiles_walls_bathroom_01e_20",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_18",
                northSprite = "melos_tiles_walls_bathroom_01e_19",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_22",
                northSprite = "melos_tiles_walls_bathroom_01e_23",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_24",
                northSprite = "melos_tiles_walls_bathroom_01e_29",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_25",
                northSprite = "melos_tiles_walls_bathroom_01e_28",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Window_Frame",
            "Tooltip_Melos_Yellow_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_26",
                northSprite = "melos_tiles_walls_bathroom_01e_27",
                corner = "melos_tiles_walls_bathroom_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Pillar",
            "Tooltip_Melos_Yellow_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Fence_Post",
            "Tooltip_Melos_Yellow_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01e_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Fence",
            "Tooltip_Melos_Yellow_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01e_84",
                northSprite = "melos_tiles_walls_bathroom_01e_85",
                corner = "melos_tiles_walls_bathroom_01e_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Yellow_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01e_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_106", northSprite = "melos_tiles_walls_bathroom_01e_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_105", northSprite = "melos_tiles_walls_bathroom_01e_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_104", northSprite = "melos_tiles_walls_bathroom_01e_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_96", northSprite = "melos_tiles_walls_bathroom_01e_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_97", northSprite = "melos_tiles_walls_bathroom_01e_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_98", northSprite = "melos_tiles_walls_bathroom_01e_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_112", northSprite = "melos_tiles_walls_bathroom_01e_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_113", northSprite = "melos_tiles_walls_bathroom_01e_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Yellow_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01e_114", northSprite = "melos_tiles_walls_bathroom_01e_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Yellow_Cinderblock"),
        "melos_tiles_walls_bathroom_01e_0",
        melosWallsYellowCinderblock
    )

    local melosWallsTurquoiseCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Wall",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_0",
                northSprite = "melos_tiles_walls_bathroom_01f_1",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Wall",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_6",
                northSprite = "melos_tiles_walls_bathroom_01f_7",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Door_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_10",
                northSprite = "melos_tiles_walls_bathroom_01f_11",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Door_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_10",
                northSprite = "melos_tiles_walls_bathroom_01f_11",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Door_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_12",
                northSprite = "melos_tiles_walls_bathroom_01f_15",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Door_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_13",
                northSprite = "melos_tiles_walls_bathroom_01f_14",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_8",
                northSprite = "melos_tiles_walls_bathroom_01f_9",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_4",
                northSprite = "melos_tiles_walls_bathroom_01f_5",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_16",
                northSprite = "melos_tiles_walls_bathroom_01f_21",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_17",
                northSprite = "melos_tiles_walls_bathroom_01f_20",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_18",
                northSprite = "melos_tiles_walls_bathroom_01f_19",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_22",
                northSprite = "melos_tiles_walls_bathroom_01f_23",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_24",
                northSprite = "melos_tiles_walls_bathroom_01f_29",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_25",
                northSprite = "melos_tiles_walls_bathroom_01f_28",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Window_Frame",
            "Tooltip_Melos_Turquoise_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_26",
                northSprite = "melos_tiles_walls_bathroom_01f_27",
                corner = "melos_tiles_walls_bathroom_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Pillar",
            "Tooltip_Melos_Turquoise_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Fence_Post",
            "Tooltip_Melos_Turquoise_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01f_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Fence",
            "Tooltip_Melos_Turquoise_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01f_84",
                northSprite = "melos_tiles_walls_bathroom_01f_85",
                corner = "melos_tiles_walls_bathroom_01f_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Turquoise_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01f_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_106", northSprite = "melos_tiles_walls_bathroom_01f_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_105", northSprite = "melos_tiles_walls_bathroom_01f_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_104", northSprite = "melos_tiles_walls_bathroom_01f_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_96", northSprite = "melos_tiles_walls_bathroom_01f_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_97", northSprite = "melos_tiles_walls_bathroom_01f_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_98", northSprite = "melos_tiles_walls_bathroom_01f_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_112", northSprite = "melos_tiles_walls_bathroom_01f_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_113", northSprite = "melos_tiles_walls_bathroom_01f_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Turquoise_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01f_114", northSprite = "melos_tiles_walls_bathroom_01f_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Turquoise_Cinderblock"),
        "melos_tiles_walls_bathroom_01f_0",
        melosWallsTurquoiseCinderblock
    )

    local melosWallsBlueCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Wall",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_0",
                northSprite = "melos_tiles_walls_bathroom_01g_1",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Wall",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_6",
                northSprite = "melos_tiles_walls_bathroom_01g_7",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Door_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_10",
                northSprite = "melos_tiles_walls_bathroom_01g_11",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Door_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_10",
                northSprite = "melos_tiles_walls_bathroom_01g_11",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Door_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_12",
                northSprite = "melos_tiles_walls_bathroom_01g_15",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Door_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_13",
                northSprite = "melos_tiles_walls_bathroom_01g_14",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_8",
                northSprite = "melos_tiles_walls_bathroom_01g_9",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_4",
                northSprite = "melos_tiles_walls_bathroom_01g_5",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_16",
                northSprite = "melos_tiles_walls_bathroom_01g_21",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_17",
                northSprite = "melos_tiles_walls_bathroom_01g_20",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_18",
                northSprite = "melos_tiles_walls_bathroom_01g_19",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_22",
                northSprite = "melos_tiles_walls_bathroom_01g_23",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_24",
                northSprite = "melos_tiles_walls_bathroom_01g_29",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_25",
                northSprite = "melos_tiles_walls_bathroom_01g_28",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Window_Frame",
            "Tooltip_Melos_Blue_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_26",
                northSprite = "melos_tiles_walls_bathroom_01g_27",
                corner = "melos_tiles_walls_bathroom_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Pillar",
            "Tooltip_Melos_Blue_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Fence_Post",
            "Tooltip_Melos_Blue_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01g_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Fence",
            "Tooltip_Melos_Blue_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01g_84",
                northSprite = "melos_tiles_walls_bathroom_01g_85",
                corner = "melos_tiles_walls_bathroom_01g_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Blue_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01g_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_106", northSprite = "melos_tiles_walls_bathroom_01g_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_105", northSprite = "melos_tiles_walls_bathroom_01g_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_104", northSprite = "melos_tiles_walls_bathroom_01g_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_96", northSprite = "melos_tiles_walls_bathroom_01g_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_97", northSprite = "melos_tiles_walls_bathroom_01g_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_98", northSprite = "melos_tiles_walls_bathroom_01g_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_112", northSprite = "melos_tiles_walls_bathroom_01g_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_113", northSprite = "melos_tiles_walls_bathroom_01g_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Blue_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01g_114", northSprite = "melos_tiles_walls_bathroom_01g_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Blue_Cinderblock"),
        "melos_tiles_walls_bathroom_01g_0",
        melosWallsBlueCinderblock
    )

    local melosWallsVioletCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Wall",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_0",
                northSprite = "melos_tiles_walls_bathroom_01h_1",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Wall",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_6",
                northSprite = "melos_tiles_walls_bathroom_01h_7",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Door_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_10",
                northSprite = "melos_tiles_walls_bathroom_01h_11",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Door_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_10",
                northSprite = "melos_tiles_walls_bathroom_01h_11",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Door_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_12",
                northSprite = "melos_tiles_walls_bathroom_01h_15",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Door_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_13",
                northSprite = "melos_tiles_walls_bathroom_01h_14",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_8",
                northSprite = "melos_tiles_walls_bathroom_01h_9",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_4",
                northSprite = "melos_tiles_walls_bathroom_01h_5",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_16",
                northSprite = "melos_tiles_walls_bathroom_01h_21",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_17",
                northSprite = "melos_tiles_walls_bathroom_01h_20",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_18",
                northSprite = "melos_tiles_walls_bathroom_01h_19",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_22",
                northSprite = "melos_tiles_walls_bathroom_01h_23",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_24",
                northSprite = "melos_tiles_walls_bathroom_01h_29",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_25",
                northSprite = "melos_tiles_walls_bathroom_01h_28",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Window_Frame",
            "Tooltip_Melos_Violet_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_26",
                northSprite = "melos_tiles_walls_bathroom_01h_27",
                corner = "melos_tiles_walls_bathroom_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Pillar",
            "Tooltip_Melos_Violet_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Fence_Post",
            "Tooltip_Melos_Violet_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01h_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Fence",
            "Tooltip_Melos_Violet_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01h_84",
                northSprite = "melos_tiles_walls_bathroom_01h_85",
                corner = "melos_tiles_walls_bathroom_01h_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Violet_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01h_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_106", northSprite = "melos_tiles_walls_bathroom_01h_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_105", northSprite = "melos_tiles_walls_bathroom_01h_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_104", northSprite = "melos_tiles_walls_bathroom_01h_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_96", northSprite = "melos_tiles_walls_bathroom_01h_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_97", northSprite = "melos_tiles_walls_bathroom_01h_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_98", northSprite = "melos_tiles_walls_bathroom_01h_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_112", northSprite = "melos_tiles_walls_bathroom_01h_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_113", northSprite = "melos_tiles_walls_bathroom_01h_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Violet_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Violet_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01h_114", northSprite = "melos_tiles_walls_bathroom_01h_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Violet_Cinderblock"),
        "melos_tiles_walls_bathroom_01h_0",
        melosWallsVioletCinderblock
    )

    local melosWallsStrawberryCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Wall",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_0",
                northSprite = "melos_tiles_walls_bathroom_01i_1",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Wall",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_6",
                northSprite = "melos_tiles_walls_bathroom_01i_7",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Door_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_10",
                northSprite = "melos_tiles_walls_bathroom_01i_11",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Door_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_10",
                northSprite = "melos_tiles_walls_bathroom_01i_11",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Door_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_12",
                northSprite = "melos_tiles_walls_bathroom_01i_15",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Door_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_13",
                northSprite = "melos_tiles_walls_bathroom_01i_14",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_8",
                northSprite = "melos_tiles_walls_bathroom_01i_9",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_4",
                northSprite = "melos_tiles_walls_bathroom_01i_5",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_16",
                northSprite = "melos_tiles_walls_bathroom_01i_21",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_17",
                northSprite = "melos_tiles_walls_bathroom_01i_20",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_18",
                northSprite = "melos_tiles_walls_bathroom_01i_19",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_22",
                northSprite = "melos_tiles_walls_bathroom_01i_23",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_24",
                northSprite = "melos_tiles_walls_bathroom_01i_29",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_25",
                northSprite = "melos_tiles_walls_bathroom_01i_28",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Window_Frame",
            "Tooltip_Melos_Strawberry_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_26",
                northSprite = "melos_tiles_walls_bathroom_01i_27",
                corner = "melos_tiles_walls_bathroom_01i_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Pillar",
            "Tooltip_Melos_Strawberry_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Fence_Post",
            "Tooltip_Melos_Strawberry_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01i_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Fence",
            "Tooltip_Melos_Strawberry_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01i_84",
                northSprite = "melos_tiles_walls_bathroom_01i_85",
                corner = "melos_tiles_walls_bathroom_01i_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Strawberry_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01i_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_106", northSprite = "melos_tiles_walls_bathroom_01i_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_105", northSprite = "melos_tiles_walls_bathroom_01i_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_104", northSprite = "melos_tiles_walls_bathroom_01i_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_96", northSprite = "melos_tiles_walls_bathroom_01i_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_97", northSprite = "melos_tiles_walls_bathroom_01i_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_98", northSprite = "melos_tiles_walls_bathroom_01i_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_112", northSprite = "melos_tiles_walls_bathroom_01i_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_113", northSprite = "melos_tiles_walls_bathroom_01i_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Strawberry_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Strawberry_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01i_114", northSprite = "melos_tiles_walls_bathroom_01i_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Strawberry_Cinderblock"),
        "melos_tiles_walls_bathroom_01i_0",
        melosWallsStrawberryCinderblock
    )

    local melosWallsRedCinderblock = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Wall",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_0",
                northSprite = "melos_tiles_walls_bathroom_01j_1",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Wall",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_6",
                northSprite = "melos_tiles_walls_bathroom_01j_7",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Door_Frame",
            "Tooltip_Melos_Red_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_10",
                northSprite = "melos_tiles_walls_bathroom_01j_11",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Door_Frame",
            "Tooltip_Melos_Red_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_10",
                northSprite = "melos_tiles_walls_bathroom_01j_11",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Door_Frame",
            "Tooltip_Melos_Red_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_12",
                northSprite = "melos_tiles_walls_bathroom_01j_15",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Door_Frame",
            "Tooltip_Melos_Red_Cinderblock_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_13",
                northSprite = "melos_tiles_walls_bathroom_01j_14",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_8",
                northSprite = "melos_tiles_walls_bathroom_01j_9",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_4",
                northSprite = "melos_tiles_walls_bathroom_01j_5",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_16",
                northSprite = "melos_tiles_walls_bathroom_01j_21",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_17",
                northSprite = "melos_tiles_walls_bathroom_01j_20",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_18",
                northSprite = "melos_tiles_walls_bathroom_01j_19",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_22",
                northSprite = "melos_tiles_walls_bathroom_01j_23",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_24",
                northSprite = "melos_tiles_walls_bathroom_01j_29",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_25",
                northSprite = "melos_tiles_walls_bathroom_01j_28",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Window_Frame",
            "Tooltip_Melos_Red_Cinderblock_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_26",
                northSprite = "melos_tiles_walls_bathroom_01j_27",
                corner = "melos_tiles_walls_bathroom_01j_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Pillar",
            "Tooltip_Melos_Red_Cinderblock_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Fence_Post",
            "Tooltip_Melos_Red_Cinderblock_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01j_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Fence",
            "Tooltip_Melos_Red_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_01j_84",
                northSprite = "melos_tiles_walls_bathroom_01j_85",
                corner = "melos_tiles_walls_bathroom_01j_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Fence_Corner",
            "Tooltip_Melos_Red_Cinderblock_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_bathroom_01j_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_1",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_106", northSprite = "melos_tiles_walls_bathroom_01j_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_2",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_105", northSprite = "melos_tiles_walls_bathroom_01j_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_3",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_104", northSprite = "melos_tiles_walls_bathroom_01j_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_4",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_96", northSprite = "melos_tiles_walls_bathroom_01j_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_5",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_97", northSprite = "melos_tiles_walls_bathroom_01j_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_Slope_Wall_6",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_98", northSprite = "melos_tiles_walls_bathroom_01j_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_End_Small",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_112", northSprite = "melos_tiles_walls_bathroom_01j_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_End_Medium",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_113", northSprite = "melos_tiles_walls_bathroom_01j_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Cinderblock_Roof_End_Big",
            "Tooltip_Melos_Red_Cinderblock_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_bathroom_01j_114", northSprite = "melos_tiles_walls_bathroom_01j_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Red_Cinderblock"),
        "melos_tiles_walls_bathroom_01j_0",
        melosWallsRedCinderblock
    )
end

local function addMelosWallsBathroomToMenu()
    local melosWallsBathroomWhiteSmallTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Wall",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Wall",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Fence",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_08_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Small_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_White_Small_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_08_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_08_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Small_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_08_0",
        melosWallsBathroomWhiteSmallTiles
    )

    local melosWallsBathroomWhiteMediumTiles1 = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Pillar",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence_Post",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence_Corner",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_40",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Small",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Medium",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Big",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_01_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_01_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Medium_Tiles_1"),
        "melos_tiles_walls_bathroom_ddd_add_01_0",
        melosWallsBathroomWhiteMediumTiles1
    )

    local melosWallsBathroomWhiteMediumTiles2 = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Pillar",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence_Post",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_02_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Fence_Corner",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_40",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Small",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Medium",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Medium_Bathroom_Tiles1_Roof_End_Big",
            "Tooltip_Melos_White_Medium_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_02_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_02_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Medium_Tiles_2"),
        "melos_tiles_walls_bathroom_ddd_add_02_0",
        melosWallsBathroomWhiteMediumTiles2
    )

    local melosWallsBathroomWhiteLargeTiles1 = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Pillar",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence_Post",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_09_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence_Corner",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Small",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Medium",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Big",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_09_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_09_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Large_Tiles_1"),
        "melos_tiles_walls_bathroom_ddd_add_09_0",
        melosWallsBathroomWhiteLargeTiles1
    )

    local melosWallsBathroomWhiteLargeTiles2 = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Wall",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Pillar",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence_Post",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_04_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Fence_Corner",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_40",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Small",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Medium",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Large_Bathroom_Tiles1_Roof_End_Big",
            "Tooltip_Melos_White_Large_Bathroom_Tiles1_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_04_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_04_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Large_Tiles_2"),
        "melos_tiles_walls_bathroom_ddd_add_04_0",
        melosWallsBathroomWhiteLargeTiles2
    )

    local melosWallsBathroomGreyLargeTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_03_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_40",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Grey_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreyBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_03_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_03_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Grey_Large_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_03_0",
        melosWallsBathroomGreyLargeTiles
    )

    local melosWallsBathroomLightBlueLargeTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_05_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_40",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Blue_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Light_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_05_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_05_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Light_Blue_Large_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_05_0",
        melosWallsBathroomLightBlueLargeTiles
    )

    local melosWallsBathroomBlueLargeTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_10_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_86",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Blue_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_10_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_10_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Blue_Large_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_10_0",
        melosWallsBathroomBlueLargeTiles
    )

    local melosWallsBathroomLightGreen = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Pillar",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_07_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Light_Green_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Light_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_07_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_07_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Light_Green"),
        "melos_tiles_walls_bathroom_ddd_add_07_0",
        melosWallsBathroomLightGreen
    )

    local melosWallsBathroomGreenLargeTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Green_Bathroom_Tiles_Window_Frame",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Green_Bathroom_Tiles_Pillar",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Green_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Green_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_11_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Green_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Green_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_11_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_11_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Green_Large_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_11_0",
        melosWallsBathroomGreenLargeTiles
    )

    local melosWallsBathroomYellowLargeTiles = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_0",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_1",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Wall",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_6",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_7",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_10",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_11",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_12",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_15",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_13",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_14",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_8",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_9",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_4",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_5",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_16",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_21",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_17",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_20",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_18",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_19",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_22",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_23",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_24",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_29",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_25",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_28",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_26",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_27",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Pillar",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Fence_Post",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Fence",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_84",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_85",
                corner = "melos_tiles_walls_bathroom_ddd_add_12_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Fence_Corner",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_1",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_106",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_2",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_105",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_3",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_104",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_4",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_96",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_5",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_97",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_Slope_Wall_6",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_98",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_End_Small",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_112",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_End_Medium",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_113",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Bathroom_Tiles_Roof_End_Big",
            "Tooltip_Melos_Yellow_Bathroom_Tiles_Wall",
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
                sprite = "melos_tiles_walls_bathroom_ddd_add_12_114",
                northSprite = "melos_tiles_walls_bathroom_ddd_add_12_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Yellow_Large_Tiles"),
        "melos_tiles_walls_bathroom_ddd_add_12_0",
        melosWallsBathroomYellowLargeTiles
    )
end

local function addMelosWallsBrickToMenu()
    local melosWallsWhiteBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Wall",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_0",
                northSprite = "melos_tiles_walls_brick_01a_1",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Wall",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_6",
                northSprite = "melos_tiles_walls_brick_01a_7",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Door_Frame",
            "Tooltip_Melos_White_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_10",
                northSprite = "melos_tiles_walls_brick_01a_11",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Door_Frame",
            "Tooltip_Melos_White_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_10",
                northSprite = "melos_tiles_walls_brick_01a_11",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Door_Frame",
            "Tooltip_Melos_White_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_12",
                northSprite = "melos_tiles_walls_brick_01a_15",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Door_Frame",
            "Tooltip_Melos_White_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_13",
                northSprite = "melos_tiles_walls_brick_01a_14",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_8",
                northSprite = "melos_tiles_walls_brick_01a_9",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_4",
                northSprite = "melos_tiles_walls_brick_01a_5",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_16",
                northSprite = "melos_tiles_walls_brick_01a_21",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_17",
                northSprite = "melos_tiles_walls_brick_01a_20",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_18",
                northSprite = "melos_tiles_walls_brick_01a_19",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_22",
                northSprite = "melos_tiles_walls_brick_01a_23",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_24",
                northSprite = "melos_tiles_walls_brick_01a_29",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_25",
                northSprite = "melos_tiles_walls_brick_01a_28",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Window_Frame",
            "Tooltip_Melos_White_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01a_26",
                northSprite = "melos_tiles_walls_brick_01a_27",
                corner = "melos_tiles_walls_brick_01a_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Pillar",
            "Tooltip_Melos_White_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01a_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Fence_Post",
            "Tooltip_Melos_White_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01a_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Fence",
            "Tooltip_Melos_White_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01a_84",
                northSprite = "melos_tiles_walls_brick_01a_85",
                corner = "melos_tiles_walls_brick_01a_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Fence_Corner",
            "Tooltip_Melos_White_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01a_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_106", northSprite = "melos_tiles_walls_brick_01a_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_105", northSprite = "melos_tiles_walls_brick_01a_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_104", northSprite = "melos_tiles_walls_brick_01a_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_96", northSprite = "melos_tiles_walls_brick_01a_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_97", northSprite = "melos_tiles_walls_brick_01a_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_98", northSprite = "melos_tiles_walls_brick_01a_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_End_Small",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_112", northSprite = "melos_tiles_walls_brick_01a_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_End_Medium",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_113", northSprite = "melos_tiles_walls_brick_01a_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_White_Brick_Roof_End_Big",
            "Tooltip_Melos_White_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01a_114", northSprite = "melos_tiles_walls_brick_01a_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_White_Brick"),
        "melos_tiles_walls_brick_01a_0",
        melosWallsWhiteBrick
    )

    local melosWallsRedBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Wall",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_0",
                northSprite = "melos_tiles_walls_brick_01b_1",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Wall",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_6",
                northSprite = "melos_tiles_walls_brick_01b_7",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Door_Frame",
            "Tooltip_Melos_Red_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_10",
                northSprite = "melos_tiles_walls_brick_01b_11",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Door_Frame",
            "Tooltip_Melos_Red_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_10",
                northSprite = "melos_tiles_walls_brick_01b_11",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Door_Frame",
            "Tooltip_Melos_Red_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_12",
                northSprite = "melos_tiles_walls_brick_01b_15",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Door_Frame",
            "Tooltip_Melos_Red_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_13",
                northSprite = "melos_tiles_walls_brick_01b_14",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_8",
                northSprite = "melos_tiles_walls_brick_01b_9",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_4",
                northSprite = "melos_tiles_walls_brick_01b_5",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_16",
                northSprite = "melos_tiles_walls_brick_01b_21",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_17",
                northSprite = "melos_tiles_walls_brick_01b_20",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_18",
                northSprite = "melos_tiles_walls_brick_01b_19",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_22",
                northSprite = "melos_tiles_walls_brick_01b_23",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_24",
                northSprite = "melos_tiles_walls_brick_01b_29",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_25",
                northSprite = "melos_tiles_walls_brick_01b_28",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Window_Frame",
            "Tooltip_Melos_Red_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01b_26",
                northSprite = "melos_tiles_walls_brick_01b_27",
                corner = "melos_tiles_walls_brick_01b_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Pillar",
            "Tooltip_Melos_Red_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01b_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Fence_Post",
            "Tooltip_Melos_Red_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01b_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Fence",
            "Tooltip_Melos_Red_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01b_84",
                northSprite = "melos_tiles_walls_brick_01b_85",
                corner = "melos_tiles_walls_brick_01b_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Fence_Corner",
            "Tooltip_Melos_Red_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01b_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_106", northSprite = "melos_tiles_walls_brick_01b_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_105", northSprite = "melos_tiles_walls_brick_01b_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_104", northSprite = "melos_tiles_walls_brick_01b_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_96", northSprite = "melos_tiles_walls_brick_01b_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_97", northSprite = "melos_tiles_walls_brick_01b_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_98", northSprite = "melos_tiles_walls_brick_01b_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_End_Small",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_112", northSprite = "melos_tiles_walls_brick_01b_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_End_Medium",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_113", northSprite = "melos_tiles_walls_brick_01b_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Red_Brick_Roof_End_Big",
            "Tooltip_Melos_Red_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01b_114", northSprite = "melos_tiles_walls_brick_01b_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Red_Brick"),
        "melos_tiles_walls_brick_01b_0",
        melosWallsRedBrick
    )


    local melosWallsTurquoiseBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Wall",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_0",
                northSprite = "melos_tiles_walls_brick_01c_1",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Wall",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_6",
                northSprite = "melos_tiles_walls_brick_01c_7",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Door_Frame",
            "Tooltip_Melos_Turquoise_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_10",
                northSprite = "melos_tiles_walls_brick_01c_11",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Door_Frame",
            "Tooltip_Melos_Turquoise_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_10",
                northSprite = "melos_tiles_walls_brick_01c_11",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Door_Frame",
            "Tooltip_Melos_Turquoise_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_12",
                northSprite = "melos_tiles_walls_brick_01c_15",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Door_Frame",
            "Tooltip_Melos_Turquoise_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_13",
                northSprite = "melos_tiles_walls_brick_01c_14",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_8",
                northSprite = "melos_tiles_walls_brick_01c_9",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_4",
                northSprite = "melos_tiles_walls_brick_01c_5",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_16",
                northSprite = "melos_tiles_walls_brick_01c_21",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_17",
                northSprite = "melos_tiles_walls_brick_01c_20",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_18",
                northSprite = "melos_tiles_walls_brick_01c_19",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_22",
                northSprite = "melos_tiles_walls_brick_01c_23",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_24",
                northSprite = "melos_tiles_walls_brick_01c_29",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_25",
                northSprite = "melos_tiles_walls_brick_01c_28",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Window_Frame",
            "Tooltip_Melos_Turquoise_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01c_26",
                northSprite = "melos_tiles_walls_brick_01c_27",
                corner = "melos_tiles_walls_brick_01c_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Pillar",
            "Tooltip_Melos_Turquoise_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01c_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Fence_Post",
            "Tooltip_Melos_Turquoise_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01c_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Fence",
            "Tooltip_Melos_Turquoise_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01c_84",
                northSprite = "melos_tiles_walls_brick_01c_85",
                corner = "melos_tiles_walls_brick_01c_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Fence_Corner",
            "Tooltip_Melos_Turquoise_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01c_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_106", northSprite = "melos_tiles_walls_brick_01c_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_105", northSprite = "melos_tiles_walls_brick_01c_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_104", northSprite = "melos_tiles_walls_brick_01c_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_96", northSprite = "melos_tiles_walls_brick_01c_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_97", northSprite = "melos_tiles_walls_brick_01c_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_98", northSprite = "melos_tiles_walls_brick_01c_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_End_Small",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_112", northSprite = "melos_tiles_walls_brick_01c_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_End_Medium",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_113", northSprite = "melos_tiles_walls_brick_01c_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Turquoise_Brick_Roof_End_Big",
            "Tooltip_Melos_Turquoise_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.TurquoiseBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01c_114", northSprite = "melos_tiles_walls_brick_01c_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Turquoise_Brick"),
        "melos_tiles_walls_brick_01c_0",
        melosWallsTurquoiseBrick
    )

    local melosWallsBrownBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Wall",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_0",
                northSprite = "melos_tiles_walls_brick_01d_1",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Wall",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_6",
                northSprite = "melos_tiles_walls_brick_01d_7",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Door_Frame",
            "Tooltip_Melos_Brown_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_10",
                northSprite = "melos_tiles_walls_brick_01d_11",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Door_Frame",
            "Tooltip_Melos_Brown_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_10",
                northSprite = "melos_tiles_walls_brick_01d_11",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Door_Frame",
            "Tooltip_Melos_Brown_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_12",
                northSprite = "melos_tiles_walls_brick_01d_15",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Door_Frame",
            "Tooltip_Melos_Brown_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_13",
                northSprite = "melos_tiles_walls_brick_01d_14",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_8",
                northSprite = "melos_tiles_walls_brick_01d_9",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_4",
                northSprite = "melos_tiles_walls_brick_01d_5",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_16",
                northSprite = "melos_tiles_walls_brick_01d_21",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_17",
                northSprite = "melos_tiles_walls_brick_01d_20",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_18",
                northSprite = "melos_tiles_walls_brick_01d_19",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_22",
                northSprite = "melos_tiles_walls_brick_01d_23",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_24",
                northSprite = "melos_tiles_walls_brick_01d_29",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_25",
                northSprite = "melos_tiles_walls_brick_01d_28",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Window_Frame",
            "Tooltip_Melos_Brown_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01d_26",
                northSprite = "melos_tiles_walls_brick_01d_27",
                corner = "melos_tiles_walls_brick_01d_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Pillar",
            "Tooltip_Melos_Brown_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01d_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Fence_Post",
            "Tooltip_Melos_Brown_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01d_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Fence",
            "Tooltip_Melos_Brown_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01d_84",
                northSprite = "melos_tiles_walls_brick_01d_85",
                corner = "melos_tiles_walls_brick_01d_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Fence_Corner",
            "Tooltip_Melos_Brown_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01d_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_106", northSprite = "melos_tiles_walls_brick_01d_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_105", northSprite = "melos_tiles_walls_brick_01d_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_104", northSprite = "melos_tiles_walls_brick_01d_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_96", northSprite = "melos_tiles_walls_brick_01d_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_97", northSprite = "melos_tiles_walls_brick_01d_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_98", northSprite = "melos_tiles_walls_brick_01d_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_End_Small",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_112", northSprite = "melos_tiles_walls_brick_01d_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_End_Medium",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_113", northSprite = "melos_tiles_walls_brick_01d_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Brown_Brick_Roof_End_Big",
            "Tooltip_Melos_Brown_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BrownBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01d_114", northSprite = "melos_tiles_walls_brick_01d_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Brown_Brick"),
        "melos_tiles_walls_brick_01d_0",
        melosWallsBrownBrick
    )

    local melosWallsBlueBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Wall",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_0",
                northSprite = "melos_tiles_walls_brick_01e_1",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Wall",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_6",
                northSprite = "melos_tiles_walls_brick_01e_7",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Door_Frame",
            "Tooltip_Melos_Blue_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_10",
                northSprite = "melos_tiles_walls_brick_01e_11",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Door_Frame",
            "Tooltip_Melos_Blue_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_10",
                northSprite = "melos_tiles_walls_brick_01e_11",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Door_Frame",
            "Tooltip_Melos_Blue_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_12",
                northSprite = "melos_tiles_walls_brick_01e_15",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Door_Frame",
            "Tooltip_Melos_Blue_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_13",
                northSprite = "melos_tiles_walls_brick_01e_14",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_8",
                northSprite = "melos_tiles_walls_brick_01e_9",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_4",
                northSprite = "melos_tiles_walls_brick_01e_5",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_16",
                northSprite = "melos_tiles_walls_brick_01e_21",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_17",
                northSprite = "melos_tiles_walls_brick_01e_20",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_18",
                northSprite = "melos_tiles_walls_brick_01e_19",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_22",
                northSprite = "melos_tiles_walls_brick_01e_23",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_24",
                northSprite = "melos_tiles_walls_brick_01e_29",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_25",
                northSprite = "melos_tiles_walls_brick_01e_28",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Window_Frame",
            "Tooltip_Melos_Blue_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01e_26",
                northSprite = "melos_tiles_walls_brick_01e_27",
                corner = "melos_tiles_walls_brick_01e_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Pillar",
            "Tooltip_Melos_Blue_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01e_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Fence_Post",
            "Tooltip_Melos_Blue_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01e_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Fence",
            "Tooltip_Melos_Blue_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01e_84",
                northSprite = "melos_tiles_walls_brick_01e_85",
                corner = "melos_tiles_walls_brick_01e_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Fence_Corner",
            "Tooltip_Melos_Blue_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01e_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_106", northSprite = "melos_tiles_walls_brick_01e_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_105", northSprite = "melos_tiles_walls_brick_01e_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_104", northSprite = "melos_tiles_walls_brick_01e_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_96", northSprite = "melos_tiles_walls_brick_01e_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_97", northSprite = "melos_tiles_walls_brick_01e_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_98", northSprite = "melos_tiles_walls_brick_01e_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_End_Small",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_112", northSprite = "melos_tiles_walls_brick_01e_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_End_Medium",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_113", northSprite = "melos_tiles_walls_brick_01e_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Blue_Brick_Roof_End_Big",
            "Tooltip_Melos_Blue_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlueBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01e_114", northSprite = "melos_tiles_walls_brick_01e_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Blue_Brick"),
        "melos_tiles_walls_brick_01e_0",
        melosWallsBlueBrick
    )

    local melosWallsOrangeBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Wall",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_0",
                northSprite = "melos_tiles_walls_brick_01f_1",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Wall",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_6",
                northSprite = "melos_tiles_walls_brick_01f_7",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Door_Frame",
            "Tooltip_Melos_Orange_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_10",
                northSprite = "melos_tiles_walls_brick_01f_11",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Door_Frame",
            "Tooltip_Melos_Orange_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_10",
                northSprite = "melos_tiles_walls_brick_01f_11",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Door_Frame",
            "Tooltip_Melos_Orange_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_12",
                northSprite = "melos_tiles_walls_brick_01f_15",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Door_Frame",
            "Tooltip_Melos_Orange_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_13",
                northSprite = "melos_tiles_walls_brick_01f_14",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_8",
                northSprite = "melos_tiles_walls_brick_01f_9",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_4",
                northSprite = "melos_tiles_walls_brick_01f_5",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_16",
                northSprite = "melos_tiles_walls_brick_01f_21",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_17",
                northSprite = "melos_tiles_walls_brick_01f_20",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_18",
                northSprite = "melos_tiles_walls_brick_01f_19",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_22",
                northSprite = "melos_tiles_walls_brick_01f_23",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_24",
                northSprite = "melos_tiles_walls_brick_01f_29",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_25",
                northSprite = "melos_tiles_walls_brick_01f_28",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Window_Frame",
            "Tooltip_Melos_Orange_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01f_26",
                northSprite = "melos_tiles_walls_brick_01f_27",
                corner = "melos_tiles_walls_brick_01f_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Pillar",
            "Tooltip_Melos_Orange_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01f_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Fence_Post",
            "Tooltip_Melos_Orange_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01f_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Fence",
            "Tooltip_Melos_Orange_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01f_84",
                northSprite = "melos_tiles_walls_brick_01f_85",
                corner = "melos_tiles_walls_brick_01f_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Fence_Corner",
            "Tooltip_Melos_Orange_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01f_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_106", northSprite = "melos_tiles_walls_brick_01f_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_105", northSprite = "melos_tiles_walls_brick_01f_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_104", northSprite = "melos_tiles_walls_brick_01f_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_96", northSprite = "melos_tiles_walls_brick_01f_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_97", northSprite = "melos_tiles_walls_brick_01f_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_98", northSprite = "melos_tiles_walls_brick_01f_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_End_Small",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_112", northSprite = "melos_tiles_walls_brick_01f_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_End_Medium",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_113", northSprite = "melos_tiles_walls_brick_01f_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Orange_Brick_Roof_End_Big",
            "Tooltip_Melos_Orange_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.OrangeBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01f_114", northSprite = "melos_tiles_walls_brick_01f_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Orange_Brick"),
        "melos_tiles_walls_brick_01f_0",
        melosWallsOrangeBrick
    )


    local melosWallsGreenBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Wall",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_0",
                northSprite = "melos_tiles_walls_brick_01g_1",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Wall",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_6",
                northSprite = "melos_tiles_walls_brick_01g_7",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Door_Frame",
            "Tooltip_Melos_Green_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_10",
                northSprite = "melos_tiles_walls_brick_01g_11",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Door_Frame",
            "Tooltip_Melos_Green_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_10",
                northSprite = "melos_tiles_walls_brick_01g_11",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Door_Frame",
            "Tooltip_Melos_Green_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_12",
                northSprite = "melos_tiles_walls_brick_01g_15",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Door_Frame",
            "Tooltip_Melos_Green_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_13",
                northSprite = "melos_tiles_walls_brick_01g_14",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_8",
                northSprite = "melos_tiles_walls_brick_01g_9",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_4",
                northSprite = "melos_tiles_walls_brick_01g_5",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_16",
                northSprite = "melos_tiles_walls_brick_01g_21",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_17",
                northSprite = "melos_tiles_walls_brick_01g_20",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_18",
                northSprite = "melos_tiles_walls_brick_01g_19",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_22",
                northSprite = "melos_tiles_walls_brick_01g_23",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_24",
                northSprite = "melos_tiles_walls_brick_01g_29",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_25",
                northSprite = "melos_tiles_walls_brick_01g_28",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Window_Frame",
            "Tooltip_Melos_Green_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01g_26",
                northSprite = "melos_tiles_walls_brick_01g_27",
                corner = "melos_tiles_walls_brick_01g_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Pillar",
            "Tooltip_Melos_Green_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01g_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Fence_Post",
            "Tooltip_Melos_Green_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01g_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Fence",
            "Tooltip_Melos_Green_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01g_84",
                northSprite = "melos_tiles_walls_brick_01g_85",
                corner = "melos_tiles_walls_brick_01g_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Fence_Corner",
            "Tooltip_Melos_Green_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01g_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_106", northSprite = "melos_tiles_walls_brick_01g_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_105", northSprite = "melos_tiles_walls_brick_01g_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_104", northSprite = "melos_tiles_walls_brick_01g_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_96", northSprite = "melos_tiles_walls_brick_01g_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_97", northSprite = "melos_tiles_walls_brick_01g_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_98", northSprite = "melos_tiles_walls_brick_01g_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_End_Small",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_112", northSprite = "melos_tiles_walls_brick_01g_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_End_Medium",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_113", northSprite = "melos_tiles_walls_brick_01g_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Green_Brick_Roof_End_Big",
            "Tooltip_Melos_Green_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreenBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01g_114", northSprite = "melos_tiles_walls_brick_01g_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Green_Brick"),
        "melos_tiles_walls_brick_01g_0",
        melosWallsGreenBrick
    )


    local melosWallsPurpleBrick = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Wall",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_0",
                northSprite = "melos_tiles_walls_brick_01h_1",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Wall",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_6",
                northSprite = "melos_tiles_walls_brick_01h_7",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Door_Frame",
            "Tooltip_Melos_Purple_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_10",
                northSprite = "melos_tiles_walls_brick_01h_11",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Door_Frame",
            "Tooltip_Melos_Purple_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_10",
                northSprite = "melos_tiles_walls_brick_01h_11",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Door_Frame",
            "Tooltip_Melos_Purple_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_12",
                northSprite = "melos_tiles_walls_brick_01h_15",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Door_Frame",
            "Tooltip_Melos_Purple_Brick_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_13",
                northSprite = "melos_tiles_walls_brick_01h_14",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_8",
                northSprite = "melos_tiles_walls_brick_01h_9",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_4",
                northSprite = "melos_tiles_walls_brick_01h_5",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_16",
                northSprite = "melos_tiles_walls_brick_01h_21",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_17",
                northSprite = "melos_tiles_walls_brick_01h_20",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_18",
                northSprite = "melos_tiles_walls_brick_01h_19",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_22",
                northSprite = "melos_tiles_walls_brick_01h_23",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_24",
                northSprite = "melos_tiles_walls_brick_01h_29",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_25",
                northSprite = "melos_tiles_walls_brick_01h_28",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Window_Frame",
            "Tooltip_Melos_Purple_Brick_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "melos_tiles_walls_brick_01h_26",
                northSprite = "melos_tiles_walls_brick_01h_27",
                corner = "melos_tiles_walls_brick_01h_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Pillar",
            "Tooltip_Melos_Purple_Brick_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "melos_tiles_walls_brick_01h_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Fence_Post",
            "Tooltip_Melos_Purple_Brick_Fence_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01h_87" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Fence",
            "Tooltip_Melos_Purple_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_walls_brick_01h_84",
                northSprite = "melos_tiles_walls_brick_01h_85",
                corner = "melos_tiles_walls_brick_01h_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Fence_Corner",
            "Tooltip_Melos_Purple_Brick_Fence",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_walls_brick_01h_86" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_1",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_106", northSprite = "melos_tiles_walls_brick_01h_107" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_2",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_105", northSprite = "melos_tiles_walls_brick_01h_108" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_3",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_104", northSprite = "melos_tiles_walls_brick_01h_109" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_4",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_96", northSprite = "melos_tiles_walls_brick_01h_101" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_5",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_97", northSprite = "melos_tiles_walls_brick_01h_100" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_Slope_Wall_6",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_98", northSprite = "melos_tiles_walls_brick_01h_99" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_End_Small",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleSmallBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_112", northSprite = "melos_tiles_walls_brick_01h_117" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_End_Medium",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_113", northSprite = "melos_tiles_walls_brick_01h_116" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Purple_Brick_Roof_End_Big",
            "Tooltip_Melos_Purple_Brick_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.PurpleBigBrickWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "melos_tiles_walls_brick_01h_114", northSprite = "melos_tiles_walls_brick_01h_115" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Melos_Walls_Purple_Brick"),
        "melos_tiles_walls_brick_01h_0",
        melosWallsPurpleBrick
    )
end

local function addDoorsToMenu()
    local melosDoorObjects = {}
    local doorOptionsTable = {
        { start = 0,  stop = 23, baseName = "melos_tiles_doors_02_" },
        { start = 48, stop = 63, baseName = "melos_tiles_doors_02_" },
    }
    for _, doorOptions in ipairs(doorOptionsTable) do
        for i = doorOptions.start, doorOptions.stop, 4 do
            local spriteBaseName = doorOptions.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                melosDoorObjects,
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Wooden_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.WoodenDoorRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        canBarricade = true,
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = sprite,
                        northSprite = northSprite,
                        openSprite = openSprite,
                        openNorthSprite = openNorthSprite
                    }
                )
            )
        end
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Doors"),
        "melos_tiles_doors_02_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "melos_tiles_doors_02_0",
        melosDoorObjects
    )

    melosDoorObjects = {}
    doorOptionsTable = {
        { start = 0,  stop = 47,  baseName = "melos_tiles_doors_04_", recipe = "WoodenSingleGlassDoorRecipe" },
        { start = 0,  stop = 7,   baseName = "melos_tiles_doors_01_", recipe = "WoodenDoubleGlassDoorRecipe" },
        { start = 32, stop = 127, baseName = "melos_tiles_doors_01_", recipe = "WoodenSingleGlassDoorRecipe" },
        { start = 40, stop = 47,  baseName = "melos_tiles_doors_02_", recipe = "WoodenSingleGlassDoorRecipe" },
        { start = 64, stop = 79,  baseName = "melos_tiles_doors_02_", recipe = "WoodenSingleGlassDoorRecipe" },
        { start = 80, stop = 83,  baseName = "melos_tiles_doors_02_", recipe = "WoodenDoubleGlassDoorRecipe" },
        { start = 96, stop = 107, baseName = "melos_tiles_doors_02_", recipe = "WoodenDoubleGlassDoorRecipe" },
        { start = 96, stop = 119, baseName = "melos_tiles_doors_03_", recipe = "WoodenDoubleGlassDoorRecipe" },
    }
    for _, doorOptions in ipairs(doorOptionsTable) do
        for i = doorOptions.start, doorOptions.stop, 4 do
            local spriteBaseName = doorOptions.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                melosDoorObjects,
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Wooden_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu[doorOptions.recipe],
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = sprite,
                        northSprite = northSprite,
                        openSprite = openSprite,
                        openNorthSprite = openNorthSprite
                    }
                )
            )
        end
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_Glass_Doors"),
        "melos_tiles_doors_02_40",
        melosDoorObjects
    )

    local melosMetalDoorObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Blue_Metal_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_24",
                northSprite = "melos_tiles_doors_01_25",
                openSprite = "melos_tiles_doors_01_26",
                openNorthSprite = "melos_tiles_doors_01_27"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Blue_Metal_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_28",
                northSprite = "melos_tiles_doors_01_29",
                openSprite = "melos_tiles_doors_01_30",
                openNorthSprite = "melos_tiles_doors_01_31"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Black_2_Pane_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalSingleGlassDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_8",
                northSprite = "melos_tiles_doors_01_9",
                openSprite = "melos_tiles_doors_01_10",
                openNorthSprite = "melos_tiles_doors_01_11"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Black_2_Pane_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalSingleGlassDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_12",
                northSprite = "melos_tiles_doors_01_13",
                openSprite = "melos_tiles_doors_01_14",
                openNorthSprite = "melos_tiles_doors_01_15"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Black_2_Pane_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalSingleGlassDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_16",
                northSprite = "melos_tiles_doors_01_17",
                openSprite = "melos_tiles_doors_01_18",
                openNorthSprite = "melos_tiles_doors_01_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Black_2_Pane_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalSingleGlassDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_doors_01_20",
                northSprite = "melos_tiles_doors_01_21",
                openSprite = "melos_tiles_doors_01_22",
                openNorthSprite = "melos_tiles_doors_01_23"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_Metal_Doors"),
        "melos_tiles_doors_01_24",
        melosMetalDoorObjects
    )
end

local function addGarageDoorsToMenu()
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

    local melosGarageDoorsObjects = {}
    local garageDoorSpriteRanges = {
        set1 = { 0, 16, 32, 48, 64, 96 },
        set2 = { 0, 32, 64, 96 }
    }

    for _, startNumber in ipairs(garageDoorSpriteRanges.set1) do
        table.insert(melosGarageDoorsObjects, create3TileGarageDoor("melos_tiles_walls_garage_01_", startNumber))
    end

    for _, startNumber in ipairs(garageDoorSpriteRanges.set2) do
        table.insert(melosGarageDoorsObjects, create3TileGarageDoor("melos_tiles_walls_garage_02_", startNumber))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
        "melos_tiles_walls_garage_01_0",
        melosGarageDoorsObjects
    )

    melosGarageDoorsObjects = {}
    for _, startNumber in ipairs(garageDoorSpriteRanges.set1) do
        table.insert(melosGarageDoorsObjects, create4TileGarageDoor("melos_tiles_walls_garage_01_", startNumber))
    end

    for _, startNumber in ipairs(garageDoorSpriteRanges.set2) do
        table.insert(melosGarageDoorsObjects, create4TileGarageDoor("melos_tiles_walls_garage_02_", startNumber))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
        "melos_tiles_walls_garage_01_0",
        melosGarageDoorsObjects
    )
end

local function addWindowsPlusToMenu()
    local function createWindowObject(baseName, startSpriteNumber)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Windows_Generic",
            BuildingMenu.onBuildWindow,
            BuildingMenu.WindowRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = baseName .. startSpriteNumber,
                northSprite = baseName .. (startSpriteNumber + 1)
            }
        )
    end

    local melosWindows = {}
    local dataRusticWindows = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120 }
    for _, startNumber in ipairs(dataRusticWindows) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_03_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        "melos_tiles_windows_03_0",
        getText("IGUI_BuildingMenuSubCat_Windows_Rustic_Windows"),
        "melos_tiles_windows_03_0",
        melosWindows
    )

    melosWindows = {}
    local dataRound = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72 }
    for _, startNumber in ipairs(dataRound) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_04_", startNumber))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Round_Windows"),
        "melos_tiles_windows_04_0",
        melosWindows
    )

    melosWindows = {}
    local dataModern1 = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112 }
    for _, startNumber in ipairs(dataModern1) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_05_", startNumber))
    end
    for _, startNumber in ipairs(dataModern1) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_05a_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Modern1_Windows"),
        "melos_tiles_windows_05_0",
        melosWindows
    )

    melosWindows = {}
    local dataModern2 = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112 }
    for _, startNumber in ipairs(dataModern2) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_05b_", startNumber))
    end
    for _, startNumber in ipairs(dataModern2) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_05c_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Modern2_Windows"),
        "melos_tiles_windows_05b_0",
        melosWindows
    )

    melosWindows = {}
    local dataModernExtended1 = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112 }
    for _, startNumber in ipairs(dataModernExtended1) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_06_", startNumber))
    end
    for _, startNumber in ipairs(dataModernExtended1) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_06a_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Modern_Extended1_Windows"),
        "melos_tiles_windows_06_0",
        melosWindows
    )

    melosWindows = {}
    local dataModernExtended2 = { 0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112 }
    for _, startNumber in ipairs(dataModernExtended2) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_06b_", startNumber))
    end
    for _, startNumber in ipairs(dataModern2) do
        table.insert(melosWindows, createWindowObject("melos_tiles_windows_06c_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Modern_Extended2_Windows"),
        "melos_tiles_windows_06b_0",
        melosWindows
    )

    local melosDarkRedBrickTripleLarge = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_1_Left",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_0",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_5",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_1_Middle",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_1",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_4",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_1_Right",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_2",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_3",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_2_Left",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_32",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_37",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_2_Middle",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_33",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_36",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_2_Right",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_34",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_35",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_3_Left",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_64",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_69",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_3_Middle",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_65",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_68",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall_3_Right",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_66",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_67",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Wall",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.RedBigWindowWoodWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_98",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_99",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Pillar",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_54",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_55",
                eastSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_62",
                southSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_63"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Post",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_38",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_47",
                eastSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_39",
                southSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Railing",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_59",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_56",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Railing",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_58",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_57",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Corner",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_60"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Railing",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_78",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Railing",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_dark_red_brick_01_78",
                corner = "melos_tiles_windows_triple_large_dark_red_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Corner",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Dark_Red_Brick_Glass_Post",
            "Tooltip_Melos_Dark_Red_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.RedSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_dark_red_brick_01_87"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Dark_Red_Brick_Triple_Large"),
        "melos_tiles_windows_triple_large_dark_red_brick_01_0",
        melosDarkRedBrickTripleLarge
    )

    local melosGreyBrickTripleLarge = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_1_Left",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_0",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_5",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_1_Middle",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_1",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_4",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_1_Right",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_2",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_3",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_2_Left",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_32",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_37",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_2_Middle",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_33",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_36",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_2_Right",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_34",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_35",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_3_Left",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_64",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_69",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_3_Middle",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_65",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_68",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall_3_Right",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_66",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_67",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Wall",
            "Tooltip_Melos_Grey_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.GreyBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_98",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_99",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Pillar",
            "Tooltip_Melos_Grey_Brick_Glass_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_54",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_55",
                eastSprite = "melos_tiles_windows_triple_large_grey_brick_01_62",
                southSprite = "melos_tiles_windows_triple_large_grey_brick_01_63"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Post",
            "Tooltip_Melos_Grey_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_38",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_47",
                eastSprite = "melos_tiles_windows_triple_large_grey_brick_01_39",
                southSprite = "melos_tiles_windows_triple_large_grey_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Railing",
            "Tooltip_Melos_Grey_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_59",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_56",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Railing",
            "Tooltip_Melos_Grey_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_58",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_57",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Corner",
            "Tooltip_Melos_Grey_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_60"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Railing",
            "Tooltip_Melos_Grey_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_78",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Railing",
            "Tooltip_Melos_Grey_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_grey_brick_01_78",
                corner = "melos_tiles_windows_triple_large_grey_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Corner",
            "Tooltip_Melos_Grey_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Grey_Brick_Glass_Post",
            "Tooltip_Melos_Grey_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.GreySmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_grey_brick_01_87"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Dark_Grey_Brick_Triple_Large"),
        "melos_tiles_windows_triple_large_grey_brick_01_0",
        melosGreyBrickTripleLarge
    )

    local melosYellowBrickTripleLarge = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_1_Left",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_0",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_5",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_1_Middle",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_1",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_4",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_1_Right",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_2",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_3",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_2_Left",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_32",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_37",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_2_Middle",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_33",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_36",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_2_Right",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_34",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_35",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_3_Left",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_64",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_69",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_3_Middle",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_65",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_68",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall_3_Right",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_66",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_67",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Wall",
            "Tooltip_Melos_Yellow_Brick_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.YellowBigWoodWindowWallRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_98",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_99",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_62"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Pillar",
            "Tooltip_Melos_Yellow_Brick_Glass_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_54",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_55",
                eastSprite = "melos_tiles_windows_triple_large_yellow_brick_01_62",
                southSprite = "melos_tiles_windows_triple_large_yellow_brick_01_63"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Post",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_38",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_47",
                eastSprite = "melos_tiles_windows_triple_large_yellow_brick_01_39",
                southSprite = "melos_tiles_windows_triple_large_yellow_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Railing",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_59",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_56",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Railing",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_58",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_57",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_61"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Corner",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_60"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Railing",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_78",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Railing",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_79",
                northSprite = "melos_tiles_windows_triple_large_yellow_brick_01_78",
                corner = "melos_tiles_windows_triple_large_yellow_brick_01_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Corner",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_86"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Melos_Yellow_Brick_Glass_Post",
            "Tooltip_Melos_Yellow_Brick_Glass_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.YellowSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                sprite = "melos_tiles_windows_triple_large_yellow_brick_01_87"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Windows"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Windows_Dark_Yellow_Brick_Triple_Large"),
        "melos_tiles_windows_triple_large_yellow_brick_01_0",
        melosYellowBrickTripleLarge
    )
end

local function addHighFencesToMenu()
    local melosWireFences = {
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "melos_tiles_fencing_02_50",
                sprite2 = "melos_tiles_fencing_02_51",
                northSprite = "melos_tiles_fencing_02_49",
                northSprite2 = "melos_tiles_fencing_02_48"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_fencing_02_52" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "melos_tiles_fencing_02_58",
                sprite2 = "melos_tiles_fencing_02_59",
                northSprite = "melos_tiles_fencing_02_57",
                northSprite2 = "melos_tiles_fencing_02_56"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighWireFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_fencing_02_60" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_fencing_02_36",
                northSprite = "melos_tiles_fencing_02_37",
                openSprite = "melos_tiles_fencing_02_38",
                openNorthSprite = "melos_tiles_fencing_02_39"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigMetalWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "melos_tiles_fencing_02_32",
                northSprite = "melos_tiles_fencing_02_33"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighWireFencePostRecipe,
            "Make Metal Fences",
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "melos_tiles_fencing_02_34", northSprite = "melos_tiles_fencing_02_35" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalDoorRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                dontNeedFrame = true,
                canBarricade = false,
                isThumpable = false
            },
            {
                sprite = "melos_tiles_fencing_02_44",
                northSprite = "melos_tiles_fencing_02_45",
                openSprite = "melos_tiles_fencing_02_46",
                openNorthSprite = "melos_tiles_fencing_02_47"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "melos_tiles_fencing_02_50",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_High"),
        "melos_tiles_fencing_02_50",
        melosWireFences
    )
end

local function addLowAndRailingFencesToMenu()
    local function createStairRailingsObject(baseName, startSpriteNumber)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wood_Stair_Railings",
            "Tooltip_Wood_Stair_Railings",
            BuildingMenu.onBuildStairRailings,
            BuildingMenu.WoodStairRailingsRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = baseName .. startSpriteNumber,
                sprite2 = baseName .. (startSpriteNumber + 1),
                sprite3 = baseName .. (startSpriteNumber + 2),
                sprite4 = baseName .. (startSpriteNumber + 3),
                sprite5 = baseName .. (startSpriteNumber + 4),
                northSprite = baseName .. (startSpriteNumber + 12),
                northSprite2 = baseName .. (startSpriteNumber + 11),
                northSprite3 = baseName .. (startSpriteNumber + 10),
                northSprite4 = baseName .. (startSpriteNumber + 9),
                northSprite5 = baseName .. (startSpriteNumber + 8),
            }
        )
    end

    local stairRailings = {};
    local dataStairRailings = { 0, 24, 48, 72, 96 };
    for _, startNumber in ipairs(dataStairRailings) do
        table.insert(stairRailings, createStairRailingsObject("melos_tiles_railings_01_", startNumber));
    end

    dataStairRailings = { 0, 24, 48, 72, 96 };
    for _, startNumber in ipairs(dataStairRailings) do
        table.insert(stairRailings, createStairRailingsObject("melos_tiles_railings_02_", startNumber));
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Fencing"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Fencing_Stair_Railings"),
        "melos_tiles_railings_02_60",
        stairRailings
    )


    local function createRailingObjects(prefix, sprites)
        local railingObjects = {
            BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_Wooden_Railing_Post",
                "Tooltip_Wooden_Railing_Post",
                BuildingMenu.onBuildWall,
                BuildingMenu.WoodenFenceRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureSmall",
                    canBeAlwaysPlaced = true,
                    canPassThrough = true,
                    canBarricade = false,
                    isCorner = true
                },
                { sprite = prefix .. sprites.post }
            ),
            BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_Wooden_Railing_Post",
                "Tooltip_Wooden_Railing_Post",
                BuildingMenu.onBuildWall,
                BuildingMenu.WoodenFenceRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureSmall",
                    canBeAlwaysPlaced = true,
                    canPassThrough = true,
                    canBarricade = false,
                    isCorner = true
                },
                { sprite = prefix .. sprites.postAlt, northSprite = prefix .. sprites.postAltNorth }
            ),
            BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_Wooden_Railing_Tall_Post",
                "Tooltip_Wooden_Railing_Tall_Post",
                BuildingMenu.onBuildWall,
                BuildingMenu.WoodenFenceRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureSmall",
                    canBeAlwaysPlaced = true,
                    canPassThrough = true,
                    canBarricade = false,
                    isCorner = true
                },
                {
                    sprite = prefix .. sprites.tallPost
                }
            ),
            BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_Wooden_Railing",
                "Tooltip_Wooden_Railing",
                BuildingMenu.onBuildWall,
                BuildingMenu.WoodenFenceRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureSmall",
                    isThumpable = true,
                    hoppable = true,
                    blockAllTheSquare = false
                },
                {
                    sprite = prefix .. sprites.railing,
                    northSprite = prefix .. sprites.railingNorth,
                    corner = prefix .. sprites.post
                }
            ),
            BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_Wooden_Railing",
                "Tooltip_Wooden_Railing",
                BuildingMenu.onBuildWall,
                BuildingMenu.WoodenFenceRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureSmall",
                    isThumpable = true,
                    hoppable = true,
                    blockAllTheSquare = false
                },
                {
                    sprite = prefix .. sprites.railingAlt,
                    northSprite = prefix .. sprites.railingAltNorth,
                    corner = prefix .. sprites.post
                }
            )
        }
        return railingObjects
    end


    local spriteSets = {
        {
            prefix = "melos_tiles_railings_01_",
            sprites = {
                post = "46",
                postAlt = "44",
                postAltNorth = "45",
                tallPost = "31",
                railing = "29",
                railingNorth = "30",
                railingAlt = "37",
                railingAltNorth = "38"
            }
        },
        {
            prefix = "melos_tiles_railings_01_",
            sprites = {
                post = "70",
                postAlt = "68",
                postAltNorth = "69",
                tallPost = "55",
                railing = "53",
                railingNorth = "54",
                railingAlt = "61",
                railingAltNorth = "62"
            }
        },
        {
            prefix = "melos_tiles_railings_01_",
            sprites = {
                post = "94",
                postAlt = "92",
                postAltNorth = "93",
                tallPost = "79",
                railing = "77",
                railingNorth = "78",
                railingAlt = "85",
                railingAltNorth = "86"
            }
        },
        {
            prefix = "melos_tiles_railings_01_",
            sprites = {
                post = "118",
                postAlt = "116",
                postAltNorth = "117",
                tallPost = "103",
                railing = "101",
                railingNorth = "102",
                railingAlt = "109",
                railingAltNorth = "110"
            }
        },
        {
            prefix = "melos_tiles_railings_02_",
            sprites = {
                post = "22",
                postAlt = "20",
                postAltNorth = "21",
                tallPost = "7",
                railing = "5",
                railingNorth = "6",
                railingAlt = "13",
                railingAltNorth = "14"
            }
        },
        {
            prefix = "melos_tiles_railings_02_",
            sprites = {
                post = "46",
                postAlt = "44",
                postAltNorth = "45",
                tallPost = "31",
                railing = "29",
                railingNorth = "30",
                railingAlt = "37",
                railingAltNorth = "38"
            }
        },
        {
            prefix = "melos_tiles_railings_02_",
            sprites = {
                post = "70",
                postAlt = "68",
                postAltNorth = "69",
                tallPost = "55",
                railing = "53",
                railingNorth = "54",
                railingAlt = "61",
                railingAltNorth = "62"
            }
        },
        {
            prefix = "melos_tiles_railings_02_",
            sprites = {
                post = "94",
                postAlt = "92",
                postAltNorth = "93",
                tallPost = "79",
                railing = "77",
                railingNorth = "78",
                railingAlt = "85",
                railingAltNorth = "86"
            }
        },
        {
            prefix = "melos_tiles_railings_02_",
            sprites = {
                post = "118",
                postAlt = "116",
                postAltNorth = "117",
                tallPost = "103",
                railing = "101",
                railingNorth = "102",
                railingAlt = "109",
                railingAltNorth = "110"
            }
        },
    }

    local allRailingObjects = {}
    for _, set in ipairs(spriteSets) do
        local railingObjects = createRailingObjects(set.prefix, set.sprites)
        for _, obj in ipairs(railingObjects) do
            table.insert(allRailingObjects, obj)
        end
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Fencing"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Fencing_Railing"),
        "melos_tiles_railings_01_53",
        allRailingObjects
    )
end



local function addFloorsToMenu()
    local baseNameMelosFloors = "melos_tiles_floors_01_"
    local dataFloors = {
        wooden = { 8, 9, 10, 11, 48, 49, 50, 51, 52, 53, 54, 55 },
        checkeredSmall = { 92, 93, 94, 95 },
        checkeredLarge = { 0, 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 72, 73, 74, 75, 81, 82, 83, 84, 85, 86, 87 },
        diagonal = { 76, 77, 78, 79, 104, 105, 106, 107, 112, 113, 114, 115 },
        special = { 24, 25, 26, 27, 36, 37, 38, 39, 40, 41, 42, 43 },
        carpet = { 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 96, 97, 98, 99, 100, 101, 102, 103, 108, 109, 110, 111, 116, 117, 118, 119 }
    }
    local function createAndAddFloorObjects(subCategory, spriteNumbers)
        local melosFloors = {}
        for _, startNumber in ipairs(spriteNumbers) do
            table.insert(
                melosFloors,
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Floor_Generic",
                    BuildingMenu.onBuildFloor,
                    BuildingMenu.TwoSpriteFloorRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall"
                    },
                    {
                        sprite = baseNameMelosFloors .. startNumber
                    }
                )
            )
        end
        BuildingMenu.addObjectsToCategories(
            "Melos",
            getText("IGUI_BuildingMenuCat_Floors"),
            "melos_tiles_floors_01_0",
            getText(subCategory),
            baseNameMelosFloors .. spriteNumbers[1],
            melosFloors
        )
    end

    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Wooden", dataFloors.wooden)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Checkered_Small", dataFloors.checkeredSmall)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Checkered_Large", dataFloors.checkeredLarge)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Tile_Diagonal", dataFloors.diagonal)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Melos_Tiles", dataFloors.special)
    createAndAddFloorObjects("IGUI_BuildingMenuSubCat_Floors_Carpets", dataFloors.carpet)
end

local function addMelosStairsToMenu()
    local function createWoodenStairsObject(baseName, startSpriteNumber)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Simple_Wooden_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.WoodenStairsRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = false
            },
            {
                sprite = baseName .. startSpriteNumber,
                upToLeft01 = baseName .. startSpriteNumber,
                upToLeft02 = baseName .. (startSpriteNumber + 1),
                upToLeft03 = baseName .. (startSpriteNumber + 2),
                upToRight01 = baseName .. (startSpriteNumber + 8),
                upToRight02 = baseName .. (startSpriteNumber + 9),
                upToRight03 = baseName .. (startSpriteNumber + 10),
                pillar = baseName .. (startSpriteNumber + 6),
                pillarNorth = baseName .. (startSpriteNumber + 7)
            }
        )
    end

    local melosWoodenStairs = {}
    local dataStairs = { 16, 19, 32, 35, 48, 51, 64, 67, 80, 83, 96, 99, 112, 115 }
    for _, startNumber in ipairs(dataStairs) do
        table.insert(melosWoodenStairs, createWoodenStairsObject("melos_tiles_stairs_01_", startNumber))
    end

    dataStairs = { 0, 16, 19, 32, 35, 48, 51, 64, 67, 80, 83, 96, 99, 112, 115 }
    for _, startNumber in ipairs(dataStairs) do
        table.insert(melosWoodenStairs, createWoodenStairsObject("melos_tiles_stairs_02_", startNumber))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Stairs"),
        "melos_tiles_stairs_01_16",
        getText("IGUI_BuildingMenuSubCat_Stairs_Wooden"),
        "melos_tiles_stairs_01_16",
        melosWoodenStairs
    )

    local melosMetalStairs = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.MetalStairsRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "melos_tiles_stairs_01_0",
                upToLeft01 = "melos_tiles_stairs_01_0",
                upToLeft02 = "melos_tiles_stairs_01_1",
                upToLeft03 = "melos_tiles_stairs_01_2",
                upToRight01 = "melos_tiles_stairs_01_8",
                upToRight02 = "melos_tiles_stairs_01_9",
                upToRight03 = "melos_tiles_stairs_01_10",
                pillar = "fixtures_stairs_01_14",
                pillarNorth = "fixtures_stairs_01_14"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.MetalStairsRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "melos_tiles_stairs_01_3",
                upToLeft01 = "melos_tiles_stairs_01_3",
                upToLeft02 = "melos_tiles_stairs_01_4",
                upToLeft03 = "melos_tiles_stairs_01_5",
                upToRight01 = "melos_tiles_stairs_01_11",
                upToRight02 = "melos_tiles_stairs_01_12",
                upToRight03 = "melos_tiles_stairs_01_13",
                pillar = "melos_tiles_stairs_01_14",
                pillarNorth = "melos_tiles_stairs_01_14"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Stairs"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Stairs_Metal"),
        "melos_tiles_stairs_01_0",
        melosMetalStairs
    )
end

local function addKitchenCountersToMenu()
    local function createCounterObject(spriteBaseName, spriteNumber)
        return BuildingMenu.createObject(
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
                sprite = spriteBaseName .. spriteNumber,
                northSprite = spriteBaseName .. (spriteNumber + 2),
                eastSprite = spriteBaseName .. (spriteNumber + 4),
                southSprite = spriteBaseName .. (spriteNumber - 2)
            }
        )
    end

    local melosCounters = {}
    local dataCounters = { 3, 2, 19, 18, 35, 34, 51, 50, 67, 66, 83, 82, 99, 98, 115, 114 }

    table.insert(melosCounters, createCounterObject("melos_tiles_furniture_counters_02_", 3))
    table.insert(melosCounters, createCounterObject("melos_tiles_furniture_counters_02_", 2))
    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(melosCounters, createCounterObject("melos_tiles_furniture_counters_01_", spriteNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Containers"),
        "melos_tiles_furniture_counters_02_3",
        getText("IGUI_BuildingMenuSubCat_Containers_Residential"),
        "melos_tiles_furniture_counters_01_3",
        melosCounters
    )

    melosCounters = {}
    local dataUpperCounters = { 11, 10, 27, 26, 43, 42, 59, 58, 75, 74, 91, 90, 107, 106, 123, 122 }
    for _, spriteNumber in ipairs(dataUpperCounters) do
        table.insert(melosCounters, createCounterObject("melos_tiles_furniture_counters_01_", spriteNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Upper_Counters"),
        "melos_tiles_furniture_counters_01_11",
        melosCounters
    )
end

local function addMetalContainersToMenu()
    local function createMelosLockers(spriteBaseName, northBaseName, eastBaseName, southBaseName)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = spriteBaseName,
                northSprite = northBaseName,
                eastSprite = eastBaseName,
                southSprite = southBaseName
            }
        )
    end

    local melosCounters = {}
    local baseName = "melos_tiles_furniture_storage_03_"

    for i = 1, 13, 4 do
        local spriteBaseName = baseName .. i
        local northBaseName = baseName .. (i - 1)
        local eastBaseName = baseName .. (i + 2)
        local southBaseName = baseName .. (i + 1)
        table.insert(melosCounters, createMelosLockers(spriteBaseName, northBaseName, eastBaseName, southBaseName))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Lockers"),
        "melos_tiles_furniture_storage_03_1",
        melosCounters
    )
end

local function addContainersOthersToMenu()
    local melosCounters = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Logs",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "melos_tiles_gardencenter_02_107",
                sprite2 = "melos_tiles_gardencenter_02_106",
                northSprite = "melos_tiles_gardencenter_02_104",
                northSprite2 = "melos_tiles_gardencenter_02_105"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Logs",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "melos_tiles_gardencenter_02_115",
                sprite2 = "melos_tiles_gardencenter_02_114",
                northSprite = "melos_tiles_gardencenter_02_112",
                northSprite2 = "melos_tiles_gardencenter_02_113"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Logs",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                dismantable = true,
            },
            {
                sprite = "melos_tiles_gardencenter_02_119",
                sprite2 = "melos_tiles_gardencenter_02_118",
                northSprite = "melos_tiles_gardencenter_02_116",
                northSprite2 = "melos_tiles_gardencenter_02_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Logs",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                renderFloorHelper = false,
                dismantable = true,
            },
            {
                sprite = "melos_tiles_gardencenter_02_111",
                sprite2 = "melos_tiles_gardencenter_02_110",
                northSprite = "melos_tiles_gardencenter_02_108",
                northSprite2 = "melos_tiles_gardencenter_02_109"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Others"),
        "melos_tiles_gardencenter_02_104",
        melosCounters
    )
end

local function addMelosSmallTablesToMenu()
    local melosSmallTables = {}
    local dataSmallTables = { 0, 4, 5, 8, 11, 12, 13, 16, 17, 18, 19, 20 }

    local function createMelosSmallTable(spriteIndex)
        return BuildingMenu.createObject(
            "",
            "Tooltip_craft_smallTableDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "melos_tiles_furniture_tables_01_" .. spriteIndex
            }
        )
    end

    for _, spriteIndex in ipairs(dataSmallTables) do
        table.insert(melosSmallTables, createMelosSmallTable(spriteIndex))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        "melos_tiles_furniture_tables_01_0",
        getText("IGUI_BuildingMenuSubCat_Furniture_Small_Tables"),
        "melos_tiles_furniture_tables_01_0",
        melosSmallTables
    )
end

local function createDoubleTileFurnitureObject(tooltip, recipe, sprite, sprite2, northSprite, northSprite2)
    return BuildingMenu.createObject(
        "",
        tooltip,
        BuildingMenu.onBuildDoubleTileFurniture,
        recipe,
        true,
        {
            completionSound = "BuildWoodenStructureLarge"
        },
        {
            sprite = sprite,
            sprite2 = sprite2,
            northSprite = northSprite,
            northSprite2 = northSprite2
        }
    )
end

local function addMelosLargeTablesToMenu()
    local tooltip = "Tooltip_craft_largeTableDesc"
    local melosLargeTables = {
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_67",
            "melos_tiles_furniture_tables_01_66",
            "melos_tiles_furniture_tables_01_64",
            "melos_tiles_furniture_tables_01_65"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_73",
            "melos_tiles_furniture_tables_01_72",
            "melos_tiles_furniture_tables_01_74",
            "melos_tiles_furniture_tables_01_75"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_77",
            "melos_tiles_furniture_tables_01_76",
            "melos_tiles_furniture_tables_01_78",
            "melos_tiles_furniture_tables_01_79"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_81",
            "melos_tiles_furniture_tables_01_80",
            "melos_tiles_furniture_tables_01_82",
            "melos_tiles_furniture_tables_01_83"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_85",
            "melos_tiles_furniture_tables_01_84",
            "melos_tiles_furniture_tables_01_86",
            "melos_tiles_furniture_tables_01_87"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "melos_tiles_furniture_tables_01_89",
            "melos_tiles_furniture_tables_01_88",
            "melos_tiles_furniture_tables_01_90",
            "melos_tiles_furniture_tables_01_91"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeFurnitureRecipe,
            "melos_tiles_furniture_tables_01_33",
            "melos_tiles_furniture_tables_01_32",
            "melos_tiles_furniture_tables_01_40",
            "melos_tiles_furniture_tables_01_41"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeFurnitureRecipe,
            "melos_tiles_furniture_tables_01_35",
            "melos_tiles_furniture_tables_01_34",
            "melos_tiles_furniture_tables_01_42",
            "melos_tiles_furniture_tables_01_43"
        )
    }

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Large_Tables"),
        "melos_tiles_furniture_tables_01_67",
        melosLargeTables
    )
end

local function addMelosSimpleBedsToMenu()
    local tooltip = "Tooltip_craft_bedDesc"
    local melosSimpleBeds = {
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_3",
            "melos_tiles_furniture_bedding_01_2",
            "melos_tiles_furniture_bedding_01_0",
            "melos_tiles_furniture_bedding_01_1"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_7",
            "melos_tiles_furniture_bedding_01_6",
            "melos_tiles_furniture_bedding_01_4",
            "melos_tiles_furniture_bedding_01_5"
        ),

        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_25",
            "melos_tiles_furniture_bedding_01_24",
            "melos_tiles_furniture_bedding_01_26",
            "melos_tiles_furniture_bedding_01_27"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_51",
            "melos_tiles_furniture_bedding_01_50",
            "melos_tiles_furniture_bedding_01_48",
            "melos_tiles_furniture_bedding_01_49"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_55",
            "melos_tiles_furniture_bedding_01_54",
            "melos_tiles_furniture_bedding_01_52",
            "melos_tiles_furniture_bedding_01_53"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_57",
            "melos_tiles_furniture_bedding_01_56",
            "melos_tiles_furniture_bedding_01_58",
            "melos_tiles_furniture_bedding_01_59"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_81",
            "melos_tiles_furniture_bedding_01_80",
            "melos_tiles_furniture_bedding_01_82",
            "melos_tiles_furniture_bedding_01_83"
        ),
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.BedRecipe,
            "melos_tiles_furniture_bedding_01_105",
            "melos_tiles_furniture_bedding_01_104",
            "melos_tiles_furniture_bedding_01_106",
            "melos_tiles_furniture_bedding_01_107"
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Simple_Beds"),
        "melos_tiles_furniture_bedding_01_3",
        melosSimpleBeds
    )
end

local function addMelosLargeBedsToMenu()
    local function createFourTileFurnitureObject(category, data)
        return BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildFourTileFurniture,
            BuildingMenu.BedRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = category .. data[1],
                sprite2 = category .. data[2],
                sprite3 = category .. data[3],
                sprite4 = category .. data[4],
                northSprite = category .. data[5],
                northSprite2 = category .. data[6],
                northSprite3 = category .. data[7],
                northSprite4 = category .. data[8]
            }
        )
    end


    local melosLargeBeds = {}
    local dataLargeBed = {
        { 15,  14,  12,  13,  8,   9,   11,  10 },
        { 35,  33,  32,  34,  36,  38,  39,  37 },
        { 43,  41,  40,  42,  44,  46,  47,  45 },
        { 67,  65,  64,  66,  68,  70,  71,  69 },
        { 75,  73,  72,  74,  76,  78,  79,  77 },
        { 91,  89,  88,  90,  92,  94,  95,  93 },
        { 99,  97,  96,  98,  100, 102, 103, 101 },
        { 115, 113, 112, 114, 116, 118, 119, 117 },
        { 123, 121, 120, 122, 124, 126, 127, 125 },
    }
    for j, data in ipairs(dataLargeBed) do
        table.insert(melosLargeBeds, createFourTileFurnitureObject("melos_tiles_furniture_bedding_01_", data))
    end


    local bedCategories = {
        "melos_tiles_furniture_bedding_03a_",
        "melos_tiles_furniture_bedding_03_"
    }
    dataLargeBed = {
        { 7,   6,   4,   5,   0,   1,   3,   2 },
        { 15,  14,  12,  13,  8,   9,   11,  10 },
        { 23,  22,  20,  21,  16,  17,  19,  18 },
        { 31,  30,  28,  29,  24,  25,  27,  26 },
        { 35,  33,  32,  34,  36,  38,  39,  37 },
        { 43,  41,  40,  42,  44,  46,  47,  45 },
        { 51,  49,  48,  50,  52,  54,  55,  53 },
        { 59,  57,  56,  58,  60,  62,  63,  61 },
        { 67,  65,  64,  66,  68,  70,  71,  69 },
        { 75,  73,  72,  74,  76,  78,  79,  77 },
        { 83,  81,  80,  82,  84,  86,  87,  85 },
        { 91,  89,  88,  90,  92,  94,  95,  93 },
        { 99,  97,  96,  98,  100, 102, 103, 101 },
        { 107, 105, 104, 106, 108, 110, 111, 109 },
        { 115, 113, 112, 114, 116, 118, 119, 117 },
        { 123, 121, 120, 122, 124, 126, 127, 125 },
    }

    for i, category in ipairs(bedCategories) do
        for j, data in ipairs(dataLargeBed) do
            table.insert(melosLargeBeds, createFourTileFurnitureObject(category, data))
        end
    end


    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Large_Beds"),
        "melos_tiles_furniture_bedding_03a_15",
        melosLargeBeds
    )
end

local function addMelosCouchesToMenu()
    local function createFurnitureObject(recipe, spriteData, isSimpleFurniture)
        return BuildingMenu.createObject(
            "",
            "",
            isSimpleFurniture and BuildingMenu.onBuildSimpleFurniture or BuildingMenu.onBuildDoubleTileFurniture,
            recipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            spriteData
        )
    end

    local melosCouches = {
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_1",
                sprite2 = "melos_tiles_furniture_seating_02_0",
                northSprite = "melos_tiles_furniture_seating_02_2",
                northSprite2 = "melos_tiles_furniture_seating_02_3"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_7",
                sprite2 = "melos_tiles_furniture_seating_02_6",
                northSprite = "melos_tiles_furniture_seating_02_4",
                northSprite2 = "melos_tiles_furniture_seating_02_5"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_13",
                northSprite = "melos_tiles_furniture_seating_02_12",
                eastSprite = "melos_tiles_furniture_seating_02_14",
                southSprite = "melos_tiles_furniture_seating_02_15"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_17",
                sprite2 = "melos_tiles_furniture_seating_02_16",
                northSprite = "melos_tiles_furniture_seating_02_18",
                northSprite2 = "melos_tiles_furniture_seating_02_19"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_23",
                sprite2 = "melos_tiles_furniture_seating_02_22",
                northSprite = "melos_tiles_furniture_seating_02_20",
                northSprite2 = "melos_tiles_furniture_seating_02_21"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_9",
                northSprite = "melos_tiles_furniture_seating_02_8",
                eastSprite = "melos_tiles_furniture_seating_02_10",
                southSprite = "melos_tiles_furniture_seating_02_11"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_25",
                sprite2 = "melos_tiles_furniture_seating_02_24",
                northSprite = "melos_tiles_furniture_seating_02_26",
                northSprite2 = "melos_tiles_furniture_seating_02_27"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_31",
                sprite2 = "melos_tiles_furniture_seating_02_30",
                northSprite = "melos_tiles_furniture_seating_02_28",
                northSprite2 = "melos_tiles_furniture_seating_02_29"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_37",
                northSprite = "melos_tiles_furniture_seating_02_36",
                eastSprite = "melos_tiles_furniture_seating_02_38",
                southSprite = "melos_tiles_furniture_seating_02_39"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_41",
                sprite2 = "melos_tiles_furniture_seating_02_40",
                northSprite = "melos_tiles_furniture_seating_02_42",
                northSprite2 = "melos_tiles_furniture_seating_02_43"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_47",
                sprite2 = "melos_tiles_furniture_seating_02_46",
                northSprite = "melos_tiles_furniture_seating_02_44",
                northSprite2 = "melos_tiles_furniture_seating_02_45"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_33",
                northSprite = "melos_tiles_furniture_seating_02_32",
                eastSprite = "melos_tiles_furniture_seating_02_34",
                southSprite = "melos_tiles_furniture_seating_02_35"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_48",
                sprite2 = "melos_tiles_furniture_seating_02_49",
                northSprite = "melos_tiles_furniture_seating_02_50",
                northSprite2 = "melos_tiles_furniture_seating_02_51"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_53",
                sprite2 = "melos_tiles_furniture_seating_02_52",
                northSprite = "melos_tiles_furniture_seating_02_54",
                northSprite2 = "melos_tiles_furniture_seating_02_55"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_60",
                northSprite = "melos_tiles_furniture_seating_02_61",
                eastSprite = "melos_tiles_furniture_seating_02_62",
                southSprite = "melos_tiles_furniture_seating_02_63"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_64",
                sprite2 = "melos_tiles_furniture_seating_02_65",
                northSprite = "melos_tiles_furniture_seating_02_66",
                northSprite2 = "melos_tiles_furniture_seating_02_67"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_69",
                sprite2 = "melos_tiles_furniture_seating_02_68",
                northSprite = "melos_tiles_furniture_seating_02_70",
                northSprite2 = "melos_tiles_furniture_seating_02_71"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_56",
                northSprite = "melos_tiles_furniture_seating_02_57",
                eastSprite = "melos_tiles_furniture_seating_02_58",
                southSprite = "melos_tiles_furniture_seating_02_59"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_91",
                sprite2 = "melos_tiles_furniture_seating_02_90",
                northSprite = "melos_tiles_furniture_seating_02_88",
                northSprite2 = "melos_tiles_furniture_seating_02_89"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_95",
                sprite2 = "melos_tiles_furniture_seating_02_94",
                northSprite = "melos_tiles_furniture_seating_02_92",
                northSprite2 = "melos_tiles_furniture_seating_02_93"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_84",
                northSprite = "melos_tiles_furniture_seating_02_85",
                eastSprite = "melos_tiles_furniture_seating_02_86",
                southSprite = "melos_tiles_furniture_seating_02_87"
            },
            true
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_113",
                sprite2 = "melos_tiles_furniture_seating_02_112",
                northSprite = "melos_tiles_furniture_seating_02_114",
                northSprite2 = "melos_tiles_furniture_seating_02_115"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_119",
                sprite2 = "melos_tiles_furniture_seating_02_118",
                northSprite = "melos_tiles_furniture_seating_02_116",
                northSprite2 = "melos_tiles_furniture_seating_02_117"
            },
            false
        ),
        createFurnitureObject(
            BuildingMenu.CouchRecipe,
            {
                sprite = "melos_tiles_furniture_seating_02_109",
                northSprite = "melos_tiles_furniture_seating_02_108",
                eastSprite = "melos_tiles_furniture_seating_02_110",
                southSprite = "melos_tiles_furniture_seating_02_111"
            },
            true
        )
    }

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Couches"),
        "melos_tiles_furniture_seating_02_1",
        melosCouches
    )
end

local function addMelosCharisToMenu()
    local melosChairs = {
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_0",
                northSprite = "melos_tiles_furniture_seating_01_1"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_4",
                northSprite = "melos_tiles_furniture_seating_01_5"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_16",
                northSprite = "melos_tiles_furniture_seating_01_17",
                eastSprite = "melos_tiles_furniture_seating_01_18",
                southSprite = "melos_tiles_furniture_seating_01_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_20",
                northSprite = "melos_tiles_furniture_seating_01_21",
                eastSprite = "melos_tiles_furniture_seating_01_22",
                southSprite = "melos_tiles_furniture_seating_01_23"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_24",
                northSprite = "melos_tiles_furniture_seating_01_25",
                eastSprite = "melos_tiles_furniture_seating_01_26",
                southSprite = "melos_tiles_furniture_seating_01_27"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_28",
                northSprite = "melos_tiles_furniture_seating_01_29",
                eastSprite = "melos_tiles_furniture_seating_01_30",
                southSprite = "melos_tiles_furniture_seating_01_31"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_88",
                northSprite = "melos_tiles_furniture_seating_01_89",
                eastSprite = "melos_tiles_furniture_seating_01_90",
                southSprite = "melos_tiles_furniture_seating_01_91"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
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
                sprite = "melos_tiles_furniture_seating_01_96",
                northSprite = "melos_tiles_furniture_seating_01_97",
                eastSprite = "melos_tiles_furniture_seating_01_98",
                southSprite = "melos_tiles_furniture_seating_01_99"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.MetalChairRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "melos_tiles_furniture_seating_01_49",
                northSprite = "melos_tiles_furniture_seating_01_48",
                eastSprite = "melos_tiles_furniture_seating_01_51",
                southSprite = "melos_tiles_furniture_seating_01_50"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.MetalChairRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "melos_tiles_furniture_seating_01_57",
                northSprite = "melos_tiles_furniture_seating_01_56",
                eastSprite = "melos_tiles_furniture_seating_01_59",
                southSprite = "melos_tiles_furniture_seating_01_58"
            }
        ),
        BuildingMenu.createObject(
            "",
            "",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.MetalChairRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "melos_tiles_furniture_seating_01_112",
                northSprite = "melos_tiles_furniture_seating_01_113",
                eastSprite = "melos_tiles_furniture_seating_01_114",
                southSprite = "melos_tiles_furniture_seating_01_115"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Chairs"),
        "melos_tiles_furniture_seating_01_0",
        melosChairs
    )
end

local function addMelosFurnitureSet1ToMenu()
    local melosFurnitureSets1 = {
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
                sprite = "melos_tiles_furniture_storage_02a_3",
                northSprite = "melos_tiles_furniture_storage_02a_5",
                eastSprite = "melos_tiles_furniture_storage_02a_7",
                southSprite = "melos_tiles_furniture_storage_02a_1"
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
                sprite = "melos_tiles_furniture_storage_02a_2",
                northSprite = "melos_tiles_furniture_storage_02a_4",
                eastSprite = "melos_tiles_furniture_storage_02a_6",
                southSprite = "melos_tiles_furniture_storage_02a_0"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_8",
                northSprite = "melos_tiles_furniture_storage_02a_9",
                eastSprite = "melos_tiles_furniture_storage_02a_10",
                southSprite = "melos_tiles_furniture_storage_02a_11"
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
                sprite = "melos_tiles_furniture_storage_02a_12",
                northSprite = "melos_tiles_furniture_storage_02a_13",
                eastSprite = "melos_tiles_furniture_storage_02a_14",
                southSprite = "melos_tiles_furniture_storage_02a_15"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_16",
                northSprite = "melos_tiles_furniture_storage_02a_17",
                eastSprite = "melos_tiles_furniture_storage_02a_18",
                southSprite = "melos_tiles_furniture_storage_02a_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_21",
                northSprite = "melos_tiles_furniture_storage_02a_20",
                eastSprite = "melos_tiles_furniture_storage_02a_22",
                southSprite = "melos_tiles_furniture_storage_02a_23"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_24",
                northSprite = "melos_tiles_furniture_storage_02a_25"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_26",
                northSprite = "melos_tiles_furniture_storage_02a_27"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_30",
                northSprite = "melos_tiles_furniture_storage_02a_29",
                eastSprite = "melos_tiles_furniture_storage_02a_28"
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
                sprite = "melos_tiles_furniture_storage_02a_35",
                northSprite = "melos_tiles_furniture_storage_02a_37",
                eastSprite = "melos_tiles_furniture_storage_02a_39",
                southSprite = "melos_tiles_furniture_storage_02a_33"
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
                sprite = "melos_tiles_furniture_storage_02a_34",
                northSprite = "melos_tiles_furniture_storage_02a_36",
                eastSprite = "melos_tiles_furniture_storage_02a_38",
                southSprite = "melos_tiles_furniture_storage_02a_32"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_40",
                northSprite = "melos_tiles_furniture_storage_02a_41",
                eastSprite = "melos_tiles_furniture_storage_02a_42",
                southSprite = "melos_tiles_furniture_storage_02a_43"
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
                sprite = "melos_tiles_furniture_storage_02a_44",
                northSprite = "melos_tiles_furniture_storage_02a_45",
                eastSprite = "melos_tiles_furniture_storage_02a_46",
                southSprite = "melos_tiles_furniture_storage_02a_47"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_48",
                northSprite = "melos_tiles_furniture_storage_02a_49",
                eastSprite = "melos_tiles_furniture_storage_02a_50",
                southSprite = "melos_tiles_furniture_storage_02a_51"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_53",
                northSprite = "melos_tiles_furniture_storage_02a_52",
                eastSprite = "melos_tiles_furniture_storage_02a_54",
                southSprite = "melos_tiles_furniture_storage_02a_55"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_56",
                northSprite = "melos_tiles_furniture_storage_02a_57"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_58",
                northSprite = "melos_tiles_furniture_storage_02a_59"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_62",
                northSprite = "melos_tiles_furniture_storage_02a_61",
                eastSprite = "melos_tiles_furniture_storage_02a_60"
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
                sprite = "melos_tiles_furniture_storage_02a_67",
                northSprite = "melos_tiles_furniture_storage_02a_69",
                eastSprite = "melos_tiles_furniture_storage_02a_71",
                southSprite = "melos_tiles_furniture_storage_02a_65"
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
                sprite = "melos_tiles_furniture_storage_02a_66",
                northSprite = "melos_tiles_furniture_storage_02a_68",
                eastSprite = "melos_tiles_furniture_storage_02a_70",
                southSprite = "melos_tiles_furniture_storage_02a_64"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_72",
                northSprite = "melos_tiles_furniture_storage_02a_73",
                eastSprite = "melos_tiles_furniture_storage_02a_74",
                southSprite = "melos_tiles_furniture_storage_02a_75"
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
                sprite = "melos_tiles_furniture_storage_02a_76",
                northSprite = "melos_tiles_furniture_storage_02a_77",
                eastSprite = "melos_tiles_furniture_storage_02a_78",
                southSprite = "melos_tiles_furniture_storage_02a_79"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_80",
                northSprite = "melos_tiles_furniture_storage_02a_81",
                eastSprite = "melos_tiles_furniture_storage_02a_82",
                southSprite = "melos_tiles_furniture_storage_02a_83"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_85",
                northSprite = "melos_tiles_furniture_storage_02a_84",
                eastSprite = "melos_tiles_furniture_storage_02a_86",
                southSprite = "melos_tiles_furniture_storage_02a_87"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_88",
                northSprite = "melos_tiles_furniture_storage_02a_89"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_90",
                northSprite = "melos_tiles_furniture_storage_02a_91"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_94",
                northSprite = "melos_tiles_furniture_storage_02a_93",
                eastSprite = "melos_tiles_furniture_storage_02a_92"
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
                sprite = "melos_tiles_furniture_storage_02a_99",
                northSprite = "melos_tiles_furniture_storage_02a_101",
                eastSprite = "melos_tiles_furniture_storage_02a_103",
                southSprite = "melos_tiles_furniture_storage_02a_97"
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
                sprite = "melos_tiles_furniture_storage_02a_98",
                northSprite = "melos_tiles_furniture_storage_02a_100",
                eastSprite = "melos_tiles_furniture_storage_02a_102",
                southSprite = "melos_tiles_furniture_storage_02a_96"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_104",
                northSprite = "melos_tiles_furniture_storage_02a_105",
                eastSprite = "melos_tiles_furniture_storage_02a_106",
                southSprite = "melos_tiles_furniture_storage_02a_107"
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
                sprite = "melos_tiles_furniture_storage_02a_108",
                northSprite = "melos_tiles_furniture_storage_02a_109",
                eastSprite = "melos_tiles_furniture_storage_02a_110",
                southSprite = "melos_tiles_furniture_storage_02a_111"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_112",
                northSprite = "melos_tiles_furniture_storage_02a_113",
                eastSprite = "melos_tiles_furniture_storage_02a_114",
                southSprite = "melos_tiles_furniture_storage_02a_115"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_117",
                northSprite = "melos_tiles_furniture_storage_02a_116",
                eastSprite = "melos_tiles_furniture_storage_02a_118",
                southSprite = "melos_tiles_furniture_storage_02a_119"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_120",
                northSprite = "melos_tiles_furniture_storage_02a_121"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_122",
                northSprite = "melos_tiles_furniture_storage_02a_123"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_126",
                northSprite = "melos_tiles_furniture_storage_02a_125",
                eastSprite = "melos_tiles_furniture_storage_02a_124"
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
                sprite = "melos_tiles_furniture_storage_02a_131",
                northSprite = "melos_tiles_furniture_storage_02a_133",
                eastSprite = "melos_tiles_furniture_storage_02a_135",
                southSprite = "melos_tiles_furniture_storage_02a_129"
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
                sprite = "melos_tiles_furniture_storage_02a_130",
                northSprite = "melos_tiles_furniture_storage_02a_132",
                eastSprite = "melos_tiles_furniture_storage_02a_134",
                southSprite = "melos_tiles_furniture_storage_02a_128"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_136",
                northSprite = "melos_tiles_furniture_storage_02a_137",
                eastSprite = "melos_tiles_furniture_storage_02a_138",
                southSprite = "melos_tiles_furniture_storage_02a_139"
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
                sprite = "melos_tiles_furniture_storage_02a_140",
                northSprite = "melos_tiles_furniture_storage_02a_141",
                eastSprite = "melos_tiles_furniture_storage_02a_142",
                southSprite = "melos_tiles_furniture_storage_02a_143"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_144",
                northSprite = "melos_tiles_furniture_storage_02a_145",
                eastSprite = "melos_tiles_furniture_storage_02a_146",
                southSprite = "melos_tiles_furniture_storage_02a_147"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_149",
                northSprite = "melos_tiles_furniture_storage_02a_148",
                eastSprite = "melos_tiles_furniture_storage_02a_150",
                southSprite = "melos_tiles_furniture_storage_02a_151"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_152",
                northSprite = "melos_tiles_furniture_storage_02a_153"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_154",
                northSprite = "melos_tiles_furniture_storage_02a_155"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_158",
                northSprite = "melos_tiles_furniture_storage_02a_157",
                eastSprite = "melos_tiles_furniture_storage_02a_156"
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
                sprite = "melos_tiles_furniture_storage_02a_163",
                northSprite = "melos_tiles_furniture_storage_02a_165",
                eastSprite = "melos_tiles_furniture_storage_02a_167",
                southSprite = "melos_tiles_furniture_storage_02a_161"
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
                sprite = "melos_tiles_furniture_storage_02a_162",
                northSprite = "melos_tiles_furniture_storage_02a_164",
                eastSprite = "melos_tiles_furniture_storage_02a_166",
                southSprite = "melos_tiles_furniture_storage_02a_160"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_168",
                northSprite = "melos_tiles_furniture_storage_02a_169",
                eastSprite = "melos_tiles_furniture_storage_02a_170",
                southSprite = "melos_tiles_furniture_storage_02a_171"
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
                sprite = "melos_tiles_furniture_storage_02a_172",
                northSprite = "melos_tiles_furniture_storage_02a_173",
                eastSprite = "melos_tiles_furniture_storage_02a_174",
                southSprite = "melos_tiles_furniture_storage_02a_175"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_176",
                northSprite = "melos_tiles_furniture_storage_02a_177",
                eastSprite = "melos_tiles_furniture_storage_02a_178",
                southSprite = "melos_tiles_furniture_storage_02a_179"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_181",
                northSprite = "melos_tiles_furniture_storage_02a_180",
                eastSprite = "melos_tiles_furniture_storage_02a_182",
                southSprite = "melos_tiles_furniture_storage_02a_183"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_184",
                northSprite = "melos_tiles_furniture_storage_02a_185"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_186",
                northSprite = "melos_tiles_furniture_storage_02a_187"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_190",
                northSprite = "melos_tiles_furniture_storage_02a_189",
                eastSprite = "melos_tiles_furniture_storage_02a_188"
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
                sprite = "melos_tiles_furniture_storage_02a_195",
                northSprite = "melos_tiles_furniture_storage_02a_197",
                eastSprite = "melos_tiles_furniture_storage_02a_199",
                southSprite = "melos_tiles_furniture_storage_02a_193"
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
                sprite = "melos_tiles_furniture_storage_02a_194",
                northSprite = "melos_tiles_furniture_storage_02a_196",
                eastSprite = "melos_tiles_furniture_storage_02a_198",
                southSprite = "melos_tiles_furniture_storage_02a_192"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_200",
                northSprite = "melos_tiles_furniture_storage_02a_201",
                eastSprite = "melos_tiles_furniture_storage_02a_202",
                southSprite = "melos_tiles_furniture_storage_02a_203"
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
                sprite = "melos_tiles_furniture_storage_02a_204",
                northSprite = "melos_tiles_furniture_storage_02a_205",
                eastSprite = "melos_tiles_furniture_storage_02a_206",
                southSprite = "melos_tiles_furniture_storage_02a_207"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_208",
                northSprite = "melos_tiles_furniture_storage_02a_209",
                eastSprite = "melos_tiles_furniture_storage_02a_210",
                southSprite = "melos_tiles_furniture_storage_02a_211"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_213",
                northSprite = "melos_tiles_furniture_storage_02a_212",
                eastSprite = "melos_tiles_furniture_storage_02a_214",
                southSprite = "melos_tiles_furniture_storage_02a_215"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_216",
                northSprite = "melos_tiles_furniture_storage_02a_217"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_218",
                northSprite = "melos_tiles_furniture_storage_02a_219"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_222",
                northSprite = "melos_tiles_furniture_storage_02a_221",
                eastSprite = "melos_tiles_furniture_storage_02a_220"
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
                sprite = "melos_tiles_furniture_storage_02a_227",
                northSprite = "melos_tiles_furniture_storage_02a_229",
                eastSprite = "melos_tiles_furniture_storage_02a_231",
                southSprite = "melos_tiles_furniture_storage_02a_225"
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
                sprite = "melos_tiles_furniture_storage_02a_226",
                northSprite = "melos_tiles_furniture_storage_02a_228",
                eastSprite = "melos_tiles_furniture_storage_02a_230",
                southSprite = "melos_tiles_furniture_storage_02a_224"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_232",
                northSprite = "melos_tiles_furniture_storage_02a_233",
                eastSprite = "melos_tiles_furniture_storage_02a_234",
                southSprite = "melos_tiles_furniture_storage_02a_235"
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
                sprite = "melos_tiles_furniture_storage_02a_236",
                northSprite = "melos_tiles_furniture_storage_02a_237",
                eastSprite = "melos_tiles_furniture_storage_02a_238",
                southSprite = "melos_tiles_furniture_storage_02a_239"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_240",
                northSprite = "melos_tiles_furniture_storage_02a_241",
                eastSprite = "melos_tiles_furniture_storage_02a_242",
                southSprite = "melos_tiles_furniture_storage_02a_243"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_245",
                northSprite = "melos_tiles_furniture_storage_02a_244",
                eastSprite = "melos_tiles_furniture_storage_02a_246",
                southSprite = "melos_tiles_furniture_storage_02a_247"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_248",
                northSprite = "melos_tiles_furniture_storage_02a_249"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_250",
                northSprite = "melos_tiles_furniture_storage_02a_251"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02a_254",
                northSprite = "melos_tiles_furniture_storage_02a_253",
                eastSprite = "melos_tiles_furniture_storage_02a_252"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Melos_Furniture_Sets_1"),
        "melos_tiles_furniture_storage_02a_3",
        melosFurnitureSets1
    )
end

local function addMelosFurnitureSet2ToMenu()
    local melosFurnitureSets2 = {
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
                sprite = "melos_tiles_furniture_storage_02_3",
                northSprite = "melos_tiles_furniture_storage_02_5",
                eastSprite = "melos_tiles_furniture_storage_02_7",
                southSprite = "melos_tiles_furniture_storage_02_1"
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
                sprite = "melos_tiles_furniture_storage_02_2",
                northSprite = "melos_tiles_furniture_storage_02_4",
                eastSprite = "melos_tiles_furniture_storage_02_6",
                southSprite = "melos_tiles_furniture_storage_02_0"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_8",
                northSprite = "melos_tiles_furniture_storage_02_9",
                eastSprite = "melos_tiles_furniture_storage_02_10",
                southSprite = "melos_tiles_furniture_storage_02_11"
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
                sprite = "melos_tiles_furniture_storage_02_12",
                northSprite = "melos_tiles_furniture_storage_02_13",
                eastSprite = "melos_tiles_furniture_storage_02_14",
                southSprite = "melos_tiles_furniture_storage_02_15"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_16",
                northSprite = "melos_tiles_furniture_storage_02_17",
                eastSprite = "melos_tiles_furniture_storage_02_18",
                southSprite = "melos_tiles_furniture_storage_02_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_21",
                northSprite = "melos_tiles_furniture_storage_02_20",
                eastSprite = "melos_tiles_furniture_storage_02_22",
                southSprite = "melos_tiles_furniture_storage_02_23"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_24",
                northSprite = "melos_tiles_furniture_storage_02_25"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_26",
                northSprite = "melos_tiles_furniture_storage_02_27"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_30",
                northSprite = "melos_tiles_furniture_storage_02_29",
                eastSprite = "melos_tiles_furniture_storage_02_28"
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
                sprite = "melos_tiles_furniture_storage_02_35",
                northSprite = "melos_tiles_furniture_storage_02_37",
                eastSprite = "melos_tiles_furniture_storage_02_39",
                southSprite = "melos_tiles_furniture_storage_02_33"
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
                sprite = "melos_tiles_furniture_storage_02_34",
                northSprite = "melos_tiles_furniture_storage_02_36",
                eastSprite = "melos_tiles_furniture_storage_02_38",
                southSprite = "melos_tiles_furniture_storage_02_32"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_40",
                northSprite = "melos_tiles_furniture_storage_02_41",
                eastSprite = "melos_tiles_furniture_storage_02_42",
                southSprite = "melos_tiles_furniture_storage_02_43"
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
                sprite = "melos_tiles_furniture_storage_02_44",
                northSprite = "melos_tiles_furniture_storage_02_45",
                eastSprite = "melos_tiles_furniture_storage_02_46",
                southSprite = "melos_tiles_furniture_storage_02_47"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_48",
                northSprite = "melos_tiles_furniture_storage_02_49",
                eastSprite = "melos_tiles_furniture_storage_02_50",
                southSprite = "melos_tiles_furniture_storage_02_51"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_53",
                northSprite = "melos_tiles_furniture_storage_02_52",
                eastSprite = "melos_tiles_furniture_storage_02_54",
                southSprite = "melos_tiles_furniture_storage_02_55"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_56",
                northSprite = "melos_tiles_furniture_storage_02_57"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_58",
                northSprite = "melos_tiles_furniture_storage_02_59"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_62",
                northSprite = "melos_tiles_furniture_storage_02_61",
                eastSprite = "melos_tiles_furniture_storage_02_60"
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
                sprite = "melos_tiles_furniture_storage_02_67",
                northSprite = "melos_tiles_furniture_storage_02_69",
                eastSprite = "melos_tiles_furniture_storage_02_71",
                southSprite = "melos_tiles_furniture_storage_02_65"
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
                sprite = "melos_tiles_furniture_storage_02_66",
                northSprite = "melos_tiles_furniture_storage_02_68",
                eastSprite = "melos_tiles_furniture_storage_02_70",
                southSprite = "melos_tiles_furniture_storage_02_64"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_72",
                northSprite = "melos_tiles_furniture_storage_02_73",
                eastSprite = "melos_tiles_furniture_storage_02_74",
                southSprite = "melos_tiles_furniture_storage_02_75"
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
                sprite = "melos_tiles_furniture_storage_02_76",
                northSprite = "melos_tiles_furniture_storage_02_77",
                eastSprite = "melos_tiles_furniture_storage_02_78",
                southSprite = "melos_tiles_furniture_storage_02_79"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_80",
                northSprite = "melos_tiles_furniture_storage_02_81",
                eastSprite = "melos_tiles_furniture_storage_02_82",
                southSprite = "melos_tiles_furniture_storage_02_83"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_85",
                northSprite = "melos_tiles_furniture_storage_02_84",
                eastSprite = "melos_tiles_furniture_storage_02_86",
                southSprite = "melos_tiles_furniture_storage_02_87"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_88",
                northSprite = "melos_tiles_furniture_storage_02_89"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_90",
                northSprite = "melos_tiles_furniture_storage_02_91"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_94",
                northSprite = "melos_tiles_furniture_storage_02_93",
                eastSprite = "melos_tiles_furniture_storage_02_92"
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
                sprite = "melos_tiles_furniture_storage_02_99",
                northSprite = "melos_tiles_furniture_storage_02_101",
                eastSprite = "melos_tiles_furniture_storage_02_103",
                southSprite = "melos_tiles_furniture_storage_02_97"
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
                sprite = "melos_tiles_furniture_storage_02_98",
                northSprite = "melos_tiles_furniture_storage_02_100",
                eastSprite = "melos_tiles_furniture_storage_02_102",
                southSprite = "melos_tiles_furniture_storage_02_96"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_104",
                northSprite = "melos_tiles_furniture_storage_02_105",
                eastSprite = "melos_tiles_furniture_storage_02_106",
                southSprite = "melos_tiles_furniture_storage_02_107"
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
                sprite = "melos_tiles_furniture_storage_02_108",
                northSprite = "melos_tiles_furniture_storage_02_109",
                eastSprite = "melos_tiles_furniture_storage_02_110",
                southSprite = "melos_tiles_furniture_storage_02_111"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_112",
                northSprite = "melos_tiles_furniture_storage_02_113",
                eastSprite = "melos_tiles_furniture_storage_02_114",
                southSprite = "melos_tiles_furniture_storage_02_115"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_117",
                northSprite = "melos_tiles_furniture_storage_02_116",
                eastSprite = "melos_tiles_furniture_storage_02_118",
                southSprite = "melos_tiles_furniture_storage_02_119"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_120",
                northSprite = "melos_tiles_furniture_storage_02_121"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_122",
                northSprite = "melos_tiles_furniture_storage_02_123"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_126",
                northSprite = "melos_tiles_furniture_storage_02_125",
                eastSprite = "melos_tiles_furniture_storage_02_124"
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
                sprite = "melos_tiles_furniture_storage_02_131",
                northSprite = "melos_tiles_furniture_storage_02_133",
                eastSprite = "melos_tiles_furniture_storage_02_135",
                southSprite = "melos_tiles_furniture_storage_02_129"
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
                sprite = "melos_tiles_furniture_storage_02_130",
                northSprite = "melos_tiles_furniture_storage_02_132",
                eastSprite = "melos_tiles_furniture_storage_02_134",
                southSprite = "melos_tiles_furniture_storage_02_128"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_136",
                northSprite = "melos_tiles_furniture_storage_02_137",
                eastSprite = "melos_tiles_furniture_storage_02_138",
                southSprite = "melos_tiles_furniture_storage_02_139"
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
                sprite = "melos_tiles_furniture_storage_02_140",
                northSprite = "melos_tiles_furniture_storage_02_141",
                eastSprite = "melos_tiles_furniture_storage_02_142",
                southSprite = "melos_tiles_furniture_storage_02_143"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_144",
                northSprite = "melos_tiles_furniture_storage_02_145",
                eastSprite = "melos_tiles_furniture_storage_02_146",
                southSprite = "melos_tiles_furniture_storage_02_147"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_149",
                northSprite = "melos_tiles_furniture_storage_02_148",
                eastSprite = "melos_tiles_furniture_storage_02_150",
                southSprite = "melos_tiles_furniture_storage_02_151"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_152",
                northSprite = "melos_tiles_furniture_storage_02_153"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_154",
                northSprite = "melos_tiles_furniture_storage_02_155"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_158",
                northSprite = "melos_tiles_furniture_storage_02_157",
                eastSprite = "melos_tiles_furniture_storage_02_156"
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
                sprite = "melos_tiles_furniture_storage_02_163",
                northSprite = "melos_tiles_furniture_storage_02_165",
                eastSprite = "melos_tiles_furniture_storage_02_167",
                southSprite = "melos_tiles_furniture_storage_02_161"
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
                sprite = "melos_tiles_furniture_storage_02_162",
                northSprite = "melos_tiles_furniture_storage_02_164",
                eastSprite = "melos_tiles_furniture_storage_02_166",
                southSprite = "melos_tiles_furniture_storage_02_160"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_168",
                northSprite = "melos_tiles_furniture_storage_02_169",
                eastSprite = "melos_tiles_furniture_storage_02_170",
                southSprite = "melos_tiles_furniture_storage_02_171"
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
                sprite = "melos_tiles_furniture_storage_02_172",
                northSprite = "melos_tiles_furniture_storage_02_173",
                eastSprite = "melos_tiles_furniture_storage_02_174",
                southSprite = "melos_tiles_furniture_storage_02_175"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_176",
                northSprite = "melos_tiles_furniture_storage_02_177",
                eastSprite = "melos_tiles_furniture_storage_02_178",
                southSprite = "melos_tiles_furniture_storage_02_179"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_181",
                northSprite = "melos_tiles_furniture_storage_02_180",
                eastSprite = "melos_tiles_furniture_storage_02_182",
                southSprite = "melos_tiles_furniture_storage_02_183"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_184",
                northSprite = "melos_tiles_furniture_storage_02_185"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_186",
                northSprite = "melos_tiles_furniture_storage_02_187"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_190",
                northSprite = "melos_tiles_furniture_storage_02_189",
                eastSprite = "melos_tiles_furniture_storage_02_188"
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
                sprite = "melos_tiles_furniture_storage_02_195",
                northSprite = "melos_tiles_furniture_storage_02_197",
                eastSprite = "melos_tiles_furniture_storage_02_199",
                southSprite = "melos_tiles_furniture_storage_02_193"
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
                sprite = "melos_tiles_furniture_storage_02_194",
                northSprite = "melos_tiles_furniture_storage_02_196",
                eastSprite = "melos_tiles_furniture_storage_02_198",
                southSprite = "melos_tiles_furniture_storage_02_192"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_200",
                northSprite = "melos_tiles_furniture_storage_02_201",
                eastSprite = "melos_tiles_furniture_storage_02_202",
                southSprite = "melos_tiles_furniture_storage_02_203"
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
                sprite = "melos_tiles_furniture_storage_02_204",
                northSprite = "melos_tiles_furniture_storage_02_205",
                eastSprite = "melos_tiles_furniture_storage_02_206",
                southSprite = "melos_tiles_furniture_storage_02_207"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_208",
                northSprite = "melos_tiles_furniture_storage_02_209",
                eastSprite = "melos_tiles_furniture_storage_02_210",
                southSprite = "melos_tiles_furniture_storage_02_211"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_213",
                northSprite = "melos_tiles_furniture_storage_02_212",
                eastSprite = "melos_tiles_furniture_storage_02_214",
                southSprite = "melos_tiles_furniture_storage_02_215"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_216",
                northSprite = "melos_tiles_furniture_storage_02_217"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_218",
                northSprite = "melos_tiles_furniture_storage_02_219"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_222",
                northSprite = "melos_tiles_furniture_storage_02_221",
                eastSprite = "melos_tiles_furniture_storage_02_220"
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
                sprite = "melos_tiles_furniture_storage_02_227",
                northSprite = "melos_tiles_furniture_storage_02_229",
                eastSprite = "melos_tiles_furniture_storage_02_231",
                southSprite = "melos_tiles_furniture_storage_02_225"
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
                sprite = "melos_tiles_furniture_storage_02_226",
                northSprite = "melos_tiles_furniture_storage_02_228",
                eastSprite = "melos_tiles_furniture_storage_02_230",
                southSprite = "melos_tiles_furniture_storage_02_224"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_232",
                northSprite = "melos_tiles_furniture_storage_02_233",
                eastSprite = "melos_tiles_furniture_storage_02_234",
                southSprite = "melos_tiles_furniture_storage_02_235"
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
                sprite = "melos_tiles_furniture_storage_02_236",
                northSprite = "melos_tiles_furniture_storage_02_237",
                eastSprite = "melos_tiles_furniture_storage_02_238",
                southSprite = "melos_tiles_furniture_storage_02_239"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_240",
                northSprite = "melos_tiles_furniture_storage_02_241",
                eastSprite = "melos_tiles_furniture_storage_02_242",
                southSprite = "melos_tiles_furniture_storage_02_243"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeLockedByPadlock = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_245",
                northSprite = "melos_tiles_furniture_storage_02_244",
                eastSprite = "melos_tiles_furniture_storage_02_246",
                southSprite = "melos_tiles_furniture_storage_02_247"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_248",
                northSprite = "melos_tiles_furniture_storage_02_249"
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
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_250",
                northSprite = "melos_tiles_furniture_storage_02_251"
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
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                renderFloorHelper = true
            },
            {
                sprite = "melos_tiles_furniture_storage_02_254",
                northSprite = "melos_tiles_furniture_storage_02_253",
                eastSprite = "melos_tiles_furniture_storage_02_252"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Melos_Furniture_Sets_2"),
        "melos_tiles_furniture_storage_02_3",
        melosFurnitureSets2
    )
end

local function addMelosFlowersToMenu()
    local function createIndoorFlowerObject(sprite)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Plants_Indoor_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerPotRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true
            },
            { sprite = sprite, northSprite = northSprite }
        );
    end

    local melosIndoorFlowers = {};
    for i = 0, 16 do
        local sprite = "melos_tiles_gardencenter_01_" .. i;
        if i == 12 or i == 13 or i == 14 or i == 15 then
        else
            table.insert(melosIndoorFlowers, createIndoorFlowerObject(sprite));
        end
    end

    for i = 0, 16 do
        local sprite = "melos_tiles_gardencenter_plants_02_" .. i;
        table.insert(melosIndoorFlowers, createIndoorFlowerObject(sprite));
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Vegetation"),
        "melos_tiles_gardencenter_01_0",
        getText("IGUI_BuildingMenuSubCat_Vegetation_Plants_Indoor"),
        "melos_tiles_gardencenter_01_0",
        melosIndoorFlowers
    );
end

local function addMelosPlantersToMenu()
    local function createFlowerPlanterObject(spriteIndex, northSpriteIndex)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Plants_Indoor_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerPotRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                renderFloorHelper = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true
            },
            {
                sprite = "melos_tiles_gardencenter_plants_01_" .. spriteIndex,
                northSprite = "melos_tiles_gardencenter_plants_01_" .. northSpriteIndex
            }
        )
    end

    local melosFlowerPlanters = {}
    for i = 0, 63, 2 do
        table.insert(melosFlowerPlanters, createFlowerPlanterObject(i, i + 1))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Vegetation"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Vegetation_Melos_Flower_Planter_Set1"),
        "melos_tiles_gardencenter_plants_01_0",
        melosFlowerPlanters
    )

    melosFlowerPlanters = {}
    for i = 64, 126, 2 do
        table.insert(melosFlowerPlanters, createFlowerPlanterObject(i, i + 1))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Vegetation"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Vegetation_Melos_Flower_Planter_Set2"),
        "melos_tiles_gardencenter_plants_01_64",
        melosFlowerPlanters
    )
end

local function addMelosWallVinesToMenu()
    local melosWallVines = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Floor_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.WallVinesRecipe,
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
                sprite = "melos_tiles_gardencenter_vines_01_56",
                northSprite = "melos_tiles_gardencenter_vines_01_57",
                eastSprite = "melos_tiles_gardencenter_vines_01_58",
                southSprite = "melos_tiles_gardencenter_vines_01_59"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Floor_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.WallVinesRecipe,
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
                sprite = "melos_tiles_gardencenter_vines_01_60",
                northSprite = "melos_tiles_gardencenter_vines_01_61",
                eastSprite = "melos_tiles_gardencenter_vines_01_62",
                southSprite = "melos_tiles_gardencenter_vines_01_63"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Floor_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.WallVinesRecipe,
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
                sprite = "melos_tiles_gardencenter_vines_01_71",
                northSprite = "melos_tiles_gardencenter_vines_01_69",
                eastSprite = "melos_tiles_gardencenter_vines_01_67",
                southSprite = "melos_tiles_gardencenter_vines_01_65"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Floor_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.WallVinesRecipe,
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
                sprite = "melos_tiles_gardencenter_vines_01_70",
                northSprite = "melos_tiles_gardencenter_vines_01_68",
                eastSprite = "melos_tiles_gardencenter_vines_01_66",
                southSprite = "melos_tiles_gardencenter_vines_01_64"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_88",
                northSprite = "melos_tiles_gardencenter_vines_01_93"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_89",
                northSprite = "melos_tiles_gardencenter_vines_01_92"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_90",
                northSprite = "melos_tiles_gardencenter_vines_01_91"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_96",
                northSprite = "melos_tiles_gardencenter_vines_01_101"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_97",
                northSprite = "melos_tiles_gardencenter_vines_01_100"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_98",
                northSprite = "melos_tiles_gardencenter_vines_01_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_106",
                northSprite = "melos_tiles_gardencenter_vines_01_107"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_105",
                northSprite = "melos_tiles_gardencenter_vines_01_108"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_104",
                northSprite = "melos_tiles_gardencenter_vines_01_109"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_114",
                northSprite = "melos_tiles_gardencenter_vines_01_115"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_113",
                northSprite = "melos_tiles_gardencenter_vines_01_116"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_112",
                northSprite = "melos_tiles_gardencenter_vines_01_117"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_120",
                northSprite = "melos_tiles_gardencenter_vines_01_125"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_121",
                northSprite = "melos_tiles_gardencenter_vines_01_124"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_122",
                northSprite = "melos_tiles_gardencenter_vines_01_123"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_94",
                northSprite = "melos_tiles_gardencenter_vines_01_95"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_102",
                northSprite = "melos_tiles_gardencenter_vines_01_103"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_110",
                northSprite = "melos_tiles_gardencenter_vines_01_111"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_118",
                northSprite = "melos_tiles_gardencenter_vines_01_119"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_gardencenter_vines_01_126",
                northSprite = "melos_tiles_gardencenter_vines_01_127"
            }
        ),


    }


    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Vegetation"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Vegetation_Vines"),
        "melos_tiles_gardencenter_vines_01_102",
        melosWallVines
    )
end

local function addMelosGrapeVinesToMenu()
    local melosGrapeVines = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_0",
                northSprite = "melos_tiles_grapevines_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_1",
                northSprite = "melos_tiles_grapevines_01_2"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_4"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_6",
                northSprite = "melos_tiles_grapevines_01_9"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_7",
                northSprite = "melos_tiles_grapevines_01_8"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_10",
                northSprite = "melos_tiles_grapevines_01_11"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_18",
                northSprite = "melos_tiles_grapevines_01_21"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_19",
                northSprite = "melos_tiles_grapevines_01_20"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_22",
                northSprite = "melos_tiles_grapevines_01_23"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_24",
                northSprite = "melos_tiles_grapevines_01_27"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_25",
                northSprite = "melos_tiles_grapevines_01_26"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_28",
                northSprite = "melos_tiles_grapevines_01_29"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_30",
                northSprite = "melos_tiles_grapevines_01_33"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_31",
                northSprite = "melos_tiles_grapevines_01_32"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_34",
                northSprite = "melos_tiles_grapevines_01_35"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_36",
                northSprite = "melos_tiles_grapevines_01_39"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            {
                sprite = "melos_tiles_grapevines_01_37",
                northSprite = "melos_tiles_grapevines_01_38"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wall_Vines",
            "Tooltip_Wall_Vines_Generic",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallVinesRecipe,
            true,
            {
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
            },
            {
                sprite = "melos_tiles_grapevines_01_40",
                northSprite = "melos_tiles_grapevines_01_41"
            }
        ),


    }


    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Vegetation"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Vegetation_Vines"),
        "melos_tiles_gardencenter_vines_01_102",
        melosGrapeVines
    )
end

local function addMelosCookingObjsToMenu()
    local function createCookingObject(spriteIndex, northSpriteIndex, eastSpriteIndex, southSpriteIndex)
        return BuildingMenu.createObject(
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
                sprite = "melos_tiles_appliances_01_" .. spriteIndex,
                northSprite = "melos_tiles_appliances_01_" .. northSpriteIndex,
                eastSprite = "melos_tiles_appliances_01_" .. eastSpriteIndex,
                southSprite = "melos_tiles_appliances_01_" .. southSpriteIndex
            }
        )
    end

    local melosCookingObjects = {}

    for i = 0, 7 do
        local spriteIndex = i * 4
        local northSpriteIndex = spriteIndex + 1
        local eastSpriteIndex = spriteIndex + 2
        local southSpriteIndex = spriteIndex + 3

        local cookingObject = createCookingObject(spriteIndex, northSpriteIndex, eastSpriteIndex, southSpriteIndex)
        table.insert(melosCookingObjects, cookingObject)
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "melos_tiles_appliances_01_0",
        getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
        "melos_tiles_appliances_01_0",
        melosCookingObjects
    )
end

local function addMelosFridgesToMenu()
    local function createFridgeObject(recipe, popsicleFridge, sprites)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            popsicleFridge and BuildingMenu.onBuildPopsicleFridge or BuildingMenu.onBuildSimpleFridge,
            recipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true
            },
            sprites
        )
    end

    local function createFridgeSprites(baseIndex)
        return {
            sprite = "melos_tiles_appliances_01_" .. baseIndex,
            northSprite = "melos_tiles_appliances_01_" .. (baseIndex - 1),
            eastSprite = "melos_tiles_appliances_01_" .. (baseIndex + 2),
            southSprite = "melos_tiles_appliances_01_" .. (baseIndex + 1)
        }
    end

    local melosFridgesObjects = {}

    for i = 65, 77, 4 do
        local sprites = createFridgeSprites(i)
        table.insert(melosFridgesObjects, createFridgeObject(BuildingMenu.FridgeRecipe, false, sprites))
    end

    for i = 97, 109, 4 do
        local sprites = createFridgeSprites(i)
        table.insert(melosFridgesObjects, createFridgeObject(BuildingMenu.FridgeRecipe, false, sprites))
    end

    local additionalFridges = {
        { sprite = "melos_tiles_appliances_01_87", sprite2 = "melos_tiles_appliances_01_86", northSprite = "melos_tiles_appliances_01_84", northSprite2 = "melos_tiles_appliances_01_85" },
        { sprite = "melos_tiles_appliances_01_93", sprite2 = "melos_tiles_appliances_01_92", northSprite = "melos_tiles_appliances_01_94", northSprite2 = "melos_tiles_appliances_01_95" },
    }

    for _, fridgeData in ipairs(additionalFridges) do
        table.insert(melosFridgesObjects, createFridgeObject(BuildingMenu.Fridge2TileRecipe, true, fridgeData))
    end

    BuildingMenu.addObjectsToCategories(
        "Melos",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "melos_tiles_appliances_01_87",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "melos_tiles_appliances_01_87",
        melosFridgesObjects
    )
end


local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.melosTilesCastleWalls then
        addMelosWallsCastleToMenu()
    end
    if SandboxVars.BuildingMenu.brickWallsSubCategory then
        addMelosWallsBrickToMenu()
    end
    if SandboxVars.BuildingMenu.cinderblockWallsSubCategory then
        addMelosWallsCinderblockToMenu()
    end
    if SandboxVars.BuildingMenu.melosTilesBathroomWalls then
        addMelosWallsBathroomToMenu()
    end
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.windowsCategory then
        addWindowsPlusToMenu()
    end
    if SandboxVars.BuildingMenu.highFencesSubCategory then
        addHighFencesToMenu()
    end
    if SandboxVars.BuildingMenu.lowAndRailingFencesSubCategory then
        addLowAndRailingFencesToMenu()
    end
    if SandboxVars.BuildingMenu.floorsCategory then
        addFloorsToMenu()
    end
    if SandboxVars.BuildingMenu.stairsCategory then
        addMelosStairsToMenu()
    end
    if SandboxVars.BuildingMenu.kitchenCountersSubCategory then
        addKitchenCountersToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.containersOthersSubCategory then
        addContainersOthersToMenu()
    end
    if SandboxVars.BuildingMenu.tablesSubCategory then
        addMelosSmallTablesToMenu()
        addMelosLargeTablesToMenu()
    end
    if SandboxVars.BuildingMenu.bedsSubCategory then
        addMelosSimpleBedsToMenu()
        addMelosLargeBedsToMenu()
    end
    if SandboxVars.BuildingMenu.seatingFurnitureSubCategory then
        addMelosCouchesToMenu()
        addMelosCharisToMenu()
    end
    if SandboxVars.BuildingMenu.dressersAndWardrobesSubCategory then
        addMelosFurnitureSet1ToMenu()
        addMelosFurnitureSet2ToMenu()
    end
    if SandboxVars.BuildingMenu.indoorPlantsSubCategory then
        addMelosFlowersToMenu()
    end
    if SandboxVars.BuildingMenu.outdoorPlantsSubCategory then
        addMelosPlantersToMenu()
    end
    if SandboxVars.BuildingMenu.landscapingSubCategory then
        addMelosWallVinesToMenu()
        addMelosGrapeVinesToMenu()
    end
    if SandboxVars.BuildingMenu.cookingAppliances then
        addMelosCookingObjsToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addMelosFridgesToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)
