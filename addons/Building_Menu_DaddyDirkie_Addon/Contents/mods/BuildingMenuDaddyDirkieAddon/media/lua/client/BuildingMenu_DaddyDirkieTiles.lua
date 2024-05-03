---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addDaddyDirkieDoorsToMenu()
    local function createDoorObjects(doorRanges, recipe)
        local doors = {}
        for _, range in ipairs(doorRanges) do
            for i = range.start, range.stop, 4 do
                local spriteBaseName = range.baseName
                local sprites = {
                    sprite = spriteBaseName .. i,
                    northSprite = spriteBaseName .. (i + 1),
                    openSprite = spriteBaseName .. (i + 2),
                    openNorthSprite = spriteBaseName .. (i + 3)
                }
                table.insert(
                    doors,
                    BuildingMenu.createObject(
                        "",
                        "Tooltip_Wooden_Door",
                        BuildingMenu.onBuildDoor,
                        recipe,
                        true,
                        {
                            noNeedHammer = false,
                            completionSound = "BuildWoodenStructureLarge",
                            canBarricade = true,
                            modData = {wallType = "doorframe"}
                        },
                        sprites
                    )
                )
            end
        end
        return doors
    end

    local daddyDirkieDoors = {}
    local doorSpriteRanges = {
        {start = 0, stop = 3, baseName = "d_doors_01_"},
        {start = 36, stop = 39, baseName = "d_doors_01_"},
        {start = 44, stop = 47, baseName = "d_doors_01_"},
        {start = 52, stop = 55, baseName = "d_doors_01_"},
        {start = 56, stop = 63, baseName = "d_doors_01_"},
        {start = 8, stop = 15, baseName = "d_doors_02_"},
        {start = 40, stop = 51, baseName = "d_doors_02_"},
        {start = 56, stop = 59, baseName = "d_doors_02_"},
        {start = 0, stop = 3, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 8, stop = 11, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 16, stop = 19, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 24, stop = 27, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 32, stop = 35, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 40, stop = 43, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 48, stop = 51, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 56, stop = 59, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 64, stop = 67, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 72, stop = 95, baseName = "edit_ddd_RUS_Doors_house_01_"},
    }

    daddyDirkieDoors = createDoorObjects(doorSpriteRanges, BuildingMenu.WoodenDoorRecipe)
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Doors"),
        "d_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "d_doors_01_0",
        daddyDirkieDoors
    )

    doorSpriteRanges = {
        {start = 4, stop = 7, baseName = "d_doors_01_"},
        {start = 20, stop = 23, baseName = "d_doors_01_"},
        {start = 28, stop = 31, baseName = "d_doors_01_"},
        {start = 32, stop = 39, baseName = "d_doors_02_"},
    }

    daddyDirkieDoors = createDoorObjects(doorSpriteRanges, BuildingMenu.WoodenSingleGlassDoorRecipe)
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Doors"),
        "",
        getText("IGUI_BuildingMenuSubCat_Doors_Glass_Doors"),
        "d_doors_01_4",
        daddyDirkieDoors
    )

    doorSpriteRanges = {
        {start = 8, stop = 11, baseName = "d_doors_01_"},
        {start = 16, stop = 19, baseName = "d_doors_01_"},
        {start = 0, stop = 7, baseName = "d_doors_02_"},
        {start = 4, stop = 7, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 12, stop = 15, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 20, stop = 23, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 28, stop = 31, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 36, stop = 39, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 44, stop = 47, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 52, stop = 55, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 60, stop = 63, baseName = "edit_ddd_RUS_Doors_house_01_"},
        {start = 68, stop = 71, baseName = "d_doors_01_"},
    }

    daddyDirkieDoors = createDoorObjects(doorSpriteRanges, BuildingMenu.WoodenDoubleGlassDoorRecipe)
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Doors"),
        "d_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Glass_Doors"),
        "d_doors_01_8",
        daddyDirkieDoors
    )


    doorSpriteRanges = {
        {start = 28, stop = 31, baseName = "d_doors_02_"},
    }

    daddyDirkieDoors = createDoorObjects(doorSpriteRanges, BuildingMenu.MetalDoorRecipe)
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Doors"),
        "d_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Metal_Doors"),
        "d_doors_01_28",
        daddyDirkieDoors
    )

    doorSpriteRanges = {
        {start = 12, stop = 15, baseName = "d_doors_01_"},
        {start = 16, stop = 23, baseName = "d_doors_02_"},
    }

    daddyDirkieDoors = createDoorObjects(doorSpriteRanges, BuildingMenu.MetalSingleGlassDoorRecipe)
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Doors"),
        "d_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Metal_Doors"),
        "d_doors_01_12",
        daddyDirkieDoors
    )
end

local function addHighFencesToMenu()
    local highFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_ddd_01_10",
                sprite2 = "fencing_ddd_01_11",
                northSprite = "fencing_ddd_01_8",
                northSprite2 = "fencing_ddd_01_9",
                corner = "fencing_ddd_01_13"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFenceRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_12", northSprite = "fencing_ddd_01_12"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFencePostRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_13", northSprite = "fencing_ddd_01_13"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_ddd_01_18",
                sprite2 = "fencing_ddd_01_19",
                northSprite = "fencing_ddd_01_16",
                northSprite2 = "fencing_ddd_01_17",
                corner = "fencing_ddd_01_21"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_20", northSprite = "fencing_ddd_01_20"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_21", northSprite = "fencing_ddd_01_21"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_with_Vines1",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_ddd_01_34",
                sprite2 = "fencing_ddd_01_35",
                northSprite = "fencing_ddd_01_32",
                northSprite2 = "fencing_ddd_01_33",
                corner = "fencing_ddd_01_37"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_with_Vines2",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_ddd_01_39",
                sprite2 = "fencing_ddd_01_35",
                northSprite = "fencing_ddd_01_32",
                northSprite2 = "fencing_ddd_01_38",
                corner = "fencing_ddd_01_37"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Corner_with_Vines",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_36", northSprite = "fencing_ddd_01_36"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Post_with_Vines",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_37", northSprite = "fencing_ddd_01_37"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Planks_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighMetalFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "fencing_ddd_01_26",
                sprite2 = "fencing_ddd_01_27",
                northSprite = "fencing_ddd_01_24",
                northSprite2 = "fencing_ddd_01_25",
                corner = "fencing_ddd_01_29"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Planks_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_28", northSprite = "fencing_ddd_01_28"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Planks_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "fencing_ddd_01_29", northSprite = "fencing_ddd_01_29"}
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "fencing_ddd_01_11",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_High"),
        "fencing_ddd_01_11",
        highFences
    )

