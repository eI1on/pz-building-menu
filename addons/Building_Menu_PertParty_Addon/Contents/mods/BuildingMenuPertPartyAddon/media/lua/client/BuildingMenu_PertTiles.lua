---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addPertWallsToMenu()
    local pertFancyWhiteWoodPanelWall = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Wall",
            "Tooltip_Fancy_White_Wood_Panel_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_walls_wallpaper_1_80",
                northSprite = "pert_walls_wallpaper_1_81",
                corner = "pert_walls_wallpaper_1_82",
                pillar = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Door_Frame",
            "Tooltip_Fancy_White_Wood_Panel_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_walls_wallpaper_1_90",
                northSprite = "pert_walls_wallpaper_1_91",
                pillar = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Window_Frame",
            "Tooltip_Fancy_White_Wood_Panel_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "pert_walls_wallpaper_1_88",
                northSprite = "pert_walls_wallpaper_1_89",
                pillar = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Corner_Wall",
            "Tooltip_Fancy_White_Wood_Panel_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                corner = "pert_walls_wallpaper_1_82",
                pillar = "pert_walls_wallpaper_1_83"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_White_Wood_Panel_Pillar",
            "Tooltip_Fancy_White_Wood_Panel_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.WhiteSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "pert_walls_wallpaper_1_83" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Walls"),
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
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_walls_wallpaper_1_84",
                northSprite = "pert_walls_wallpaper_1_85",
                corner = "pert_walls_wallpaper_1_86",
                pillar = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Door_Frame",
            "Tooltip_Fancy_Black_Wood_Panel_Door_Frame",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_walls_wallpaper_1_94",
                northSprite = "pert_walls_wallpaper_1_95",
                pillar = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Window_Frame",
            "Tooltip_Fancy_Black_Wood_Panel_Window_Frame",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "pert_walls_wallpaper_1_92",
                northSprite = "pert_walls_wallpaper_1_93",
                pillar = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Corner_Wall",
            "Tooltip_Fancy_Black_Wood_Panel_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackBigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                corner = "pert_walls_wallpaper_1_86",
                pillar = "pert_walls_wallpaper_1_87"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Fancy_Black_Wood_Panel_Pillar",
            "Tooltip_Fancy_Black_Wood_Panel_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.BlackSmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "pert_walls_wallpaper_1_87" }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Walls"),
        "pert_walls_wallpaper_1_80",
        getText("IGUI_BuildingMenuSubCat_Walls_Fancy_Black_Wood_Panel"),
        "pert_walls_wallpaper_1_84",
        pertFancyBlackWoodPanelWall
    )
end

