require("BuildingMenu04_CategoriesDefinitions")


local BuildingMenu = getBuildingMenuInstance()




local function addPertWallsToMenu()
    local pertFancyWhiteWoodPanelWall = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Wall",
            "Tooltip_Fancy_White_Wood_Panel_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
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
                sprite = "pert_walls_wallpaper_1_80",
                northSprite = "pert_walls_wallpaper_1_81",
                corner = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Door_Frame",
            "Tooltip_Fancy_White_Wood_Panel_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "pert_walls_wallpaper_1_90",
                northSprite = "pert_walls_wallpaper_1_91",
                corner = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Window_Frame",
            "Tooltip_Fancy_White_Wood_Panel_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "pert_walls_wallpaper_1_88",
                northSprite = "pert_walls_wallpaper_1_89",
                corner = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Pillar",
            "Tooltip_Fancy_White_Wood_Panel_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {sprite = "pert_walls_wallpaper_1_83", northSprite = "pert_walls_wallpaper_1_83"}
        )
    }
    BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Walls"),
    "pert_walls_wallpaper_1_80",
    getText("IGUI_BuildingMenuSubCat_Walls_Fancy_White_Wood_Panel"),
    "pert_walls_wallpaper_1_80",
    pertFancyWhiteWoodPanelWall
    )

    local pertFancyBlackWoodPanelWall = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Wall",
            "Tooltip_Fancy_Black_Wood_Panel_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
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
                sprite = "pert_walls_wallpaper_1_84",
                northSprite = "pert_walls_wallpaper_1_85",
                corner = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Door_Frame",
            "Tooltip_Fancy_Black_Wood_Panel_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = {wallType = "doorframe"}
            },
            {
                sprite = "pert_walls_wallpaper_1_94",
                northSprite = "pert_walls_wallpaper_1_95",
                corner = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Window_Frame",
            "Tooltip_Fancy_Black_Wood_Panel_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = {wallType = "windowsframe"}
            },
            {
                sprite = "pert_walls_wallpaper_1_92",
                northSprite = "pert_walls_wallpaper_1_93",
                corner = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Pillar",
            "Tooltip_Fancy_Black_Wood_Panel_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = {wallType = "pillar"}
            },
            {sprite = "pert_walls_wallpaper_1_87", northSprite = "pert_walls_wallpaper_1_87"}
        )
    }
    BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Walls"),
    nil,
    getText("IGUI_BuildingMenuSubCat_Walls_Fancy_Black_Wood_Panel"),
    "pert_walls_wallpaper_1_84",
    pertFancyBlackWoodPanelWall
    )
end
addPertWallsToMenu()