end

local function addLowAndRailingFencesToMenu()
    local lowFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence_Post",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "location_farm_accesories_spyjack_01_5", northSprite = "location_farm_accesories_spyjack_01_5"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_3",
                northSprite = "location_farm_accesories_spyjack_01_0",
                corner = "location_farm_accesories_spyjack_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_2",
                northSprite = "location_farm_accesories_spyjack_01_1",
                corner = "location_farm_accesories_spyjack_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence_Corner",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "location_farm_accesories_spyjack_01_4", northSprite = "location_farm_accesories_spyjack_01_4"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence_Gate",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildDoor,
            BuildingMenu.LowWoodenDoorRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                dontNeedFrame = true,
                canBarricade = false,
                isThumpable = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_8",
                northSprite = "location_farm_accesories_spyjack_01_9",
                openSprite = "location_farm_accesories_spyjack_01_10",
                openNorthSprite = "location_farm_accesories_spyjack_01_11"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Fence_Gate",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildDoor,
            BuildingMenu.LowWoodenDoorRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                dontNeedFrame = true,
                canBarricade = false,
                isThumpable = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_12",
                northSprite = "location_farm_accesories_spyjack_01_13",
                openSprite = "location_farm_accesories_spyjack_01_14",
                openNorthSprite = "location_farm_accesories_spyjack_01_15"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence_Post",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "location_farm_accesories_spyjack_01_21", northSprite = "location_farm_accesories_spyjack_01_21"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_19",
                northSprite = "location_farm_accesories_spyjack_01_16",
                corner = "location_farm_accesories_spyjack_01_21"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_18",
                northSprite = "location_farm_accesories_spyjack_01_17",
                corner = "location_farm_accesories_spyjack_01_21"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence_Corner",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "location_farm_accesories_spyjack_01_20", northSprite = "location_farm_accesories_spyjack_01_20"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence_Gate",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildDoor,
            BuildingMenu.LowWoodenDoorRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                dontNeedFrame = true,
                canBarricade = false,
                isThumpable = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_24",
                northSprite = "location_farm_accesories_spyjack_01_25",
                openSprite = "location_farm_accesories_spyjack_01_26",
                openNorthSprite = "location_farm_accesories_spyjack_01_27"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Wooden_Fence_Gate",
            "Tooltip_Wooden_Fence_Gate",
            BuildingMenu.onBuildDoor,
            BuildingMenu.LowWoodenDoorRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                dontNeedFrame = true,
                canBarricade = false,
                isThumpable = false
            },
            {
                sprite = "location_farm_accesories_spyjack_01_28",
                northSprite = "location_farm_accesories_spyjack_01_29",
                openSprite = "location_farm_accesories_spyjack_01_30",
                openNorthSprite = "location_farm_accesories_spyjack_01_31"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "fencing_ddd_01_11",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_Low"),
        "location_farm_accesories_spyjack_01_11",
        lowFences
    )
end

