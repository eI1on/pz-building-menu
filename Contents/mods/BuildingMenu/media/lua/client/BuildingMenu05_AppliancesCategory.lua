require("BuildingMenu04_CategoriesDefinitions")

local BuildingMenu = getBuildingMenuInstance()


local function addBathroomAppliancesToMenu()
    local function createBathroomObject(spec)
        return BuildingMenu.createObject(
            "",
            spec.tooltip or "Tooltip_Sink",
            spec.buildFunc,
            spec.recipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true
            },
            spec.sprites
        )
    end

    local bathroomObjectSpecs = {
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_21", 
                northSprite = "fixtures_sinks_01_22", 
                eastSprite = "fixtures_sinks_01_23", 
                southSprite = "fixtures_sinks_01_20" 
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_1", 
                northSprite = "fixtures_sinks_01_2", 
                eastSprite = "fixtures_sinks_01_3", 
                southSprite = "fixtures_sinks_01_0" 
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_4",
                northSprite = "fixtures_sinks_01_5",
                eastSprite = "fixtures_sinks_01_6",
                southSprite = "fixtures_sinks_01_7"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_16",
                northSprite = "fixtures_sinks_01_17",
                eastSprite = "fixtures_sinks_01_18",
                southSprite = "fixtures_sinks_01_19"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_8",
                northSprite = "fixtures_sinks_01_9",
                eastSprite = "fixtures_sinks_01_10",
                southSprite = "fixtures_sinks_01_11"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_13",
                northSprite = "fixtures_sinks_01_12",
                eastSprite = "fixtures_sinks_01_29",
                southSprite = "fixtures_sinks_01_28"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_sinks_01_15",
                northSprite = "fixtures_sinks_01_14",
                eastSprite = "fixtures_sinks_01_31",
                southSprite = "fixtures_sinks_01_30"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_bathroom_01_1",
                northSprite = "fixtures_bathroom_01_0",
                eastSprite = "fixtures_bathroom_01_2",
                southSprite = "fixtures_bathroom_01_3"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_bathroom_01_9",
                northSprite = "fixtures_bathroom_01_8",
                eastSprite = "fixtures_bathroom_01_11",
                southSprite = "fixtures_bathroom_01_10"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "fixtures_bathroom_01_5",
                northSprite = "fixtures_bathroom_01_4",
                eastSprite = "fixtures_bathroom_01_6",
                southSprite = "fixtures_bathroom_01_7"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = {
                sprite = "fixtures_bathroom_01_32", 
                northSprite = "fixtures_bathroom_01_33"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildBathtub, 
            recipe = BuildingMenu.BathtubRecipe, 
            sprites = { 
                sprite = "fixtures_bathroom_01_27",
                sprite2 = "fixtures_bathroom_01_26",
                northSprite1 = "fixtures_bathroom_01_24",
                northSprite2 = "fixtures_bathroom_01_25"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildBathtub, 
            recipe = BuildingMenu.BathtubRecipe, 
            sprites = { 
                sprite = "fixtures_bathroom_01_55",
                sprite2 = "fixtures_bathroom_01_54",
                northSprite1 = "fixtures_bathroom_01_52",
                northSprite2 = "fixtures_bathroom_01_53"
            }
        },
    }

    local bathroomObjects = {}
    for _, spec in ipairs(bathroomObjectSpecs) do
        table.insert(bathroomObjects, createBathroomObject(spec))
    end

    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuCat_Appliances"),
        "fixtures_sinks_01_21",
        getText("IGUI_BuildingMenuSubCat_Appliances_Bathroom"),
        "fixtures_sinks_01_21",
        bathroomObjects
    )
end
addBathroomAppliancesToMenu()


