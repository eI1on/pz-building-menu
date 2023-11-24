require("BuildingMenu04_CategoriesDefinitions")


local BuildingMenu = getBuildingMenuInstance()



local function addDylanContainersToMenu()
    local blakcCoffeeContainer = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructrueMedium",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "BlackCoffeeCo01_8",
                northSprite = "BlackCoffeeCo01_8",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructrueMedium",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "BlackCoffeeCo01_9",
                northSprite = "BlackCoffeeCo01_9",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
    "Dylan",
    getText("IGUI_BuildingMenuCat_Containers"),
    "BlackCoffeeCo01_8",
    getText("IGUI_BuildingMenuSubCat_Containers_Lockers"),
    "BlackCoffeeCo01_8",
    blakcCoffeeContainer
    )


    local function createCounterObject(spriteBaseName, spriteNumber)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
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
    local dylanCounter = {}
    table.insert(dylanCounter, createCounterObject("Block_Trasher_", 51))
    table.insert(dylanCounter, createCounterObject("Block_Trasher_", 50))
    BuildingMenu.addObjectsToCategories(
        "Dylan",
            getText("IGUI_BuildingMenuCat_Containers"),
            "",
            getText("IGUI_BuildingMenuSubCat_Containers_Block_Trasher"),
            "Block_Trasher_51",
            dylanCounter
    )
    dylanCounter = {}
    table.insert(dylanCounter, createCounterObject("DylansBar01_", 43))
    table.insert(dylanCounter, createCounterObject("DylansBar01_", 42))
    BuildingMenu.addObjectsToCategories(
        "Dylan",
            getText("IGUI_BuildingMenuCat_Containers"),
            "",
            getText("IGUI_BuildingMenuSubCat_Containers_Restaurant"),
            "DylansBar01_43",
            dylanCounter
    )


    local dylanBookshelves = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "Block_Trasher_1",
                sprite2 = "Block_Trasher_0",
                northSprite = "Block_Trasher_2",
                northSprite2 = "Block_Trasher_3"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "Block_Trasher_5",
                sprite2 = "Block_Trasher_4",
                northSprite = "Block_Trasher_6",
                northSprite2 = "Block_Trasher_7"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "Block_Trasher_60",
                sprite2 = "Block_Trasher_61",
                northSprite = "Block_Trasher_62",
                northSprite2 = "Block_Trasher_63"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "Bookies_Store_13",
                sprite2 = "Bookies_Store_12",
                northSprite = "Bookies_Store_14",
                northSprite2 = "Bookies_Store_15"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "Bookies_Store_45",
                sprite2 = "Bookies_Store_44",
                northSprite = "Bookies_Store_46",
                northSprite2 = "Bookies_Store_47"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
            getText("IGUI_BuildingMenuCat_Containers"),
            "Block_Trasher_1",
            getText("IGUI_BuildingMenuSubCat_Containers_Shelves"),
            "Block_Trasher_1",
            dylanBookshelves
    )
    
end
addDylanContainersToMenu()