local function addPertDoorsToMenu()
    local pertDoorObjects = {}
    local doorSpriteRanges = {
        { start = 8,   stop = 19,  baseName = "pert_doors_01_",          recipe = BuildingMenu.WoodenDoorRecipe },
        { start = 24,  stop = 31,  baseName = "pert_doors_01_",          recipe = BuildingMenu.WoodenDoorRecipe },
        { start = 36,  stop = 39,  baseName = "pert_doors_01_",          recipe = BuildingMenu.WoodenDoorRecipe },
        { start = 104, stop = 127, baseName = "pert_more_dbl_doors_02_", recipe = BuildingMenu.WoodenDoubleGlassDoorRecipe },
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
                    range.recipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        canBarricade = true,
                        modData = { wallType = "doorframe" }
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "pert_doors_01_8",
        pertDoorObjects
    )


    pertDoorObjects = {}
    doorSpriteRanges = {
        { start = 0, stop = 23, baseName = "pert_doors_fire_1_" },
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
                        completionSound = "BuildMetalStructureMedium",
                        canBarricade = true,
                        modData = { wallType = "doorframe" }
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
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            { sprite = "pert_doors_fire_1_24", northSprite = "pert_doors_fire_1_25" }
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
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            { sprite = "pert_doors_fire_1_26", northSprite = "pert_doors_fire_1_27" }
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
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                renderFloorHelper = true,
                canBarricade = false,
                isThumpable = false
            },
            { sprite = "pert_doors_fire_1_28", northSprite = "pert_doors_fire_1_29" }
        )
    )

    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_Fire_Doors"),
        "pert_doors_fire_1_0",
        pertDoorObjects
    )


    pertDoorObjects = {}
    doorSpriteRanges = {
        { start = 0,  stop = 8,  baseName = "pert_doors_01_" },
        { start = 20, stop = 23, baseName = "pert_doors_01_" },
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
                    BuildingMenu.WoodenDoubleGlassDoorRecipe,
                    true,
                    {
                        completionSound = "BuildWoodenStructureLarge",
                        canBarricade = true,
                        modData = { wallType = "doorframe" }
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_Glass_Doors"),
        "pert_doors_01_0",
        pertDoorObjects
    )
end

local function addHighFencesToMenu()
    local highFences = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.HighConcretePoleFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "pert_fencing_01_12",
                sprite2 = "pert_fencing_01_8",
                northSprite = "pert_fencing_01_13",
                northSprite2 = "pert_fencing_01_9",
                corner = "pert_fencing_01_11",
                pillar = "pert_fencing_01_10"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcretePoleFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                corner = "pert_fencing_01_11",
                pillar = "pert_fencing_01_10"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFencePostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_fencing_01_10" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "pert_fencing_01_4",
                sprite2 = "pert_fencing_01_0",
                northSprite = "pert_fencing_01_5",
                northSprite2 = "pert_fencing_01_1",
                corner = "pert_fencing_01_3",
                pillar = "pert_fencing_01_2"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                corner = "pert_fencing_01_3",
                pillar = "pert_fencing_01_2"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_fencing_01_2" }
        ),

        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "pert_fencing_01_28",
                sprite2 = "pert_fencing_01_24",
                northSprite = "pert_fencing_01_29",
                northSprite2 = "pert_fencing_01_25",
                corner = "pert_fencing_01_27",
                pillar = "pert_fencing_01_26"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                corner = "pert_fencing_01_27",
                pillar = "pert_fencing_01_26"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_fencing_01_26" }
        ),



        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.HighConcretePoleFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "pert_fencing_01_52",
                sprite2 = "pert_fencing_01_48",
                northSprite = "pert_fencing_01_53",
                northSprite2 = "pert_fencing_01_49",
                corner = "pert_fencing_01_51",
                pillar = "pert_fencing_01_50"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcretePoleFenceRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                corner = "pert_fencing_01_51",
                pillar = "pert_fencing_01_50"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_and_Wire_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteWireFencePostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_fencing_01_50" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildHighDoubleFence,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                blockAllTheSquare = false,
                hoppable = false
            },
            {
                sprite = "pert_fencing_01_44",
                sprite2 = "pert_fencing_01_40",
                northSprite = "pert_fencing_01_45",
                northSprite2 = "pert_fencing_01_41",
                corner = "pert_fencing_01_43",
                pillar = "pert_fencing_01_42"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Corner",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            {
                corner = "pert_fencing_01_43",
                pillar = "pert_fencing_01_42"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Cinderblock_Fence_Post",
            "Tooltip_High_Metal_Fence_Generic",
            BuildingMenu.onBuildWall,
            BuildingMenu.HighConcreteFencePostRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_fencing_01_42" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Fencing"),
        "pert_fencing_01_12",
        getText("IGUI_BuildingMenuSubCat_Fencing_Fencing_High"),
        "pert_fencing_01_12",
        highFences
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

    local pertGarageDoorsObjects = {}
    local garageDoorSpriteRanges = { 0, 16, 32, 48 }

    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(pertGarageDoorsObjects, create3TileGarageDoor("pert_more_garage_doors_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
        "pert_more_garage_doors_0",
        pertGarageDoorsObjects
    )

    pertGarageDoorsObjects = {}
    for _, startNumber in ipairs(garageDoorSpriteRanges) do
        table.insert(pertGarageDoorsObjects, create4TileGarageDoor("pert_more_garage_doors_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Doors"),
        "pert_doors_01_8",
        getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
        "pert_more_garage_doors_0",
        pertGarageDoorsObjects
    )
end

local function addPertCountersToMenu()
    local function createCounterObject(spriteBaseName, spriteNumber)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
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
    local dataCounters = { 3, 2, 19, 18, 59, 58, 83, 82 }


    for _, spriteNumber in ipairs(dataCounters) do
        table.insert(pertContainers, createCounterObject("pert_bar_01_", spriteNumber))
    end


    local additionalContainers = {
        { sprite = "pert_bar_01_29", northSprite = "pert_bar_01_37" },
        { sprite = "pert_bar_01_30", northSprite = "pert_bar_01_38" },
        { sprite = "pert_bar_01_31", northSprite = "pert_bar_01_39" },
        { sprite = "pert_bar_01_64", northSprite = "pert_bar_01_72" },
        { sprite = "pert_bar_01_65", northSprite = "pert_bar_01_73" },
        { sprite = "pert_bar_01_66", northSprite = "pert_bar_01_74" },
        { sprite = "pert_bar_01_77", northSprite = "pert_bar_01_69" },
        { sprite = "pert_bar_01_78", northSprite = "pert_bar_01_70" },
        { sprite = "pert_bar_01_79", northSprite = "pert_bar_01_71" }
    }

    for _, spriteData in ipairs(additionalContainers) do
        table.insert(pertContainers, BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true
            },
            spriteData
        ))
    end

    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Containers"),
        "pert_bar_01_3",
        getText("IGUI_BuildingMenuSubCat_Containers_Bar"),
        "pert_bar_01_3",
        pertContainers
    )
