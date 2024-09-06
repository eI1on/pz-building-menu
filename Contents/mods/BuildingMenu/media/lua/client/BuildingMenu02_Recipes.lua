local BM_Logger = require("BM_Logger");
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

    -- BM_Logger:debug("newGroupAlternativesTable " .. BM_Logger:prettyPrintTable(newGroupAlternativesTable));
    return unpack(newGroupAlternativesTable);
end

function BuildingMenu.addPaintToRecipe(recipe, paints)
    if SandboxVars.BuildingMenuRecipes.usePaint then
        if not recipe.neededTools then recipe.neededTools = {}; end
        if not recipe.useConsumable then recipe.useConsumable = {}; end

        if not recipe.neededTools["Paintbrush"] then
            table.insert(recipe.neededTools, "Paintbrush");
        end

        for _, paint in ipairs(paints) do
            table.insert(recipe.useConsumable, {
                Consumable = paint.type,
                Amount = paint.amount
            })
        end
    end
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


    BuildingMenu.GreyBigStoneWallRecipe = {
        neededTools = {
            "Hammer"
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
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreyBigStoneWallRecipe, {
        { type = "Base.PaintGrey", amount = 1 },
    })

    BuildingMenu.GreySmallStoneWallRecipe = {
        neededTools = {
            "Hammer"
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreySmallStoneWallRecipe, {
        { type = "Base.PaintGrey", amount = 1 },
    })


    BuildingMenu.GreenBigFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle"
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenBigFabricWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.GreenSmallFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle"
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenSmallFabricWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })


    BuildingMenu.YellowBigFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle",
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowBigFabricWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
    })


    BuildingMenu.YellowSmallFabricWallRecipe = {
        neededTools = {
            "Hammer",
            "Needle"
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowSmallFabricWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
    })


    BuildingMenu.TanBigStoneWallRecipe = {
        neededTools = {
            "Hammer"
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TanBigStoneWallRecipe, {
        { type = "Base.PaintLightBrown", amount = 1 },
        { type = "Base.PaintWhite",      amount = 1 },
    })

    BuildingMenu.TanSmallStoneWallRecipe = {
        neededTools = {
            "Hammer"
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TanSmallStoneWallRecipe, {
        { type = "Base.PaintLightBrown", amount = 1 },
        { type = "Base.PaintWhite",      amount = 1 },
    })

    BuildingMenu.RedBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.RedBigBrickWallRecipe, {
        { type = "Base.PaintRed", amount = 1 },
    })

    BuildingMenu.RedSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.RedSmallBrickWallRecipe, {
        { type = "Base.PaintRed", amount = 1 },
    })


    BuildingMenu.PinkBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PinkBigBrickWallRecipe, {
        { type = "Base.PaintPink", amount = 1 },
    })

    BuildingMenu.PinkSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PinkSmallBrickWallRecipe, {
        { type = "Base.PaintPink", amount = 1 },
    })

    BuildingMenu.OldBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OldBigBrickWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.OldSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OldSmallBrickWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.OrangeBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OrangeBigBrickWallRecipe, {
        { type = "Base.PaintOrange", amount = 1 },
    })

    BuildingMenu.OrangeSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OrangeSmallBrickWallRecipe, {
        { type = "Base.PaintOrange", amount = 1 },
    })

    BuildingMenu.BlueBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlueBigBrickWallRecipe, {
        { type = "Base.PaintBlue", amount = 1 },
    })

    BuildingMenu.BlueSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlueSmallBrickWallRecipe, {
        { type = "Base.PaintBlue", amount = 1 },
    })

    BuildingMenu.BeigeBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BeigeBigBrickWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })

    BuildingMenu.BeigeSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BeigeSmallBrickWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })

    BuildingMenu.WhiteBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteBigBrickWallRecipe, {
        { type = "Base.PaintWhite", amount = 1 },
    })

    BuildingMenu.WhiteSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteSmallBrickWallRecipe, {
        { type = "Base.PaintWhite", amount = 1 },
    })

    BuildingMenu.PurpleBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PurpleBigBrickWallRecipe, {
        { type = "Base.PaintPurple", amount = 1 },
    })

    BuildingMenu.PurpleSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PurpleSmallBrickWallRecipe, {
        { type = "Base.PaintPurple", amount = 1 },
    })

    BuildingMenu.GreenBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenBigBrickWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.GreenSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenSmallBrickWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.BrownBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownBigBrickWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.BrownSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownSmallBrickWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.BlueBigWoodWallRecipe = {
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
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlueBigWoodWallRecipe, {
        { type = "Base.PaintBlue", amount = 1 },
    })

    BuildingMenu.BlueSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlueSmallWoodWallRecipe, {
        { type = "Base.PaintBlue", amount = 1 },
    })

    BuildingMenu.TanBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TanBigWoodWallRecipe, {
        { type = "Base.PaintLightBrown", amount = 1 },
        { type = "Base.PaintWhite",      amount = 1 },
    })

    BuildingMenu.TanSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TanSmallWoodWallRecipe, {
        { type = "Base.PaintLightBrown", amount = 1 },
        { type = "Base.PaintWhite",      amount = 1 },
    })

    BuildingMenu.PinkBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PinkBigWoodWallRecipe, {
        { type = "Base.PaintPink", amount = 1 },
    })

    BuildingMenu.PinkSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PinkSmallWoodWallRecipe, {
        { type = "Base.PaintPink", amount = 1 },
    })

    BuildingMenu.TurquoiseBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TurquoiseBigWoodWallRecipe, {
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.TurquoiseSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TurquoiseSmallWoodWallRecipe, {
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.TurquoiseBigBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TurquoiseBigBrickWallRecipe, {
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.TurquoiseSmallBrickWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.TurquoiseSmallBrickWallRecipe, {
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.WhiteBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteBigWoodWallRecipe, {
        { type = "Base.PaintWhite", amount = 1 },
    })

    BuildingMenu.WhiteSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteSmallWoodWallRecipe, {
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.YellowBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowBigWoodWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
    })

    BuildingMenu.YellowSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowSmallWoodWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
    })


    BuildingMenu.BrownBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownBigWoodWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.BrownBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownBigWoodWindowWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })



    BuildingMenu.GreenBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenBigWoodWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.GreenBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenBigWoodWindowWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.WhiteBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteBigWoodWindowWallRecipe, {
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.BrownSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BrownSmallWoodWallRecipe, {
        { type = "Base.PaintBrown", amount = 1 },
    })

    BuildingMenu.YellowBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowBigWoodWindowWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
    })

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

    BuildingMenu.RedBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.RedBigWoodWallRecipe, {
        { type = "Base.PaintRed", amount = 1 },
    })

    BuildingMenu.RedBigWindowWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.RedBigWindowWoodWallRecipe, {
        { type = "Base.PaintRed", amount = 1 },
    })

    BuildingMenu.RedSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.RedSmallWoodWallRecipe, {
        { type = "Base.PaintRed", amount = 1 },
    })

    BuildingMenu.GreenBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenBigWoodWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })

    BuildingMenu.GreenSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenSmallWoodWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
    })


    BuildingMenu.GreenWhiteBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenWhiteBigWoodWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.GreenWhiteSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreenWhiteSmallWoodWallRecipe, {
        { type = "Base.PaintGreen", amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.PurpleBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PurpleBigWoodWallRecipe, {
        { type = "Base.PaintPurple", amount = 1 },
    })

    BuildingMenu.PurpleSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.PurpleSmallWoodWallRecipe, {
        { type = "Base.PaintPurple", amount = 1 },
    })

    BuildingMenu.GreyBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreyBigWoodWallRecipe, {
        { type = "Base.PaintGrey", amount = 1 },
    })

    BuildingMenu.GreyBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreyBigWoodWindowWallRecipe, {
        { type = "Base.PaintGrey", amount = 1 },
    })

    BuildingMenu.GreySmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.GreySmallWoodWallRecipe, {
        { type = "Base.PaintGrey", amount = 1 },
    })


    BuildingMenu.OrangeBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OrangeBigWoodWallRecipe, {
        { type = "Base.PaintOrange", amount = 1 },
    })


    BuildingMenu.OrangeSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.OrangeSmallWoodWallRecipe, {
        { type = "Base.PaintOrange", amount = 1 },
    })


    BuildingMenu.CreamBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.CreamBigWoodWallRecipe, {
        { type = "Base.PaintPink",  amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.CreamSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.CreamSmallWoodWallRecipe, {
        { type = "Base.PaintPink",  amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.BlackBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackBigWoodWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
    })

    BuildingMenu.BlackBigWoodWindowWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackBigWoodWindowWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
    })

    BuildingMenu.BlackSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackSmallWoodWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
    })

    BuildingMenu.BlackSmallWoodGlassWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackSmallWoodGlassWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
    })

    BuildingMenu.BlackWhiteBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackWhiteBigWoodWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.BlackWhiteSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.BlackWhiteSmallWoodWallRecipe, {
        { type = "Base.PaintBlack", amount = 1 },
        { type = "Base.PaintWhite", amount = 1 },
    })


    BuildingMenu.WhiteTurquoiseBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteTurquoiseBigWoodWallRecipe, {
        { type = "Base.PaintWhite",     amount = 1 },
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.WhiteTurquoiseWindowBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteTurquoiseWindowBigWoodWallRecipe, {
        { type = "Base.PaintWhite",     amount = 1 },
        { type = "Base.PaintTurquoise", amount = 1 },
    })


    BuildingMenu.WhiteTurquoiseSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteTurquoiseSmallWoodWallRecipe, {
        { type = "Base.PaintWhite",     amount = 1 },
        { type = "Base.PaintTurquoise", amount = 1 },
    })

    BuildingMenu.WhiteOrangeBlueBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteOrangeBlueBigWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintOrange", amount = 1 },
        { type = "Base.PaintBlue",   amount = 1 },
    })

    BuildingMenu.WhiteOrangeBlueBigWindowWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteOrangeBlueBigWindowWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintOrange", amount = 1 },
        { type = "Base.PaintBlue",   amount = 1 },
    })


    BuildingMenu.WhiteOrangeBlueSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteOrangeBlueSmallWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintOrange", amount = 1 },
        { type = "Base.PaintBlue",   amount = 1 },
    })


    BuildingMenu.WhiteRedYellowBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteRedYellowBigWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintRed",    amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })

    BuildingMenu.WhiteRedYellowBigWindowWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteRedYellowBigWindowWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintRed",    amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })

    BuildingMenu.WhiteRedYellowSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.WhiteRedYellowSmallWoodWallRecipe, {
        { type = "Base.PaintWhite",  amount = 1 },
        { type = "Base.PaintRed",    amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })


    BuildingMenu.YellowBrownBigWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowBrownBigWoodWallRecipe, {
        { type = "Base.PaintBrown",  amount = 1 },
        { type = "Base.PaintYellow", amount = 1 },
    })


    BuildingMenu.YellowBrownSmallWoodWallRecipe = {
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
    BuildingMenu.addPaintToRecipe(BuildingMenu.YellowBrownSmallWoodWallRecipe, {
        { type = "Base.PaintYellow", amount = 1 },
        { type = "Base.PaintBrown",  amount = 1 },
    })


    BuildingMenu.BigMetalBarGlassWallRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsWoodCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsWoodCount,
                    "Material")
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
            "WeldingMask",
            "BlowTorch",
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


    BuildingMenu.WireDoubleDoorGatesRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalPipe",
                Amount = metalBarsCount * 2
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 4
            },
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
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.PoleDoubleDoorGatesRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalPipe",
                Amount = metalBarsCount * 2.5
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                Material = "Base.Hinge",
                Amount = 4
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
                Level = 8,
                Xp = BuildingMenu.round(8 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.BlackPoleDoubleDoorGatesRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalPipe",
                Amount = metalBarsCount * 3
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.75)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 1)
            },
            {
                Material = "Base.Hinge",
                Amount = 4
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
                Level = 9,
                Xp = BuildingMenu.round(9 * metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 1)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 1)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 10
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.75)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 5
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
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.HighMetalBarsFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 2)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 1)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.5)
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

    BuildingMenu.HighMetalBarsFencePostRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.25)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.25)
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
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 1)
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
                Amount = 10
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
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.HighConcretePoleFenceRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 2)
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 1)
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
                Level = 8,
                Xp = BuildingMenu.round(8 * metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = BuildingMenu.round(scrapMetalCountForFences * 0.75)
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
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
            }
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
            },
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill * 0.75),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
            }
        }
    }

    BuildingMenu.HighWoodenFenceRecipe = {
        neededTools = {
            "Shovel",
            "Hammer"
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
                Amount = 2
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
            "Shovel",
            "Hammer"
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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
            "WeldingMask",
            "Screwdriver",
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


    BuildingMenu.MetalWoodStairRailingsRecipe = {
        neededTools = {
            "Hammer",
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 1),
            },
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.5)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 1)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 1), "Material")
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
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill * 0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4 * metalweldingXpPerLevel)
            }
        }
    }


    BuildingMenu.MetalStairRailingsRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = "Base.SmallSheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForWalls * 0.5)
            },
            {
                Material = "Base.MetalBar",
                Amount = BuildingMenu.round(metalBarsCount * 1.75)
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 1)
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


    BuildingMenu.WoodStairRailingsRecipe = {
        neededTools = {
            "Hammer",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = BuildingMenu.round(smallObjectsWoodCount * 2),
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 0.5)
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails,
                    BuildingMenu.round(smallObjectsNailsCount * 2), "Material")
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill * carpentryXpPerLevel)
            },
        }
    }


    BuildingMenu.HescoBarrierRecipe = {
        neededTools = {
            "Shovel",
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Tarp",
                Amount = 2
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 8
            },
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

    BuildingMenu.DoubleHescoBarrierRecipe = {
        neededTools = {
            "Shovel",
            "Hammer"
        },
        neededMaterials = {
            {
                Material = "Base.Tarp",
                Amount = 4
            },
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 16
            },
            {
                Consumable = "Base.Wire",
                Amount = 20
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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

    BuildingMenu.AsphaltRampRoadRecipe = {
        neededTools = {
            "HandShovel"
        },
        useConsumable = {
            {
                Consumable = "Base.BucketAsphaltMixtureFull",
                Amount = 3
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

    BuildingMenu.SandRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Sandbag",
                Amount = 1
            }
        }
    }

    BuildingMenu.DirtRampRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Dirtbag",
                Amount = 3
            }
        }
    }

    BuildingMenu.SandRampRecipe = {
        neededTools = {
            "Shovel"
        },
        useConsumable = {
            {
                Consumable = "Base.Sandbag",
                Amount = 3
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount,
                    "Material")
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


    BuildingMenu.LogContainerRecipe = {
        neededTools = {
            "Hammer",
            "Saw"
        },
        neededMaterials = {
            {
                Material = "Base.Log",
                Amount = 4
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Ropes, 1, "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, nailsCountForMilitaryCrate,
                    "Material")
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 1.5)
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
            "WeldingMask",
            "Screwdriver",
        },
        neededMaterials = {
            {
                Material = BuildingMenu.ItemsAlternatives.GlassPaneSmall,
                Amount = BuildingMenu.round(glassPaneCount * 2)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForContainers * 1.25)
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
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

    BuildingMenu.CurtainsRecipe = {
        neededTools = {
            "Needle"
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = 1
            },
            {
                Material = "Base.Sheet",
                Amount = 2
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
                Skill = "Tailoring",
                Level = 5,
                Xp = 15
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
                Amount = BuildingMenu.round(scrapMetalCountForElectrical * 1.5)
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
            "WeldingMask",
            "Screwdriver",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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


    BuildingMenu.Fridge2TileRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 3.5)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 55
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 8
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 2.5)
            }
        },
        useConsumable = {
            {
                Consumable = "Base.BlowTorch",
                Amount = 7.5
            },
            {
                Consumable = "Base.WeldingRods",
                Amount = BuildingMenu.weldingRodUses(7.5)
            }
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 7,
                Xp = BuildingMenu.round(7 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 5,
                Xp = BuildingMenu.round(5 * electricalXpPerLevel)
            },
        }
    }


    BuildingMenu.Fridge3TileRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
        },
        neededMaterials = {
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances * 5)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 85
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 12
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount * 3)
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
                Level = 8,
                Xp = BuildingMenu.round(8 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 6,
                Xp = BuildingMenu.round(6 * electricalXpPerLevel)
            },
        }
    }


    BuildingMenu.TrailerFridgeRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Hammer",
            "Saw",
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = 2
            },
            {
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, 5,
                    "Material")
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances)
            },
            {
                Material = "Base.ElectronicsScrap",
                Amount = 20
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = "Base.Screws",
                Amount = BuildingMenu.round(screwsCount)
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
                Level = 3,
                Xp = BuildingMenu.round(3 * metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 2,
                Xp = BuildingMenu.round(2 * electricalXpPerLevel)
            },
        }
    }


    BuildingMenu.WashingMachineWindowRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
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


    BuildingMenu.WashingMachineRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
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

    BuildingMenu.WashingBinRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount,
                    "Material")
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallObjectsNailsCount,
                    "Material")
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
            "WeldingMask",
            "Screwdriver",
            "Saw",
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
                Amount = 15
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


    BuildingMenu.MetalBarChairRecipe = {
        neededTools = {
            "BlowTorch",
            "WeldingMask",
            "Screwdriver",
            "Saw",
        },
        neededMaterials = {
            {
                Material = "Base.MetalBar",
                Amount = metalBarsCount
            },
            {
                Material = "Base.RippedSheets",
                Amount = 15
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
                BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, smallWallNailsCount,
                    "Material")
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

Events.OnInitializeBuildingMenuRecipes.Add(function()
    initBuildingMenuRecipes()
end)
