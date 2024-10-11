---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")



local function addMetalContainersToMenu()
    local metalContainers = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Containers_Metal"),
            subCategoryIcon = "fixtures_counters_tk_01_0",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        blockAllTheSquare = false,
                    },
                    {
                        sprite = "fixtures_counters_tk_01_0",
                        northSprite = "fixtures_counters_tk_01_1",
                        eastSprite = "fixtures_counters_tk_01_2",
                        southSprite = "fixtures_counters_tk_01_3"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalCounterSmallRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        renderFloorHelper = true,
                        blockAllTheSquare = false,
                    },
                    {
                        sprite = "industry_tk_02_25",
                        northSprite = "industry_tk_02_26",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        blockAllTheSquare = true,
                    },
                    {
                        sprite = "kitchen_misc_tk_01_12",
                        northSprite = "kitchen_misc_tk_01_13",
                        eastSprite = "kitchen_misc_tk_01_14",
                        southSprite = "kitchen_misc_tk_01_15"
                    }
                ),
            }
        },
    }
    for k, subCatData in pairs(metalContainers) do
        BuildingMenu.addObjectsToCategories(
            "Throttlekitty",
            getText("IGUI_BuildingMenuCat_Containers"),
            "fixtures_counters_tk_01_0",
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
            "Tooltip_Big_Cardboard_Box",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CardboardBoxRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
            },
            { sprite = "industry_tk_02_32" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Big_Cardboard_Box",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CardboardBoxRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = true,
            },
            { sprite = "industry_tk_02_33" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Throttlekitty",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Crates"),
        "industry_tk_02_32",
        crate
    )
end

