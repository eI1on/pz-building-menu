---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");


local function initBuildingMenuRecipes()
    local bigWallWoodCount = SandboxVars.BuildingMenuRecipes.bigWallWoodCount or 6;
    local bigWallNailsCount = SandboxVars.BuildingMenuRecipes.bigWallNailsCount or 8;

    local smallWallWoodCount = SandboxVars.BuildingMenuRecipes.smallWallWoodCount or 3;
    local smallWallNailsCount = SandboxVars.BuildingMenuRecipes.smallWallNailsCount or 4;


    local bigObjectsWoodCount = SandboxVars.BuildingMenuRecipes.bigObjectsWoodCount or 6;
    local bigObjectsNailsCount = SandboxVars.BuildingMenuRecipes.bigObjectsNailsCount or 10;

    local smallObjectsWoodCount = SandboxVars.BuildingMenuRecipes.smallObjectsWoodCount or 4;
    local smallObjectsNailsCount = SandboxVars.BuildingMenuRecipes.smallObjectsNailsCount or 6;


    local glassPaneCount = SandboxVars.BuildingMenuRecipes.glassPaneCount or 2;

    local metalBarsCount = SandboxVars.BuildingMenuRecipes.metalBarsCount or 4;

    local screwsCount = SandboxVars.BuildingMenuRecipes.screwsCount or 10;

    local scrapMetalCountForFences = SandboxVars.BuildingMenuRecipes.scrapMetalCountForFences or 20;
    local scrapMetalCountForElectrical = SandboxVars.BuildingMenuRecipes.scrapMetalCountForElectrical or 10;

    local sheetMetalCountForWalls = SandboxVars.BuildingMenuRecipes.sheetMetalCountForWalls or 5;
    local sheetMetalCountForDoors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4;
    local sheetMetalCountForContainers = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4;
    local sheetMetalCountForFixturesAndAppliances = SandboxVars.BuildingMenuRecipes.sheetMetalCountForFixturesAndAppliances or 4;
    local sheetMetalCountForRoofingAndFloors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForRoofingAndFloors or 1;


    local bigObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.bigObjectsCarpentrySkill or 5;
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4;
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5;
    local metalweldingXpPerLevel = SandboxVars.BuildingMenuRecipes.metalweldingXpPerLevel or 3.5;
    local electricalXpPerLevel = SandboxVars.BuildingMenuRecipes.electricalXpPerLevel or 5.0;


    local plankCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.plankCountForMilitaryCrate or 15;
    local nailsCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.nailsCountForMilitaryCrate or 10;
    local militaryCrateCarpentrySkill = SandboxVars.BuildingMenuRecipes.militaryCrateCarpentrySkill or 9;


    BuildingMenu.RedBrownBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount, "Material")
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintRed",
                Amount = 1
            },
            {
                Consumable = "Base.PaintBrown",
                Amount = 1
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.RedBrownSmallWoodWallRecipe = {
        neededTools = {
            "Hammer",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount, "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.PaintRed",
                Amount = 1
            },
            {
                Consumable = "Base.PaintBrown",
                Amount = 1
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

end

Events.OnInitGlobalModData.Add(function()
    initBuildingMenuRecipes()
end)