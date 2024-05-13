---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addResidentialCountersToMenu()
    local residentailContainers = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureMedium",
            },
            {
                sprite = "Chinatown_EX_home_2_0",
                northSprite = "Chinatown_EX_home_2_1",
                eastSprite = "Chinatown_EX_home_2_3",
                southSprite = "Chinatown_EX_home_2_2"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureMedium",
            },
            {
                sprite = "Chinatown_EX_home_2_4",
                northSprite = "Chinatown_EX_home_2_5",
                eastSprite = "Chinatown_EX_home_2_7",
                southSprite = "Chinatown_EX_home_2_6"
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
            },
            {
                sprite = "Chinatown_EX_home_2_33",
                northSprite = "Chinatown_EX_home_2_32",
                eastSprite = "Chinatown_EX_home_2_35",
                southSprite = "Chinatown_EX_home_2_34"
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
            },
            {
                sprite = "Chinatown_EX_home_2_37",
                northSprite = "Chinatown_EX_home_2_36",
                eastSprite = "Chinatown_EX_home_2_39",
                southSprite = "Chinatown_EX_home_2_38"
            }
        ),
    }
    
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Containers"),
        "Chinatown_EX_home_2_0",
        getText("IGUI_BuildingMenuSubCat_Containers_Residential"),
        "Chinatown_EX_home_2_0",
        residentailContainers
    )
end

local function addCommercialCountersToMenu()
    local shopGenericContainers = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureMedium",
                containerType = "shelves"
            },
            {
                sprite = "Chinatown_EX_generic_1_0",
                northSprite = "Chinatown_EX_generic_1_1",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureMedium",
                containerType = "shelves"
            },
            {
                sprite = "Chinatown_EX_generic_1_2",
                northSprite = "Chinatown_EX_generic_1_3",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                containerType = "displaycase"
            },
            {
                sprite = "Chinatown_EX_generic_1_40",
                northSprite = "Chinatown_EX_generic_1_41",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                containerType = "displaycase"
            },
            {
                sprite = "Chinatown_EX_generic_1_42",
                northSprite = "Chinatown_EX_generic_1_43",
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
                containerType = "shelves"
            },
            {
                sprite = "Chinatown_EX_generic_1_83",
                sprite2 = "Chinatown_EX_generic_1_82",
                northSprite = "Chinatown_EX_generic_1_80",
                northSprite2 = "Chinatown_EX_generic_1_81"
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
                containerType = "shelves"
            },
            {
                sprite = "Chinatown_EX_generic_1_85",
                sprite2 = "Chinatown_EX_generic_1_84",
                northSprite = "Chinatown_EX_generic_1_86",
                northSprite2 = "Chinatown_EX_generic_1_87"
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
                containerType = "counter"
            },
            {
                sprite = "Chinatown_3_27",
                northSprite = "Chinatown_3_29",
                eastSprite = "Chinatown_3_31",
                southSprite = "Chinatown_3_25"
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
                containerType = "counter"
            },
            {
                sprite = "Chinatown_3_26",
                northSprite = "Chinatown_3_28",
                eastSprite = "Chinatown_3_30",
                southSprite = "Chinatown_3_24"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Shop_Generic"),
        "Chinatown_EX_generic_1_0",
        shopGenericContainers
    )
end