local function addStairsToMenu()
    local junkyardStairs = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Junkyard_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.JunkyardStairsRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "junkyard_tk_02_5",
                upToLeft01 = "junkyard_tk_02_5",
                upToLeft02 = "junkyard_tk_02_4",
                upToLeft03 = "junkyard_tk_02_3",
                upToRight01 = "junkyard_tk_02_0",
                upToRight02 = "junkyard_tk_02_1",
                upToRight03 = "junkyard_tk_02_2",
                pillar = "",
                pillarNorth = ""
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Throttlekitty",
        getText("IGUI_BuildingMenuCat_Junkyard"),
        "junkyard_tk_02_5",
        getText("IGUI_BuildingMenuSubCat_Stairs_Junkyard"),
        "junkyard_tk_02_5",
        junkyardStairs
    )

    local decorations = {};
    if getActivatedMods():contains("damnlib") then
        decorations = {
            BuildingMenu.createObject(
                "",
                "Tooltip_Roadway_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                BuildingMenu.TireRubberPileRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureSmallScrap",
                    actionAnim = "VehicleTrailer",
                    craftingBank = "RepairWithWrench",
                    isCorner = true,
                    canPassThrough = true,
                },
                {
                    sprite = "junkyard_tk_02_18"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Roadway_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                BuildingMenu.TireRubberRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureSmallScrap",
                    actionAnim = "VehicleTrailer",
                    craftingBank = "RepairWithWrench",
                    isCorner = true,
                    canPassThrough = true,
                },
                {
                    sprite = "junkyard_tk_02_16"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Roadway_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                BuildingMenu.TireRubberRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureSmallScrap",
                    actionAnim = "VehicleTrailer",
                    craftingBank = "RepairWithWrench",
                    isCorner = true,
                    canPassThrough = true,
                },
                {
                    sprite = "junkyard_tk_02_19",
                    northSprite = "junkyard_tk_02_20"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Roadway_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                BuildingMenu.TireRubberPileRecipe,
                true,
                {
                    completionSound = "BuildMetalStructureSmallScrap",
                    actionAnim = "VehicleTrailer",
                    craftingBank = "RepairWithWrench",
                    isCorner = true,
                    canPassThrough = true,
                },
                {
                    sprite = "junkyard_tk_02_40",
                    northSprite = "junkyard_tk_02_41"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Roadway_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                {
                    neededTools = {
                        "Paintbrush"
                    },
                    neededMaterials = {
                        {
                            {
                                Material = "damnCraft.TireRubberNewLarge",
                                Amount = 4
                            },
                            {
                                Material = "damnCraft.TireRubberUsedLarge",
                                Amount = 4
                            },
                            {
                                Material = "damnCraft.TireRubberDestroyedLarge",
                                Amount = 4
                            },
                        },
                    },
                    useConsumable = {
                        {
                            Consumable = "Base.PaintWhite",
                            Amount = 2
                        }
                    },
                },
                true,
                {
                    completionSound = "BuildMetalStructureSmallScrap",
                    actionAnim = "VehicleTrailer",
                    craftingBank = "RepairWithWrench",
                    isCorner = true,
                    canPassThrough = true,
                },
                {
                    sprite = "junkyard_tk_02_42",
                    northSprite = "junkyard_tk_02_43"
                }
            ),
        }
        BuildingMenu.addObjectsToCategories(
            "Throttlekitty",
            getText("IGUI_BuildingMenuCat_Junkyard"),
            nil,
            getText("IGUI_BuildingMenuSubCat_Junkyard_Decorations"),
            "junkyard_tk_02_18",
            decorations
        )
    end

    decorations = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            {
                neededMaterials = {
                    {
                        {
                            Material = "Base.SheetMetal",
                            Amount = 1
                        },
                    },
                }
            },
            true,
            {
                completionSound = "BuildMetalStructureSmallScrap",
                actionAnim = "VehicleWorkOnTire",
                craftingBank = "RepairWithWrench",
                isCorner = true,
                canPassThrough = true,
            },
            {
                sprite = "junkyard_tk_02_8",
                northSprite = "junkyard_tk_02_9"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            {
                neededMaterials = {
                    {
                        Material = "Base.Plank",
                        Amount = 2
                    },
                }
            },
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                actionAnim = "VehicleWorkOnTire",
                craftingBank = "BuildingGeneric",
                isCorner = true,
                canPassThrough = true,
            },
            {
                sprite = "junkyard_tk_02_10",
                northSprite = "junkyard_tk_02_11"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            {
                neededTools = {
                    "Paintbrush"
                },
                neededMaterials = {
                    {
                        Material = "Base.SheetMetal",
                        Amount = 1
                    },
                },
                useConsumable = {
                    {
                        Consumable = "Base.PaintGreen",
                        Amount = 1
                    }
                },
                skills = {
                    {
                        Skill = "Woodwork",
                        Level = 1,
                        Xp = BuildingMenu.round(1 * SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel)
                    }
                }
            },
            true,
            {
                completionSound = "BuildMetalStructureSmall",
                isCorner = true,
                canPassThrough = true,
            },
            {
                sprite = "junkyard_tk_02_12",
                northSprite = "junkyard_tk_02_13"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            {
                neededTools = {
                    "Paintbrush"
                },
                neededMaterials = {
                    {
                        Material = "Base.SheetMetal",
                        Amount = 1
                    },
                },
                useConsumable = {
                    {
                        Consumable = "Base.PaintOrange",
                        Amount = 1
                    }
                },
                skills = {
                    {
                        Skill = "Woodwork",
                        Level = 1,
                        Xp = BuildingMenu.round(1 * SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel)
                    }
                }
            },
            true,
            {
                completionSound = "BuildMetalStructureSmall",
                isCorner = true,
                canPassThrough = true,
            },
            {
                sprite = "junkyard_tk_02_14",
                northSprite = "junkyard_tk_02_15"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Throttlekitty",
        getText("IGUI_BuildingMenuCat_Junkyard"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Junkyard_Decorations"),
        "junkyard_tk_02_18",
        decorations
    )
end

local function addIndustrialWallsToMenu()
    local industrialWalls = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Walls_White_Industrial_Walls"),
            subCategoryIcon = "industry_tk_01_0",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Wall",
                    "Tooltip_White_Industrial_Wall",
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
                        sprite = "industry_tk_01_0",
                        northSprite = "industry_tk_01_1",
                        corner = "industry_tk_01_2",
                        pillar = "industry_tk_01_3"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Door_Frame",
                    "Tooltip_White_Industrial_Door_Frame",
                    BuildingMenu.onBuildDoorFrame,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = "industry_tk_01_10",
                        northSprite = "industry_tk_01_11",
                        pillar = "industry_tk_01_3"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Window_Frame",
                    "Tooltip_White_Industrial_Window_Frame",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = true,
                        hoppable = true,
                        modData = { wallType = "windowsframe" }
                    },
                    {
                        sprite = "industry_tk_01_8",
                        northSprite = "industry_tk_01_9",
                        pillar = "industry_tk_01_3"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Corner_Wall",
                    "Tooltip_White_Industrial_Wall",
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
                        corner = "industry_tk_01_2",
                        pillar = "industry_tk_01_3"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Pillar",
                    "Tooltip_White_Industrial_Pillar",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        canPassThrough = true,
                        canBarricade = false,
                        isCorner = true,
                        modData = { wallType = "pillar" }
                    },
                    { sprite = "industry_tk_01_3" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_1",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_0", northSprite = "walls_exterior_roofs_tk_01_13" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_2",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_1", northSprite = "walls_exterior_roofs_tk_01_12" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_3",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_2", northSprite = "walls_exterior_roofs_tk_01_11" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_4",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_8", northSprite = "walls_exterior_roofs_tk_01_5" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_5",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_9", northSprite = "walls_exterior_roofs_tk_01_4" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_Slope_Wall_6",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_10", northSprite = "walls_exterior_roofs_tk_01_3" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_End_Small",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_15", northSprite = "walls_exterior_roofs_tk_01_7" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_End_Medium",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_14", northSprite = "walls_exterior_roofs_tk_01_6" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_White_Industrial_Roof_End_Big",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenWhiteBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_16", northSprite = "walls_exterior_roofs_tk_01_17" }
                )
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Walls_Blue_Industrial_Walls"),
            subCategoryIcon = "industry_tk_01_4",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Wall",
                    "Tooltip_Blue_Industrial_Wall",
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
                        sprite = "industry_tk_01_4",
                        northSprite = "industry_tk_01_5",
                        corner = "industry_tk_01_6",
                        pillar = "industry_tk_01_7"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Door_Frame",
                    "Tooltip_Blue_Industrial_Door_Frame",
                    BuildingMenu.onBuildDoorFrame,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = "industry_tk_01_14",
                        northSprite = "industry_tk_01_15",
                        pillar = "industry_tk_01_7"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Window_Frame",
                    "Tooltip_Blue_Industrial_Window_Frame",
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
                        sprite = "industry_tk_01_12",
                        northSprite = "industry_tk_01_13",
                        pillar = "industry_tk_01_7"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Corner_Wall",
                    "Tooltip_Blue_Industrial_Wall",
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
                        corner = "industry_tk_01_6",
                        pillar = "industry_tk_01_7"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Pillar",
                    "Tooltip_Blue_Industrial_Pillar",
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
                    { sprite = "industry_tk_01_7" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_1",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_24", northSprite = "walls_exterior_roofs_tk_01_37" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_2",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_25", northSprite = "walls_exterior_roofs_tk_01_36" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_3",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_26", northSprite = "walls_exterior_roofs_tk_01_35" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_4",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_32", northSprite = "walls_exterior_roofs_tk_01_29" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_5",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_33", northSprite = "walls_exterior_roofs_tk_01_28" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_Slope_Wall_6",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_34", northSprite = "walls_exterior_roofs_tk_01_27" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_End_Small",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_39", northSprite = "walls_exterior_roofs_tk_01_31" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_End_Medium",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_38", northSprite = "walls_exterior_roofs_tk_01_30" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Blue_Industrial_Roof_End_Big",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.BlueBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_01_40", northSprite = "walls_exterior_roofs_tk_01_41" }
                )
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Walls_Light_Green_Industrial_Walls"),
            subCategoryIcon = "industry_tk_01_24",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Wall",
                    "Tooltip_Light_Green_Industrial_Wall",
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
                        sprite = "industry_tk_01_24",
                        northSprite = "industry_tk_01_25",
                        corner = "industry_tk_01_26",
                        pillar = "industry_tk_01_27"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Door_Frame",
                    "Tooltip_Light_Green_Industrial_Door_Frame",
                    BuildingMenu.onBuildDoorFrame,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = "industry_tk_01_34",
                        northSprite = "industry_tk_01_35",
                        pillar = "industry_tk_01_27"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Window_Frame",
                    "Tooltip_Light_Green_Industrial_Window_Frame",
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
                        sprite = "industry_tk_01_32",
                        northSprite = "industry_tk_01_33",
                        pillar = "industry_tk_01_27"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Corner_Wall",
                    "Tooltip_Light_Green_Industrial_Wall",
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
                        corner = "industry_tk_01_26",
                        pillar = "industry_tk_01_27"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Pillar",
                    "Tooltip_Light_Green_Industrial_Pillar",
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
                    { sprite = "industry_tk_01_27" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_1",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_0", northSprite = "walls_exterior_roofs_tk_02_13" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_2",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_1", northSprite = "walls_exterior_roofs_tk_02_12" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_3",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_2", northSprite = "walls_exterior_roofs_tk_02_11" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_4",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_8", northSprite = "walls_exterior_roofs_tk_02_5" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_5",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_9", northSprite = "walls_exterior_roofs_tk_02_4" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_Slope_Wall_6",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_10", northSprite = "walls_exterior_roofs_tk_02_3" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_End_Small",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_15", northSprite = "walls_exterior_roofs_tk_02_7" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_End_Medium",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_14", northSprite = "walls_exterior_roofs_tk_02_6" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Light_Green_Industrial_Roof_End_Big",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_16", northSprite = "walls_exterior_roofs_tk_02_17" }
                )
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Walls_Green_Industrial_Walls"),
            subCategoryIcon = "industry_tk_01_28",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Wall",
                    "Tooltip_Green_Industrial_Wall",
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
                        sprite = "industry_tk_01_28",
                        northSprite = "industry_tk_01_29",
                        corner = "industry_tk_01_30",
                        pillar = "industry_tk_01_31"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Door_Frame",
                    "Tooltip_Green_Industrial_Door_Frame",
                    BuildingMenu.onBuildDoorFrame,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        modData = { wallType = "doorframe" }
                    },
                    {
                        sprite = "industry_tk_01_38",
                        northSprite = "industry_tk_01_39",
                        pillar = "industry_tk_01_31"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Window_Frame",
                    "Tooltip_Green_Industrial_Window_Frame",
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
                        sprite = "industry_tk_01_36",
                        northSprite = "industry_tk_01_37",
                        pillar = "industry_tk_01_31"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Corner_Wall",
                    "Tooltip_Green_Industrial_Wall",
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
                        corner = "industry_tk_01_30",
                        pillar = "industry_tk_01_31"
                    }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Pillar",
                    "Tooltip_Green_Industrial_Pillar",
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
                    { sprite = "industry_tk_01_31" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_1",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_24", northSprite = "walls_exterior_roofs_tk_02_37" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_2",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_25", northSprite = "walls_exterior_roofs_tk_02_36" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_3",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_26", northSprite = "walls_exterior_roofs_tk_02_35" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_4",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_32", northSprite = "walls_exterior_roofs_tk_02_29" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_5",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_33", northSprite = "walls_exterior_roofs_tk_02_28" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_Slope_Wall_6",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_34", northSprite = "walls_exterior_roofs_tk_02_27" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_End_Small",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenSmallWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureSmall",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_39", northSprite = "walls_exterior_roofs_tk_02_31" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_End_Medium",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_38", northSprite = "walls_exterior_roofs_tk_02_30" }
                ),
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Green_Industrial_Roof_End_Big",
                    "Tooltip_Old_Wood_Wall",
                    BuildingMenu.onBuildWall,
                    BuildingMenu.GreenBigWoodWallRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                        canBarricade = false,
                        modData = { wallType = "wall" }
                    },
                    { sprite = "walls_exterior_roofs_tk_02_40", northSprite = "walls_exterior_roofs_tk_02_41" }
                )
            }
        },
    }
    for k, subCatData in pairs(industrialWalls) do
        BuildingMenu.addObjectsToCategories(
            "Throttlekitty",
            getText("IGUI_BuildingMenuCat_Walls"),
            "industry_tk_01_0",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addLightingToMenu()
    local lighting = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Post1",
            "Tooltip_Lighting",
            BuildingMenu.onBuildGeneratorPoweredLight,
            BuildingMenu.LightPostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canBeAlwaysPlaced = false,
                isCorner = true
            },
            {
                sprite = "lighting_outdoor_tk_01_12",
                northSprite = "lighting_outdoor_tk_01_13",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Post2",
            "Tooltip_Lighting",
            BuildingMenu.onBuildGeneratorPoweredLight,
            BuildingMenu.LightPostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canBeAlwaysPlaced = false,
                isCorner = true
            },
            {
                sprite = "lighting_outdoor_tk_01_17",
                northSprite = "lighting_outdoor_tk_01_14",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Post3",
            "Tooltip_Lighting",
            BuildingMenu.onBuildGeneratorPoweredLight,
            BuildingMenu.LightPostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canBeAlwaysPlaced = false,
                isCorner = true
            },
            {
                sprite = "lighting_outdoor_tk_01_16",
                northSprite = "lighting_outdoor_tk_01_15",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Throttlekitty",
        getText("IGUI_BuildingMenuCat_Lighting"),
        "lighting_outdoor_tk_01_12",
        getText("IGUI_BuildingMenuSubCat_Lighting_Outdoor"),
        "lighting_outdoor_tk_01_12",
        lighting
    )