local function addPertDoorsToMenu()
    local pertDoorObjects = {}
    local doorSpriteRanges = {
        {start = 8, stop = 19, baseName = "pert_doors_01_"},
        {start = 24, stop = 31, baseName = "pert_doors_01_"},
        {start = 36, stop = 39, baseName = "pert_doors_01_"},
    }
    for _, range in ipairs(doorSpriteRanges) do
        for i = range.start, range.stop, 4 do
            local spriteBaseName = range.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                pertDoorObjects,
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Generic_Door",
                    "Tooltip_Wooden_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.WoodenDoorRecipe,
                    true,
                    {
                        actionAnim = "Build",
                        noNeedHammer = false,
                        completionSound = "BuildWoodenStructureLarge",
                        modData = {wallType = "doorframe"}
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
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "pert_doors_01_8",
        pertDoorObjects
    )


    pertDoorObjects = {}
    doorSpriteRanges = {
        {start = 0, stop = 23, baseName = "pert_doors_fire_1_"},
    }
    for _, range in ipairs(doorSpriteRanges) do
        for i = range.start, range.stop, 4 do
            local spriteBaseName = range.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                pertDoorObjects,
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Red_Metal_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.MetalDoorRecipe,
                    true,
                    {
                        firstItem = "BlowTorch",
                        secondItem = "WeldingMask",
                        craftingBank = "BlowTorch",
                        actionAnim = "BlowTorch",
                        noNeedHammer = true,
                        completionSound = "BuildMetalStructureMedium",
                        modData = {wallType = "doorframe"}
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

    table.insert(pertDoorObjects, 
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Fire_Door_Frame_West",
            "Tooltip_Door_Trim",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WoodenDoorFrameRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = {wallType = "doorframe"}
            },
            {sprite = "pert_doors_fire_1_24", northSprite = "pert_doors_fire_1_25"}
        )
    )
    table.insert(pertDoorObjects, 
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Fire_Door_Frame_North",
            "Tooltip_Door_Trim",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WoodenDoorFrameRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = {wallType = "doorframe"}
            },
            {sprite = "pert_doors_fire_1_26", northSprite = "pert_doors_fire_1_27"}
        )
    )
    table.insert(pertDoorObjects, 
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Fire_Door_Trim",
            "Tooltip_Door_Trim",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.WoodenDoorTrimRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canBarricade = false,
                isThumpable = false
            },
            {sprite = "pert_doors_fire_1_28", northSprite = "pert_doors_fire_1_29"}
        )
    )

    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_Fire_Doors"),
        "pert_doors_fire_1_0",
        pertDoorObjects
    )


    pertDoorObjects = {}
    doorSpriteRanges = {
        {start = 0, stop = 8, baseName = "pert_doors_01_"},
        {start = 20, stop = 23, baseName = "pert_doors_01_"},
    }
    for _, range in ipairs(doorSpriteRanges) do
        for i = range.start, range.stop, 4 do
            local spriteBaseName = range.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                pertDoorObjects,
                BuildingMenu.createObject(
                    "Tooltip_BuildingMenuObj_Generic_Door",
                    "Tooltip_White_Window_Metal_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.WoodenWindowDoorRecipe,
                    true,
                    {
                        actionAnim = "Build",
                        noNeedHammer = false,
                        completionSound = "BuildWoodenStructureLarge",
                        modData = {wallType = "doorframe"}
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
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_Glass_Doors"),
        "pert_doors_01_0",
        pertDoorObjects
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

    local pertGarageDoorsObjects = {}
    local garageDoorSpriteRanges = {0, 16, 32, 48}

    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(pertGarageDoorsObjects, create3TileGarageDoor("pert_more_garage_doors_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
        "pert_more_garage_doors_0",
        pertGarageDoorsObjects
    )

    pertGarageDoorsObjects = {}
    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(pertGarageDoorsObjects, create4TileGarageDoor("pert_more_garage_doors_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
        "pert_more_garage_doors_0",
        pertGarageDoorsObjects
    )
end
addPertDoorsToMenu()


local function addPertCountersToMenu()
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

    local pertContainers = {}
    local dataCounters = {3, 2, 19, 18, 59, 58, 83, 82}


    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(pertContainers, createCounterObject("pert_bar_01_", spriteNumber))
    end


    local additionalContainers = {
        {sprite = "pert_bar_01_29", northSprite = "pert_bar_01_37"},
        {sprite = "pert_bar_01_30", northSprite = "pert_bar_01_38"},
        {sprite = "pert_bar_01_31", northSprite = "pert_bar_01_39"},
        {sprite = "pert_bar_01_64", northSprite = "pert_bar_01_72"},
        {sprite = "pert_bar_01_65", northSprite = "pert_bar_01_73"},
        {sprite = "pert_bar_01_66", northSprite = "pert_bar_01_74"},
        {sprite = "pert_bar_01_77", northSprite = "pert_bar_01_69"},
        {sprite = "pert_bar_01_78", northSprite = "pert_bar_01_70"},
        {sprite = "pert_bar_01_79", northSprite = "pert_bar_01_71"}
    }

    for _, spriteData in ipairs(additionalContainers) do
        table.insert(pertContainers, BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            spriteData
        ))
    end

    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Containers"),
        "pert_bar_01_3",
        getText("IGUI_BuildingMenuSubCat_Containers_Bar"),
        "pert_bar_01_3",
        pertContainers
    )

end
addPertCountersToMenu()


local pertFilingCabinets = {
    BuildingMenu.createObject(
        "",
        "Tooltip_Counter_Generic",
        BuildingMenu.onBuildWoodenContainer,
        BuildingMenu.MetalCounterRecipe,
        true,
        {
            firstItem = "BlowTorch",
            secondItem = "WeldingMask",
            craftingBank = "BlowTorch",
            actionAnim = "BlowTorchMid",
            noNeedHammer = true,
            completionSound = "BuildMetalStructureMedium",
            containerType = "filingcabinet",
            canBeAlwaysPlaced = true,
            blockAllTheSquare = true,
            canBeLockedByPadlock = true
        },
        {
            sprite = "pert_cyberdrive_systems_1_22",
            northSprite = "pert_cyberdrive_systems_1_23",
            eastSprite = "pert_cyberdrive_systems_1_30",
            southSprite = "pert_cyberdrive_systems_1_31"
        }
    ),
}
BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Containers"),
    nil,
    getText("IGUI_BuildingMenuSubCat_Containers_Filing_Cabinets"),
    "pert_cyberdrive_systems_1_22",
    pertFilingCabinets
)


local function createDoubleTileFurnitureObject(tooltip, recipe, sprite, sprite2, northSprite, northSprite2)
    return BuildingMenu.createObject(
        "",
        tooltip,
        BuildingMenu.onBuildDoubleTileFurniture,
        recipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
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

local function addpertLargeTablesToMenu()

    local pertSmallTables = {
        BuildingMenu.createObject(
            "",
            "Tooltip_craft_smallTableDesc",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.LargeFurnitureRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge"
            },
            {sprite = "pert_re-phoenix_4_53", northSprite = "pert_re-phoenix_4_52"}
        )
    }

    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Furniture"),
        "pert_re-phoenix_4_53",
        getText("IGUI_BuildingMenuSubCat_Furniture_Small_Tables"),
        "pert_re-phoenix_4_53",
        pertSmallTables
    )

    local tooltip = "Tooltip_craft_largeTableDesc"
    local pertLargeTables = {
        createDoubleTileFurnitureObject(
            tooltip,
            BuildingMenu.LargeGlassFurnitureRecipe,
            "pert_re-phoenix_4_49",
            "pert_re-phoenix_4_48",
            "pert_re-phoenix_4_50",
            "pert_re-phoenix_4_51"
        ),
    }

    BuildingMenu.addObjectsToCategories(
        "[Pert] ".. getText("IGUI_BuildingMenuCat_Furniture"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Furniture_Large_Tables"),
        "pert_re-phoenix_4_49",
        pertLargeTables
    )
end
addpertLargeTablesToMenu()


local pertDecorationsRoadWork = {
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_White_Line",
        "Tooltip_Road_Line_Generic",
        BuildingMenu.onBuildSimpleFurniture,
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
            sprite = "pert_re-phoenix_2_16",
            northSprite = "pert_re-phoenix_2_17",
            eastSprite = "pert_re-phoenix_2_18",
            southSprite = "pert_re-phoenix_2_19"
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_White_Line",
        "Tooltip_Road_Line_Generic",
        BuildingMenu.onBuildSimpleFurniture,
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
            sprite = "pert_re-phoenix_2_32",
            northSprite = "pert_re-phoenix_2_30",
            eastSprite = "pert_re-phoenix_2_46",
            southSprite = "pert_re-phoenix_2_48"
        }
    ),
    
}
BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Road_Work"),
    "pert_re-phoenix_2_16",
    getText("IGUI_BuildingMenuSubCat_Road_Work_Painted_White_Line"),
    "pert_re-phoenix_2_16",
    pertDecorationsRoadWork
)