local function addDaddyDirkieBedroomFurnitureToMenu()
    local furnitureSets = {}
    for i = 1, 5 do
        local tileSetName = "d_furniture_bedroom_0" .. i
        furnitureSets[i] = {
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildDoubleTileFurniture,
                BuildingMenu.BedRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = tileSetName .. "_3",
                    sprite2 = tileSetName .. "_2",
                    northSprite = tileSetName .. "_0",
                    northSprite2 = tileSetName .. "_1"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildDoubleTileFurniture,
                BuildingMenu.BedRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = tileSetName .. (i == 4 and "_15" or "_7"),
                    sprite2 = tileSetName .. (i == 4 and "_14" or "_6"),
                    northSprite = tileSetName .. (i == 4 and "_12" or "_4"),
                    northSprite2 = tileSetName .. (i == 4 and "_13" or "_5")
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildFourTileFurniture,
                BuildingMenu.BedRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = tileSetName .. (i == 4 and "_23" or "_11"),
                    sprite2 = tileSetName .. (i == 4 and "_21" or "_10"),
                    sprite3 = tileSetName .. (i == 4 and "_20" or "_8"),
                    sprite4 = tileSetName .. (i == 4 and "_22" or "_9"),
                    northSprite = tileSetName .. (i == 4 and "_16" or "_12"),
                    northSprite2 = tileSetName .. (i == 4 and "_18" or "_14"),
                    northSprite3 = tileSetName .. (i == 4 and "_19" or "_15"),
                    northSprite4 = tileSetName .. (i == 4 and "_17" or "_13")
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bedDesc",
                BuildingMenu.onBuildFourTileFurniture,
                BuildingMenu.BedRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = tileSetName .. (i == 4 and "_11" or "_23"),
                    sprite2 = tileSetName .. (i == 4 and "_9" or "_22"),
                    sprite3 = tileSetName .. (i == 4 and "_8" or "_20"),
                    sprite4 = tileSetName .. (i == 4 and "_10" or "_21"),
                    northSprite = tileSetName .. (i == 4 and "_4" or "_16"),
                    northSprite2 = tileSetName .. (i == 4 and "_6" or "_18"),
                    northSprite3 = tileSetName .. (i == 4 and "_7" or "_19"),
                    northSprite4 = tileSetName .. (i == 4 and "_5" or "_17")
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_smallTableDesc",
                BuildingMenu.onBuildSimpleFurniture,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge"
                },
                {
                    sprite = tileSetName .. "_58", 
                    northSprite = tileSetName .. "_59"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "cabinet",
                },
                {
                    sprite = tileSetName .. "_62",
                    northSprite = tileSetName .. "_63"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "cabinet",
                    isContainer = true,
                },
                {
                    sprite = tileSetName .. "_25",
                    northSprite = tileSetName .. "_24",
                    eastSprite = tileSetName .. "_26",
                    southSprite = tileSetName .. "_27"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "cabinet",
                },
                {
                    sprite = tileSetName .. "_29",
                    northSprite = tileSetName .. "_28",
                    eastSprite = tileSetName .. "_30",
                    southSprite = tileSetName .. "_31"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "cabinet",
                },
                {
                    sprite = tileSetName .. "_33",
                    northSprite = tileSetName .. "_32",
                    eastSprite = tileSetName .. "_34",
                    southSprite = tileSetName .. "_35"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "cabinet",
                },
                {
                    sprite = tileSetName .. "_37",
                    northSprite = tileSetName .. "_36",
                    eastSprite = tileSetName .. "_38",
                    southSprite = tileSetName .. "_39"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "shelves",
                },
                {
                    sprite = tileSetName .. "_53",
                    northSprite = tileSetName .. "_52",
                    eastSprite = tileSetName .. "_54",
                    southSprite = tileSetName .. "_55"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildDoubleTileContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "wardrobe",
                    isContainer = true,
                    canBeLockedByPadlock = true
                },
                {
                    sprite = tileSetName .. "_41",
                    sprite2 = tileSetName .. "_40",
                    northSprite = tileSetName .. "_42",
                    northSprite2 = tileSetName .. "_43"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_Dresser",
                BuildingMenu.onBuildDoubleTileContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "wardrobe",
                    isContainer = true,
                    canBeLockedByPadlock = true
                },
                {
                    sprite = tileSetName .. "_47",
                    sprite2 = tileSetName .. "_46",
                    northSprite = tileSetName .. "_44",
                    northSprite2 = tileSetName .. "_45"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bookcaseDesc",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "shelves",
                    isContainer = true,
                    canBeLockedByPadlock = false
                },
                {
                    sprite = tileSetName .. "_49",
                    northSprite = tileSetName .. "_48",
                    eastSprite = tileSetName .. "_50",
                    southSprite = tileSetName .. "_51"
                }
            ),
            BuildingMenu.createObject(
                "",
                "Tooltip_craft_bookcaseDesc",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.LargeFurnitureRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    containerType = "shelves",
                    needToBeAgainstWall = true,
                    buildHigh = true,
                    blockAllTheSquare = false,
                    isWallLike = true,
                },
                {
                    sprite = tileSetName .. "_56",
                    northSprite = tileSetName .. "_57"
                }
            ),
        }
    end

    for i, set in ipairs(furnitureSets) do
        BuildingMenu.addObjectsToCategories(
            "Daddy Dirkie",
            getText("IGUI_BuildingMenuCat_Furniture"),
            "d_furniture_bedroom_0" .. i .. "_25",
            getText("IGUI_BuildingMenuSubCat_DaddyDirkie_Furniture_Furniture_Set_" .. i),
            "d_furniture_bedroom_0" .. i .. "_25",
            set
        )
    end


    local furnitureDressers = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Double_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_3",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_2",
                northSprite = "edit_ddd_RUS_furniture_storage_03_0",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_1"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Double_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_7",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_6",
                northSprite = "edit_ddd_RUS_furniture_storage_03_4",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Double_Wardrobe_Glass",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_11",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_10",
                northSprite = "edit_ddd_RUS_furniture_storage_03_8",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_9"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Double_Wardrobe_Glass",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_15",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_14",
                northSprite = "edit_ddd_RUS_furniture_storage_03_12",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_13"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Oak_Drawers",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "desk",
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_28",
                northSprite = "edit_ddd_RUS_furniture_storage_03_29",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_30",
                southSprite = "edit_ddd_RUS_furniture_storage_03_31"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Oak_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_33",
                northSprite = "edit_ddd_RUS_furniture_storage_03_36",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_50",
                southSprite = "edit_ddd_RUS_furniture_storage_03_51"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Oak_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_41",
                northSprite = "edit_ddd_RUS_furniture_storage_03_40",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_43",
                southSprite = "edit_ddd_RUS_furniture_storage_03_42"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Oak_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_34",
                northSprite = "edit_ddd_RUS_furniture_storage_03_35",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Wood_Double_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_67",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_66",
                northSprite = "edit_ddd_RUS_furniture_storage_03_64",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_65"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Wood_Double_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_71",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_70",
                northSprite = "edit_ddd_RUS_furniture_storage_03_68",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_69"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Wood_Double_Wardrobe_Glass",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_75",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_74",
                northSprite = "edit_ddd_RUS_furniture_storage_03_72",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_73"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Light_Wood_Double_Wardrobe_Glass",
            "Tooltip_Dresser",
            BuildingMenu.onBuildDoubleTileContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "wardrobe",
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_79",
                sprite2 = "edit_ddd_RUS_furniture_storage_03_78",
                northSprite = "edit_ddd_RUS_furniture_storage_03_76",
                northSprite2 = "edit_ddd_RUS_furniture_storage_03_77"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Dark_Drawers",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "desk"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_100",
                northSprite = "edit_ddd_RUS_furniture_storage_03_101",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_102",
                southSprite = "edit_ddd_RUS_furniture_storage_03_103"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Dark_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_80",
                northSprite = "edit_ddd_RUS_furniture_storage_03_85",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_86",
                southSprite = "edit_ddd_RUS_furniture_storage_03_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Dark_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_81",
                northSprite = "edit_ddd_RUS_furniture_storage_03_84",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_98",
                southSprite = "edit_ddd_RUS_furniture_storage_03_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Dark_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_82",
                northSprite = "edit_ddd_RUS_furniture_storage_03_83",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_96",
                southSprite = "edit_ddd_RUS_furniture_storage_03_97"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Dark_Wardrobe",
            "Tooltip_Dresser",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                container = "wardrobe"
            },
            {
                sprite = "edit_ddd_RUS_furniture_storage_03_89",
                northSprite = "edit_ddd_RUS_furniture_storage_03_88",
                eastSprite = "edit_ddd_RUS_furniture_storage_03_91",
                southSprite = "edit_ddd_RUS_furniture_storage_03_90"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Furniture"),
        "edit_ddd_RUS_furniture_storage_03_8",
        getText("IGUI_BuildingMenuSubCat_Furniture_Dressers"),
        "edit_ddd_RUS_furniture_storage_03_8",
        furnitureDressers
    )