end

local function addSeatingFurnitureToMenu()
    local seatingFurniture = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Furniture_Couches"),
            subCategoryIcon = "seating_outdoor_tk_01_7",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.MetalBarChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_7",
                        sprite2 = "seating_outdoor_tk_01_6",
                        northSprite = "seating_outdoor_tk_01_0",
                        northSprite2 = "seating_outdoor_tk_01_1"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.MetalBarChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_3",
                        sprite2 = "seating_outdoor_tk_01_2",
                        northSprite = "seating_outdoor_tk_01_4",
                        northSprite2 = "seating_outdoor_tk_01_5"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.CouchRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_11",
                        sprite2 = "seating_outdoor_tk_01_10",
                        northSprite = "seating_outdoor_tk_01_8",
                        northSprite2 = "seating_outdoor_tk_01_9"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.CouchRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_15",
                        sprite2 = "seating_outdoor_tk_01_14",
                        northSprite = "seating_outdoor_tk_01_12",
                        northSprite2 = "seating_outdoor_tk_01_13"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.MetalBarChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_25",
                        sprite2 = "seating_outdoor_tk_01_24",
                        northSprite = "seating_outdoor_tk_01_26",
                        northSprite2 = "seating_outdoor_tk_01_27"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.MetalBarChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_29",
                        sprite2 = "seating_outdoor_tk_01_28",
                        northSprite = "seating_outdoor_tk_01_30",
                        northSprite2 = "seating_outdoor_tk_01_31"
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Furniture_Chairs"),
            subCategoryIcon = "seating_outdoor_tk_01_16",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.MetalChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_16",
                        northSprite = "seating_outdoor_tk_01_17",
                        eastSprite = "seating_outdoor_tk_01_18",
                        southSprite = "seating_outdoor_tk_01_19"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.MetalChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "seating_outdoor_tk_01_20",
                        northSprite = "seating_outdoor_tk_01_21",
                        eastSprite = "seating_outdoor_tk_01_22",
                        southSprite = "seating_outdoor_tk_01_23"
                    }
                ),
            }
        }
    }
    for k, subCatData in pairs(seatingFurniture) do
        BuildingMenu.addObjectsToCategories(
            "Throttlekitty",
            getText("IGUI_BuildingMenuCat_Furniture"),
            "seating_outdoor_tk_01_7",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addTrashCansToMenu()
    local trashCans = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_0", northSprite = "trash_containers_tk_01_1" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_2", northSprite = "trash_containers_tk_01_3" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_4", northSprite = "trash_containers_tk_01_5" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_6", northSprite = "trash_containers_tk_01_7" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_8" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
            },
            { sprite = "trash_containers_tk_01_10" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.GarbageBinBigRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildMid = true,
            },
            {
                sprite = "trash_containers_tk_01_27",
                sprite2 = "trash_containers_tk_01_26",
                northSprite = "trash_containers_tk_01_24",
                northSprite2 = "trash_containers_tk_01_25"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.GarbageBinBigRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildMid = true,
            },
            {
                sprite = "trash_containers_tk_01_31",
                sprite2 = "trash_containers_tk_01_30",
                northSprite = "trash_containers_tk_01_28",
                northSprite2 = "trash_containers_tk_01_29"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.GarbageBinBigRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildMid = true,
            },
            {
                sprite = "trash_containers_tk_01_51",
                sprite2 = "trash_containers_tk_01_50",
                northSprite = "trash_containers_tk_01_48",
                northSprite2 = "trash_containers_tk_01_49"
            }
        ),
        BuildingMenu.createObject(
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
                sprite = "trash_containers_tk_01_55",
                sprite2 = "trash_containers_tk_01_54",
                northSprite = "trash_containers_tk_01_52",
                northSprite2 = "trash_containers_tk_01_53"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Throttlekitty",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Trash_Cans"),
        "trash_containers_tk_01_0",
        trashCans
    )