local function addMetalContainersToMenu()
    local sheetMetalCountForContainers = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4;
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4;
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5;
    local metalweldingXpPerLevel = SandboxVars.BuildingMenuRecipes.metalweldingXpPerLevel or 3.5;

    local metalContainers = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Containers_Metal"),
            subCategoryIcon = "guizi_01_0",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "shelves",
                        blockAllTheSquare = true,
                        canBeLockedByPadlock = true
                    },
                    { sprite = "guizi_01_0", northSprite = "guizi_01_16" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "counter",
                        blockAllTheSquare = true,
                        canBeLockedByPadlock = true
                    },
                    { 
                        sprite = "guizi_01_8",
                        northSprite = "guizi_01_10",
                        eastSprite = "guizi_01_14",
                        southSprite = "guizi_01_12"
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
                        containerType = "counter",
                        blockAllTheSquare = true,
                        canBeLockedByPadlock = true
                    },
                    { 
                        sprite = "guizi_01_11",
                        northSprite = "guizi_01_9",
                        eastSprite = "guizi_01_13",
                        southSprite = "guizi_01_15"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalLockerRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "locker",
                        blockAllTheSquare = true,
                        canBeLockedByPadlock = true
                    },
                    { 
                        sprite = "Industry_1_30",
                        northSprite = "Industry_1_31",
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
                        containerType = "metal_shelves",
                        blockAllTheSquare = true,
                        canBeLockedByPadlock = true
                    },
                    { 
                        sprite = "Industry_1_56",
                        northSprite = "Industry_1_57",
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Containers_Military"),
            subCategoryIcon = "Guizi_tiles_01_7",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalGlassCounterRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "displaycase",
                    },
                    {
                        sprite = "Chinatown_EX_military_1_11",
                        northSprite = "Chinatown_EX_military_1_10",
                        eastSprite = "Chinatown_EX_military_1_8",
                        southSprite = "Chinatown_EX_military_1_9"
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
                        containerType = "displaycase",
                    },
                    {
                        sprite = "Chinatown_EX_military_1_18",
                        northSprite = "Chinatown_EX_military_1_19",
                        eastSprite = "Chinatown_EX_military_1_17",
                        southSprite = "Chinatown_EX_military_1_16"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildDoubleMetalShelf,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "shelves",
                        canPassThrough = true,
                        isCorner = true,
                        buildHigh = true,
                    },
                    {
                        sprite = "Chinatown_EX_military_1_1",
                        sprite2 = "Chinatown_EX_military_1_0",
                        northSprite = "Chinatown_EX_military_1_2",
                        northSprite2 = "Chinatown_EX_military_1_3"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildDoubleMetalShelf,
                    BuildingMenu.ClothingRackRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "shelves",
                        buildHigh = true,
                    },
                    {
                        sprite = "Guizi_tiles_01_7",
                        sprite2 = "Guizi_tiles_01_6",
                        northSprite = "Guizi_tiles_01_0",
                        northSprite2 = "Guizi_tiles_01_1"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildDoubleTileContainer,
                    BuildingMenu.MilitaryCrateRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "militarycrate",
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Chinatown_EX_military_1_25",
                        sprite2 = "Chinatown_EX_military_1_24",
                        northSprite = "Chinatown_EX_military_1_26",
                        northSprite2 = "Chinatown_EX_military_1_27"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MilitaryCrateRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "militarycrate",
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Industry_3_9",
                        northSprite = "Industry_3_8",
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Containers_Vault_Tec"),
            subCategoryIcon = "Vaulttec_2_6",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildDoubleMetalShelf,
                    BuildingMenu.MetalCounterRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "shelves",
                        canPassThrough = true,
                        isCorner = true,
                        buildHigh = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_2_1",
                        sprite2 = "Vaulttec_2_0",
                        northSprite = "Vaulttec_2_2",
                        northSprite2 = "Vaulttec_2_3"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalLockerRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "locker",
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_2_6",
                        northSprite = "Vaulttec_2_7",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Dresser",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "wardrobe",
                        isContainer = true,
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_2_43",
                        sprite2 = "Vaulttec_2_42",
                        northSprite = "Vaulttec_2_34",
                        northSprite2 = "Vaulttec_2_35"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Dresser",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "shelves",
                        isContainer = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_2_37",
                        sprite2 = "Vaulttec_2_36",
                        northSprite = "Vaulttec_2_38",
                        northSprite2 = "Vaulttec_2_39"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Dresser",
                    BuildingMenu.onBuildDoubleTileFurniture,
                    {
                        neededTools = {
                            "BlowTorch",
                            "WeldingMask",
                            "Screwdriver",
                            "Hammer"
                        },
                        neededMaterials = {
                            {
                                Material = "Base.SheetMetal",
                                Amount = BuildingMenu.round(sheetMetalCountForContainers)
                            },
                            {
                                Material = "Base.SmallSheetMetal",
                                Amount = BuildingMenu.round(sheetMetalCountForContainers)
                            },
                            {
                                Material = "Base.Plank",
                                Amount = 6
                            },
                            {
                                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 10,
                                    "Material")
                            },
                        },
                        useConsumable = {
                            {
                                Consumable = "Base.BlowTorch",
                                Amount = 5
                            },
                            {
                                Consumable = "Base.WeldingRods",
                                Amount = BuildingMenu.weldingRodUses(5)
                            }
                        },
                        skills = {
                            {
                                Skill = "Woodwork",
                                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
                            },
                            {
                                Skill = "MetalWelding",
                                Level = 4,
                                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
                            }
                        }
                    },
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        containerType = "shelves",
                        isContainer = true,
                        buildHigh = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_6_43",
                        sprite2 = "Vaulttec_6_42",
                        northSprite = "Vaulttec_6_44",
                        northSprite2 = "Vaulttec_6_45"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    {
                        neededTools = {
                            "BlowTorch",
                            "WeldingMask",
                            "Screwdriver",
                            "Hammer"
                        },
                        neededMaterials = {
                            {
                                Material = "Base.SheetMetal",
                                Amount = BuildingMenu.round(sheetMetalCountForContainers * 0.5)
                            },
                            {
                                Material = "Base.SmallSheetMetal",
                                Amount = BuildingMenu.round(sheetMetalCountForContainers * 0.5)
                            },
                            {
                                Material = "Base.Plank",
                                Amount = 4
                            },
                            {
                                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 10,
                                    "Material")
                            },
                        },
                        useConsumable = {
                            {
                                Consumable = "Base.BlowTorch",
                                Amount = 3
                            },
                            {
                                Consumable = "Base.WeldingRods",
                                Amount = BuildingMenu.weldingRodUses(3)
                            }
                        },
                        skills = {
                            {
                                Skill = "Woodwork",
                                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
                            },
                            {
                                Skill = "MetalWelding",
                                Level = 3,
                                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
                            }
                        }
                    },
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "shelves",
                        isContainer = true,
                        buildHigh = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_6_40",
                        northSprite = "Vaulttec_6_41",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalLockerWGlassRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "locker",
                        isContainer = true,
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_3_34",
                        northSprite = "Vaulttec_3_35",
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
                        containerType = "locker",
                        isContainer = true,
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_3_48",
                        northSprite = "Vaulttec_3_49",
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
                        containerType = "militarycrate",
                        isContainer = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_3_28",
                        northSprite = "Vaulttec_3_29",
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
                        containerType = "militarycrate",
                        isContainer = true,
                        canBeLockedByPadlock = false
                    },
                    {
                        sprite = "Vaulttec_3_26",
                        northSprite = "Vaulttec_3_27",
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
                        containerType = "militarycrate",
                        isContainer = true,
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_5_9",
                        northSprite = "Vaulttec_5_8",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Counter_Generic",
                    BuildingMenu.onBuildWoodenContainer,
                    BuildingMenu.MetalLockerRecipe,
                    true,
                    {
                        completionSound = "BuildMetalStructureMedium",
                        containerType = "militarycrate",
                        isContainer = true,
                        canBeLockedByPadlock = true
                    },
                    {
                        sprite = "Vaulttec_5_16",
                        northSprite = "Vaulttec_5_17",
                    }
                ),
            }
        },
    }

    for k, subCatData in pairs(metalContainers) do
        BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Containers"),
        "guizi_01_0",
        subCatData.subcategoryName,
        subCatData.subCategoryIcon,
        subCatData.objects
        )
    end