end

local function addDaddyDirkieCouchesToMenu()
    local function createFurnitureObject(spriteData, isSimpleFurniture)
        return BuildingMenu.createObject(
            "",
            "",
            isSimpleFurniture and BuildingMenu.onBuildSimpleFurniture or BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.CouchRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                isThumpable = true,
                isCorner = true
            },
            spriteData
        )
    end

    local daddyDirkieCouches = {}
    local spriteConfigurations = {
        {
            sprite = "d_furniture_couches_01_1",
            sprite2 = "d_furniture_couches_01_0",
            northSprite = "d_furniture_couches_01_2",
            northSprite2 = "d_furniture_couches_01_3",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_7",
            sprite2 = "d_furniture_couches_01_6",
            northSprite = "d_furniture_couches_01_4",
            northSprite2 = "d_furniture_couches_01_5",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_13",
            northSprite = "d_furniture_couches_01_12",
            eastSprite = "d_furniture_couches_01_14",
            southSprite = "d_furniture_couches_01_15",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_17",
            sprite2 = "d_furniture_couches_01_16",
            northSprite = "d_furniture_couches_01_18",
            northSprite2 = "d_furniture_couches_01_19",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_23",
            sprite2 = "d_furniture_couches_01_22",
            northSprite = "d_furniture_couches_01_20",
            northSprite2 = "d_furniture_couches_01_21",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_9",
            northSprite = "d_furniture_couches_01_8",
            eastSprite = "d_furniture_couches_01_10",
            southSprite = "d_furniture_couches_01_11",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_25",
            sprite2 = "d_furniture_couches_01_24",
            northSprite = "d_furniture_couches_01_26",
            northSprite2 = "d_furniture_couches_01_27",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_31",
            sprite2 = "d_furniture_couches_01_30",
            northSprite = "d_furniture_couches_01_28",
            northSprite2 = "d_furniture_couches_01_29",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_37",
            northSprite = "d_furniture_couches_01_36",
            eastSprite = "d_furniture_couches_01_38",
            southSprite = "d_furniture_couches_01_39",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_41",
            sprite2 = "d_furniture_couches_01_40",
            northSprite = "d_furniture_couches_01_42",
            northSprite2 = "d_furniture_couches_01_43",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_47",
            sprite2 = "d_furniture_couches_01_46",
            northSprite = "d_furniture_couches_01_44",
            northSprite2 = "d_furniture_couches_01_45",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_33",
            northSprite = "d_furniture_couches_01_32",
            eastSprite = "d_furniture_couches_01_34",
            southSprite = "d_furniture_couches_01_35",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_49",
            sprite2 = "d_furniture_couches_01_48",
            northSprite = "d_furniture_couches_01_50",
            northSprite2 = "d_furniture_couches_01_51",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_55",
            sprite2 = "d_furniture_couches_01_54",
            northSprite = "d_furniture_couches_01_52",
            northSprite2 = "d_furniture_couches_01_53",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_57",
            northSprite = "d_furniture_couches_01_56",
            eastSprite = "d_furniture_couches_01_58",
            southSprite = "d_furniture_couches_01_59",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_67",
            sprite2 = "d_furniture_couches_01_66",
            northSprite = "d_furniture_couches_01_64",
            northSprite2 = "d_furniture_couches_01_65",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_71",
            sprite2 = "d_furniture_couches_01_70",
            northSprite = "d_furniture_couches_01_68",
            northSprite2 = "d_furniture_couches_01_69",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_72",
            northSprite = "d_furniture_couches_01_73",
            eastSprite = "d_furniture_couches_01_74",
            southSprite = "d_furniture_couches_01_75",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_83",
            sprite2 = "d_furniture_couches_01_82",
            northSprite = "d_furniture_couches_01_80",
            northSprite2 = "d_furniture_couches_01_81",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_87",
            sprite2 = "d_furniture_couches_01_86",
            northSprite = "d_furniture_couches_01_84",
            northSprite2 = "d_furniture_couches_01_85",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_76",
            northSprite = "d_furniture_couches_01_77",
            eastSprite = "d_furniture_couches_01_78",
            southSprite = "d_furniture_couches_01_79",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_91",
            sprite2 = "d_furniture_couches_01_90",
            northSprite = "d_furniture_couches_01_88",
            northSprite2 = "d_furniture_couches_01_89",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_95",
            sprite2 = "d_furniture_couches_01_94",
            northSprite = "d_furniture_couches_01_92",
            northSprite2 = "d_furniture_couches_01_93",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_96",
            northSprite = "d_furniture_couches_01_97",
            eastSprite = "d_furniture_couches_01_98",
            southSprite = "d_furniture_couches_01_99",
            isSimple = true
        },
        {
            sprite = "d_furniture_couches_01_107",
            sprite2 = "d_furniture_couches_01_106",
            northSprite = "d_furniture_couches_01_104",
            northSprite2 = "d_furniture_couches_01_105",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_111",
            sprite2 = "d_furniture_couches_01_110",
            northSprite = "d_furniture_couches_01_108",
            northSprite2 = "d_furniture_couches_01_109",
            isSimple = false
        },
        {
            sprite = "d_furniture_couches_01_100",
            northSprite = "d_furniture_couches_01_101",
            eastSprite = "d_furniture_couches_01_102",
            southSprite = "d_furniture_couches_01_103",
            isSimple = true
        }
    }

    for _, config in ipairs(spriteConfigurations) do
        table.insert(daddyDirkieCouches, createFurnitureObject(config, config.isSimple))
    end

    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Couches"),
        "d_furniture_couches_01_13",
        daddyDirkieCouches
    )
