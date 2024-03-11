---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addDylanContainersToMenu()
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
                containerType = "counter",
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


    local function createDylanBookshelf(sprite, sprite2, northSprite, northSprite2)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                containerType = "shelves",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = sprite,
                sprite2 = sprite2,
                northSprite = northSprite,
                northSprite2 = northSprite2
            }
        )
    end
    local dylanBookshelves = {
        createDylanBookshelf("Block_Trasher_1", "Block_Trasher_0", "Block_Trasher_2", "Block_Trasher_3"),
        createDylanBookshelf("Block_Trasher_5", "Block_Trasher_4", "Block_Trasher_6", "Block_Trasher_7"),
        createDylanBookshelf("Block_Trasher_60", "Block_Trasher_61", "Block_Trasher_62", "Block_Trasher_63"),
        createDylanBookshelf("Bookies_Store_13", "Bookies_Store_12", "Bookies_Store_14", "Bookies_Store_15"),
        createDylanBookshelf("Bookies_Store_45", "Bookies_Store_44", "Bookies_Store_46", "Bookies_Store_47")
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


    local function createPlantCrateObject(sprite, northSprite, recipe)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            recipe,
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
            { sprite = sprite, northSprite = northSprite or sprite }
        )
    end

    local plantCrateObjects = {}

    local function addPlantCrateObjects(startIndex, endIndex, baseName, specialCases, recipe)
        for i = startIndex, endIndex do
            local spriteName = baseName .. "_" .. tostring(i)
            local northSpriteName = specialCases and specialCases[i] or spriteName
            table.insert(plantCrateObjects, createPlantCrateObject(spriteName, northSpriteName, recipe))
        end
    end
    
    addPlantCrateObjects(19, 31, "DylansGardenStuff01", nil, BuildingMenu.PlantCrateRecipe)
    addPlantCrateObjects(38, 41, "DylansGardenStuff01", nil, BuildingMenu.PlantCrateRecipe)
    table.insert(plantCrateObjects, createPlantCrateObject("DylansGardenStuff01_0", "DylansGardenStuff01_1", BuildingMenu.PlantCrateRecipe))
    
    addPlantCrateObjects(3, 7, "DylansGardenStuff02", nil, BuildingMenu.FlowerBedRecipe)
    table.insert(plantCrateObjects, createPlantCrateObject("DylansGardenStuff02_14", "DylansGardenStuff02_15", BuildingMenu.PlantCrateRecipe))
    table.insert(plantCrateObjects, createPlantCrateObject("DylansGardenStuff02_2", nil, BuildingMenu.PlantCrateRecipe))
    addPlantCrateObjects(16, 31, "DylansGardenStuff02", nil, BuildingMenu.PlantCrateRecipe)
    
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


    local function createSmallPlantContainer(sprite)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Plant_Crate",
            "Tooltip_Random_Garden_Stuff",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallPlantBoxRecipe,
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
            { sprite = sprite, northSprite = sprite }
        )
    end


    plantCrateObjects = {}
    table.insert(plantCrateObjects, createSmallPlantContainer("building_menu_dylan_garden_stuff_8"))
    for i = 13, 21 do
        local spriteName = "building_menu_dylan_garden_stuff_" .. tostring(i)
        table.insert(plantCrateObjects, createSmallPlantContainer(spriteName))
    end
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

