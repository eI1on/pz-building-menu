---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")


local function addExtraNoisesNewburbsFlagsToMenu()
    local function createFlag(spriteIndex)
        return BuildingMenu.createObject(
            "",
            "Tooltip_Flags",
            BuildingMenu.onBuildSimpleFurniture,
            BuildingMenu.MannequinRecipe,
            true,
            {
                firstItem = "BlowTorch",
                secondItem = "WeldingMask",
                craftingBank = "BlowTorch",
                actionAnim = "BlowTorch",
                noNeedHammer = true,
                completionSound = "BuildMetalStructureWallFrame",
                renderFloorHelper = false,
                blockAllTheSquare = false,
                isCorner = true,
                dismantable = true,
            },
            {
                sprite = "en_newburbs_details_01_" .. spriteIndex,
                northSprite = "en_newburbs_details_01_" .. spriteIndex + 1,
                eastSprite = "en_newburbs_details_01_" .. spriteIndex + 3,
                southSprite = "en_newburbs_details_01_" .. spriteIndex + 2,
            }
        )
    end


    local flags = {}
    local startIndex = 16

    for i = 0, 31, 4 do
        table.insert(flags, createFlag(startIndex + i))
    end

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_ExtraNoiseNewburbs_Others"),
        "en_newburbs_details_01_16",
        getText("IGUI_BuildingMenuSubCat_ExtraNoiseNewburbs_Others_Flags"),
        "en_newburbs_details_01_16",
        flags
    )
end

local function addDoorsToMenu()
    local extraNoiseDoorObjects = {}
    local doorOptionsTable = {
        {start = 0, stop = 71, baseName = "en_newburbs_doors_01_"},
    }
    for _, doorOptions in ipairs(doorOptionsTable) do
        for i = doorOptions.start, doorOptions.stop, 4 do
            local spriteBaseName = doorOptions.baseName
            local sprite = spriteBaseName .. i
            local northSprite = spriteBaseName .. (i + 1)
            local openSprite = spriteBaseName .. (i + 2)
            local openNorthSprite = spriteBaseName .. (i + 3)

            table.insert(
                extraNoiseDoorObjects,
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Wooden_Door",
                    BuildingMenu.onBuildDoor,
                    BuildingMenu.WoodenDoorRecipe,
                    true,
                    {
                        actionAnim = "Build",
                        noNeedHammer = false,
                        completionSound = "BuildWoodenStructureLarge",
                        canBarricade = true,
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
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Doors"),
        "en_newburbs_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Wooden_Doors"),
        "en_newburbs_doors_01_0",
        extraNoiseDoorObjects
    )

    local slidingDoors = {
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Sliding_Glass_Door_Side_Wall",
            "Tooltip_Black_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                modData = { wallType = "wall" }
            },
            {
                sprite = "en_newburbs_doors_01_79",
                northSprite = "en_newburbs_doors_01_94"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Sliding_Glass_Door_Side_Wall",
            "Tooltip_Black_Frame_Glass_Wall",
            BuildingMenu.onBuildWindowWall,
            BuildingMenu.WhiteBigWoodWallRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = true,
                modData = { wallType = "wall" }
            },
            {
                sprite = "en_newburbs_doors_01_87",
                northSprite = "en_newburbs_doors_01_102"
            }
        ),
        BuildingMenu.createObject(
            "Tooltip_BuildingMenuObj_White_Sliding_Glass_Door",
            "Tooltip_White_Sliding_Glass_Door",
            BuildingMenu.onBuildDoor,
            BuildingMenu.WoodenDoubleGlassDoorRecipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                dontNeedFrame = true,
                canBarricade = false,
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = "doorframe" }
            },
            {
                sprite = "en_newburbs_doors_01_78",
                northSprite = "en_newburbs_doors_01_95",
                openSprite = "en_newburbs_doors_01_86",
                openNorthSprite = "en_newburbs_doors_01_103"
            }
        )
    }
    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Doors"),
        "en_newburbs_doors_01_0",
        getText("IGUI_BuildingMenuSubCat_Doors_Sliding_Doors"),
        "en_newburbs_doors_01_78",
        slidingDoors
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

    local extraNoiseGarageDoorsObjects = {}
    local garageDoorSpriteRanges = {
        set1 = {0, 16, 32, 48, 64, 96, 112},
    }

    for _, startNumber in ipairs(garageDoorSpriteRanges.set1) do
        table.insert(extraNoiseGarageDoorsObjects, create3TileGarageDoor("en_newburbs_doors_garages_01_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_3_Tiles_Garage_Doors"),
        "en_newburbs_doors_garages_01_0",
        extraNoiseGarageDoorsObjects
    )

    extraNoiseGarageDoorsObjects = {}
    for _, startNumber in ipairs(garageDoorSpriteRanges.set1) do
        table.insert(extraNoiseGarageDoorsObjects, create4TileGarageDoor("en_newburbs_doors_garages_01_", startNumber))
    end


    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Doors"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Doors_4_Tiles_Garage_Doors"),
        "en_newburbs_doors_garages_01_0",
        extraNoiseGarageDoorsObjects
    )