end

local function addKitchenCountersToMenu()
    local daddyDirkieCounters = {}
    local dataCounters = {10, 11, 18, 19, 26, 27, 34, 35, 42, 43, 50, 51, 58, 59, 66, 67, 74, 75, 82, 83, 90, 91, 98, 99, 106, 107}

    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(daddyDirkieCounters, 
            BuildingMenu.createObject(
                "",
                "Tooltip_Counter_Generic",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.CounterRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    isThumpable = true
                },
                {
                    sprite = "d_furniture_kitchen_01_" .. spriteNumber,
                    northSprite = "d_furniture_kitchen_01_" .. (spriteNumber + 2),
                    eastSprite = "d_furniture_kitchen_01_" .. (spriteNumber + 4),
                    southSprite = "d_furniture_kitchen_01_" .. (spriteNumber - 2)
                }
            )
        )
    end

    table.insert(daddyDirkieCounters, 
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            {
                sprite = "d_location_sofaking_11",
                northSprite = "d_location_sofaking_13",
                eastSprite = "d_location_sofaking_15",
                southSprite = "d_location_sofaking_9"
            }
        )
    )

    table.insert(daddyDirkieCounters, 
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            {
                sprite = "d_location_sofaking_10",
                northSprite = "d_location_sofaking_12",
                eastSprite = "d_location_sofaking_14",
                southSprite = "d_location_sofaking_8"
            }
        )
    )

    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Containers"),
        "d_furniture_kitchen_01_11",
        getText("IGUI_BuildingMenuSubCat_Containers_Residential"),
        "d_furniture_kitchen_01_11",
        daddyDirkieCounters
    )


    daddyDirkieCounters = {}
    dataCounters = {1, 3, 5, 7, 113}
    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(daddyDirkieCounters,
            BuildingMenu.createObject(
                "",
                "Tooltip_Counter_Generic",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.CounterRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    isThumpable = true
                },
                {
                    sprite = "d_furniture_kitchen_01_" .. spriteNumber,
                    northSprite = "d_furniture_kitchen_01_" .. (spriteNumber - 1)
                }
            )
        )
    end

    dataCounters = {2, 3, 10, 11, 18, 19, 26, 27, 34, 35, 42, 43, 50, 51, 58, 59}
    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(daddyDirkieCounters,
            BuildingMenu.createObject(
                "",
                "Tooltip_Counter_Generic",
                BuildingMenu.onBuildWoodenContainer,
                BuildingMenu.CounterRecipe,
                true,
                {
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    isThumpable = true
                },
                {
                    sprite = "edit_ddd_RUS_fixtures_counters_03_" .. spriteNumber,
                    northSprite = "edit_ddd_RUS_fixtures_counters_03_" .. (spriteNumber + 2),
                    eastSprite = "edit_ddd_RUS_fixtures_counters_03_" .. (spriteNumber + 4),
                    southSprite = "edit_ddd_RUS_fixtures_counters_03_" .. (spriteNumber - 2)
                }
            )
        )
    end
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Upper_Counters"),
        "d_furniture_kitchen_01_1",
        daddyDirkieCounters
    )
end

local function addMetalContainersToMenu()
    local daddyDirkieCounters = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "edit_ddd_RUS_location_business_machinery_02_1",
                northSprite = "edit_ddd_RUS_location_business_machinery_02_2",
                eastSprite = "edit_ddd_RUS_location_business_machinery_02_3",
                southSprite = "edit_ddd_RUS_location_business_machinery_02_0"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                needToBeAgainstWall = false,
                renderFloorHelper = false,
                canBeAlwaysPlaced = true,
                blockAllTheSquare = false,
            },
            {
                sprite = "furniture_storage_ddd_01_14",
                northSprite = "furniture_storage_ddd_01_15"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                needToBeAgainstWall = false,
                renderFloorHelper = false,
                canBeAlwaysPlaced = true,
                blockAllTheSquare = false,
            },
            {
                sprite = "furniture_storage_ddd_01_30",
                northSprite = "furniture_storage_ddd_01_31"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildDoubleMetalShelf,
            BuildingMenu.MetalCounterBigRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                isContainer = true,
                containerType = "shelves",
                canBeAlwaysPlaced = false,
                renderFloorHelper = false,
                buildHigh = true,
            },
            {
                sprite = "industry_dirkea_ddd_01_15",
                sprite2 = "industry_dirkea_ddd_01_14",
                northSprite = "industry_dirkea_ddd_01_12",
                northSprite2 = "industry_dirkea_ddd_01_13"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "location_community_medical_ddd_01_8",
                northSprite = "location_community_medical_ddd_01_9",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "location_community_medical_ddd_01_10",
                northSprite = "location_community_medical_ddd_01_11",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "shelves",
                needToBeAgainstWall = true,
                renderFloorHelper = true,
                blockAllTheSquare = false,
            },
            {
                sprite = "location_community_medical_ddd_01_12",
                northSprite = "location_community_medical_ddd_01_13",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "location_community_medical_ddd_01_16",
                northSprite = "location_community_medical_ddd_01_17",
                eastSprite = "location_community_medical_ddd_01_18",
                southSprite = "location_community_medical_ddd_01_19"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalLockerRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                containerType = "toolcabinet",
                blockAllTheSquare = true,
                canBeLockedByPadlock = true,
            },
            {
                sprite = "location_community_medical_ddd_01_28",
                northSprite = "location_community_medical_ddd_01_29",
                eastSprite = "location_community_medical_ddd_01_30",
                southSprite = "location_community_medical_ddd_01_31"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Metal"),
        "edit_ddd_RUS_location_business_machinery_02_1",
        daddyDirkieCounters
    )