local function addCookingAppliancesToMenu()
    local cookingObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildBarbecue,
            BuildingMenu.StoveRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true
            },
            {
                sprite = "appliances_cooking_01_35",
                northSprite = "appliances_cooking_01_35"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildStove,
            BuildingMenu.StoveRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                needToBeAgainstWall = true
            },
            {
                sprite = "appliances_cooking_01_16",
                northSprite = "appliances_cooking_01_17",
                eastSprite = "appliances_cooking_01_19",
                southSprite = "appliances_cooking_01_18"
            }
        ),
    }

    local spriteIndexes = {
        {0, 1, 2, 3},
        {4, 5, 6, 7},
        {8, 9, 10, 11},
        {12, 13, 14, 15},
        {20, 21, 22, 23},
        {52, 53, 54, 55},
    }
    for _, indexes in ipairs(spriteIndexes) do
        table.insert(cookingObjects, BuildingMenu.createObject(
                "",
                "Tooltip_Oven",
                BuildingMenu.onBuildOven,
                BuildingMenu.OvenRecipe,
                true,
                {
                    firstItem = "BlowTorch",
                    secondItem = "WeldingMask",
                    craftingBank = "BlowTorch",
                    actionAnim = "BlowTorch",
                    noNeedHammer = true,
                    completionSound = "BuildMetalStructureMedium",
                    buildLow = true,
                    canBeAlwaysPlaced = true,
                    renderFloorHelper = false
                },
                {
                    sprite = "appliances_cooking_01_" .. indexes[1],
                    northSprite = "appliances_cooking_01_" .. indexes[2],
                    eastSprite = "appliances_cooking_01_" .. indexes[3],
                    southSprite = "appliances_cooking_01_" .. indexes[4]
                }
            )
        )
    end

    table.insert(cookingObjects, BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildMicrowaveOven,
            BuildingMenu.MicrowaveOvenRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false
            },
            {
                sprite = "appliances_cooking_01_24",
                northSprite = "appliances_cooking_01_25",
                eastSprite = "appliances_cooking_01_26",
                southSprite = "appliances_cooking_01_27"
            }
        )
    )

    table.insert(cookingObjects, BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildMicrowaveOven,
            BuildingMenu.MicrowaveOvenRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false
            },
            {
                sprite = "appliances_cooking_01_29",
                northSprite = "appliances_cooking_01_28",
                eastSprite = "appliances_cooking_01_30",
                southSprite = "appliances_cooking_01_31"
            }
        )
    )

    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuCat_Appliances"),
        "appliances_cooking_01_35",
        getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
        "appliances_cooking_01_35",
        cookingObjects
    )
end
addCookingAppliancesToMenu()


local function addFridgeAppliancesToMenu()
    local function createFridgeObject(sprite, northSprite, eastSprite, southSprite)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildSimpleFridge,
            BuildingMenu.FridgeRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true,
                canBeAlwaysPlaced = true,
                renderFloorHelper = false,
                containerType = "fridge",
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
        { "appliances_refrigeration_01_24", "appliances_refrigeration_01_25", "appliances_refrigeration_01_26", "appliances_refrigeration_01_27" },
        { "appliances_refrigeration_01_1", "appliances_refrigeration_01_0", "appliances_refrigeration_01_3", "appliances_refrigeration_01_2" },
        { "appliances_refrigeration_01_5", "appliances_refrigeration_01_4", "appliances_refrigeration_01_7", "appliances_refrigeration_01_6" },
        { "appliances_refrigeration_01_9", "appliances_refrigeration_01_8", "appliances_refrigeration_01_11", "appliances_refrigeration_01_10" },
        { "appliances_refrigeration_01_13", "appliances_refrigeration_01_12", "appliances_refrigeration_01_15", "appliances_refrigeration_01_14" },
        { "appliances_refrigeration_01_23", "appliances_refrigeration_01_22", "appliances_refrigeration_01_37", "appliances_refrigeration_01_36" },
        { "appliances_refrigeration_01_29", "appliances_refrigeration_01_28", "appliances_refrigeration_01_31", "appliances_refrigeration_01_30" },
        { "appliances_refrigeration_01_33", "appliances_refrigeration_01_32", "appliances_refrigeration_01_35", "appliances_refrigeration_01_34" },
        { "appliances_refrigeration_01_41", "appliances_refrigeration_01_40", "appliances_refrigeration_01_43", "appliances_refrigeration_01_42" },
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
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true,
                canBeAlwaysPlaced = true,
                renderFloorHelper = false,
                containerType = "fridge",
                dismantable = true
            },
            {
                sprite = "appliances_refrigeration_01_19",
                sprite2 = "appliances_refrigeration_01_18",
                northSprite1 = "appliances_refrigeration_01_16",
                northSprite2 = "appliances_refrigeration_01_17"
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
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildLow = true,
                canBeAlwaysPlaced = true,
                renderFloorHelper = false,
                containerType = "fridge",
                dismantable = true
            },
            {
                sprite = "appliances_refrigeration_01_39",
                sprite2 = "appliances_refrigeration_01_38",
                northSprite1 = "appliances_refrigeration_01_20",
                northSprite2 = "appliances_refrigeration_01_21"
            }
        )
    )

    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuCat_Appliances"),
        "appliances_refrigeration_01_24",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "appliances_refrigeration_01_24",
        fridgesObjects
    )