end

local function addExtraNoisesNewburbsColouredWallsToMenu()
    local function createWallObject(tooltipObj, tooltip, buildFunction, recipe, modDataWallType, spriteIndices)
        return BuildingMenu.createObject(
            tooltipObj,
            tooltip,
            buildFunction,
            recipe,
            true,
            {
                actionAnim = "Build",
                noNeedHammer = false,
                completionSound = "BuildWoodenStructureLarge",
                isThumpable = true,
                canBarricade = modDataWallType ~= "wall",
                hoppable = modDataWallType == "windowsframe",
                modData = { wallType = modDataWallType }
            },
            {
                sprite = spriteIndices.baseSprite .. spriteIndices.sprite,
                northSprite = spriteIndices.baseSprite .. spriteIndices.northSprite,
                corner = spriteIndices.baseSprite .. spriteIndices.corner
            }
        )
    end

    local function addWallsToMenu(baseSprite, wallColor, objects)
        local categoryName = "ExtraNoise's Newburbs"
        local categoryText = getText("IGUI_BuildingMenuCat_Walls")
        local subCategoryText = getText("IGUI_BuildingMenuSubCat_Walls_Painted_" .. wallColor)
        BuildingMenu.addObjectsToCategories(categoryName, categoryText, objects[1].data.sprites.sprite, subCategoryText, objects[1].data.sprites.sprite, objects)
    end


    local baseSprite = "en_newburbs_interiors_01_";
    local objects01 = {
        White = {
            createWallObject("Tooltip_BuildingMenuObj_White_Wall", "Tooltip_White_Wall", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="0", northSprite="1", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_White_Door_Frame", "Tooltip_White_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.WhiteBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="6", northSprite="7", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_White_Door_Frame", "Tooltip_White_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.WhiteBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="24", northSprite="29", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Door_Frame", "Tooltip_White_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.WhiteSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="25", northSprite="28", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Door_Frame", "Tooltip_White_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.WhiteBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="26", northSprite="27", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="4", northSprite="5", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="8", northSprite="13", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="9", northSprite="12", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="10", northSprite="11", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="14", northSprite="15", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="16", northSprite="21", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="17", northSprite="20", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="18", northSprite="19", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite="3", corner="3"}),
        },
        Pink = {
            createWallObject("Tooltip_BuildingMenuObj_Pink_Wall", "Tooltip_Pink_Wall", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="32", northSprite="33", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Pink_Door_Frame", "Tooltip_Pink_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.PinkBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="38", northSprite="39", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Pink_Door_Frame", "Tooltip_Pink_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PinkBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="56", northSprite="61", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Door_Frame", "Tooltip_Pink_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PinkSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="57", northSprite="60", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Door_Frame", "Tooltip_Pink_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PinkBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="58", northSprite="59", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="36", northSprite="37", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="40", northSprite="45", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="41", northSprite="44", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="42", northSprite="43", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="46", northSprite="47", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="48", northSprite="53", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="49", northSprite="52", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="50", northSprite="51", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite="35", corner="35"}),
        },
        Tan = {
            createWallObject("Tooltip_BuildingMenuObj_Tan_Wall", "Tooltip_Tan_Wall", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="64", northSprite="65", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Tan_Door_Frame", "Tooltip_Tan_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.TanBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="70", northSprite="71",corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Tan_Door_Frame", "Tooltip_Tan_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.TanBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="88", northSprite="93", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Door_Frame", "Tooltip_Tan_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.TanSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="89", northSprite="92", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Door_Frame", "Tooltip_Tan_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.TanBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="90", northSprite="91", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="68", northSprite="69", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="72", northSprite="77", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="73", northSprite="76", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="74", northSprite="75", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="78", northSprite="79", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="80", northSprite="85", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="81", northSprite="84", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="82", northSprite="83", corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite="67", corner="67"}),
        },
        Pale_Silver = {
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Wall", "Tooltip_Pale_Silver_Wall", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="96", northSprite="97", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Door_Frame", "Tooltip_Pale_Silver_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="102", northSprite="103",corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Door_Frame", "Tooltip_Pale_Silver_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="120", northSprite="125", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Door_Frame", "Tooltip_Pale_Silver_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="121", northSprite="124", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Door_Frame", "Tooltip_Pale_Silver_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="122", northSprite="123", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="100", northSprite="101", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="104", northSprite="109", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="105", northSprite="108", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="106", northSprite="107", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="110", northSprite="111", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="112", northSprite="117", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="113", northSprite="116", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="114", northSprite="115", corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite="99", corner="99"}),
        },
    }
    for color, objectList in pairs(objects01) do
        addWallsToMenu(baseSprite, color, objectList)
    end


    baseSprite = "en_newburbs_interiors_02_";
    local objects02 = {
        Blue = {
            createWallObject("Tooltip_BuildingMenuObj_Blue_Wall", "Tooltip_Blue_Wall", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="0", northSprite="1", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Blue_Door_Frame", "Tooltip_Blue_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="6", northSprite="7", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Blue_Door_Frame", "Tooltip_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="24", northSprite="29", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Door_Frame", "Tooltip_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="25", northSprite="28", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Door_Frame", "Tooltip_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="26", northSprite="27", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="4", northSprite="5", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="8", northSprite="13", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="9", northSprite="12", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="10", northSprite="11", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="14", northSprite="15", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="16", northSprite="21", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="17", northSprite="20", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="18", northSprite="19", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite="3", corner="3"}),
        },
        Smoke = {
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Wall", "Tooltip_Smoke_Wall", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="32", northSprite="33", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Smoke_Door_Frame", "Tooltip_Smoke_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="38", northSprite="39", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Door_Frame", "Tooltip_Smoke_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="56", northSprite="61", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Door_Frame", "Tooltip_Smoke_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreySmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="57", northSprite="60", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Door_Frame", "Tooltip_Smoke_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="58", northSprite="59", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="36", northSprite="37", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="40", northSprite="45", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="41", northSprite="44", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="42", northSprite="43", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="46", northSprite="47", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="48", northSprite="53", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="49", northSprite="52", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="50", northSprite="51", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite="35", corner="35"}),
        },
        Morning_Blue = {
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Wall", "Tooltip_Morning_Blue_Wall", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="64", northSprite="65", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Door_Frame", "Tooltip_Morning_Blue_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="70", northSprite="71",corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Door_Frame", "Tooltip_Morning_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="88", northSprite="93", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Door_Frame", "Tooltip_Morning_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="89", northSprite="92", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Door_Frame", "Tooltip_Morning_Blue_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlueBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="90", northSprite="91", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="68", northSprite="69", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="72", northSprite="77", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="73", northSprite="76", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="74", northSprite="75", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="78", northSprite="79", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="80", northSprite="85", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="81", northSprite="84", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="82", northSprite="83", corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite="67", corner="67"}),
        },
        Rhythm = {
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Wall", "Tooltip_Rhythm_Wall", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="96", northSprite="97", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Door_Frame", "Tooltip_Rhythm_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.PurpleBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="102", northSprite="103",corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Door_Frame", "Tooltip_Rhythm_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PurpleBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="120", northSprite="125", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Door_Frame", "Tooltip_Rhythm_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PurpleSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="121", northSprite="124", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Door_Frame", "Tooltip_Rhythm_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.PurpleBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="122", northSprite="123", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="100", northSprite="101", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="104", northSprite="109", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="105", northSprite="108", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="106", northSprite="107", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="110", northSprite="111", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="112", northSprite="117", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="113", northSprite="116", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="114", northSprite="115", corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite="99", corner="99"}),
        },
    }
    for color, objectList in pairs(objects02) do
        addWallsToMenu(baseSprite, color, objectList)
    end


    baseSprite = "en_newburbs_interiors_03_";
    local objects03 = {
        Cream = {
            createWallObject("Tooltip_BuildingMenuObj_Cream_Wall", "Tooltip_Cream_Wall", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="0", northSprite="1", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Cream_Door_Frame", "Tooltip_Cream_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="6", northSprite="7", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Cream_Door_Frame", "Tooltip_Cream_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="24", northSprite="29", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Door_Frame", "Tooltip_Cream_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="25", northSprite="28", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Door_Frame", "Tooltip_Cream_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="26", northSprite="27", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="4", northSprite="5", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="8", northSprite="13", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="9", northSprite="12", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="10", northSprite="11", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="14", northSprite="15", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="16", northSprite="21", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="17", northSprite="20", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="18", northSprite="19", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite="3", corner="3"}),
        },
        Black = {
            createWallObject("Tooltip_BuildingMenuObj_Black_Wall", "Tooltip_Black_Wall", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="32", northSprite="33", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Black_Door_Frame", "Tooltip_Black_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.BlackBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="38", northSprite="39", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Black_Door_Frame", "Tooltip_Black_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlackBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="56", northSprite="61", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Door_Frame", "Tooltip_Black_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlackSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="57", northSprite="60", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Door_Frame", "Tooltip_Black_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.BlackBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="58", northSprite="59", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="36", northSprite="37", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="40", northSprite="45", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="41", northSprite="44", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="42", northSprite="43", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="46", northSprite="47", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="48", northSprite="53", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="49", northSprite="52", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="50", northSprite="51", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite="35", corner="35"}),
        },
        Cinereous = {
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Wall", "Tooltip_Cinereous_Wall", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="64", northSprite="65", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Door_Frame", "Tooltip_Cinereous_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="70", northSprite="71",corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Door_Frame", "Tooltip_Cinereous_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="88", northSprite="93", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Door_Frame", "Tooltip_Cinereous_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="89", northSprite="92", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Door_Frame", "Tooltip_Cinereous_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="90", northSprite="91", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="68", northSprite="69", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="72", northSprite="77", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="73", northSprite="76", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="74", northSprite="75", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="78", northSprite="79", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="80", northSprite="85", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="81", northSprite="84", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="82", northSprite="83", corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite="67", corner="67"}),
        },
        Grey_Asparagus = {
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Wall", "Tooltip_Grey_Asparagus_Wall", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="96", northSprite="97", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Door_Frame", "Tooltip_Grey_Asparagus_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="102", northSprite="103",corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Door_Frame", "Tooltip_Grey_Asparagus_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="120", northSprite="125", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Door_Frame", "Tooltip_Grey_Asparagus_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="121", northSprite="124", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Door_Frame", "Tooltip_Grey_Asparagus_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="122", northSprite="123", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="100", northSprite="101", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="104", northSprite="109", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="105", northSprite="108", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="106", northSprite="107", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="110", northSprite="111", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="112", northSprite="117", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="113", northSprite="116", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="114", northSprite="115", corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite="99", corner="99"}),
        },
    }
    for color, objectList in pairs(objects03) do
        addWallsToMenu(baseSprite, color, objectList)
    end

    baseSprite = "en_newburbs_interiors_04_";
    local objects04 = {
        Granite_Grey = {
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Wall", "Tooltip_Granite_Grey_Wall", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="0", northSprite="1", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Door_Frame", "Tooltip_Granite_Grey_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="6", northSprite="7", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Door_Frame", "Tooltip_Granite_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="24", northSprite="29", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Door_Frame", "Tooltip_Granite_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreySmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="25", northSprite="28", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Door_Frame", "Tooltip_Granite_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="26", northSprite="27", corner="3"}),

            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="4", northSprite="5", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="8", northSprite="13", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="9", northSprite="12", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="10", northSprite="11", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="14", northSprite="15", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="16", northSprite="21", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="17", northSprite="20", corner="3"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="18", northSprite="19", corner="3"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite="3", corner="3"}),
        },
        Granite_Grey_Dark = {
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Wall", "Tooltip_Granite_Grey_Dark_Wall", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="96", northSprite="97", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Door_Frame", "Tooltip_Granite_Grey_Dark_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="102", northSprite="103",corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Door_Frame", "Tooltip_Granite_Grey_Dark_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="120", northSprite="125", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Door_Frame", "Tooltip_Granite_Grey_Dark_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreySmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="121", northSprite="124", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Door_Frame", "Tooltip_Granite_Grey_Dark_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreyBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="122", northSprite="123", corner="99"}),

            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="100", northSprite="101", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="104", northSprite="109", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="105", northSprite="108", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="106", northSprite="107", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="110", northSprite="111", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="112", northSprite="117", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="113", northSprite="116", corner="99"}),
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreyBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="114", northSprite="115", corner="99"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite="99", corner="99"}),
        },
        Spanish_Grey = {
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Wall", "Tooltip_Spanish_Grey_Wall", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="32", northSprite="33", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Door_Frame", "Tooltip_Spanish_Grey_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="38", northSprite="39", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Door_Frame", "Tooltip_Spanish_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="56", northSprite="61", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Door_Frame", "Tooltip_Spanish_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="57", northSprite="60", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Door_Frame", "Tooltip_Spanish_Grey_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.CreamBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="58", northSprite="59", corner="35"}),

            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="36", northSprite="37", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="40", northSprite="45", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="41", northSprite="44", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="42", northSprite="43", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="46", northSprite="47", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="48", northSprite="53", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="49", northSprite="52", corner="35"}),
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="50", northSprite="51", corner="35"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite="35", corner="35"}),
        },
        Grullo = {
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Wall", "Tooltip_Grullo_Wall", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "wall", {baseSprite = baseSprite, sprite="64", northSprite="65", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Grullo_Door_Frame", "Tooltip_Grullo_Door_Frame", BuildingMenu.onBuildDoorFrame, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="70", northSprite="71",corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Door_Frame", "Tooltip_Grullo_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="88", northSprite="93", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Door_Frame", "Tooltip_Grullo_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenSmallWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="89", northSprite="92", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Door_Frame", "Tooltip_Grullo_Door_Frame", BuildingMenu.onBuildSpecialObject, BuildingMenu.GreenBigWoodWallRecipe, "doorframe", {baseSprite = baseSprite, sprite="90", northSprite="91", corner="67"}),

            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="68", northSprite="69", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="72", northSprite="77", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="73", northSprite="76", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="74", northSprite="75", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="78", northSprite="79", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="80", northSprite="85", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="81", northSprite="84", corner="67"}),
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenBigWoodWallRecipe, "windowsframe", {baseSprite = baseSprite, sprite="82", northSprite="83", corner="67"}),
            
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite="67", corner="67"}),
        },
    }
    for color, objectList in pairs(objects04) do
        addWallsToMenu(baseSprite, color, objectList)
    end
