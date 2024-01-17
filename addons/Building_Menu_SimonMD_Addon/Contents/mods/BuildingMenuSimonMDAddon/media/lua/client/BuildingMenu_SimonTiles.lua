require("BuildingMenu04_CategoriesDefinitions")

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()


local function addSimonMDWallsToMenu()
    local simonMDScrapWalls = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_92",
                northSprite = "walls_Simon_MD_80",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_93",
                northSprite = "walls_Simon_MD_81",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_94",
                northSprite = "walls_Simon_MD_82",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_95",
                northSprite = "walls_Simon_MD_83",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_96",
                northSprite = "walls_Simon_MD_84",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_97",
                northSprite = "walls_Simon_MD_85",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_98",
                northSprite = "walls_Simon_MD_86",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Wall",
            "Tooltip_Scrap_Wall",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                isThumpable = true,
                canBarricade = false,
                noNeedHammer = true,
                modData = {wallType = "wall"}
            },
            {
                sprite = "walls_Simon_MD_99",
                northSprite = "walls_Simon_MD_87",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_119",
                northSprite = "walls_Simon_MD_112",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_118",
                northSprite = "walls_Simon_MD_113",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_117",
                northSprite = "walls_Simon_MD_114",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Door_Frame",
            "Tooltip_Scrap_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "walls_Simon_MD_116",
                northSprite = "walls_Simon_MD_115",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_111",
                northSprite = "walls_Simon_MD_104",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_110",
                northSprite = "walls_Simon_MD_105",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_109",
                northSprite = "walls_Simon_MD_106",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Window_Frame",
            "Tooltip_Scrap_Window_Frame",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.BigScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "walls_Simon_MD_108",
                northSprite = "walls_Simon_MD_107",
                corner = "constructedobjects_01_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Scrap_Pillar",
            "Tooltip_Scrap_Pillar",
            BuildingMenu.onBuildMetalWall,
            BuildingMenu.SmallScrapWallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                completionSound = "BuildMetalStructureWallFrame",
                noNeedHammer = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {sprite = "constructedobjects_01_51", northSprite = "constructedobjects_01_51"}
        )
    }
    BuildingMenu.addObjectsToCategories(
    "Simon MDs",
    getText("IGUI_BuildingMenuCat_Walls"),
    "walls_Simon_MD_92",
    getText("IGUI_BuildingMenuSubCat_Walls_Scrap"),
    "walls_Simon_MD_92",
    simonMDScrapWalls
    )

end
addSimonMDWallsToMenu()


local simonMDCorrugatedRoof = {
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Roof",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildFloor,
        BuildingMenu.MetalFloorRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
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
            actionAnim = "BuildLow",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_16", northSprite = "roofs_Simon_MD_16"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner_2",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_17", northSprite = "roofs_Simon_MD_17"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Inner_3",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_18", northSprite = "roofs_Simon_MD_18"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_1",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_19", northSprite = "roofs_Simon_MD_19"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_2",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_20", northSprite = "roofs_Simon_MD_20"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Valley_3",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_21", northSprite = "roofs_Simon_MD_21"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Corrugated_Metal_Outer_1",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
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
            actionAnim = "Build",
            noNeedHammer = false,
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
        "Tooltip_BuildingMenuObj_Black_Patio_Shingles_Pitched",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
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
        "Tooltip_BuildingMenuObj_Black_Patio_Shingles_Inner",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_29", northSprite = "roofs_Simon_MD_29"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Black_Patio_Shingles_Outer",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
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
        "Tooltip_BuildingMenuObj_Black_Patio_Shingles_Valley",
        "Tooltip_Roof_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.ScrapRoofTileRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            renderFloorHelper = true,
            canPassThrough = true,
            canBarricade = false
        },
        {sprite = "roofs_Simon_MD_28", northSprite = "roofs_Simon_MD_28"}
    )
}
BuildingMenu.addObjectsToCategories(
    "Simon MDs",
    getText("IGUI_BuildingMenuCat_Roofing"),
    "roofs_Simon_MD_8",
    getText("IGUI_BuildingMenuSubCat_Roofing_Scrap"),
    "roofs_Simon_MD_8",
    simonMDCorrugatedRoof
)


local simonMDOthers = {
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_SecretEntranceDoor",
        "Tooltip_SecretEntranceDoor",
        BuildingMenu.onBuildDoor,
        BuildingMenu.WoodenDoorRecipe,
        "Build Secret Entrance",
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
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
    getText("IGUI_BuildingMenuCat_SimonMD_Others"),
    "fixtures_doors_Simon_MD_30",
    getText("IGUI_BuildingMenuSubCat_SimonMD_Secret_Entrances"),
    "fixtures_doors_Simon_MD_30",
    simonMDOthers
)


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
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
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
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
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
    getText("IGUI_BuildingMenuCat_Doors"),
    "furniture_Simon_MD_72",
    getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
    "furniture_Simon_MD_72",
    simonMDGarageDoorsObjects
)

simonMDGarageDoorsObjects = {}
for _, startNumber in ipairs(garageDoorSpriteRanges) do
    table.insert(simonMDGarageDoorsObjects, create4TileGarageDoor("furniture_Simon_MD_", startNumber))
end


BuildingMenu.addObjectsToCategories(
    "Simon MDs",
    getText("IGUI_BuildingMenuCat_Doors"),
    nil,
    getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
    "furniture_Simon_MD_72",
    simonMDGarageDoorsObjects
)