local BM_Logger = require("BM_Logger");
local BM_Utils = require("BM_Utils");

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

    BuildingMenu.FishTankRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
        },
        neededMaterials = {
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(6)
            },
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigObjectsNailsCount * 1.5), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 1
            },
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WoodenDoubleDoorGateRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = 12
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount,
                    "Material")
            },
            {
                Material = "Base.Hinge",
                Amount = 4
            },
            {
                Material = "Base.Doorknob",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = 8,
                Xp = BuildingMenu.round(8 * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.VaseRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketConcreteFull",
                Amount = 4
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GreyWindowBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreyWindowBigWoodWallRecipe, {
        { type = "Base.PaintGrey",     amount = 1 },
    })

    BuildingMenu.BrownGreyWindowBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownGreyWindowBigWoodWallRecipe, {
        { type = "Base.PaintGrey",     amount = 1 },
        { type = "Base.PaintBrown",     amount = 1 },
    })

    BuildingMenu.BrownGreyBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownGreyBigWoodWallRecipe, {
        { type = "Base.PaintGrey",     amount = 1 },
        { type = "Base.PaintBrown",     amount = 1 },
    })

    BuildingMenu.BrownGreySmallWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownGreySmallWoodWallRecipe, {
        { type = "Base.PaintGrey",     amount = 1 },
        { type = "Base.PaintBrown",     amount = 1 },
    })

    BuildingMenu.BlueWindowBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlueWindowBigWoodWallRecipe, {
        { type = "Base.PaintBlue",     amount = 1 },
    })


    BuildingMenu.PurpleWindowBigWoodWallRecipe = {
        neededTools = {
            "Hammer",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = bigWallWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.PurpleWindowBigWoodWallRecipe, {
        { type = "Base.PaintPurple",     amount = 1 },
    })
end

Events.OnInitializeBuildingMenuRecipes.Add(function()
    initBuildingMenuRecipes()
end)