end


local function addContainersOthersToMenu()
    local containersOthers = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isContainer = true
            },
            {
                sprite = "Industry_1_8",
                northSprite = "Industry_1_8",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.SmallCounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isContainer = true
            },
            {
                sprite = "Industry_1_9",
                northSprite = "Industry_1_9",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Others"),
        "Industry_1_8",
        containersOthers
    )
end


local function addTrashCansToMenu()
    local trashCans = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GarbageBinBigRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "bin",
                isContainer = true,
            },
            { sprite = "Vaulttec_6_16", northSprite = "Vaulttec_6_17" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Trash_Cans"),
        "Vaulttec_6_16",
        trashCans
    )
end


local function addSeatingFurnitureToMenu()
    local seatingFurniture = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Furniture_Couches"),
            subCategoryIcon = "Chinatown_EX_home_1_43",
            objects = {
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
                        sprite = "Chinatown_EX_home_1_43",
                        sprite2 = "Chinatown_EX_home_1_42",
                        northSprite = "Chinatown_EX_home_1_40",
                        northSprite2 = "Chinatown_EX_home_1_41"
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
                        sprite = "Chinatown_EX_home_1_45",
                        sprite2 = "Chinatown_EX_home_1_44",
                        northSprite = "Chinatown_EX_home_1_46",
                        northSprite2 = "Chinatown_EX_home_1_47"
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
                        sprite = "Chinatown_EX_home_1_51",
                        sprite2 = "Chinatown_EX_home_1_50",
                        northSprite = "Chinatown_EX_home_1_48",
                        northSprite2 = "Chinatown_EX_home_1_49"
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
                        sprite = "Chinatown_EX_home_1_53",
                        sprite2 = "Chinatown_EX_home_1_52",
                        northSprite = "Chinatown_EX_home_1_54",
                        northSprite2 = "Chinatown_EX_home_1_55"
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
                        sprite = "Chinatown_EX_home_1_75",
                        sprite2 = "Chinatown_EX_home_1_74",
                        northSprite = "Chinatown_EX_home_1_72",
                        northSprite2 = "Chinatown_EX_home_1_73"
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
                        sprite = "Chinatown_EX_home_1_77",
                        sprite2 = "Chinatown_EX_home_1_76",
                        northSprite = "Chinatown_EX_home_1_78",
                        northSprite2 = "Chinatown_EX_home_1_79"
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
                        sprite = "Chinatown_EX_home_1_120",
                        sprite2 = "Chinatown_EX_home_1_123",
                        northSprite = "Chinatown_EX_home_1_121",
                        northSprite2 = "Chinatown_EX_home_1_122"
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
                        sprite = "Chinatown_EX_home_1_127",
                        sprite2 = "Chinatown_EX_home_1_124",
                        northSprite = "Chinatown_EX_home_1_126",
                        northSprite2 = "Chinatown_EX_home_1_125"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_56",
                        sprite2 = "Chinatown_EX_home_1_57",
                        sprite3 = "Chinatown_EX_home_1_58",
                        northSprite = "Chinatown_EX_home_1_59",
                        northSprite2 = "Chinatown_EX_home_1_60",
                        northSprite3 = "Chinatown_EX_home_1_61",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_67",
                        sprite2 = "Chinatown_EX_home_1_68",
                        sprite3 = "Chinatown_EX_home_1_69",
                        northSprite = "Chinatown_EX_home_1_64",
                        northSprite2 = "Chinatown_EX_home_1_65",
                        northSprite3 = "Chinatown_EX_home_1_66",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_80",
                        sprite2 = "Chinatown_EX_home_1_81",
                        sprite3 = "Chinatown_EX_home_1_82",
                        northSprite = "Chinatown_EX_home_1_83",
                        northSprite2 = "Chinatown_EX_home_1_84",
                        northSprite3 = "Chinatown_EX_home_1_85",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_91",
                        sprite2 = "Chinatown_EX_home_1_92",
                        sprite3 = "Chinatown_EX_home_1_93",
                        northSprite = "Chinatown_EX_home_1_88",
                        northSprite2 = "Chinatown_EX_home_1_89",
                        northSprite3 = "Chinatown_EX_home_1_90",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_96",
                        sprite2 = "Chinatown_EX_home_1_97",
                        sprite3 = "Chinatown_EX_home_1_98",
                        northSprite = "Chinatown_EX_home_1_99",
                        northSprite2 = "Chinatown_EX_home_1_100",
                        northSprite3 = "Chinatown_EX_home_1_101",
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildThreeTileSimpleFurniture,
                    BuildingMenu.LargeFurnitureRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        isThumpable = true,
                    },
                    {
                        sprite = "Chinatown_EX_home_1_107",
                        sprite2 = "Chinatown_EX_home_1_108",
                        sprite3 = "Chinatown_EX_home_1_109",
                        northSprite = "Chinatown_EX_home_1_104",
                        northSprite2 = "Chinatown_EX_home_1_105",
                        northSprite3 = "Chinatown_EX_home_1_106",
                    }
                ),
            }
        },
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Furniture_Chairs"),
            subCategoryIcon = "Chinatown_1_2",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_1_2",
                        northSprite = "Chinatown_1_1",
                        eastSprite = "Chinatown_1_4",
                        southSprite = "Chinatown_1_3"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_2_10",
                        northSprite = "Chinatown_2_8",
                        eastSprite = "Chinatown_2_11",
                        southSprite = "Chinatown_2_9"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_EX_home_1_62",
                        northSprite = "Chinatown_EX_home_1_63",
                        eastSprite = "Chinatown_EX_home_1_71",
                        southSprite = "Chinatown_EX_home_1_70"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_EX_home_1_86",
                        northSprite = "Chinatown_EX_home_1_87",
                        eastSprite = "Chinatown_EX_home_1_95",
                        southSprite = "Chinatown_EX_home_1_94"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_EX_home_1_102",
                        northSprite = "Chinatown_EX_home_1_103",
                        eastSprite = "Chinatown_EX_home_1_111",
                        southSprite = "Chinatown_EX_home_1_110"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_EX_home_1_116",
                        northSprite = "Chinatown_EX_home_1_117",
                        eastSprite = "Chinatown_EX_home_1_119",
                        southSprite = "Chinatown_EX_home_1_118"
                    }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_craft_woodenChairDesc",
                    BuildingMenu.onBuildSimpleFurniture,
                    BuildingMenu.WoodenChairRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureMedium",
                    },
                    {
                        sprite = "Chinatown_EX_home_1_112",
                        northSprite = "Chinatown_EX_home_1_113",
                        eastSprite = "Chinatown_EX_home_1_115",
                        southSprite = "Chinatown_EX_home_1_114"
                    }
                ),
            }
        }
    }
    for k, subCatData in pairs(seatingFurniture) do
        BuildingMenu.addObjectsToCategories(
            "Oujinjin's",
            getText("IGUI_BuildingMenuCat_Furniture"),
            "Chinatown_EX_home_1_43",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end


local function addCookingAppliancesToMenu()
    local cookingObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildBarbecue,
            BuildingMenu.StoveRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "stove",
                isContainer = true,
            },
            {
                sprite = "Chinatown_EX_kitchen_1_0",
                northSprite = "Chinatown_EX_kitchen_1_1"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildBarbecue,
            BuildingMenu.StoveRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "stove",
                isContainer = true,
            },
            {
                sprite = "Vaulttec_5_10",
                northSprite = "Vaulttec_5_11"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildBarbecue,
            BuildingMenu.StoveRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "stove",
                isContainer = true,
            },
            {
                sprite = "Vaulttec_5_18",
                northSprite = "Vaulttec_5_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildStove,
            BuildingMenu.StoveRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "stove",
                isContainer = true,
            },
            {
                sprite = "Chinatown_EX_kitchen_1_25",
                northSprite = "Chinatown_EX_kitchen_1_24",
                eastSprite = "Chinatown_EX_kitchen_1_27",
                southSprite = "Chinatown_EX_kitchen_1_26"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "Chinatown_EX_kitchen_1_0",
        getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
        "Chinatown_EX_kitchen_1_0",
        cookingObjects
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
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true,
                containerType = "fridge",
                isContainer = true,
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
        { "Chinatown_EX_generic_1_4", "Chinatown_EX_generic_1_5", "Chinatown_EX_generic_1_7", "Chinatown_EX_generic_1_6" },
        { "Chinatown_EX_generic_1_32", "Chinatown_EX_generic_1_33", "Chinatown_EX_generic_1_35", "Chinatown_EX_generic_1_34" },
        { "Chinatown_EX_generic_1_73", "Chinatown_EX_generic_1_72"},
        { "Chinatown_EX_kitchen_1_53", "Chinatown_EX_kitchen_1_52"},
        { "Industry_1_26", "Industry_1_27"},
        { "Vaulttec_1_10", "Vaulttec_1_11"},
        { "Vaulttec_5_43", "Vaulttec_5_42"},
        { "Vaulttec_5_48", "Vaulttec_5_49"},
        { "Vaulttec_6_5", "Vaulttec_6_4", "Vaulttec_6_7", "Vaulttec_6_6" },
    }

    local fridgesObjects = {}
    for _, config in ipairs(spriteConfigurations) do
        table.insert(fridgesObjects, createFridgeObject(unpack(config)))
    end

    table.insert(fridgesObjects,
        BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildLargeFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildHigh = true,
                dismantable = true
            },
            {
                sprite = "Chinatown_EX_generic_1_19",
                sprite2 = "Chinatown_EX_generic_1_18",
                northSprite = "Chinatown_EX_generic_1_16",
                northSprite2 = "Chinatown_EX_generic_1_17"
            }
        )
    )
    table.insert(fridgesObjects,
        BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildLargeFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildHigh = true,
                dismantable = true
            },
            {
                sprite = "Chinatown_EX_generic_1_21",
                sprite2 = "Chinatown_EX_generic_1_20",
                northSprite = "Chinatown_EX_generic_1_22",
                northSprite2 = "Chinatown_EX_generic_1_23"
            }
        )
    )
    table.insert(fridgesObjects,
        BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildTripleFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildHigh = true,
                dismantable = true
            },
            {
                sprite = "Vaulttec_5_29",
                sprite2 = "Vaulttec_5_30",
                sprite3 = "Vaulttec_5_31",
                northSprite= "Vaulttec_5_13",
                northSprite2= "Vaulttec_5_14",
                northSprite3 = "Vaulttec_5_15",
            }
        )
    )
    table.insert(fridgesObjects,
        BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildPopsicleFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildHigh = true,
                dismantable = true
            },
            {
                sprite = "Chinatown_EX_kitchen_1_49",
                sprite2 = "Chinatown_EX_kitchen_1_48",
                northSprite = "Chinatown_EX_kitchen_1_50",
                northSprite2 = "Chinatown_EX_kitchen_1_51"
            }
        )
    )

    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Appliances"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "Chinatown_EX_generic_1_73",
        fridgesObjects
    )
