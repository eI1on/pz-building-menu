---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");


local function initBuildingMenuRecipes()
    local bigWallWoodCount = SandboxVars.BuildingMenuRecipes.bigWallWoodCount or 6;
    local bigWallNailsCount = SandboxVars.BuildingMenuRecipes.bigWallNailsCount or 6;

    local smallWallWoodCount = SandboxVars.BuildingMenuRecipes.smallWallWoodCount or 3;
    local smallWallNailsCount = SandboxVars.BuildingMenuRecipes.smallWallNailsCount or 4;


    local bigObjectsWoodCount = SandboxVars.BuildingMenuRecipes.bigObjectsWoodCount or 6;
    local bigObjectsNailsCount = SandboxVars.BuildingMenuRecipes.bigObjectsNailsCount or 8;

    local smallObjectsWoodCount = SandboxVars.BuildingMenuRecipes.smallObjectsWoodCount or 4;
    local smallObjectsNailsCount = SandboxVars.BuildingMenuRecipes.smallObjectsNailsCount or 6;


    local glassPaneCount = SandboxVars.BuildingMenuRecipes.glassPaneCount or 2;

    local metalBarsCount = SandboxVars.BuildingMenuRecipes.metalBarsCount or 4;

    local screwsCount = SandboxVars.BuildingMenuRecipes.screwsCount or 10;

    local scrapMetalCountForFences = SandboxVars.BuildingMenuRecipes.scrapMetalCountForFences or 10;
    local scrapMetalCountForElectrical = SandboxVars.BuildingMenuRecipes.scrapMetalCountForElectrical or 5;

    local sheetMetalCountForWalls = SandboxVars.BuildingMenuRecipes.sheetMetalCountForWalls or 5;
    local sheetMetalCountForDoors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4;
    local sheetMetalCountForContainers = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4;
    local sheetMetalCountForFixturesAndAppliances = SandboxVars.BuildingMenuRecipes
        .sheetMetalCountForFixturesAndAppliances or 4;
    local sheetMetalCountForRoofingAndFloors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForRoofingAndFloors or 1;


    local bigObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.bigObjectsCarpentrySkill or 5;
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4;
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5;
    local metalweldingXpPerLevel = SandboxVars.BuildingMenuRecipes.metalweldingXpPerLevel or 3.5;
    local electricalXpPerLevel = SandboxVars.BuildingMenuRecipes.electricalXpPerLevel or 5.0;


    local plankCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.plankCountForMilitaryCrate or 15;
    local nailsCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.nailsCountForMilitaryCrate or 10;
    local militaryCrateCarpentrySkill = SandboxVars.BuildingMenuRecipes.militaryCrateCarpentrySkill or 9;

    BuildingMenu.JunkyardStairsRecipe = {
        neededTools = {
            "Hammer",
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = 10
            },
            {
                {
                    Material = "Base.MetalBar",
                    Amount = metalBarsCount
                },
                {
                    Material = "Base.MetalPipe",
                    Amount = metalBarsCount
                },
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            },
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 0.75),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigObjectsNailsCount * 0.75), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 7
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(7)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.TireRubberPileRecipe = {
        neededMaterials = {
            {
                {
                    Material = "damnCraft.TireRubberNewLarge",
                    Amount = 4
                },
                {
                    Material = "damnCraft.TireRubberUsedLarge",
                    Amount = 4
                },
                {
                    Material = "damnCraft.TireRubberDestroyedLarge",
                    Amount = 4
                },
            },
        },
    }

    BuildingMenu.TireRubberRecipe = {
        neededMaterials = {
            {
                {
                    Material = "damnCraft.TireRubberNewLarge",
                    Amount = 1
                },
                {
                    Material = "damnCraft.TireRubberUsedLarge",
                    Amount = 1
                },
                {
                    Material = "damnCraft.TireRubberDestroyedLarge",
                    Amount = 1
                },
            },
        },
    }
end

Events.OnInitializeBuildingMenuRecipes.Add(function()
    initBuildingMenuRecipes()
end)