local function addFridgeAppliancesToMenu()

    local fridgesObjects = {
        BuildingMenu.createObject(
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
                completionSound = "BuildMetalStructrueMedium",
                buildLow = true,
                canBeAlwaysPlaced = true,
                renderFloorHelper = false,
                containerType = "fridge",
                dismantable = true
            },
            {
                sprite = "DylansElectronics01_50",
                northSprite = "DylansElectronics01_51"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "DylansElectronics01_50",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "DylansElectronics01_50",
        fridgesObjects
    )
end



local function addGardenStuffToMenu()
    local crateObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Grocery_Box",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "smallbox",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = false
            },
            {sprite = "DylansGardenStuff01_18", northSprite = "DylansGardenStuff01_18"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Broken_Cardboard_Box",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CardboardBoxRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "smallbox",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "DylansGardenStuff01_8", 
                northSprite = "DylansGardenStuff01_9",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Broken_Cardboard_Box",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CardboardBoxRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "smallbox",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "DylansGardenStuff01_11", 
                northSprite = "DylansGardenStuff01_10",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Garden_Stuff"),
        "DylansGardenStuff02_3",
        getText("IGUI_BuildingMenuSubCat_Containers_Crates"),
        "DylansGardenStuff01_18",
        crateObjects
    )


    local plantCrateObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_19", northSprite = "DylansGardenStuff01_19"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_20", northSprite = "DylansGardenStuff01_20"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_21", northSprite = "DylansGardenStuff01_21"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_22", northSprite = "DylansGardenStuff01_22"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_23", northSprite = "DylansGardenStuff01_23"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_24", northSprite = "DylansGardenStuff01_24"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_25", northSprite = "DylansGardenStuff01_25"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_26", northSprite = "DylansGardenStuff01_26"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_27", northSprite = "DylansGardenStuff01_27"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_28", northSprite = "DylansGardenStuff01_28"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_29", northSprite = "DylansGardenStuff01_29"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_30", northSprite = "DylansGardenStuff01_30"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_31", northSprite = "DylansGardenStuff01_31"}
        ),


        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_38", northSprite = "DylansGardenStuff01_38"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_42", northSprite = "DylansGardenStuff01_42"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_39", northSprite = "DylansGardenStuff01_39"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_40", northSprite = "DylansGardenStuff01_40"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_41", northSprite = "DylansGardenStuff01_41"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff01_0", northSprite = "DylansGardenStuff01_1"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_3", northSprite = "DylansGardenStuff02_3"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_4", northSprite = "DylansGardenStuff02_4"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_5", northSprite = "DylansGardenStuff02_5"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_6", northSprite = "DylansGardenStuff02_6"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_7", northSprite = "DylansGardenStuff02_7"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_2", northSprite = "DylansGardenStuff02_2"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_14", northSprite = "DylansGardenStuff02_15"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_16", northSprite = "DylansGardenStuff02_16"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_17", northSprite = "DylansGardenStuff02_17"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_18", northSprite = "DylansGardenStuff02_18"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_19", northSprite = "DylansGardenStuff02_19"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_20", northSprite = "DylansGardenStuff02_20"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_21", northSprite = "DylansGardenStuff02_21"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_22", northSprite = "DylansGardenStuff02_22"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_23", northSprite = "DylansGardenStuff02_23"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_24", northSprite = "DylansGardenStuff02_24"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_25", northSprite = "DylansGardenStuff02_25"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_26", northSprite = "DylansGardenStuff02_26"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_27", northSprite = "DylansGardenStuff02_27"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_28", northSprite = "DylansGardenStuff02_28"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_29", northSprite = "DylansGardenStuff02_29"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_30", northSprite = "DylansGardenStuff02_30"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_31", northSprite = "DylansGardenStuff02_31"}
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Garden_Stuff"),
        "",
        getText("IGUI_BuildingMenuSubCat_Plant_Containers"),
        "DylansGardenStuff01_21",
        plantCrateObjects
    )


    plantCrateObjects = {}
    plantCrateObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_32", northSprite = "DylansGardenStuff02_33"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "DigShovel",
                noNeedHammer = true,
                craftingBank = "Shoveling",
                completionSound = "DropSoilFromGravelBag",
                blockAllTheSquare = true,
                canPassThrough = false,
                isCorner = false,
                isThumpable = true,
            },
            {sprite = "DylansGardenStuff02_34", northSprite = "DylansGardenStuff02_35"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = false,
                canPassThrough = true,
                canBarricade = false
            },
            {
                sprite = "DylansGardenStuff02_36",
                northSprite = "DylansGardenStuff02_37"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                renderFloorHelper = false,
                canPassThrough = true,
                canBarricade = false
            },
            {
                sprite = "DylansGardenStuff02_38",
                northSprite = "DylansGardenStuff02_39"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Garden_Stuff"),
        "",
        getText("IGUI_BuildingMenuSubCat_Plant_Shelves"),
        "DylansGardenStuff02_36",
        plantCrateObjects
    )


    plantCrateObjects = {}
    plantCrateObjects = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_8", northSprite = "building_menu_dylan_garden_stuff_8"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_13", northSprite = "building_menu_dylan_garden_stuff_13"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_14", northSprite = "building_menu_dylan_garden_stuff_14"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_15", northSprite = "building_menu_dylan_garden_stuff_15"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_16", northSprite = "building_menu_dylan_garden_stuff_16"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_17", northSprite = "building_menu_dylan_garden_stuff_17"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_18", northSprite = "building_menu_dylan_garden_stuff_18"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_19", northSprite = "building_menu_dylan_garden_stuff_19"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_20", northSprite = "building_menu_dylan_garden_stuff_20"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PlantCrateRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = true,
                completionSound = "BuildWoodenStructureLarge",
                blockAllTheSquare = false,
                canPassThrough = true,
                isCorner = true,
                isThumpable = true,
            },
            {sprite = "building_menu_dylan_garden_stuff_21", northSprite = "building_menu_dylan_garden_stuff_21"}
        ),

    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Garden_Stuff"),
        "",
        getText("IGUI_BuildingMenuSubCat_Small_Plant_Containers"),
        "building_menu_dylan_garden_stuff_8",
        plantCrateObjects
    )

    local gardenWallsObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Garden_Fencing",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "DylansGardenStuff02_8",
                northSprite = "DylansGardenStuff02_9"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Garden_Fencing",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                isCorner = true
            },
            {sprite = "DylansGardenStuff02_10", northSprite = "DylansGardenStuff02_10"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Garden_Fencing",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "DylansGardenStuff02_11",
                northSprite = "DylansGardenStuff02_12"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Garden_Fencing",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                isCorner = true
            },
            {sprite = "DylansGardenStuff02_13", northSprite = "DylansGardenStuff02_13"}
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Garden_Stuff"),
        "",
        getText("IGUI_BuildingMenuSubCat_Garden_Fencing"),
        "DylansGardenStuff02_8",
        gardenWallsObjects
    )

end
addGardenStuffToMenu()


local function addMetalCountersToMenu()
    local metalCounterObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = true,
                buildLow = true
            },
            {
                sprite = "DarthGunStore_9",
                sprite2 = "DarthGunStore_8",
                northSprite1 = "DarthGunStore_10",
                northSprite2 = "DarthGunStore_11"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = true,
                buildLow = true
            },
            {
                sprite = "DarthGunStore_13",
                sprite2 = "DarthGunStore_12",
                northSprite1 = "DarthGunStore_14",
                northSprite2 = "DarthGunStore_15"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_2",
                northSprite = "building_menu_dylan_safes_3",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_6",
                northSprite = "building_menu_dylan_safes_7",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "building_menu_dylan_safes_10",
                northSprite = "building_menu_dylan_safes_11",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "DylansRandomFurniture01_10",
                northSprite = "DylansRandomFurniture01_11",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "locker",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
                health = 1000,
            },
            {
                sprite = "DylansRandomFurniture01_12",
                northSprite = "DylansRandomFurniture01_13",
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Containers"),
        "",
        getText("IGUI_BuildingMenuSubCat_Containers_Metal"),
        "DarthGunStore_10",
        metalCounterObjects
    )
end
addMetalCountersToMenu()

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)