end



local function addBathroomAppliancesToMenu()
    local function createBathroomObject(spec)
        return BuildingMenu.createObject(
            "",
            spec.tooltip or "Tooltip_Sink",
            spec.buildFunc,
            spec.recipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                containerType = "counter",
                isContainer = true,
                buildMid = true,
            },
            spec.sprites
        )
    end

    local bathroomObjectSpecs = {
        {
            buildFunc = BuildingMenu.onBuildWoodenContainer,
            recipe = BuildingMenu.SinkRecipe,
            sprites = {
                sprite = "Chinatown_EX_home_2_8",
                northSprite = "Chinatown_EX_home_2_9",
                eastSprite = "Chinatown_EX_home_2_11",
                southSprite = "Chinatown_EX_home_2_10"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildWoodenContainer,
            recipe = BuildingMenu.SinkRecipe,
            sprites = {
                sprite = "Chinatown_EX_home_2_12",
                northSprite = "Chinatown_EX_home_2_13",
                eastSprite = "Chinatown_EX_home_2_15",
                southSprite = "Chinatown_EX_home_2_14"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildWoodenContainer,
            recipe = BuildingMenu.SinkRecipe,
            sprites = {
                sprite = "Chinatown_EX_home_2_16",
                northSprite = "Chinatown_EX_home_2_17",
                eastSprite = "Chinatown_EX_home_2_19",
                southSprite = "Chinatown_EX_home_2_18"
            }
        },
    }

    local bathroomObjects = {}
    for _, spec in ipairs(bathroomObjectSpecs) do
        table.insert(bathroomObjects, createBathroomObject(spec))
    end

    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Appliances"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Appliances_Bathroom"),
        "Chinatown_EX_home_2_8",
        bathroomObjects
    )
