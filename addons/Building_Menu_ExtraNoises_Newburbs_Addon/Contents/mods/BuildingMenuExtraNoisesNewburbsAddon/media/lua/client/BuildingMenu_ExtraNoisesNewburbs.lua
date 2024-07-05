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
        local options = {
            completionSound = "BuildWoodenStructureLarge",
            modData = { wallType = modDataWallType }
        };

        if modDataWallType ~= "doorframe" then
            options.isThumpable = nil;
            options.canBarricade = true;
            options.hoppable = modDataWallType == "windowsframe";
        end

        return BuildingMenu.createObject(
            tooltipObj,
            tooltip,
            buildFunction,
            recipe,
            true,
            options,
            {
                sprite = spriteIndices.baseSprite .. spriteIndices.sprite,
                northSprite = spriteIndices.northSprite and (spriteIndices.baseSprite .. spriteIndices.northSprite) or nil,
                corner = spriteIndices.corner and (spriteIndices.baseSprite .. spriteIndices.corner) or nil,
            }
        );
    end

    local function addWallsToMenu(baseSprite, wallColor, objects)
        local categoryName = "ExtraNoise's Newburbs";
        local categoryText = getText("IGUI_BuildingMenuCat_Walls");
        local subCategoryText = getText("IGUI_BuildingMenuSubCat_Walls_Painted_" .. wallColor);
        BuildingMenu.addObjectsToCategories(categoryName, categoryText, objects[1].data.sprites.sprite, subCategoryText, objects[1].data.sprites.sprite, objects);
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
            
            createWallObject("Tooltip_BuildingMenuObj_White_Window_Frame", "Tooltip_White_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.WhiteSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite = nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Pink_Window_Frame", "Tooltip_Pink_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PinkSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Tan_Window_Frame", "Tooltip_Tan_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.TanSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Pale_Silver_Window_Frame", "Tooltip_Pale_Silver_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Blue_Window_Frame", "Tooltip_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Smoke_Window_Frame", "Tooltip_Smoke_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Morning_Blue_Window_Frame", "Tooltip_Morning_Blue_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlueSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Rhythm_Window_Frame", "Tooltip_Rhythm_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.PurpleSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Cream_Window_Frame", "Tooltip_Cream_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Black_Window_Frame", "Tooltip_Black_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.BlackSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Cinereous_Window_Frame", "Tooltip_Cinereous_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Grey_Asparagus_Window_Frame", "Tooltip_Grey_Asparagus_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Window_Frame", "Tooltip_Granite_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="3", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Granite_Grey_Dark_Window_Frame", "Tooltip_Granite_Grey_Dark_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreySmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="99", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Spanish_Grey_Window_Frame", "Tooltip_Spanish_Grey_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.CreamSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="35", northSprite= nil, corner= nil}),
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
            
            createWallObject("Tooltip_BuildingMenuObj_Grullo_Window_Frame", "Tooltip_Grullo_Window_Frame", BuildingMenu.onBuildWall, BuildingMenu.GreenSmallWoodWallRecipe, "pillar", {baseSprite = baseSprite, sprite="67", northSprite= nil, corner= nil}),
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
            local options = {
                actionAnim = obj.actionAnim or "Build",
                completionSound = "BuildWoodenStructureLarge",
                modData = { wallType = (obj.wallType and string.lower(obj.wallType)) or "wall" }
            };
    
            if obj.wallType == "doorframe" then
            elseif obj.wallType == "windowsframe" then
                options.isThumpable = obj.isThumpable ~= false;
                options.canBarricade = obj.canBarricade == true;
                options.hoppable = obj.hoppable == true;
            elseif obj.wallType == "pillar" then
                options.isCorner = obj.isCorner == true;
                options.canPassThrough = obj.canPassThrough == true;
            else
                options.isThumpable = obj.isThumpable ~= false;
                options.canBarricade = obj.canBarricade ~= false;
            end

            local corner = nil;
            if obj.wallType ~= "pillar" then
                corner = texturePrefix .. "_" .. (obj.corner or "3");
            end

            local spriteDetails = {
                sprite = texturePrefix .. "_" .. obj.sprite,
                corner = corner
            };

            if obj.northSprite then
                spriteDetails.northSprite = texturePrefix .. "_" .. obj.northSprite;
            end

            if obj.eastSprite then
                spriteDetails.eastSprite = texturePrefix .. "_" .. obj.eastSprite;
            end

            if obj.southSprite then
                spriteDetails.southSprite = texturePrefix .. "_" .. obj.southSprite;
            end

            table.insert(walls, BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_" .. color .. "_" .. obj.type,
                "Tooltip_" .. color .. "_" .. obj.type,
                obj.buildFunction or BuildingMenu.onBuildWall,
                obj.recipe,
                true,
                options,
                spriteDetails
            ));
        end
        return walls;
    end


    local whiteWalls = createClapboardWallObjects("White_Clapboard", "en_newburbs_walls_01_white", {
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Wall", wallType = "wall", sprite = "0", northSprite = "1", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "84", northSprite = "85", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "86", northSprite = "87", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe,  type = "Wall", wallType = "wall", sprite = "94", northSprite = "95", corner = "3", isThumpable = true, canBarricade = false },
        
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.WhiteBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.CreamBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreySmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.GreyBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.RedSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.OrangeBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.RedBrownBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.BrownBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
        
        {recipe = BuildingMenu.TanSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "3", northSprite = nil, isCorner = true, canPassThrough = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe,  type = "Pillar", wallType = "pillar", sprite = "114", northSprite = "112", eastSprite = "118", southSprite = "116", isCorner = true, canPassThrough = true, canBarricade = false },

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

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Slope_Wall_1", wallType = "wall", sprite = "88", northSprite = "99", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Slope_Wall_2", wallType = "wall", sprite = "89", northSprite = "100", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Slope_Wall_3", wallType = "wall", sprite = "90", northSprite = "101", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Slope_Wall_4", wallType = "wall", sprite = "98", northSprite = "93", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Slope_Wall_5", wallType = "wall", sprite = "97", northSprite = "92", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Slope_Wall_6", wallType = "wall", sprite = "96", northSprite = "91", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_End_Small", wallType = "wall", sprite = "104", northSprite = "109", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_End_Medium", wallType = "wall", sprite = "105", northSprite = "108", corner = "3", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_End_Big", wallType = "wall", sprite = "106", northSprite = "107", corner = "3", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_1", wallType = "wall", sprite = "24", northSprite = "40", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_2", wallType = "wall", sprite = "25", northSprite = "41", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_3", wallType = "wall", sprite = "26", northSprite = "42", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_4", wallType = "wall", sprite = "27", northSprite = "43", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_5", wallType = "wall", sprite = "28", northSprite = "44", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_6", wallType = "wall", sprite = "29", northSprite = "45", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_7", wallType = "wall", sprite = "32", northSprite = "48", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_8", wallType = "wall", sprite = "33", northSprite = "49", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_9", wallType = "wall", sprite = "34", northSprite = "50", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_Slope_Wall_10", wallType = "wall", sprite = "35", northSprite = "51", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_11", wallType = "wall", sprite = "36", northSprite = "52", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_Slope_Wall_12", wallType = "wall", sprite = "37", northSprite = "53", isThumpable = true, canBarricade = false },

        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_End_Small", wallType = "wall", sprite = "23", northSprite = "63", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Small", wallType = "wall", sprite = "22", northSprite = "62", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_End_Medium", wallType = "wall", sprite = "31", northSprite = "55", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanSmallWoodWallRecipe, type = "Roof_Steep_End_Medium_Large", wallType = "wall", sprite = "30", northSprite = "54", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_End_Large", wallType = "wall", sprite = "39", northSprite = "47", isThumpable = true, canBarricade = false },
        {recipe = BuildingMenu.TanBigWoodWallRecipe, type = "Roof_Steep_End_Extra_Large", wallType = "wall", sprite = "38", northSprite = "46", isThumpable = true, canBarricade = false },

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
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_0", northSprite = "en_newburbs_windows_01_4" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_8", northSprite = "en_newburbs_windows_01_12" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_16", northSprite = "en_newburbs_windows_01_22" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_17", northSprite = "en_newburbs_windows_01_21" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_18", northSprite = "en_newburbs_windows_01_20" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_19", northSprite = "en_newburbs_windows_01_23" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_48", northSprite = "en_newburbs_windows_01_54" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_49", northSprite = "en_newburbs_windows_01_53" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_50", northSprite = "en_newburbs_windows_01_52" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_51", northSprite = "en_newburbs_windows_01_55" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_80", northSprite = "en_newburbs_windows_01_86" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
                    { sprite = "en_newburbs_windows_01_81", northSprite = "en_newburbs_windows_01_85" }
                ),
                BuildingMenu.createObject(
                    "",
                    "Tooltip_Windows_Generic",
                    BuildingMenu.onBuildWindow,
                    BuildingMenu.WindowRecipe,
                    true,
                    { completionSound = "BuildWoodenStructureLarge" },
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

local function addRoofingToMenu()
    local function createClapboardWallObjects(color, texturePrefix, wallObjects)
        local roofs = {}
        for _, obj in ipairs(wallObjects) do
            local spriteDetails = {
                sprite = texturePrefix .. "_" .. obj.sprite,
                northSprite = texturePrefix .. "_" .. obj.northSprite,
            }

            if obj.eastSprite then
                spriteDetails.eastSprite = texturePrefix .. "_" .. obj.eastSprite
            end

            if obj.southSprite then
                spriteDetails.southSprite = texturePrefix .. "_" .. obj.southSprite
            end

            table.insert(roofs, BuildingMenu.createObject(
                "Tooltip_BuildingMenuObj_" .. color .. "_" .. obj.name,
                "Tooltip_Roof_Generic",
                BuildingMenu.onBuildSimpleFurniture,
                obj.recipe or BuildingMenu.RoofTileRecipe,
                true,
                {
                    completionSound = "BuildWoodenStructureLarge",
                    needToBeAgainstWall = false,
                    blockAllTheSquare = false,
                    renderFloorHelper = true,
                    canPassThrough = true,
                    canBarricade = false,
                    dismantable = true,
                    isCorner = true
                },
                spriteDetails
            ))
        end
        return roofs
    end

    local roofSubcategories = {
        {
            color = "Light_Gray",
            texturePrefix = {"en_newburbs_roofs_01a_lightgray", "en_newburbs_roofs_01b_lightgray"},
            subCategory = "Roofing_Light_Gray_Roofs"
        },
        {
            color = "Warm_Gray",
            texturePrefix = {"en_newburbs_roofs_02a_warmgray", "en_newburbs_roofs_02b_warmgray"},
            subCategory = "Roofing_Warm_Gray_Roofs"
        },
        {
            color = "Red_Brown",
            texturePrefix = {"en_newburbs_roofs_03a_redbrown", "en_newburbs_roofs_03b_redbrown"},
            subCategory = "Roofing_Red_Brown_Roofs"
        },
        {
            color = "Light_Brown",
            texturePrefix = {"en_newburbs_roofs_04a_lightbrown", "en_newburbs_roofs_04b_lightbrown"},
            subCategory = "Roofing_Light_Brown_Roofs"
        },
        {
            color = "Slate_Green",
            texturePrefix = {"en_newburbs_roofs_05a_slategreen", "en_newburbs_roofs_05b_slategreen"},
            subCategory = "Roofing_Slate_Green_Roofs"
        },
        {
            color = "Slate_Blue",
            texturePrefix = {"en_newburbs_roofs_06a_slateblue", "en_newburbs_roofs_06b_slateblue"},
            subCategory = "Roofing_Slate_Blue_Roofs"
        },
        {
            color = "Black",
            texturePrefix = {"en_newburbs_roofs_07a_black", "en_newburbs_roofs_07b_black"},
            subCategory = "Roofing_Black_Roofs"
        },
    }

    local roofObjectsConfigs = {
        {name = "Roof_Pitched_1", sprite = "5", northSprite = "16", eastSprite = "8", southSprite = "29"},
        {name = "Roof_Pitched_2", sprite = "4", northSprite = "17", eastSprite = "9", southSprite = "28"},
        {name = "Roof_Pitched_3", sprite = "3", northSprite = "18", eastSprite = "10", southSprite = "27"},
        {name = "Roof_Pitched_4", sprite = "2", northSprite = "19", eastSprite = "11", southSprite = "26"},
        {name = "Roof_Pitched_5", sprite = "1", northSprite = "20", eastSprite = "12", southSprite = "25"},
        {name = "Roof_Pitched_6", sprite = "0", northSprite = "21", eastSprite = "13", southSprite = "24"},

        {name = "Roof_Pitched_2_wGlass", sprite = "7", northSprite = "14", recipe = BuildingMenu.GlassRoofTileRecipe},
        {name = "Roof_Pitched_3_wGlass", sprite = "6", northSprite = "15", recipe = BuildingMenu.GlassRoofTileRecipe},

        {name = "Roof_Valley_1", sprite = "32", northSprite = "48", eastSprite = "61", southSprite = "45"},
        {name = "Roof_Valley_2", sprite = "33", northSprite = "49", eastSprite = "60", southSprite = "44"},
        {name = "Roof_Valley_3", sprite = "34", northSprite = "50", eastSprite = "59", southSprite = "43"},
        {name = "Roof_Valley_4", sprite = "35", northSprite = "51", eastSprite = "58", southSprite = "42"},
        {name = "Roof_Valley_5", sprite = "36", northSprite = "52", eastSprite = "57", southSprite = "41"},
        {name = "Roof_Valley_6", sprite = "37", northSprite = "53", eastSprite = "56", southSprite = "40"},

        {name = "Roof_Inner_1", sprite = "69", northSprite = "72", eastSprite = "80", southSprite = "93"},
        {name = "Roof_Inner_2", sprite = "68", northSprite = "73", eastSprite = "81", southSprite = "92"},
        {name = "Roof_Inner_3", sprite = "67", northSprite = "74", eastSprite = "82", southSprite = "91"},
        {name = "Roof_Inner_4", sprite = "66", northSprite = "75", eastSprite = "83", southSprite = "90"},
        {name = "Roof_Inner_5", sprite = "65", northSprite = "76", eastSprite = "84", southSprite = "89"},
        {name = "Roof_Inner_6", sprite = "64", northSprite = "77", eastSprite = "85", southSprite = "88"},

        {name = "Roof_Ridge_Cap_1", sprite = "101", northSprite = "104"},
        {name = "Roof_Ridge_Cap_2", sprite = "100", northSprite = "105"},
        {name = "Roof_Ridge_Cap_3", sprite = "99", northSprite = "106"},
        {name = "Roof_Ridge_Cap_4", sprite = "98", northSprite = "107"},
        {name = "Roof_Ridge_Cap_5", sprite = "97", northSprite = "108"},
        {name = "Roof_Ridge_Cap_6", sprite = "96", northSprite = "109"},
    }

    local fasciaRoofObjects = {
        {name = "Roof_Fascia_1", sprite = "0", northSprite = "45", eastSprite = "29", southSprite = "48"},
        {name = "Roof_Fascia_2", sprite = "1", northSprite = "44", eastSprite = "28", southSprite = "49"},
        {name = "Roof_Fascia_3", sprite = "2", northSprite = "43", eastSprite = "27", southSprite = "50"},
        {name = "Roof_Fascia_4", sprite = "3", northSprite = "42", eastSprite = "26", southSprite = "51"},
        {name = "Roof_Fascia_5", sprite = "4", northSprite = "41", eastSprite = "25", southSprite = "52"},
        {name = "Roof_Fascia_6", sprite = "5", northSprite = "40", eastSprite = "24", southSprite = "53"},

        {name = "Roof_Fascia_Extension_Top_1", sprite = "6", northSprite = "46", eastSprite = "30", southSprite = "54"},
        {name = "Roof_Fascia_Extension_Top_2", sprite = "14", northSprite = "38", eastSprite = "22", southSprite = "62"},

        {name = "Roof_Fascia_Extension_Middle_1", sprite = "7", northSprite = "47", eastSprite = "31", southSprite = "55"},
        {name = "Roof_Fascia_Extension_Middle_2", sprite = "15", northSprite = "39", eastSprite = "23", southSprite = "63"},

        {name = "Roof_Gutter_Top", sprite = "78", northSprite = "94", eastSprite = "70", southSprite = "86"},
        {name = "Roof_Gutter_Top_Inner_Corner", sprite = "96", northSprite = "98", eastSprite = "104", southSprite = "106"},
        {name = "Roof_Gutter_Top_Outer_Corner", sprite = "102", northSprite = "110", eastSprite = "118", southSprite = "126"},

        {name = "Roof_Gutter_Middle", sprite = "79", northSprite = "95", eastSprite = "71", southSprite = "87"},
        {name = "Roof_Gutter_Middle_Outer_Corner", sprite = "103", northSprite = "111", eastSprite = "119", southSprite = "127"},

        {name = "Roof_Apex_Fascia_Back_1", sprite = "69", northSprite = "80"},
        {name = "Roof_Apex_Fascia_Back_2", sprite = "68", northSprite = "81"},
        {name = "Roof_Apex_Fascia_Back_3", sprite = "67", northSprite = "82"},
        {name = "Roof_Apex_Fascia_Back_4", sprite = "66", northSprite = "83"},
        {name = "Roof_Apex_Fascia_Back_5", sprite = "65", northSprite = "84"},
        {name = "Roof_Apex_Fascia_Back_6", sprite = "64", northSprite = "85"},

        {name = "Roof_Apex_Fascia_Front_1", sprite = "77", northSprite = "88"},
        {name = "Roof_Apex_Fascia_Front_2", sprite = "76", northSprite = "89"},
        {name = "Roof_Apex_Fascia_Front_3", sprite = "75", northSprite = "90"},
        {name = "Roof_Apex_Fascia_Front_4", sprite = "74", northSprite = "91"},
        {name = "Roof_Apex_Fascia_Front_5", sprite = "73", northSprite = "92"},
        {name = "Roof_Apex_Fascia_Front_6", sprite = "72", northSprite = "93"},
    }

    for _, colorConfig in ipairs(roofSubcategories) do
        local roofsObjects = createClapboardWallObjects(colorConfig.color, colorConfig.texturePrefix[1], roofObjectsConfigs)
        local fasciaObjects = createClapboardWallObjects(colorConfig.color, colorConfig.texturePrefix[2], fasciaRoofObjects)


        BuildingMenu.addObjectsToCategories(
            "ExtraNoise's Newburbs",
            getText("IGUI_BuildingMenuCat_Roofing"),
            colorConfig.texturePrefix[1] .. "_16",
            getText("IGUI_BuildingMenuSubCat_" .. colorConfig.subCategory),
            colorConfig.texturePrefix[1] .. "_16",
            roofsObjects
        )
        BuildingMenu.addObjectsToCategories(
            "ExtraNoise's Newburbs",
            getText("IGUI_BuildingMenuCat_Roofing"),
            colorConfig.texturePrefix[2] .. "_16",
            getText("IGUI_BuildingMenuSubCat_" .. colorConfig.subCategory),
            colorConfig.texturePrefix[2] .. "_16",
            fasciaObjects
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
    if SandboxVars.BuildingMenu.roofsCategory then
        addRoofingToMenu()
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