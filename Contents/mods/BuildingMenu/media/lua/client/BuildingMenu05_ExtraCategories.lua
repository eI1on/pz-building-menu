require("BuildingMenu04_CategoriesDefinitions")

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()


local function addBathroomAppliancesToMenu()
    local function createBathroomObject(spec)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
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
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Appliances"),
        "fixtures_sinks_01_21",
        getText("IGUI_BuildingMenuSubCat_Appliances_Bathroom"),
        "fixtures_sinks_01_21",
        bathroomObjects
    )
end


local function addCookingAppliancesToMenu()
    local cookingObjects = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
                canBeAlwaysPlaced = true
            },
            {
                sprite = "appliances_cooking_01_16",
                northSprite = "appliances_cooking_01_17",
                eastSprite = "building_menu_01_17",
                southSprite = "building_menu_01_16"
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
                "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Appliances"),
        "appliances_cooking_01_35",
        getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
        "appliances_cooking_01_35",
        cookingObjects
    )
end


local function addFridgeAppliancesToMenu()
    local function createFridgeObject(sprite, northSprite, eastSprite, southSprite)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Fridges",
            BuildingMenu.onBuildTripleFridge,
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
                sprite = "location_shop_generic_01_67",
                sprite2 = "location_shop_generic_01_68",
                sprite3 = "location_shop_generic_01_69",
                northSprite1 = "location_shop_generic_01_64",
                northSprite2 = "location_shop_generic_01_65",
                northSprite3 = "location_shop_generic_01_66",
            }
        )
    )
    table.insert(fridgesObjects,
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
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
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Appliances"),
        "appliances_refrigeration_01_1",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "appliances_refrigeration_01_1",
        fridgesObjects
    )
end


local function addLaundryAppliancesToMenu()
    local laundryObjects = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
            "Tooltip_BuildingMenuObj_White_Line",
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
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Appliances"),
        "appliances_laundry_01_1",
        getText("IGUI_BuildingMenuSubCat_Appliances_Laundry"),
        "appliances_laundry_01_1",
        laundryObjects
    )
end


local function addMetalDrumsToMenu()
    local metalDrums = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "crafted_01_24"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "building_menu_barrels_02_16"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "crafted_01_28"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "building_menu_barrels_02_0"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "building_menu_barrels_02_4"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "building_menu_barrels_02_8"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Metal_Drum",
            "Tooltip_Metal_Drum",
            BuildingMenu.onMetalDrum,
            BuildingMenu.MetalDrumRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorchMid",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium"
            },
            {sprite = "building_menu_barrels_02_12"}
        )
    }
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Survival"),
        "fixtures_fireplaces_01_0",
        getText("IGUI_BuildingMenuSubCat_Survival_Metal_Drums"),
        "crafted_01_24",
        metalDrums
    )
end