end

local function addMetalContainersToMenu()
    local pertFilingCabinets = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Counter_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalCounterRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Containers"),
        "pert_bar_01_3",
        getText("IGUI_BuildingMenuSubCat_Containers_Filing_Cabinets"),
        "pert_cyberdrive_systems_1_22",
        pertFilingCabinets
    )
end

local function createDoubleTileFurnitureObject(tooltip, recipe, sprite, sprite2, northSprite, northSprite2)
    return BuildingMenu.createObject(
        "",
        tooltip,
        BuildingMenu.onBuildDoubleTileFurniture,
        recipe,
        true,
        {
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
                completionSound = "BuildWoodenStructureLarge"
            },
            { sprite = "pert_re-phoenix_4_53", northSprite = "pert_re-phoenix_4_52" }
        )
    }

    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Furniture"),
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Furniture"),
        "pert_re-phoenix_4_53",
        getText("IGUI_BuildingMenuSubCat_Furniture_Large_Tables"),
        "pert_re-phoenix_4_49",
        pertLargeTables
    )
end

local function addRoadworkPaintedRoadMarkingsToMenu()
    local pertDecorationsRoadWork = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Line",
            "Tooltip_Road_Line_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.PaintWhite,
            true,
            {
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Road_Work"),
        "pert_re-phoenix_2_16",
        getText("IGUI_BuildingMenuSubCat_Road_Work_Painted_White_Line"),
        "pert_re-phoenix_2_16",
        pertDecorationsRoadWork
    )
end

local function addPostersAndSignsToMenu()
    local pertDecorationsSigns = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Signs_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
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
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Decorations"),
        "pert_re-phoenix_3_50",
        getText("IGUI_BuildingMenuSubCat_Decorations_Signs"),
        "pert_re-phoenix_3_50",
        pertDecorationsSigns
    )
end