end

local function addCratesToMenu()
    local daddyDirkieCrates = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_9", northSprite = "industry_ddd_01_9"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_12", northSprite = "furniture_storage_ddd_01_12"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_20", northSprite = "furniture_storage_ddd_01_20"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Green_Small_Locker",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_4", northSprite = "furniture_storage_ddd_01_4"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pallet_Green_Small_Locker",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_7", northSprite = "furniture_storage_ddd_01_7"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Small_Locker",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_9", northSprite = "furniture_storage_ddd_01_9"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pallet_White_Small_Locker",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "locker",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "furniture_storage_ddd_01_8", northSprite = "furniture_storage_ddd_01_8"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Barrel_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_4", northSprite = "industry_ddd_01_4"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Barrel_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_5", northSprite = "industry_ddd_01_5"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Barrel_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_6", northSprite = "industry_ddd_01_6"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Barrel_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_7", northSprite = "industry_ddd_01_7"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Boxes_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_55", northSprite = "industry_ddd_01_55"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Boxes_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_53", northSprite = "industry_ddd_01_53"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Small_Boxes_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_54", northSprite = "industry_ddd_01_54"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_55", northSprite = "industry_ddd_01_55"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_52", northSprite = "industry_ddd_01_52"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_60", northSprite = "industry_ddd_01_60"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_56", northSprite = "industry_ddd_01_56"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_57", northSprite = "industry_ddd_01_57"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_58", northSprite = "industry_ddd_01_58"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Vegetable_Baskets_On_Pallet",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "crate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {sprite = "industry_ddd_01_59", northSprite = "industry_ddd_01_59"}
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Containers"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Containers_Crates"),
        "furniture_storage_ddd_01_7",
        daddyDirkieCrates
    )
end

local function addDaddyDirkieStairsToMenu()
    local function createWoodenStairsObject1(baseName, startSpriteNumber)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Simple_Wooden_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.WoodenStairsRecipe,
            true,
            {
                noNeedHammer = false,
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
    local function createWoodenStairsObject2(baseName, startSpriteNumber)
        return BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Simple_Wooden_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.WoodenStairsRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = false
            },
            {
                sprite = baseName .. startSpriteNumber,
                upToLeft01 = baseName .. startSpriteNumber,
                upToLeft02 = baseName .. (startSpriteNumber + 1),
                upToLeft03 = baseName .. (startSpriteNumber + 2),
                upToRight01 = baseName .. (startSpriteNumber + 3),
                upToRight02 = baseName .. (startSpriteNumber + 4),
                upToRight03 = baseName .. (startSpriteNumber + 5),
                pillar = baseName .. (startSpriteNumber + 6),
                pillarNorth = baseName .. (startSpriteNumber + 7)
            }
        )
    end

    local melosWoodenStairs = {}
    local dataStairs = {16, 19}
    for _, startNumber in ipairs(dataStairs) do
        table.insert(melosWoodenStairs, createWoodenStairsObject1("fixtures_stairs_ddd_01_", startNumber))
    end

    dataStairs = {32, 40, 48}
    for _, startNumber in ipairs(dataStairs) do
        table.insert(melosWoodenStairs, createWoodenStairsObject2("fixtures_stairs_ddd_01_", startNumber))
    end
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Stairs"),
        "fixtures_stairs_ddd_01_32",
        getText("IGUI_BuildingMenuSubCat_Stairs_Wooden"),
        "fixtures_stairs_ddd_01_32",
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
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "fixtures_stairs_ddd_01_0",
                upToLeft01 = "fixtures_stairs_ddd_01_0",
                upToLeft02 = "fixtures_stairs_ddd_01_1",
                upToLeft03 = "fixtures_stairs_ddd_01_2",
                upToRight01 = "fixtures_stairs_ddd_01_8",
                upToRight02 = "fixtures_stairs_ddd_01_9",
                upToRight03 = "fixtures_stairs_ddd_01_10",
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
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "fixtures_stairs_ddd_01_3",
                upToLeft01 = "fixtures_stairs_ddd_01_3",
                upToLeft02 = "fixtures_stairs_ddd_01_4",
                upToLeft03 = "fixtures_stairs_ddd_01_5",
                upToRight01 = "fixtures_stairs_ddd_01_11",
                upToRight02 = "fixtures_stairs_ddd_01_12",
                upToRight03 = "fixtures_stairs_ddd_01_13",
                pillar = "fixtures_stairs_ddd_01_14",
                pillarNorth = "fixtures_stairs_ddd_01_14"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Stairs"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Stairs_Metal"),
        "fixtures_stairs_ddd_01_0",
        melosMetalStairs
    )
end

local function addDaddyDirkieOthersToMenu()
    local daddyDirkieOthers = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_SecretEntranceShelf",
            "Tooltip_SecretEntranceShelf",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            "Build Secret Entrance",
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "shelves",
                canBeAlwaysPlaced = true,
                needToBeAgainstWall = true,
                isContainer = true,
                canBeLockedByPadlock = true,
                blockAllTheSquare = false,
            },
            {
                sprite = "furniture_storage_ddd_01_32",
                northSprite = "furniture_storage_ddd_01_33",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_SecretEntranceShelf",
            "Tooltip_SecretEntranceShelf",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            "Build Secret Entrance",
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "shelves",
                canBeAlwaysPlaced = true,
                needToBeAgainstWall = true,
                isContainer = true,
                canBeLockedByPadlock = true,
                blockAllTheSquare = false,
            },
            {
                sprite = "furniture_storage_ddd_01_34",
                northSprite = "furniture_storage_ddd_01_35",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_SecretEntranceDoor",
            "Tooltip_SecretEntranceDoor",
            BuildingMenu.onBuildDoor,
            BuildingMenu.WoodenDoorRecipe,
            "Build Secret Entrance",
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "d_doors_02_64",
                northSprite = "d_doors_02_65",
                openSprite = "d_doors_02_66",
                openNorthSprite = "d_doors_02_67"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_SecretEntranceDoor",
            "Tooltip_SecretEntranceDoor",
            BuildingMenu.onBuildDoor,
            BuildingMenu.WoodenDoorRecipe,
            "Build Secret Entrance",
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "d_doors_02_68",
                northSprite = "d_doors_02_69",
                openSprite = "d_doors_02_70",
                openNorthSprite = "d_doors_02_71"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_DaddyDirkie_Others"),
        "d_doors_02_64",
        getText("IGUI_BuildingMenuSubCat_DaddyDirkie_Secret_Entrances"),
        "d_doors_02_64",
        daddyDirkieOthers
    )
