---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addSimonMDWallsToMenu()
    local simonMDScrapWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_92",
                northSprite = "walls_Simon_MD_80",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_93",
                northSprite = "walls_Simon_MD_81",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_94",
                northSprite = "walls_Simon_MD_82",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_95",
                northSprite = "walls_Simon_MD_83",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_96",
                northSprite = "walls_Simon_MD_84",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_97",
                northSprite = "walls_Simon_MD_85",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_98",
                northSprite = "walls_Simon_MD_86",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_99",
                northSprite = "walls_Simon_MD_87",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_119",
                northSprite = "walls_Simon_MD_112",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_118",
                northSprite = "walls_Simon_MD_113",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_117",
                northSprite = "walls_Simon_MD_114",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_116",
                northSprite = "walls_Simon_MD_115",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_111",
                northSprite = "walls_Simon_MD_104",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_110",
                northSprite = "walls_Simon_MD_105",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_109",
                northSprite = "walls_Simon_MD_106",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_108",
                northSprite = "walls_Simon_MD_107",
                pillar = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Pillar",
            "Tooltip_Scrap_Pillar",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.SmallScrapWallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureWallFrame",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {sprite = "constructedobjects_01_51" }
        )
    }
    BuildingMenu.addObjectsToCategories(
    "Simon MDs",
    "IGUI_BuildingMenuCat_Walls",
    "walls_Simon_MD_92",
    "IGUI_BuildingMenuSubCat_Walls_Scrap",
    "walls_Simon_MD_92",
    simonMDScrapWalls
    )

end


local function addHighFencesToMenu()
    local highFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_1",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.BigScrapHighFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_Simon_MD_32",
                sprite2 = "fencing_Simon_MD_31",
                northSprite = "fencing_Simon_MD_36",
                northSprite2 = "fencing_Simon_MD_37",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_Post_1",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_Simon_MD_30", northSprite = "fencing_Simon_MD_38"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_1",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                hoppable = false,
                blockAllTheSquare = false
            },
            {
                sprite = "fencing_Simon_MD_35",
                sprite2 = "fencing_Simon_MD_34",
                northSprite = "fencing_Simon_MD_39",
                northSprite2 = "fencing_Simon_MD_40",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_Post_1",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                hoppable = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_Simon_MD_33", northSprite = "fencing_Simon_MD_41"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_2",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.BigScrapHighFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_Simon_MD_44",
                sprite2 = "fencing_Simon_MD_43",
                northSprite = "fencing_Simon_MD_48",
                northSprite2 = "fencing_Simon_MD_49",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_Post_2",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_Simon_MD_42", northSprite = "fencing_Simon_MD_50"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_2",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                hoppable = false,
                blockAllTheSquare = false
            },
            {
                sprite = "fencing_Simon_MD_47",
                sprite2 = "fencing_Simon_MD_46",
                northSprite = "fencing_Simon_MD_51",
                northSprite2 = "fencing_Simon_MD_52",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_Post_2",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                hoppable = false,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_Simon_MD_45", northSprite = "fencing_Simon_MD_53"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_1_Back",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.BigScrapHighFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_Simon_MD_55",
                sprite2 = "fencing_Simon_MD_54",
                northSprite = "fencing_Simon_MD_58",
                northSprite2 = "fencing_Simon_MD_59",
                corner = "fencing_Simon_MD_70",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_1_Back",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                hoppable = false,
                blockAllTheSquare = false
            },
            {
                sprite = "fencing_Simon_MD_57",
                sprite2 = "fencing_Simon_MD_56",
                northSprite = "fencing_Simon_MD_60",
                northSprite2 = "fencing_Simon_MD_61",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_High_Fence_2_Back",
            "Tooltip_Scrap_High_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.BigScrapHighFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_Simon_MD_63",
                sprite2 = "fencing_Simon_MD_62",
                northSprite = "fencing_Simon_MD_66",
                northSprite2 = "fencing_Simon_MD_67",
                corner = "fencing_Simon_MD_70",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Low_Fence_2_Back",
            "Tooltip_Scrap_Low_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.SmallScrapLowFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                hoppable = false,
                blockAllTheSquare = false
            },
            {
                sprite = "fencing_Simon_MD_65",
                sprite2 = "fencing_Simon_MD_64",
                northSprite = "fencing_Simon_MD_68",
                northSprite2 = "fencing_Simon_MD_69",
            }
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Fencing",
        "fencing_Simon_MD_31",
        "IGUI_BuildingMenuSubCat_High_Fences_Scrap",
        "fencing_Simon_MD_31",
        highFences
    )