local function addTrafficLinesToMenu()
    local whiteTrafficLines = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_0",
                northSprite = "street_trafficlines_curb_white_full_4",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_1",
                northSprite = "street_trafficlines_curb_white_full_3",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_2",
                northSprite = "street_trafficlines_curb_white_full_5",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_7",
                northSprite = "street_trafficlines_curb_white_full_6",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_8",
                northSprite = "street_trafficlines_curb_white_full_13",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_9",
                northSprite = "street_trafficlines_curb_white_full_12",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_10",
                northSprite = "street_trafficlines_curb_white_full_11",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_14",
                northSprite = "street_trafficlines_curb_white_full_14",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_15",
                northSprite = "street_trafficlines_curb_white_full_15",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_24",
                northSprite = "street_trafficlines_curb_white_full_16",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_17",
                northSprite = "street_trafficlines_curb_white_full_25",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_18",
                northSprite = "street_trafficlines_curb_white_full_26",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_19",
                northSprite = "street_trafficlines_curb_white_full_27",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_20",
                northSprite = "street_trafficlines_curb_white_full_28",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_21",
                northSprite = "street_trafficlines_curb_white_full_29",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_22",
                northSprite = "street_trafficlines_curb_white_full_30",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_32",
                northSprite = "street_trafficlines_curb_white_full_40",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_33",
                northSprite = "street_trafficlines_curb_white_full_41",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_34",
                northSprite = "street_trafficlines_curb_white_full_42",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_35",
                northSprite = "street_trafficlines_curb_white_full_43",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_36",
                northSprite = "street_trafficlines_curb_white_full_44",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_39",
                northSprite = "street_trafficlines_curb_white_full_38",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_47",
                northSprite = "street_trafficlines_curb_white_full_47",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_48",
                northSprite = "street_trafficlines_curb_white_full_48",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_49",
                northSprite = "street_trafficlines_curb_white_full_47",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_52",
                northSprite = "street_trafficlines_curb_white_full_89",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_53",
                northSprite = "street_trafficlines_curb_white_full_54",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_55",
                northSprite = "street_trafficlines_curb_white_full_55",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_59",
                northSprite = "street_trafficlines_curb_white_full_60",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_62",
                northSprite = "street_trafficlines_curb_white_full_85",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_63",
                northSprite = "street_trafficlines_curb_white_full_84",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_64",
                northSprite = "street_trafficlines_curb_white_full_83",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_69",
                northSprite = "street_trafficlines_curb_white_full_87",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_74",
                northSprite = "street_trafficlines_curb_white_full_90",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_65",
                northSprite = "street_trafficlines_curb_white_full_91",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_66",
                northSprite = "street_trafficlines_curb_white_full_92",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_67",
                northSprite = "street_trafficlines_curb_white_full_77",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_68",
                northSprite = "street_trafficlines_curb_white_full_76",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_70",
                northSprite = "street_trafficlines_curb_white_full_88",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_71",
                northSprite = "street_trafficlines_curb_white_full_78",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_72",
                northSprite = "street_trafficlines_curb_white_full_79",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_80",
                northSprite = "street_trafficlines_curb_white_full_94",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_96",
                northSprite = "street_trafficlines_curb_white_full_108",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_106",
                northSprite = "street_trafficlines_curb_white_full_113",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_104",
                northSprite = "street_trafficlines_curb_white_full_115",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_98",
                northSprite = "street_trafficlines_curb_white_full_99",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_102",
                northSprite = "street_trafficlines_curb_white_full_103",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_105",
                northSprite = "street_trafficlines_curb_white_full_112",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_107",
                northSprite = "street_trafficlines_curb_white_full_114",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_109",
                northSprite = "street_trafficlines_curb_white_full_109",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_116",
                northSprite = "street_trafficlines_curb_white_full_117",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_118",
                northSprite = "street_trafficlines_curb_white_full_119",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_122",
                northSprite = "street_trafficlines_curb_white_full_123",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_124",
                northSprite = "street_trafficlines_curb_white_full_125",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_126",
                northSprite = "street_trafficlines_curb_white_full_127",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_128",
                northSprite = "street_trafficlines_curb_white_full_138",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_129",
                northSprite = "street_trafficlines_curb_white_full_137",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_129",
                northSprite = "street_trafficlines_curb_white_full_137",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_131",
                northSprite = "street_trafficlines_curb_white_full_136",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_139",
                northSprite = "street_trafficlines_curb_white_full_139",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_131",
                northSprite = "street_trafficlines_curb_white_full_136",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_132",
                northSprite = "street_trafficlines_curb_white_full_150",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_133",
                northSprite = "street_trafficlines_curb_white_full_149",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_134",
                northSprite = "street_trafficlines_curb_white_full_148",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_146",
                northSprite = "street_trafficlines_curb_white_full_147",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_145",
                northSprite = "street_trafficlines_curb_white_full_144",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_152",
                northSprite = "street_trafficlines_curb_white_full_153",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_154",
                northSprite = "street_trafficlines_curb_white_full_155",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintWhite,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_white_full_151",
                northSprite = "street_trafficlines_curb_white_full_158",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Road_Work"),
        "",
        getText("IGUI_BuildingMenuSubCat_Road_Work_Painted_White_Line"),
        "street_trafficlines_01_8",
        whiteTrafficLines
    )

    local yellowTrafficLines = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_0",
                northSprite = "street_trafficlines_curb_yellow_full_4",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_1",
                northSprite = "street_trafficlines_curb_yellow_full_3",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_2",
                northSprite = "street_trafficlines_curb_yellow_full_5",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_7",
                northSprite = "street_trafficlines_curb_yellow_full_6",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_8",
                northSprite = "street_trafficlines_curb_yellow_full_13",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_9",
                northSprite = "street_trafficlines_curb_yellow_full_12",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_10",
                northSprite = "street_trafficlines_curb_yellow_full_11",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_14",
                northSprite = "street_trafficlines_curb_yellow_full_14",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_15",
                northSprite = "street_trafficlines_curb_yellow_full_15",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_24",
                northSprite = "street_trafficlines_curb_yellow_full_16",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_17",
                northSprite = "street_trafficlines_curb_yellow_full_25",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_18",
                northSprite = "street_trafficlines_curb_yellow_full_26",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_19",
                northSprite = "street_trafficlines_curb_yellow_full_27",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_20",
                northSprite = "street_trafficlines_curb_yellow_full_28",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_21",
                northSprite = "street_trafficlines_curb_yellow_full_29",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_22",
                northSprite = "street_trafficlines_curb_yellow_full_30",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_32",
                northSprite = "street_trafficlines_curb_yellow_full_40",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_33",
                northSprite = "street_trafficlines_curb_yellow_full_41",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_34",
                northSprite = "street_trafficlines_curb_yellow_full_42",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_35",
                northSprite = "street_trafficlines_curb_yellow_full_43",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_36",
                northSprite = "street_trafficlines_curb_yellow_full_44",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_39",
                northSprite = "street_trafficlines_curb_yellow_full_38",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_47",
                northSprite = "street_trafficlines_curb_yellow_full_47",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_48",
                northSprite = "street_trafficlines_curb_yellow_full_48",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_49",
                northSprite = "street_trafficlines_curb_yellow_full_47",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_52",
                northSprite = "street_trafficlines_curb_yellow_full_89",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_53",
                northSprite = "street_trafficlines_curb_yellow_full_54",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_55",
                northSprite = "street_trafficlines_curb_yellow_full_55",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_59",
                northSprite = "street_trafficlines_curb_yellow_full_60",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_62",
                northSprite = "street_trafficlines_curb_yellow_full_85",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_63",
                northSprite = "street_trafficlines_curb_yellow_full_84",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_64",
                northSprite = "street_trafficlines_curb_yellow_full_83",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_69",
                northSprite = "street_trafficlines_curb_yellow_full_87",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_74",
                northSprite = "street_trafficlines_curb_yellow_full_90",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_65",
                northSprite = "street_trafficlines_curb_yellow_full_91",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_66",
                northSprite = "street_trafficlines_curb_yellow_full_92",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_67",
                northSprite = "street_trafficlines_curb_yellow_full_77",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_68",
                northSprite = "street_trafficlines_curb_yellow_full_76",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_70",
                northSprite = "street_trafficlines_curb_yellow_full_88",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_71",
                northSprite = "street_trafficlines_curb_yellow_full_78",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_72",
                northSprite = "street_trafficlines_curb_yellow_full_79",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_80",
                northSprite = "street_trafficlines_curb_yellow_full_94",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_96",
                northSprite = "street_trafficlines_curb_yellow_full_108",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_106",
                northSprite = "street_trafficlines_curb_yellow_full_113",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_104",
                northSprite = "street_trafficlines_curb_yellow_full_115",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_98",
                northSprite = "street_trafficlines_curb_yellow_full_99",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_102",
                northSprite = "street_trafficlines_curb_yellow_full_103",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_105",
                northSprite = "street_trafficlines_curb_yellow_full_112",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_107",
                northSprite = "street_trafficlines_curb_yellow_full_114",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_109",
                northSprite = "street_trafficlines_curb_yellow_full_109",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_116",
                northSprite = "street_trafficlines_curb_yellow_full_117",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_118",
                northSprite = "street_trafficlines_curb_yellow_full_119",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_122",
                northSprite = "street_trafficlines_curb_yellow_full_123",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_124",
                northSprite = "street_trafficlines_curb_yellow_full_125",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_126",
                northSprite = "street_trafficlines_curb_yellow_full_127",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_128",
                northSprite = "street_trafficlines_curb_yellow_full_138",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_129",
                northSprite = "street_trafficlines_curb_yellow_full_137",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_129",
                northSprite = "street_trafficlines_curb_yellow_full_137",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_131",
                northSprite = "street_trafficlines_curb_yellow_full_136",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_139",
                northSprite = "street_trafficlines_curb_yellow_full_139",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_131",
                northSprite = "street_trafficlines_curb_yellow_full_136",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_132",
                northSprite = "street_trafficlines_curb_yellow_full_150",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_133",
                northSprite = "street_trafficlines_curb_yellow_full_149",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_134",
                northSprite = "street_trafficlines_curb_yellow_full_148",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_146",
                northSprite = "street_trafficlines_curb_yellow_full_147",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_145",
                northSprite = "street_trafficlines_curb_yellow_full_144",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_152",
                northSprite = "street_trafficlines_curb_yellow_full_153",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_154",
                northSprite = "street_trafficlines_curb_yellow_full_155",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Yellow_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildFloorOverlay,
            BuildingMenu.PaintYellow,
            true,
            {
                actionAnim = "paint",
                noNeedHammer = true,
                craftingBank = "Painting",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "street_trafficlines_curb_yellow_full_151",
                northSprite = "street_trafficlines_curb_yellow_full_158",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),
        getText("IGUI_BuildingMenuCat_Road_Work"),
        "",
        getText("IGUI_BuildingMenuSubCat_Road_Work_Painted_Yellow_Line"),
        "street_trafficlines_01_24",
        yellowTrafficLines
    )
end

local function addCategoriesToBuildingMenu()
    addTrafficLinesToMenu()
    if SandboxVars.BuildingMenu.bathroomAppliances then
        addBathroomAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.cookingAppliances then
        addCookingAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.laundryAppliances then
        addLaundryAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.metalDrums then
        addMetalDrumsToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)