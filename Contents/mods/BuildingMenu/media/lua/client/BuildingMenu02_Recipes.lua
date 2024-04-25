local BM_Utils = require("BM_Utils");

---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");


-- Helper function to apply multipliers and create material entries
function BuildingMenu.generateGroupAlternatives(groupAlternativesTable, baseCount, groupType)
    local newGroupAlternativesTable = {};

    for _, itemTable in pairs(groupAlternativesTable) do
        table.insert(newGroupAlternativesTable,
            { [groupType] = itemTable.Item, Amount = BuildingMenu.round(baseCount * itemTable.Multiplier) });
    end

    -- BM_Utils.debugPrint("[Building Menu DEBUG] newGroupAlternativesTable ", newGroupAlternativesTable);
    return unpack(newGroupAlternativesTable);
end


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


    BuildingMenu.GreyBigStoneWallRecipe = {
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
            },
        },
        useConsumable = {
            {
                Consumable = "Base.PaintGrey",
                Amount = 1
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

    BuildingMenu.GreySmallStoneWallRecipe = {
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
                Consumable = "Base.PaintGrey",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.GreenBigFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.RippedSheets",
                Amount = 10
            },
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 4,
                Xp = 15
            }
        }
    }

    BuildingMenu.GreenSmallFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.RippedSheets",
                Amount = 6
            },
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            },
            {
                Consumable = "Base.Thread",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 3,
                Xp = 10
            }
        }
    }


    BuildingMenu.YellowBigFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.RippedSheets",
                Amount = 10
            },
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
                Consumable = "Base.PaintYellow",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 4,
                Xp = 15
            }
        }
    }

    BuildingMenu.YellowSmallFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle",
            "Paintbrush"
        },
        neededMaterials = {
            {
                Material = "Base.RippedSheets",
                Amount = 6
            },
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
                Consumable = "Base.PaintYellow",
                Amount = 1
            },
            {
                Consumable = "Base.Thread",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 3,
                Xp = 10
            }
        }
    }

    BuildingMenu.TanBigStoneWallRecipe = {
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
                Consumable = "Base.PaintLightBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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

    BuildingMenu.TanSmallStoneWallRecipe = {
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
                Consumable = "Base.PaintLightBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.RedBigBrickWallRecipe = {
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

    BuildingMenu.RedSmallBrickWallRecipe = {
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
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.OldBigBrickWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
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

    BuildingMenu.OldSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.OrangeBigBrickWallRecipe = {
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
                Consumable = "Base.PaintOrange",
                Amount = 1
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

    BuildingMenu.OrangeSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintOrange",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BlueBigBrickWallRecipe = {
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
                Consumable = "Base.PaintBlue",
                Amount = 1
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

    BuildingMenu.BlueSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintBlue",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BeigeBigBrickWallRecipe = {
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
                Consumable = "Base.PaintYellow",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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

    BuildingMenu.BeigeSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintYellow",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WhiteBigBrickWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
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

    BuildingMenu.WhiteSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PurpleBigBrickWallRecipe = {
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
                Consumable = "Base.PaintPurple",
                Amount = 1
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

    BuildingMenu.PurpleSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintPurple",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GreenBigBrickWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
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

    BuildingMenu.GreenSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BrownBigBrickWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
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

    BuildingMenu.BrownSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BlueBigWoodWallRecipe = {
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
            },
        },
        useConsumable = {
            {
                Consumable = "Base.PaintBlue",
                Amount = 1
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

    BuildingMenu.BlueSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintBlue",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.TanBigWoodWallRecipe = {
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
                Consumable = "Base.PaintLightBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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

    BuildingMenu.TanSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintLightBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PinkBigWoodWallRecipe = {
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
                Consumable = "Base.PaintPink",
                Amount = 1
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

    BuildingMenu.PinkSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintPink",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.TurquoiseBigWoodWallRecipe = {
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
                Consumable = "Base.PaintTurquoise",
                Amount = 1
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

    BuildingMenu.TurquoiseSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintTurquoise",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.TurquoiseBigBrickWallRecipe = {
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
                Consumable = "Base.PaintTurquoise",
                Amount = 1
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

    BuildingMenu.TurquoiseSmallBrickWallRecipe = {
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
                Consumable = "Base.PaintTurquoise",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WhiteBigWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
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

    BuildingMenu.WhiteSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.YellowBigWoodWallRecipe = {
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
                Consumable = "Base.PaintYellow",
                Amount = 1
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

    BuildingMenu.YellowSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintYellow",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.BrownBigWoodWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
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

    BuildingMenu.BrownBigWoodWindowWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintBrown",
                Amount = 1
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


    BuildingMenu.WhiteBigWoodWindowWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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


    BuildingMenu.BrownSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.YellowBigWoodWindowWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
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

    BuildingMenu.BigWoodWallRecipe = {
        neededTools = {
            "Hammer"
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
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.SmallWoodWallRecipe = {
        neededTools = {
            "Hammer"
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
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.RedBigWoodWallRecipe = {
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

    BuildingMenu.RedBigWindowWoodWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintRed",
                Amount = 1
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

    BuildingMenu.RedSmallWoodWallRecipe = {
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
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GreenBigWoodWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
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

    BuildingMenu.GreenSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.GreenWhiteBigWoodWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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


    BuildingMenu.GreenWhiteSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintGreen",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.PurpleBigWoodWallRecipe = {
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
                Consumable = "Base.PaintPurple",
                Amount = 1
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

    BuildingMenu.PurpleSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintPurple",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GreyBigWoodWallRecipe = {
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
                Consumable = "Base.PaintGrey",
                Amount = 1
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

    BuildingMenu.GreyBigWoodWindowWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintGrey",
                Amount = 1
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

    BuildingMenu.GreySmallWoodWallRecipe = {
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
                Consumable = "Base.PaintGrey",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.OrangeBigWoodWallRecipe = {
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
                Consumable = "Base.PaintOrange",
                Amount = 1
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


    BuildingMenu.OrangeSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintOrange",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.CreamBigWoodWallRecipe = {
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
                Consumable = "Base.PaintPink",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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


    BuildingMenu.CreamSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintPink",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.BlackBigWoodWallRecipe = {
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
                Consumable = "Base.PaintBlack",
                Amount = 1
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

    BuildingMenu.BlackBigWoodWindowWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintBlack",
                Amount = 1
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

    BuildingMenu.BlackSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintBlack",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BlackSmallWoodGlassWallRecipe = {
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
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintBlack",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BlackWhiteBigWoodWallRecipe = {
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
                Consumable = "Base.PaintBlack",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
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


    BuildingMenu.BlackWhiteSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintBlack",
                Amount = 1
            },
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.WhiteTurquoiseBigWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintTurquoise",
                Amount = 1
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

    BuildingMenu.WhiteTurquoiseWindowBigWoodWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintTurquoise",
                Amount = 1
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


    BuildingMenu.WhiteTurquoiseSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintTurquoise",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WhiteOrangeBlueBigWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintOrange",
                Amount = 1
            },
            {
                Consumable = "Base.PaintBlue",
                Amount = 1
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

    BuildingMenu.WhiteOrangeBlueBigWindowWoodWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintOrange",
                Amount = 1
            },
            {
                Consumable = "Base.PaintBlue",
                Amount = 1
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


    BuildingMenu.WhiteOrangeBlueSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintOrange",
                Amount = 1
            },
            {
                Consumable = "Base.PaintBlue",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.WhiteRedYellowBigWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintRed",
                Amount = 1
            },
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
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

    BuildingMenu.WhiteRedYellowBigWindowWoodWallRecipe = {
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
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintRed",
                Amount = 1
            },
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
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

    BuildingMenu.WhiteRedYellowSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintWhite",
                Amount = 1
            },
            {
                Consumable = "Base.PaintRed",
                Amount = 1
            },
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.YellowBrownBigWoodWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
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


    BuildingMenu.YellowBrownSmallWoodWallRecipe = {
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
                Consumable = "Base.PaintBrown",
                Amount = 1
            },
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.BigMetalBarGlassWallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.BigMetalBarWallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.SmallMetalBarWallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 4
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(4)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.BigMetalWallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForWalls
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.SmallMetalWallRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 4
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(4)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.ScrapRoofTileRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForRoofingAndFloors
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2 * metalweldingXpPerLevel)
            },
        }
    }

    BuildingMenu.BigScrapWallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask",
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigWallWoodCount * 0.75)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigWallNailsCount * 0.75), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 4
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(4)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.SmallScrapWallRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallWallWoodCount * 0.75)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.25)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.25)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallWallNailsCount * 0.75), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 2
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(2)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2 * metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BigScrapHighFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask",
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigWallWoodCount * 1.5)
            },
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForWalls
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount, "Material")
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 6
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(6)
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.75),
                Xp = BuildingMenu.round(1.75 * bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.SmallScrapLowFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallWallWoodCount * 1.25)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.75)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount, "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.RoofTileRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.75)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
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

    BuildingMenu.GlassRoofTileRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5)
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
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

    BuildingMenu.WoodenDoorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount, "Material")
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.WoodenSingleGlassDoorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsWoodCount, "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 0.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WoodenDoubleGlassDoorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsWoodCount, "Material")
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.LowWoodenDoorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.75)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.ScrapDoor1Recipe = {
        neededTools = {
            "Hammer",
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.75)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForDoors * 0.75)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.ScrapDoor2Recipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForDoors * 1.25)
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalDoorRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForDoors
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.75)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.75)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalSingleGlassDoorRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForDoors
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.75)
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.75)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.JailDoorRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForDoors * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 2)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 1.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.GarageDoorRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForDoors * 2)
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            },
            {
                Material = "Base.Hinge",
                Amount = 4
            },
            {
                Material = "Base.Doorknob",
                Amount = 1
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 10
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(10)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.WoodenDoorTrimRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.5), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(1 * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WoodenDoorFrameRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.75)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.5), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WallDecorationRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.5), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WindowRecipe = {
        neededTools = {
            "Hammer",
            "Screwdriver"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigWallWoodCount * 0.75)
            },
            {
                Material = "Base.Screws",
                Amount = 5
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.HighWireFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 1)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 5
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.HighWireFencePostRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 2
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.HighConcreteWireFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 1)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BucketConcreteFull",
                Amount = 1
            },
            {
                Consumable = "Base.Wire",
                Amount = 5
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.HighConcreteWireFencePostRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.ScrapMetal",
                Amount =  BuildingMenu.round(scrapMetalCountForFences * 0.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BucketConcreteFull",
                Amount = 1
            },
            {
                Consumable = "Base.Wire",
                Amount = 2
            },
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.HighConcreteFenceRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
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
                Consumable = "Base.BucketConcreteFull",
                Amount = 2
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

    BuildingMenu.HighConcreteFencePostRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
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
                Consumable = "Base.BucketConcreteFull",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.HighWoodenFenceRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigWallWoodCount * 1.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigWallNailsCount * 1.5), "Material")
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
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.HighWoodenFencePostRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallWallWoodCount * 1.25)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigWallNailsCount * 1.5), "Material")
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.WoodenFenceRecipe = {
        neededTools = {
            "Hammer"
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
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalFencePostRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.HescoBarrierRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Sheet",
                Amount = 4
            },
            {
                Material = "Base.Dirtbag",
                Amount = 2
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.TwoSpriteFloorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsWoodCount * 0.25), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.WoodenStairsRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 2.25),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigObjectsNailsCount * 1.5), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalStairsRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = 10
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 2)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 1.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 10
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(10)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalFloorRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForRoofingAndFloors
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 2
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(2)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.ConcreteFloorRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketConcreteFull",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GravelRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Gravelbag",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.GravelBlendRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Gravelbag",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.AsphaltRoadRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketAsphaltMixtureFull",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.AsphaltBlendRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketAsphaltMixtureFull",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.DirtRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 1
            }
        }
    }


    BuildingMenu.StreetCrackRecipe = {
        neededTools = {
            "Sledgehammer"
        }
    }

    BuildingMenu.PaintWhite = {
        neededTools = {
            "Paintbrush"
        },
        useConsumable = {
            {
                Consumable = "Base.PaintWhite",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PaintOrange = {
        neededTools = {
            "Paintbrush"
        },
        useConsumable = {
            {
                Consumable = "Base.PaintOrange",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PaintPurple = {
        neededTools = {
            "Paintbrush"
        },
        useConsumable = {
            {
                Consumable = "Base.PaintPurple",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PaintGreen = {
        neededTools = {
            "Paintbrush"
        },
        useConsumable = {
            {
                Consumable = "Base.PaintGreen",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.PaintYellow = {
        neededTools = {
            "Paintbrush"
        },
        useConsumable = {
            {
                Consumable = "Base.PaintYellow",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.SmallCounterRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigWallWoodCount * 0.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigWallNailsCount * 0.5), "Material")
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


    BuildingMenu.CounterRecipe = {
        neededTools = {
            "Hammer"
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
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.LowBarricadeRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = 15
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 15, "Material")
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


    BuildingMenu.HighBarricadeRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = 20
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 20, "Material")
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


    BuildingMenu.CardboardBoxRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.SheetPaper2",
                Amount = 15
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Glue",
                Amount = 4
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.MilitaryCrateRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = plankCountForMilitaryCrate
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, nailsCountForMilitaryCrate, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = militaryCrateCarpentrySkill,
                Xp = BuildingMenu.round(militaryCrateCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalGlassCounterRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 2)
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalCounterBigRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 1.25)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 1.75)
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.MetalCounterRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalLockerRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.Screws",
                Amount = 5
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalLockerWGlassRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 2)
            },
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.Screws",
                Amount = 5
            },
            {
                Material = "Base.Hinge",
                Amount = 2
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 5,
                Xp = BuildingMenu.round(5 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.MetalCounterSmallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 0.75)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 0.75)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.GarbageBinBigRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.Garbagebag",
                Amount = 2
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 1.25)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 2)
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.GarbageBinSmallRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.Garbagebag",
                Amount = 1
            },
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 3
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(3)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.FireplaceRecipe = {
        neededTools = {
            "Hammer",
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Stone",
                Amount = 20
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 4
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.WaterWellRecipe = {
        neededTools = {
            "Shovel",
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = 2,
            },
            {
                Material = "Base.Plank",
                Amount = 2,
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 1.5), "Material")
            },
            {
                Material = "Base.BucketEmpty",
                Amount = 1
            },
            {
                Material = "Base.MetalPipe",
                Amount = 1
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Ropes, 1, "Material")
            },
            {
                Material = "Base.Stone",
                Amount = 30
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 4
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.FloorRugRecipe = {
        neededTools = {
            "Needle"
        },
        neededMaterials = {
            {
                Material = "Base.RippedSheets",
                Amount = 5
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Thread",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Tailoring",
                Level = 3,
                Xp = 10
            }
        }
    }

    BuildingMenu.SignRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.SpiffoStatueRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Hat_Spiffo",
                Amount = 1
            },
            {
                Material = "Base.SpiffoSuit",
                Amount = 1
            },
            {
                Material = "Base.SpiffoTail",
                Amount = 1
            },
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 1.25),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 1.25), "Material")
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

    BuildingMenu.PostersRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.SheetPaper2",
                Amount = 10
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 1, "Material")
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

    BuildingMenu.ClockRecipe = {
        neededTools = {
            "Screwdriver"
        },
        neededMaterials = {
            {
                Material = "Base.ElectronicsScrap",
                Amount = 5
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            }
        }
    }


    BuildingMenu.JukeboxRecipe = {
        neededTools = {
            "Hammer",
            "Screwdriver"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 1.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 1.5), "Material")
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 40
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 10
            },
            {
                Material = "Base.Screws",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 6,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            }
        }
    }


    BuildingMenu.WesternPianoRecipe = {
        neededTools = {
            "Hammer",
            "Screwdriver"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 2.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 2.5), "Material")
            },
            {
                Material = "Base.Screws",
                Amount = 10
            },
            {
                Material = "Base.ScrapMetal",
                Amount =  BuildingMenu.round(scrapMetalCountForElectrical * 1.5)
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = 8,
                Xp = BuildingMenu.round(8 * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.GraveRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 2
            },
            {
                Consumable = "Base.BucketConcreteFull",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.FlowerBedRecipe = {
        neededTools = {
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Stone",
                Amount = 5
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 1
            },
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Farming",
                Level = 4,
                Xp = 15
            }
        }
    }

    BuildingMenu.GrassRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Farming",
                Level = 2,
                Xp = 2
            }
        }
    }

    BuildingMenu.FlowerPotRecipe = {
        neededTools = {
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Stone",
                Amount = 2
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 1
            },
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Farming",
                Level = 2,
                Xp = 15
            }
        }
    }


    BuildingMenu.PlantCrateRecipe = {
        neededTools = {
            "Shovel",
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 1.25),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 2
            },
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 5
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Farming",
                Level = 2,
                Xp = 15
            }
        }
    }

    BuildingMenu.SmallPlantBoxRecipe = {
        neededTools = {
            "Shovel",
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.SheetPaper2",
                Amount = 15
            },
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.5),
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.5), "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Glue",
                Amount = 4
            },
            {
                Consumable = "Base.Dirtbag",
                Amount = 1
            },
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 2
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Farming",
                Level = 2,
                Xp = 15
            }
        }
    }

    BuildingMenu.WallVinesRecipe = {
        neededTools = {
            "Shovel"
        },
        neededMaterials = {
            {
                Material = "Base.Twigs",
                Amount = 5
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BucketWaterFull",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Farming",
                Level = 4,
                Xp = 15
            }
        }
    }

    BuildingMenu.SwitchRecipe = {
        neededTools = {
            "Screwdriver"
        },
        neededMaterials = {
            {
                Material = "Base.ElectronicsScrap",
                Amount = 10
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForElectrical * 1)
            },
            {
                Material = "Base.LightBulb",
                Amount = 1
            },
            {
                Material = "Base.Screws",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            }
        }
    }

    BuildingMenu.LightPostRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 10
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.25)
            },
            {
                Material = "Base.ScrapMetal",
                Amount =  BuildingMenu.round(scrapMetalCountForElectrical * 1)
            },
            {
                Material = "Base.LightBulb",
                Amount = 1
            },
            {
                Material = "Base.Screws",
                Amount = 5
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.SinkRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.LeadPipe",
                Amount = 2
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 1.25)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 1.25)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.BathtubRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.LeadPipe",
                Amount = 3
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 2)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 10
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(10)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.StoveRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 1.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            },
        }
    }

    BuildingMenu.OvenRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 1.5)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 3,
                Xp = BuildingMenu.round(3 * electricalXpPerLevel)
            },
        }
    }

    BuildingMenu.MicrowaveOvenRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForFixturesAndAppliances
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 3,
                Xp = BuildingMenu.round(3 * electricalXpPerLevel)
            },
        }
    }


    BuildingMenu.FridgeRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 2)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            },
        }
    }

    BuildingMenu.WashingMachineRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 2)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 6,
                Xp = BuildingMenu.round(6 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            },
        }
    }

    BuildingMenu.WashingBinRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.75)
            },
            {
                Material = "Base.Sheet",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.ClothingRackRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.75)
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.DoubleClothingRackRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 2.25)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.MannequinRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.25)
            },
            {
                Material = "Base.RippedSheets",
                Amount = 30
            },
            {
                Material = "Base.Screws",
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.MetalDrumRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = 15
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = 10
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 10
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(10)
            },
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.GeneratorRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 1.25)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 100
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Aluminum",
                Amount = 12
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4 * electricalXpPerLevel)
            }
        }
    }

    BuildingMenu.SmallFurnitureRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.LargeFurnitureRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.25)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.LargeGlassFurnitureRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.25)
            },
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.BedRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount, "Material")
            },
            {
                Material = "Base.Mattress",
                Amount = 1
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

    BuildingMenu.DoubleBedRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 2)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigObjectsNailsCount * 1.5), "Material")
            },
            {
                Material = "Base.Mattress",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.LeatherFurnitureRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.5)
            },
            {
                Material = "Base.LeatherStrips",
                Amount = 20
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.CouchRecipe = {
        neededTools = {
            "Hammer",
            "Needle"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(bigObjectsWoodCount * 1.5)
            },
            {
                Material = "Base.RippedSheets",
                Amount = 20
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount, "Material")
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Thread",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 4,
                Xp = 10
            }
        }
    }

    BuildingMenu.PaddedChairRecipe = {
        neededTools = {
            "Hammer",
            "Needle"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                Material = "Base.RippedSheets",
                Amount = 10
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount, "Material")
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Thread",
                Amount = 5
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "Tailoring",
                Level = 2,
                Xp = 10
            }
        }
    }

    BuildingMenu.WoodenChairRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount, "Material")
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.MetalChairRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "Saw",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForRoofingAndFloors * 3)
            },
            {
                Material = "Base.RippedSheets",
                Amount = 10
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.BigLogWallRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = BuildingMenu.round(bigWallWoodCount * 0.625)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(bigWallNailsCount * 0.625), "Material")
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

    BuildingMenu.SmallLogWallRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = BuildingMenu.round(smallWallWoodCount * 0.625)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.LogFloorRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = 2
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 2, "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = 1,
                Xp = BuildingMenu.round(1 * carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.PrimitveBedRecipe = {
        neededTools = {
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 0.75)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 0.75), "Material")
            },
            {
                Material = "Base.Twigs",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
end

Events.OnInitGlobalModData.Add(function()
    initBuildingMenuRecipes()
end)