end


local function addRoofingToMenu()
    local simonMDCorrugatedRoof = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Roof",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.MetalFloorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "furniture_Simon_MD_78", northSprite = "furniture_Simon_MD_87"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Roof",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.MetalFloorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "furniture_Simon_MD_79", northSprite = "furniture_Simon_MD_86"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Pitched_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_8", northSprite = "roofs_Simon_MD_13"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Pitched_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_9", northSprite = "roofs_Simon_MD_12"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Pitched_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_10", northSprite = "roofs_Simon_MD_11"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_16" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_17" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_18" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_19" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_20" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_21" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Outer_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_32", northSprite = "roofs_Simon_MD_37"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Outer_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_33", northSprite = "roofs_Simon_MD_36"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Outer_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_34", northSprite = "roofs_Simon_MD_35"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Pitched",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_14", northSprite = "roofs_Simon_MD_15"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_29" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Outer",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_38", northSprite = "roofs_Simon_MD_39"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.ScrapRoofTileRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false
            },
            {sprite = "roofs_Simon_MD_28" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Roofing",
        "roofs_Simon_MD_8",
        "IGUI_BuildingMenuSubCat_Roofing_Scrap",
        "roofs_Simon_MD_8",
        simonMDCorrugatedRoof
    )
end

local function addSimonMDSecretEntrancesToMenu()
    local simonMDOthers = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_SecretEntranceDoor",
            "Tooltip_SecretEntranceDoor",
            BuildingMenu.onBuildDoor,
            BuildingMenu.MetalDoorRecipe,
            "Build Secret Entrance",
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "fixtures_doors_Simon_MD_28",
                northSprite = "fixtures_doors_Simon_MD_29",
                openSprite = "fixtures_doors_Simon_MD_30",
                openNorthSprite = "fixtures_doors_Simon_MD_31"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_SimonMD_Others",
        "fixtures_doors_Simon_MD_30",
        "IGUI_BuildingMenuSubCat_SimonMD_Secret_Entrances",
        "fixtures_doors_Simon_MD_30",
        simonMDOthers
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


    local simonMDGarageDoorsObjects = {}
    local garageDoorSpriteRanges = {72}

    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(simonMDGarageDoorsObjects, create3TileGarageDoor("furniture_Simon_MD_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Doors",
        "furniture_Simon_MD_72",
        "IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors",
        "furniture_Simon_MD_72",
        simonMDGarageDoorsObjects
    )

    simonMDGarageDoorsObjects = {}
    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(simonMDGarageDoorsObjects, create4TileGarageDoor("furniture_Simon_MD_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Doors",
        "furniture_Simon_MD_72",
        "IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors",
        "furniture_Simon_MD_72",
        simonMDGarageDoorsObjects
    )
end

local function addMetalContainersToMenu()
    local metalContainers = {
        {
            subcategoryName = "IGUI_BuildingMenuSubCat_Containers_Lockers",
            subCategoryIcon = "furniture_Simon_MD_1",
            objects = {
                BuildingMenu.createObject(
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
                        sprite = "furniture_Simon_MD_1",
                        northSprite = "furniture_Simon_MD_0",
                        eastSprite = "furniture_Simon_MD_3",
                        southSprite = "furniture_Simon_MD_2"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalGlassCounterRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true
                    },
                    {
                        sprite = "furniture_Simon_MD_5",
                        northSprite = "furniture_Simon_MD_4",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalGlassCounterRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true
                    },
                    {
                        sprite = "furniture_02_Simon_MD_46",
                        northSprite = "furniture_02_Simon_MD_47",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildDoubleMetalShelf,
                    BuildingMenu.MetalCounterSmallRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        isThumpable = true,
                        blockAllTheSquare = false,
                        needToBeAgainstWall = true,
                        canBeAlwaysPlaced = false,
                        renderFloorHelper = true,
                        buildHigh = true,
                    },
                    {
                        sprite = "furniture_Simon_MD_12",
                        sprite2 = "furniture_Simon_MD_11",
                        northSprite = "furniture_Simon_MD_8",
                        northSprite2 = "furniture_Simon_MD_9"
                    }
                ),
            }
        },
    }

    for k, subCatData in pairs(metalContainers) do
        BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Containers",
        "furniture_Simon_MD_1",
        subCatData.subcategoryName,
        subCatData.subCategoryIcon,
        subCatData.objects
        )
    end