end

local function addGarageDoorsToMenu()
    local garageDoors = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
            subCategoryIcon = "walls_garage_tk_01_0",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_3_Tiles_White_Garage_Door",
                    "Tooltip_White_Garage_Door",
                    BuildingMenu.onBuild3TileGarageDoor,
                    BuildingMenu.GarageDoorRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium"
                    },
                    {
                        sprite = "walls_garage_tk_01_0",
                        sprite2 = "walls_garage_tk_01_1",
                        sprite3 = "walls_garage_tk_01_2",
                        northSprite = "walls_garage_tk_01_3",
                        northSprite2 = "walls_garage_tk_01_4",
                        northSprite3 = "walls_garage_tk_01_5"
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
            subCategoryIcon = "walls_garage_tk_01_0",
            objects = {
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_4_Tiles_White_Garage_Door",
                    "Tooltip_White_Garage_Door",
                    BuildingMenu.onBuild4TileGarageDoor,
                    BuildingMenu.GarageDoorRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium"
                    },
                    {
                        sprite = "walls_garage_tk_01_0",
                        sprite2 = "walls_garage_tk_01_1",
                        sprite3 = "walls_garage_tk_01_1",
                        sprite4 = "walls_garage_tk_01_2",
                        northSprite = "walls_garage_tk_01_3",
                        northSprite2 = "walls_garage_tk_01_4",
                        northSprite3 = "walls_garage_tk_01_4",
                        northSprite4 = "walls_garage_tk_01_5"
                    }
                ),
            }
        },
    }

    for k, subCatData in pairs(garageDoors) do
        BuildingMenu.addObjectsToCategories(
            "Throttlekitty",
            getText("IGUI_BuildingMenuCat_Doors"),
            "walls_garage_tk_01_0",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end


local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.industrialWallsSubCategory then
        addIndustrialWallsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.stairsCategory then
        addStairsToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.cratesSubCategory then
        addCratesToMenu()
    end
    if SandboxVars.BuildingMenu.trashCansSubCategory then
        addTrashCansToMenu()
    end
    if SandboxVars.BuildingMenu.seatingFurnitureSubCategory then
        addSeatingFurnitureToMenu()
    end
    if SandboxVars.BuildingMenu.lightingAppliances then
        addLightingToMenu()
    end
end
Events.OnInitializeBuildingMenuObjects.Add(addCategoriesToBuildingMenu)