end

local function addDaddyDirkieForestSurvivalToMenu()
    local forestSurvival = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Wall",
            "Tooltip_Log_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = {wallType = "wall"}
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_0",
                northSprite = "edit_ddd_RUS_Forest Survival_01_2",
                corner = "edit_ddd_RUS_Forest Survival_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Door_Frame",
            "Tooltip_Log_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_6",
                northSprite = "edit_ddd_RUS_Forest Survival_01_7",
                corner = "edit_ddd_RUS_Forest Survival_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Window_Frame",
            "Tooltip_Log_Window_Frame",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "building_menu_03_ddd_Forest_Survival_0",
                northSprite = "building_menu_03_ddd_Forest_Survival_1",
                corner = "edit_ddd_RUS_Forest Survival_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Twig_Window",
            "Tooltip_Windows_Generic",
            BuildingMenu.onBuildWindow,
            BuildingMenu.WindowRecipe,
            true,
            { 
                noNeedHammer = false, 
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = false,
                canBarricade = true,
                isThumpable = true,
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_14", northSprite = "edit_ddd_RUS_Forest Survival_01_15"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Pillar",
            "Tooltip_Log_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_1", 
                northSprite = "edit_ddd_RUS_Forest Survival_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Pillar",
            "Tooltip_Log_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_5", 
                northSprite = "edit_ddd_RUS_Forest Survival_01_5"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Crate",
            "Tooltip_Log_Crate",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "militarycrate",
                canBeAlwaysPlaced = true,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_32",
                northSprite = "edit_ddd_RUS_Forest Survival_01_33"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bookcaseDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                containerType = "shelves",
                canBeAlwaysPlaced = true,
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                isWallLike = true,
                isContainer = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_40",
                northSprite = "edit_ddd_RUS_Forest Survival_01_41",
                eastSprite = "edit_ddd_RUS_Forest Survival_01_42",
                southSprite = "edit_ddd_RUS_Forest Survival_01_43"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_smallTableDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_61", northSprite = "edit_ddd_RUS_Forest Survival_01_58"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_smallTableDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.BigLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_60", northSprite = "edit_ddd_RUS_Forest Survival_01_59"}
        ),


        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Roof_Pitched_1",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_16", northSprite = "edit_ddd_RUS_Forest Survival_01_21"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Roof_Pitched_2",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_17", northSprite = "edit_ddd_RUS_Forest Survival_01_20"}
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Roof_Pitched_3",
            "Tooltip_Roof_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {sprite = "edit_ddd_RUS_Forest Survival_01_18", northSprite = "edit_ddd_RUS_Forest Survival_01_19"}
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Floor_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_72",
                northSprite = "edit_ddd_RUS_Forest Survival_01_72"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Floor_Generic",
            BuildingMenu.onBuildFloor,
            BuildingMenu.LogFloorRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_73",
                northSprite = "edit_ddd_RUS_Forest Survival_01_73"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.WoodenStairsRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = false
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_68",
                upToLeft01 = "edit_ddd_RUS_Forest Survival_01_68",
                upToLeft02 = "edit_ddd_RUS_Forest Survival_01_67",
                upToLeft03 = "edit_ddd_RUS_Forest Survival_01_66",
                upToRight01 = "edit_ddd_RUS_Forest Survival_01_69",
                upToRight02 = "edit_ddd_RUS_Forest Survival_01_70",
                upToRight03 = "edit_ddd_RUS_Forest Survival_01_71",
                pillar = "edit_ddd_RUS_Forest Survival_01_1",
                pillarNorth = "edit_ddd_RUS_Forest Survival_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Log_Stairs",
            "Tooltip_Staris_Generic",
            BuildingMenu.onBuildStairs,
            BuildingMenu.WoodenStairsRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = false
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_74",
                upToLeft01 = "edit_ddd_RUS_Forest Survival_01_74",
                upToLeft02 = "edit_ddd_RUS_Forest Survival_01_75",
                upToLeft03 = "edit_ddd_RUS_Forest Survival_01_76",
                upToRight01 = "edit_ddd_RUS_Forest Survival_01_79",
                upToRight02 = "edit_ddd_RUS_Forest Survival_01_78",
                upToRight03 = "edit_ddd_RUS_Forest Survival_01_77",
                pillar = "edit_ddd_RUS_Forest Survival_01_1",
                pillarNorth = "edit_ddd_RUS_Forest Survival_01_3"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.BedRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_89",
                sprite2 = "edit_ddd_RUS_Forest Survival_01_88",
                northSprite = "edit_ddd_RUS_Forest Survival_01_90",
                northSprite2 = "edit_ddd_RUS_Forest Survival_01_91"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.BedRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_97",
                sprite2 = "edit_ddd_RUS_Forest Survival_01_96",
                northSprite = "edit_ddd_RUS_Forest Survival_01_98",
                northSprite2 = "edit_ddd_RUS_Forest Survival_01_99"
            }
        ),

        
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.PrimitveBedRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_105",
                sprite2 = "edit_ddd_RUS_Forest Survival_01_104",
                northSprite = "edit_ddd_RUS_Forest Survival_01_106",
                northSprite2 = "edit_ddd_RUS_Forest Survival_01_107"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.PrimitveBedRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_113",
                sprite2 = "edit_ddd_RUS_Forest Survival_01_112",
                northSprite = "edit_ddd_RUS_Forest Survival_01_114",
                northSprite2 = "edit_ddd_RUS_Forest Survival_01_115"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_bedDesc",
            BuildingMenu.onBuildDoubleTileFurniture,
            BuildingMenu.PrimitveBedRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_121",
                sprite2 = "edit_ddd_RUS_Forest Survival_01_120",
                northSprite = "edit_ddd_RUS_Forest Survival_01_122",
                northSprite2 = "edit_ddd_RUS_Forest Survival_01_123"
            }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Chopping_Block",
            "Tooltip_Forest_Furvival_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SmallLogWallRecipe,
            true,
            {
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true
            },
            {
                sprite = "edit_ddd_RUS_Forest Survival_01_56",
                northSprite = "edit_ddd_RUS_Forest Survival_01_56"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
         getText("IGUI_BuildingMenuCat_DaddyDirkie_Others"),
         "edit_ddd_RUS_Forest Survival_01_0",
         getText("IGUI_BuildingMenuSubCat_DaddyDirkie_Forest_Survival"),
         "edit_ddd_RUS_Forest Survival_01_0",
         forestSurvival
    )