end

local function addDoubleDoorToMenu()
    local doubleDoors = {
        {
            subcategoryName = "IGUI_BuildingMenuSubCat_Double_Door_Gates",
            subCategoryIcon = "fixtures_doors_fences_Simon_MD_0",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Double_Scrap_Door_Gate",
                    "Tooltip_Scrap_Double_Door_Gate",
                    BuildingMenu.onDoubleDoor,
                    BuildingMenu.GarageDoorRecipe,
                    true,
                    {
                        canBarricade = false,
                        ignoreNorth = true,
                        completionSound = "BuildMetalStructureLargeWiredFence",
                        spriteIndex = 8
                    },
                    {
                        sprite = "fixtures_doors_fences_Simon_MD_8",
                    }
                )
            }
        }
    }

    for k, subCatData in pairs(doubleDoors) do
        BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Doors",
        "fixtures_doors_fences_Simon_MD_0",
        subCatData.subcategoryName,
        subCatData.subCategoryIcon,
        subCatData.objects
        )
    end
end

local function addDoorsToMenu()
    local doors =
    {
        {
            subcategoryName = "IGUI_BuildingMenuSubCat_Scrap_Doors",
            subCategoryIcon = "fixtures_doors_Simon_MD_20",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Scrap_Door_1",
                    "Tooltip_Scrap_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.ScrapDoor1Recipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        canBarricade = true,
                        modData = {wallType = "doorframe"}
                    },
                    {
                        sprite = "fixtures_doors_Simon_MD_20",
                        northSprite = "fixtures_doors_Simon_MD_21",
                        openSprite = "fixtures_doors_Simon_MD_22",
                        openNorthSprite = "fixtures_doors_Simon_MD_23"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Scrap_Door_2",
                    "Tooltip_Scrap_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.ScrapDoor2Recipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        canBarricade = true,
                        modData = {wallType = "doorframe"}
                    },
                    {
                        sprite = "fixtures_doors_Simon_MD_24",
                        northSprite = "fixtures_doors_Simon_MD_25",
                        openSprite = "fixtures_doors_Simon_MD_26",
                        openNorthSprite = "fixtures_doors_Simon_MD_27"
                    }
                ),
            }
        }
    }

    for k, subCatData in pairs(doors) do
        BuildingMenu.addObjectsToCategories(
        "Simon MDs",
        "IGUI_BuildingMenuCat_Doors",
        "fixtures_doors_Simon_MD_20",
        subCatData.subcategoryName,
        subCatData.subCategoryIcon,
        subCatData.objects
        )
    end
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.industrialWallsSubCategory then
        addSimonMDWallsToMenu()
    end
    if SandboxVars.BuildingMenu.highFencesSubCategory then
        addHighFencesToMenu()
    end
    if SandboxVars.BuildingMenu.roofsCategory then
        addRoofingToMenu()
    end
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
        addDoubleDoorToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.simonMDSecretEntrances then
        addSimonMDSecretEntrancesToMenu()
    end
end
Events.OnInitializeBuildingMenuObjects.Add(addCategoriesToBuildingMenu)