local function addHalloweenDecorationsToMenu()
    local pertDecorationsHalloween = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Halloween_Hedge",
            "Tooltip_Hedges_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FlowerBedRecipe,
            true,
            {
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
            { sprite = "pert_halloween_01_1", northSprite = "pert_halloween_01_0" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Halloween_Pumpkin",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
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
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true
            },
            {
                sprite = "pert_halloween_01_16",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Halloween_DeadTree",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true
            },
            {
                sprite = "pert_halloween_01_17",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Halloween_BloodFlamingo",
            "Tooltip_Roadway_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
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
                completionSound = "BuildWoodenStructureSmall",
                isCorner = true
            },
            {
                sprite = "pert_halloween_02_21",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Pert_Halloween_Grave",
            "Tooltip_Grave_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.GraveRecipe,
            true,
            {
                completionSound = "DropSoilFromGravelBag",
                renderFloorHelper = false,
                blockAllTheSquare = true,
                canBeLockedByPadlock = true
            },
            {
                sprite = "pert_halloween_01_32"
            }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Festive"),
        "pert_halloween_01_9",
        getText("IGUI_BuildingMenuSubCat_Pert_Decorations_Halloween"),
        "pert_halloween_01_9",
        pertDecorationsHalloween
    )
end

local function addChristmasDecorationsToMenu()
    local pertGingerBreadWalls = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Ginger_Bread_Window",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "pert_Christmas_02_8",
                northSprite = "pert_Christmas_02_9",
                eastSprite = "pert_Christmas_02_10",
                southSprite = "pert_Christmas_02_11"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Ginger_Bread_Window",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.FloorRugRecipe,
            true,
            {
                needToBeAgainstWall = false,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
                isThumpable = true,
                isCorner = true
            },
            {
                sprite = "pert_Christmas_02_12",
                northSprite = "pert_Christmas_02_13",
                eastSprite = "pert_Christmas_02_14",
                southSprite = "pert_Christmas_02_15"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Wall",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_Christmas_01_0",
                northSprite = "pert_Christmas_01_1",
                pillar = "pert_Christmas_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Wall_Corner",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_Christmas_01_2",
                pillar = "pert_Christmas_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Door_Frame",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_Christmas_01_10",
                northSprite = "pert_Christmas_01_11",
                pillar = "pert_Christmas_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Simple_Window_Frame",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "pert_Christmas_01_8",
                northSprite = "pert_Christmas_01_9",
                pillar = "pert_Christmas_01_3"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Pillar",
            "Tooltip_Old_Wood_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "pert_Christmas_01_3" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Wall",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_Christmas_01_4",
                northSprite = "pert_Christmas_01_5",
                pillar = "pert_Christmas_01_7"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Wall_Corner",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            {
                sprite = "pert_Christmas_01_6",
                pillar = "pert_Christmas_01_7"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Door_Frame",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildDoorFrame,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_Christmas_01_14",
                northSprite = "pert_Christmas_01_15",
                pillar = "pert_Christmas_01_7"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Simple_Window_Frame",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                hoppable = true,
                modData = { wallType = "windowsframe" }
            },
            {
                sprite = "pert_Christmas_01_12",
                northSprite = "pert_Christmas_01_13",
                pillar = "pert_Christmas_01_7"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Pillar",
            "Tooltip_Old_Wood_Pillar",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canPassThrough = true,
                canBarricade = false,
                isCorner = true,
                modData = { wallType = "pillar" }
            },
            { sprite = "pert_Christmas_01_7" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Ginger_Bread_Window",
            BuildingMenu.onBuildWindow,
            BuildingMenu.WindowRecipe,
            true,
            { completionSound = "BuildWoodenStructureLarge" },
            { sprite = "pert_Christmas_01_16", northSprite = "pert_Christmas_01_17" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Door",
            "Tooltip_Ginger_Bread_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.WoodenDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_Christmas_01_56",
                northSprite = "pert_Christmas_01_57",
                openSprite = "pert_Christmas_01_58",
                openNorthSprite = "pert_Christmas_01_59"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Door",
            "Tooltip_Ginger_Bread_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.WoodenDoorRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                canBarricade = true,
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "pert_Christmas_01_60",
                northSprite = "pert_Christmas_01_61",
                openSprite = "pert_Christmas_01_62",
                openNorthSprite = "pert_Christmas_01_63"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_1",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_24", northSprite = "pert_Christmas_01_37" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_2",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_25", northSprite = "pert_Christmas_01_36" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_3",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_26", northSprite = "pert_Christmas_01_35" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_4",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_32", northSprite = "pert_Christmas_01_29" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_5",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_33", northSprite = "pert_Christmas_01_28" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_Slope_Wall_6",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_34", northSprite = "pert_Christmas_01_27" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_End_Small",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.SmallWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_39", northSprite = "pert_Christmas_01_31" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_End_Medium",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_38", northSprite = "pert_Christmas_01_30" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Ginger_Bread_Roof_End_Big",
            "Tooltip_Ginger_Bread_Wall",
            BuildingMenu.onBuildWall,
            BuildingMenu.BigWoodWallRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = false,
                modData = { wallType = "wall" }
            },
            { sprite = "pert_Christmas_01_40", northSprite = "pert_Christmas_01_41" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Red_Slide_Stairs",
            "Tooltip_Red_Slide_Stairs",
            BuildingMenu.onBuildStairs,
            BuildingMenu.MetalStairsRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                isThumpable = false
            },
            {
                sprite = "pert_Christmas_01_53",
                upToLeft01 = "pert_Christmas_01_53",
                upToLeft02 = "pert_Christmas_01_52",
                upToLeft03 = "pert_Christmas_01_51",
                upToRight01 = "pert_Christmas_01_48",
                upToRight02 = "pert_Christmas_01_49",
                upToRight03 = "pert_Christmas_01_50",
                pillar = "pert_Christmas_01_94",
                pillarNorth = "pert_Christmas_01_95"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Railing_Post",
            "Tooltip_Wooden_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_Christmas_01_91" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Railing",
            "Tooltip_Wooden_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "pert_Christmas_01_88",
                northSprite = "pert_Christmas_01_89",
                pillar = "pert_Christmas_01_91"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Railing",
            "Tooltip_Wooden_Railing",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                isThumpable = true,
                hoppable = true,
                blockAllTheSquare = false
            },
            {
                sprite = "pert_Christmas_01_92",
                northSprite = "pert_Christmas_01_93",
                pillar = "pert_Christmas_01_91"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Wooden_Railing_Corner",
            "Tooltip_Wooden_Railing_Post",
            BuildingMenu.onBuildWall,
            BuildingMenu.WoodenFenceRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
                canBeAlwaysPlaced = true,
                canPassThrough = true,
                canBarricade = false,
                isCorner = true
            },
            { sprite = "pert_Christmas_01_90" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Festive"),
        "pert_halloween_01_9",
        getText("IGUI_BuildingMenuSubCat_Pert_Structures_Christmas"),
        "pert_Christmas_01_4",
        pertGingerBreadWalls
    )

    local gingerBreadDetailing = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canPassThrough = true,
                canBarricade = false,
            },
            { sprite = "pert_Christmas_01_66", northSprite = "pert_Christmas_01_67" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_68", northSprite = "pert_Christmas_01_69" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_70" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_71" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_64", northSprite = "pert_Christmas_01_65" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            {
                sprite = "pert_Christmas_01_96",
                northSprite = "pert_Christmas_01_97",
                eastSprite = "pert_Christmas_01_98",
                southSprite = "pert_Christmas_01_99"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_42", northSprite = "pert_Christmas_01_43" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_104" }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Icing",
            "Tooltip_Icing_Detailing",
            BuildingMenu.onBuildWallOverlay,
            BuildingMenu.WallDecorationRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                needToBeAgainstWall = true,
            },
            { sprite = "pert_Christmas_01_105" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Festive"),
        "pert_halloween_01_9",
        getText("IGUI_BuildingMenuSubCat_Pert_Detailing_Christmas"),
        "pert_Christmas_01_42",
        gingerBreadDetailing
    )

    local christmasDecorations = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_73",
                northSprite = "pert_Christmas_01_74",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_72",
                northSprite = "pert_Christmas_01_75",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_76",
                northSprite = "pert_Christmas_01_77",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_78",
                northSprite = "pert_Christmas_01_79",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_83",
                northSprite = "pert_Christmas_01_84",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Gingerbread_Tree",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_82",
                northSprite = "pert_Christmas_01_85",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Lighting_Christmas",
            BuildingMenu.onBuildGeneratorPoweredLight,
            BuildingMenu.LightPostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canBeAlwaysPlaced = false,
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_94",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Lighting_Christmas",
            BuildingMenu.onBuildGeneratorPoweredLight,
            BuildingMenu.LightPostRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                needToBeAgainstWall = true,
                blockAllTheSquare = false,
                canBeAlwaysPlaced = false,
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_95",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_80"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_81"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Snowman",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_100",
                northSprite = "pert_Christmas_01_103",
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_Snowman",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_101",
                northSprite = "pert_Christmas_01_102",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.MetalCounterSmallRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                renderFloorHelper = false,
                isCorner = true,
                canBeLockedByPadlock = false
            },
            {
                sprite = "pert_Christmas_01_44",
                northSprite = "pert_Christmas_01_45",
                eastSprite = "pert_Christmas_01_46",
                southSprite = "pert_Christmas_01_47"
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.SignRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureLarge",
                isCorner = true
            },
            {
                sprite = "pert_Christmas_01_108",
                northSprite = "pert_Christmas_01_110",
                eastSprite = "pert_Christmas_01_111",
            }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
            },
            { sprite = "pert_Christmas_01_86" }
        ),
        BuildingMenu.createObject(
            "",
            "Tooltip_Christmas_Decoration_Generic",
            BuildingMenu.onBuildWoodenContainer,
            BuildingMenu.CounterRecipe,
            true,
            {
                completionSound = "BuildWoodenStructureSmall",
            },
            { sprite = "pert_Christmas_01_87" }
        ),
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Festive"),
        "pert_halloween_01_9",
        getText("IGUI_BuildingMenuSubCat_Pert_Decorations_Christmas"),
        "pert_Christmas_01_81",
        christmasDecorations
    )