end

local function addDaddyDirkieCraftedStoveToMenu()
    local craftedStove = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildStove,
            BuildingMenu.StoveRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true
            },
            {
                sprite = "edit_ddd_RUS_House_Furnace_14",
                northSprite = "edit_ddd_RUS_House_Furnace_6",
                eastSprite = "edit_ddd_RUS_House_Furnace_15",
                southSprite = "edit_ddd_RUS_House_Furnace_7"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Oven",
            BuildingMenu.onBuildStove,
            BuildingMenu.StoveRecipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true
            },
            {
                sprite = "edit_ddd_RUS_House_Furnace_35",
                northSprite = "edit_ddd_RUS_House_Furnace_27",
                eastSprite = "edit_ddd_RUS_House_Furnace_36",
                southSprite = "edit_ddd_RUS_House_Furnace_28"
            }
        ),
    }


    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
         getText("IGUI_BuildingMenuCat_Appliances"),
         "edit_ddd_RUS_House_Furnace_35",
         getText("IGUI_BuildingMenuSubCat_Appliances_Cooking"),
         "edit_ddd_RUS_House_Furnace_35",
         craftedStove
    )
end

local function addDaddyDirkieBathroomAppliancesToMenu()
    local function createBathroomObject(spec)
        return BuildingMenu.createObject(
            "",
            spec.tooltip or "Tooltip_Sink",
            spec.buildFunc,
            spec.recipe,
            true,
            {
                noNeedHammer = true,
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
            },
            spec.sprites
        )
    end

    local bathroomObjectSpecs = {
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "furniture_more_ddd_01_14",
                northSprite = "furniture_more_ddd_01_13",
                eastSprite = "furniture_more_ddd_01_15",
                southSprite = "furniture_more_ddd_01_21"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildSink, 
            recipe = BuildingMenu.SinkRecipe, 
            sprites = { 
                sprite = "furniture_more_ddd_01_23",
                northSprite = "furniture_more_ddd_01_22",
                eastSprite = "furniture_more_ddd_01_29",
                southSprite = "furniture_more_ddd_01_30"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildBathtub, 
            recipe = BuildingMenu.BathtubRecipe, 
            sprites = { 
                sprite = "furniture_more_ddd_01_3",
                sprite2 = "furniture_more_ddd_01_2",
                northSprite = "furniture_more_ddd_01_0",
                northSprite2 = "furniture_more_ddd_01_1"
            }
        },
        {
            buildFunc = BuildingMenu.onBuildBathtub,
            recipe = BuildingMenu.BathtubRecipe,
            sprites = { 
                sprite = "furniture_more_ddd_01_7",
                sprite2 = "furniture_more_ddd_01_6",
                northSprite = "furniture_more_ddd_01_4",
                northSprite2 = "furniture_more_ddd_01_5"
            }
        },
    }

    local bathroomObjects = {}
    for _, spec in ipairs(bathroomObjectSpecs) do
        table.insert(bathroomObjects, createBathroomObject(spec))
    end

    BuildingMenu.addObjectsToCategories(
        "Daddy Dirkie",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "fixtures_sinks_01_21",
        getText("IGUI_BuildingMenuSubCat_Appliances_Bathroom"),
        "fixtures_sinks_01_21",
        bathroomObjects
    )
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addDaddyDirkieDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.highFencesSubCategory then
        addHighFencesToMenu()
    end
    if SandboxVars.BuildingMenu.lowAndRailingFencesSubCategory then
        addLowAndRailingFencesToMenu()
    end
    if SandboxVars.BuildingMenu.dressersAndWardrobesSubCategory then
        addDaddyDirkieBedroomFurnitureToMenu()
    end
    if SandboxVars.BuildingMenu.kitchenCountersSubCategory then
        addKitchenCountersToMenu()
    end
    if SandboxVars.BuildingMenu.cratesSubCategory then
        addCratesToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.seatingFurnitureSubCategory then
        addDaddyDirkieCouchesToMenu()
    end
    if SandboxVars.BuildingMenu.stairsCategory then
        addDaddyDirkieStairsToMenu()
    end
    if SandboxVars.BuildingMenu.daddyDirkieSecretEntrances then
        addDaddyDirkieOthersToMenu()
    end
    if SandboxVars.BuildingMenu.daddyDirkieForestSurvival then
        addDaddyDirkieForestSurvivalToMenu()
    end
    if SandboxVars.BuildingMenu.bathroomAppliances then
        addDaddyDirkieBathroomAppliancesToMenu()
    end
    if SandboxVars.BuildingMenu.cookingAppliances then
        addDaddyDirkieCraftedStoveToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)