end

local function addOtherFencesToMenu()
    local otherFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Hesco_Barrier",
            "Tooltip_Hesco_Barrier",
            BuildingMenu.onBuildWall,
            BuildingMenu.HescoBarrierRecipe,
            true,
            { isThumpable = true },
            { sprite = "Chinatown_EX_military_1_120", northSprite = "Chinatown_EX_military_1_120" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Hesco_Barrier",
            "Tooltip_Hesco_Barrier",
            BuildingMenu.onBuildWall,
            BuildingMenu.DoubleHescoBarrierRecipe,
            true,
            { isThumpable = true },
            { sprite = "Chinatown_EX_military_1_121", northSprite = "Chinatown_EX_military_1_121" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Hesco_Barrier",
            "Tooltip_Hesco_Barrier",
            BuildingMenu.onBuildWall,
            BuildingMenu.HescoBarrierRecipe,
            true,
            { isThumpable = true },
            { sprite = "Chinatown_EX_military_1_122", northSprite = "Chinatown_EX_military_1_122" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Hesco_Barrier",
            "Tooltip_Hesco_Barrier",
            BuildingMenu.onBuildWall,
            BuildingMenu.DoubleHescoBarrierRecipe,
            true,
            { isThumpable = true },
            { sprite = "Chinatown_EX_military_1_123", northSprite = "Chinatown_EX_military_1_123" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_woodenChairDesc",
            BuildingMenu.onBuildThreeTileSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
            },
            {
                sprite = "Chinatown_EX_military_1_117",
                sprite2 = "Chinatown_EX_military_1_118",
                sprite3 = "Chinatown_EX_military_1_119",
                northSprite = "Chinatown_EX_military_1_114",
                northSprite2 = "Chinatown_EX_military_1_115",
                northSprite3 = "Chinatown_EX_military_1_116",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Oujinjin's",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "Chinatown_EX_military_1_120",
        getText("IGUI_BuildingMenuSubCat_Fencing_Other"),
        "Chinatown_EX_military_1_120",
        otherFences
    )
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.otherFencesSubCategory then
        addOtherFencesToMenu()
    end
    if SandboxVars.BuildingMenu.kitchenCountersSubCategory then
        addResidentialCountersToMenu()
    end
    if SandboxVars.BuildingMenu.commercialCountersSubCategory then
        addCommercialCountersToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.containersOthersSubCategory then
        addContainersOthersToMenu()
    end
    if SandboxVars.BuildingMenu.trashCansSubCategory then
        addTrashCansToMenu()
    end
    if SandboxVars.BuildingMenu.seatingFurnitureSubCategory then
        addSeatingFurnitureToMenu()
    end
    if SandboxVars.BuildingMenu.cookingAppliances then
        addCookingAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.bathroomAppliances then
        addBathroomAppliancesToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)