end

local function addFridgeAppliancesToMenu()
    local pertFridgesObjects = {
        BuildingMenu.createObject(
            "",
            "Tooltip_Fridges",
            BuildingMenu.onBuildPopsicleFridge,
            BuildingMenu.Fridge2TileRecipe,
            true,
            {
                completionSound = "BuildMetalStructureMedium",
                buildMid = true,
                renderFloorHelper = false,
                dismantable = true
            },
            {
                sprite = "pert_re-phoenix_3_47",
                sprite2 = "pert_re-phoenix_3_46",
                northSprite = "pert_re-phoenix_3_44",
                northSprite2 = "pert_re-phoenix_3_45"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "Perts Party",
        getText("IGUI_BuildingMenuCat_Appliances"),
        "pert_re-phoenix_3_47",
        getText("IGUI_BuildingMenuSubCat_Appliances_Fridges"),
        "pert_re-phoenix_3_47",
        pertFridgesObjects
    )
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.woodWallsSubCategory then
        addPertWallsToMenu()
    end
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addPertDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.highFencesSubCategory then
        addHighFencesToMenu()
    end
    if SandboxVars.BuildingMenu.commercialCountersSubCategory then
        addPertCountersToMenu()
    end
    if SandboxVars.BuildingMenu.metalContainersSubCategory then
        addMetalContainersToMenu()
    end
    if SandboxVars.BuildingMenu.tablesSubCategory then
        addpertLargeTablesToMenu()
    end
    if SandboxVars.BuildingMenu.roadworkPaintedRoadMarkingsSubCategory then
        addRoadworkPaintedRoadMarkingsToMenu()
    end
    if SandboxVars.BuildingMenu.postersAndSignsSubCategory then
        addPostersAndSignsToMenu()
    end
    if SandboxVars.BuildingMenu.pertsPartyChristmas then
        addChristmasDecorationsToMenu()
    end
    if SandboxVars.BuildingMenu.pertsPartyHalloween then
        addHalloweenDecorationsToMenu()
    end
    if SandboxVars.BuildingMenu.fridgeAppliances then
        addFridgeAppliancesToMenu()
    end
end
Events.OnInitializeBuildingMenuObjects.Add(addCategoriesToBuildingMenu)