local pertDecorationsSigns = {
    BuildingMenu.createObject(
        "",
        "Tooltip_Signs_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
            renderFloorHelper = true,
        },
        {
            sprite = "pert_re-phoenix_3_50",
            northSprite = "pert_re-phoenix_3_51"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Signs_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
            renderFloorHelper = true,
        },
        {
            sprite = "pert_re-phoenix_3_56",
            northSprite = "pert_re-phoenix_3_57"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Signs_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
            renderFloorHelper = true,
        },
        {
            sprite = "pert_re-phoenix_3_58",
            northSprite = "pert_re-phoenix_3_59"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Signs_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
            renderFloorHelper = true,
        },
        {
            sprite = "pert_re-phoenix_3_64",
            northSprite = "pert_re-phoenix_3_65"
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Signs_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
            renderFloorHelper = true,
        },
        {
            sprite = "pert_re-phoenix_3_66",
            northSprite = "pert_re-phoenix_3_67"
        }
    ),
}
BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Decorations"),
    "pert_re-phoenix_3_50",
    getText("IGUI_BuildingMenuSubCat_Decorations_Signs"),
    "pert_re-phoenix_3_50",
    pertDecorationsSigns
)


local pertDecorationsHalloween = {
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_Hedge",
        "Tooltip_Hedges_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.FlowerBedRecipe,
        true,
        {
            actionAnim = "DigShovel",
            noNeedHammer = true,
            craftingBank = "Shoveling",
            completionSound = "DropSoilFromGravelBag",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            isBush = true,
            solid = false,
            moveWithWind = true
        },
        {sprite = "pert_halloween_01_1", northSprite = "pert_halloween_01_0"}
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_Pumpkin",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
        },
        {
            sprite = "pert_halloween_01_9",
            northSprite = "pert_halloween_01_8"
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_Pumpkin",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "Build",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureLarge",
            needToBeAgainstWall = false,
            blockAllTheSquare = false,
            canPassThrough = true,
            canBarricade = false,
            isCorner = true,
            solid = false,
        },
        {
            sprite = "pert_halloween_01_11",
            northSprite = "pert_halloween_01_10"
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_WitchHat",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_01_36",
            northSprite = "pert_halloween_01_37",
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_WitchHat",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_01_38",
            northSprite = "pert_halloween_01_39",
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_DeadTree",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_01_16",
            northSprite = "pert_halloween_01_16",
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_DeadTree",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_01_17",
            northSprite = "pert_halloween_01_17",
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_BloodFlamingo",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_01_25",
            northSprite = "pert_halloween_01_24",
        }
    ),
    BuildingMenu.createObject(
        "",
        "Tooltip_Roadway_Generic",
        BuildingMenu.onBuildSimpleFurniture,
        BuildingMenu.SignRecipe,
        true,
        {
            actionAnim = "BuildLow",
            noNeedHammer = false,
            completionSound = "BuildWoodenStructureSmall",
            isCorner = true
        },
        {
            sprite = "pert_halloween_02_21",
            northSprite = "pert_halloween_02_21",
        }
    ),
    BuildingMenu.createObject(
        "Tooltip_BuildingMenuObj_Pert_Halloween_Grave",
        "Tooltip_Grave_Generic",
        BuildingMenu.onBuildWoodenContainer,
        BuildingMenu.GraveRecipe,
        true,
        {
            actionAnim = "DigShovel",
            noNeedHammer = true,
            craftingBank = "Shoveling",
            completionSound = "DropSoilFromGravelBag",
            renderFloorHelper = false,
            canBeAlwaysPlaced = true,
            blockAllTheSquare = true,
            canBeLockedByPadlock = true
        },
        {
            sprite = "pert_halloween_01_32",
            northSprite = "pert_halloween_01_32"
        }
    ),
}
BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Decorations"),
    "pert_halloween_01_9",
    getText("IGUI_BuildingMenuSubCat_Pert_Decorations_Halloween"),
    "pert_halloween_01_9",
    pertDecorationsHalloween
)


local pertFridgesObjects = {
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
            sprite = "pert_re-phoenix_3_47",
            sprite2 = "pert_re-phoenix_3_46",
            northSprite1 = "pert_re-phoenix_3_44",
            northSprite2 = "pert_re-phoenix_3_45"
        }
    )
}

BuildingMenu.addObjectsToCategories(
    "[Pert] ".. getText("IGUI_BuildingMenuCat_Appliances"),
    "pert_re-phoenix_3_47",
    getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
    "pert_re-phoenix_3_47",
    pertFridgesObjects
)