local function addMetalCountersToMenu()
    local function createLockerObject(spriteName)
        return BuildingMenu.createObject(
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
                sprite = spriteName,
                northSprite = spriteName
            }
        )
    end
    local blackCoffeeContainer = {}
    table.insert(blackCoffeeContainer, createLockerObject("BlackCoffeeCo01_8"))
    table.insert(blackCoffeeContainer, createLockerObject("BlackCoffeeCo01_9"))
    BuildingMenu.addObjectsToCategories(
    "Dylan",
    getText("IGUI_BuildingMenuCat_Containers"),
    "BlackCoffeeCo01_8",
    getText("IGUI_BuildingMenuSubCat_Containers_Lockers"),
    "BlackCoffeeCo01_8",
    blackCoffeeContainer
    )

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
                isThumpable = true,
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
                northSprite = "DarthGunStore_10",
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
                isThumpable = true,
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
                northSprite = "DarthGunStore_14",
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
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
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
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
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
        "BlackCoffeeCo01_8",
        getText("IGUI_BuildingMenuSubCat_Containers_Metal"),
        "DarthGunStore_10",
        metalCounterObjects
    )

    local labCounterObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalLockerWGlassRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "counter",
                isThumpable = true,
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildLow = true
            },
            {
                sprite = "DylansRandomFurniture03_37",
                sprite2 = "DylansRandomFurniture03_36",
                northSprite = "DylansRandomFurniture03_38",
                northSprite2 = "DylansRandomFurniture03_39"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalLockerWGlassRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "counter",
                isThumpable = true,
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildLow = true
            },
            {
                sprite = "DylansRandomFurniture03_49",
                sprite2 = "DylansRandomFurniture03_48",
                northSprite = "DylansRandomFurniture03_50",
                northSprite2 = "DylansRandomFurniture03_51"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "counter",
                isThumpable = true,
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildLow = true
            },
            {
                sprite = "DylansRandomFurniture03_45",
                sprite2 = "DylansRandomFurniture03_44",
                northSprite = "DylansRandomFurniture03_46",
                northSprite2 = "DylansRandomFurniture03_47"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "counter",
                isThumpable = true,
                isContainer = true,
                blockAllTheSquare = false,
                needToBeAgainstWall = true,
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildLow = true
            },
            {
                sprite = "DylansRandomFurniture03_59",
                sprite2 = "DylansRandomFurniture03_58",
                northSprite = "DylansRandomFurniture03_56",
                northSprite2 = "DylansRandomFurniture03_57"
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
                containerType = "counter",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "DylansRandomFurniture03_34",
                northSprite = "DylansRandomFurniture03_35",
                eastSprite = "DylansRandomFurniture03_33",
                southSprite = "DylansRandomFurniture03_32"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerWGlassRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "DylansRandomFurniture03_54",
                northSprite = "DylansRandomFurniture03_55"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerWGlassRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "DylansRandomFurniture03_60",
                northSprite = "DylansRandomFurniture03_61"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Containers"),
        "BlackCoffeeCo01_8",
        getText("IGUI_BuildingMenuSubCat_Lab_Containers"),
        "DylansRandomFurniture03_38",
        labCounterObjects
    )
end

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

local function addBarricadesToMenu()
    local function createBarricadeObject(baseName, spriteNumber, recipe)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Barricade",
            BuildingMenu.onBuildBarricade,
            BuildingMenu[recipe],
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructrueLarge",
                canBeAlwaysPlaced = false,
                blockAllTheSquare = true,
                canPassThrough = false,
                maxTime = 500
            },
            {
                sprite = baseName .. spriteNumber,
                northSprite = baseName .. spriteNumber
            }
        )
    end

    local barricadeObjects = {}
    local dataLowBarricades = {1, 3, 4, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 30, 31, 33, 34, 35, 41, 44, 51, 52, 53, 54, 55, 56, 57, 59, 60, 61, 62}
    for _, spriteNumber in ipairs(dataLowBarricades) do
        table.insert(barricadeObjects, createBarricadeObject("DylansJunkstacks01_", spriteNumber, "LowBarricadeRecipe"))
    end
    dataLowBarricades = {1, 9, 10, 11, 12, 14, 15, 17, 19, 24, 25, 27, 28, 30, 31, 32, 36, 38, 40, 44, 49, 50, 53, 54, 55, 56, 57, 60, 62}
    for _, spriteNumber in ipairs(dataLowBarricades) do
        table.insert(barricadeObjects, createBarricadeObject("DylansJunkstacks02_", spriteNumber, "LowBarricadeRecipe"))
    end
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Barricades"),
        "DylansJunkstacks01_0",
        getText("IGUI_BuildingMenuSubCat_Low_Barricades"),
        "DylansJunkstacks01_1",
        barricadeObjects
    )

    barricadeObjects = {}
    local dataHighBarricades = {0, 2, 5, 6, 7, 14,25, 26, 28, 29, 32, 36, 37, 38, 39, 40, 42, 43, 45, 46, 47, 48, 49, 50, 58, 63}
    for _, startNumber in ipairs(dataHighBarricades) do
        table.insert(barricadeObjects, createBarricadeObject("DylansJunkstacks01_", startNumber, "HighBarricadeRecipe"))
    end
    dataHighBarricades = {2, 3, 4, 5, 6, 7, 8, 13, 16, 18, 20, 21, 22, 23, 26, 29, 33, 34, 35, 37, 39, 41, 42, 43, 45, 46, 47, 48, 51, 52, 58, 59, 61, 63}
    for _, startNumber in ipairs(dataHighBarricades) do
        table.insert(barricadeObjects, createBarricadeObject("DylansJunkstacks02_", startNumber, "HighBarricadeRecipe"))
    end
    BuildingMenu.addObjectsToCategories(
        "Dylan",
        getText("IGUI_BuildingMenuCat_Barricades"),
        "DylansJunkstacks01_0",
        getText("IGUI_BuildingMenuSubCat_High_Barricades"),
        "DylansJunkstacks01_0",
        barricadeObjects
    )
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.commercialCountersSubCategory then
        addDylanContainersToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalCountersToMenu()
    end
    if SandboxVars.BuildingMenu.outdoorPlantsSubCategory then
        addGardenStuffToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.dylanBarricades then
        addBarricadesToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)