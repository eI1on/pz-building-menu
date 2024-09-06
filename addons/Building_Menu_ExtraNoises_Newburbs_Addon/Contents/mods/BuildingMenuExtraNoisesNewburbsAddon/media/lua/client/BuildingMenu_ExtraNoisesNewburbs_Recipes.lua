---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");


local function initBuildingMenuRecipes()
    local bigWallWoodCount = SandboxVars.BuildingMenuRecipes.bigWallWoodCount or 6;
    local bigWallNailsCount = SandboxVars.BuildingMenuRecipes.bigWallNailsCount or 8;

    local smallWallWoodCount = SandboxVars.BuildingMenuRecipes.smallWallWoodCount or 3;
    local smallWallNailsCount = SandboxVars.BuildingMenuRecipes.smallWallNailsCount or 4;

    local bigObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.bigObjectsCarpentrySkill or 5;
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4;
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5;


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

Events.OnInitializeBuildingMenuRecipes.Add(function()
    initBuildingMenuRecipes()
end)