end
addFridgeAppliancesToMenu()


local laundryObjects = {
    BuildingMenu.createObject(
        "",
        "Tooltip_Laundry",
        BuildingMenu.onBuildCombinationWasherDryer,
        BuildingMenu.WashingMachineRecipe,
        true,
        {
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
            completionSound = "BuildMetalStructureMedium",
            buildLow = true,
            canBeAlwaysPlaced = true,
            renderFloorHelper = false,
            dismantable = true
        },
        {
            sprite = "appliances_laundry_01_1",
            northSprite = "appliances_laundry_01_0",
            eastSprite = "appliances_laundry_01_3",
            southSprite = "appliances_laundry_01_2"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Laundry",
        BuildingMenu.onBuildClothingDryer,
        BuildingMenu.WashingMachineRecipe,
        true,
        {
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
            completionSound = "BuildMetalStructureMedium",
            buildLow = true,
            canBeAlwaysPlaced = true,
            renderFloorHelper = false,
            dismantable = true
        },
        {
            sprite = "appliances_laundry_01_13",
            northSprite = "appliances_laundry_01_12",
            eastSprite = "appliances_laundry_01_15",
            southSprite = "appliances_laundry_01_14"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Laundry",
        BuildingMenu.onBuildClothingWasher,
        BuildingMenu.WashingMachineRecipe,
        true,
        {
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
            completionSound = "BuildMetalStructureMedium",
            buildLow = true,
            canBeAlwaysPlaced = true,
            renderFloorHelper = false,
            dismantable = true
        },
        {
            sprite = "appliances_laundry_01_5",
            northSprite = "appliances_laundry_01_4",
            eastSprite = "appliances_laundry_01_7",
            southSprite = "appliances_laundry_01_6"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Laundry",
        BuildingMenu.onBuildWashingBin,
        BuildingMenu.WashingBinRecipe,
        true,
        {
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorch",
            noNeedHammer = true,
            completionSound = "BuildMetalStructureMedium",
            buildLow = true,
            canBeAlwaysPlaced = true,
            renderFloorHelper = false,
            dismantable = true,
            containerType = "clothingdryerbasic"
        },
        {
            sprite = "appliances_laundry_01_24",
            northSprite = "appliances_laundry_01_25",
            eastSprite = "appliances_laundry_01_24",
            southSprite = "appliances_laundry_01_25"
        }
    )
}
BuildingMenu.addObjectsToCategories(
    getText("IGUI_BuildingMenuCat_Appliances"),
    "appliances_laundry_01_1",
    getText("IGUI_BuildingMenuSubCat_Appliances_Laundry"),
    "appliances_laundry_01_1",
    laundryObjects
)