end

local function addExtraNoisesNewburbsClapboardWallsToMenu()
    local function createClapboardWallObjects(color, texturePrefix, wallObjects)
        local walls = {}
        for _, obj in ipairs(wallObjects) do
            table.insert(walls, BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_" .. color .. "_" .. obj.type,
                "Tooltip_" .. color .. "_" .. obj.type,
                obj.buildFunction or BuildingMenu.onBuildWall,
                obj.recipe,
                true,
                {
                    actionAnim = obj.actionAnim or "Build",
                    noNeedHammer = false,
                    completionSound = "BuildWoodenStructureLarge",
                    isThumpable = obj.isThumpable ~= false,
                    canBarricade = obj.canBarricade == true,
                    hoppable = obj.hoppable == true,
                    canPassThrough = obj.canPassThrough == true,
                    isCorner = obj.isCorner == true,
                    modData = { wallType = (obj.wallType and string.lower(obj.wallType)) or "wall" }
                },
                {
                    sprite = texturePrefix .. "_" .. obj.sprite,
                    northSprite = texturePrefix .. "_" .. obj.northSprite,
                    corner = texturePrefix .. "_" .. (obj.corner or "3")
                }
            ))
        end
        return walls
    end

    local whiteWalls = createClapboardWallObjects("White_Clapboard", "en_newburbs_walls_01_white", {
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_White_Clapboard"),
        "en_newburbs_walls_01_white_0",
        whiteWalls
    )


    local lightGreyWalls = createClapboardWallObjects("Light_Grey_Clapboard", "en_newburbs_walls_02_lightgray", {
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Light_Grey_Clapboard"),
        "en_newburbs_walls_02_lightgray_0",
        lightGreyWalls
    )

    local eggshellWalls = createClapboardWallObjects("Eggshell_Clapboard", "en_newburbs_walls_03_eggshell", {
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.CreamBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Eggshell_Clapboard"),
        "en_newburbs_walls_03_eggshell_0",
        eggshellWalls
    )


    local warmGreyWalls = createClapboardWallObjects("Warm_Grey_Clapboard", "en_newburbs_walls_04_warmgray", {
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.GreyBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Warm_Grey_Clapboard"),
        "en_newburbs_walls_04_warmgray_0",
        warmGreyWalls
    )


    
    local redWalls = createClapboardWallObjects("Red_Clapboard", "en_newburbs_walls_05_red", {
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.RedSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Red_Clapboard"),
        "en_newburbs_walls_05_red_0",
        redWalls
    )


    local orangeWalls = createClapboardWallObjects("Orange_Clapboard", "en_newburbs_walls_06_orange", {
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Orange_Clapboard"),
        "en_newburbs_walls_06_orange_0",
        orangeWalls
    )

    
    local redbrownWalls = createClapboardWallObjects("Red_Brown_Clapboard", "en_newburbs_walls_07_redbrown", {
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_RedBrown_Clapboard"),
        "en_newburbs_walls_07_redbrown_0",
        redbrownWalls
    )


    local brownWalls = createClapboardWallObjects("Brown_Clapboard", "en_newburbs_walls_08_brown", {
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.BrownBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Brown_Clapboard"),
        "en_newburbs_walls_08_brown_0",
        brownWalls
    )


    local tanWalls = createClapboardWallObjects("Tan_Clapboard", "en_newburbs_walls_09_tan", {
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.TanSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = "3", isCorner = true, canPassThrough = true, canBarricade = false },
        
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildDoorFrame, sprite = "6", northSprite = "7", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "56", northSprite = "61", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "57", northSprite = "60", corner = "3", isThumpable = true },
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Door_Frame", wallType = "doorframe", buildFunction =  BuildingMenu.onBuildSpecialObject, sprite = "58", northSprite = "59", corner = "3", isThumpable = true },
        
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "4", northSprite = "5", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "8", northSprite = "13", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "9", northSprite = "12", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "10", northSprite = "11", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "14", northSprite = "15", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "16", northSprite = "21", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "17", northSprite = "20", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},
        {recipe = BuildingMenu.TanBigWoodWallRecipe,  type = "Window_Frame", wallType = "windowsframe", sprite = "18", northSprite = "19", corner = "3", isThumpable = true, canBarricade = true, hoppable = true},

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Exterior_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Exterior_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Exterior_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Exterior_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Exterior_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Exterior_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Exterior_Sloped_Small_Wall", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Exterior_Sloped_Medium_Wall", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Exterior_Sloped_Big_Wall", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

    });

    BuildingMenu.addObjectsToCategories(
        "ExtraNoise's Newburbs",
        getText("IGUI_BuildingMenuCat_Walls"),
        nil,
        getText("IGUI_BuildingMenuSubCat_Walls_Tan_Clapboard"),
        "en_newburbs_walls_09_tan_0",
        tanWalls
    )
end

local function addWindowsPlusToMenu()
    local windows = {
        {
            subcategoryName = getText("IGUI_BuildingMenuSubCat_Windows_Wooden_Windows"),
            subCategoryIcon = "en_newburbs_windows_01_0",
            objects = {
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_0", northSprite = "en_newburbs_windows_01_4" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_8", northSprite = "en_newburbs_windows_01_12" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_16", northSprite = "en_newburbs_windows_01_22" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_17", northSprite = "en_newburbs_windows_01_21" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_18", northSprite = "en_newburbs_windows_01_20" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_19", northSprite = "en_newburbs_windows_01_23" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_48", northSprite = "en_newburbs_windows_01_54" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_49", northSprite = "en_newburbs_windows_01_53" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_50", northSprite = "en_newburbs_windows_01_52" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_51", northSprite = "en_newburbs_windows_01_55" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_80", northSprite = "en_newburbs_windows_01_86" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_81", northSprite = "en_newburbs_windows_01_85" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { actionAnim = "Build", noNeedHammer = false, completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_82", northSprite = "en_newburbs_windows_01_84" }
                ),
            }
        },
    }

    for k, subCatData in pairs(windows) do
        BuildingMenu.addObjectsToCategories(
            "ExtraNoise's Newburbs",
            getText("IGUI_BuildingMenuCat_Windows"),
            "en_newburbs_windows_01_0",
            subCatData.subcategoryName,
            subCatData.subCategoryIcon,
            subCatData.objects
        )
    end
end

local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.paintedWallsSubCategory then
        addExtraNoisesNewburbsColouredWallsToMenu()
    end
    if SandboxVars.BuildingMenu.clapboardWallsSubCategory then
        addExtraNoisesNewburbsClapboardWallsToMenu()
    end
    if SandboxVars.BuildingMenu.doorsSubCategory then
        addDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.garageDoorsSubCategory then
        addGarageDoorsToMenu()
    end
    if SandboxVars.BuildingMenu.postersAndSignsSubCategory then
        addExtraNoisesNewburbsFlagsToMenu()
    end
    if SandboxVars.BuildingMenu.windowsCategory then
        addWindowsPlusToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)