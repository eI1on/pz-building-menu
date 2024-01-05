if not getBuildingMenuInstance then
    require("BuildingMenu01_Main")
end

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()


BuildingMenu.GreyBigStoneWallRecipe = {
    neededTools = {
        "Hammer",
        "Paintbrush"
    },
    neededMaterials = {
        {
            Material = "Base.Plank",
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 3,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 2,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 3,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 2,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 30
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 25
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
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 8
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
            Xp = 30
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
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 6
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
            Xp = 15
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
            Amount = 3
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 30
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
            Amount = 2
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 5
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
            Xp = 15
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
            Amount = 1
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 4
        },
    },
    skills = {
        {
            Skill = "MetalWelding",
            Level = 2,
            Xp = 10
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
            Amount = 4
        },
        {
            Material = 'Base.SheetMetal',
            Amount = 2
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 2
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
            Xp = 30
        },
        {
            Skill = "Woodwork",
            Level = 2,
            Xp = 10
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
            Amount = 2
        },
        {
            Material = 'Base.SheetMetal',
            Amount = 1
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 2
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
            Xp = 15
        },
        {
            Skill = "Woodwork",
            Level = 1,
            Xp = 10
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 10
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
            Amount = 2
        },
        {
            Material = "Base.GlassPane",
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 10
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
            Amount = 7
        },
        {
            Material = "Base.Nails",
            Amount = 10
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
            Level = 4,
            Xp = 25
        }
    }
}

BuildingMenu.WoodenWindowDoorRecipe = {
    neededTools = {
        "Hammer"
    },
    neededMaterials = {
        {
            Material = "Base.Plank",
            Amount = 7
        },
        {
            Material = "Base.Nails",
            Amount = 10
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
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
            Level = 4,
            Xp = 25
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
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 5
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
            Level = 3,
            Xp = 20
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
            Amount = 4
        },
        {
            Material = 'Base.MetalBar',
            Amount = 3
        },
        {
            Material = 'Base.Screws',
            Amount = 15
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
            Xp = 25
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
            Amount = 2
        },
        {
            Material = 'Base.MetalBar',
            Amount = 10
        },
        {
            Material = 'Base.Screws',
            Amount = 15
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
            Xp = 25
        }
    }
}

BuildingMenu.MetalWindowDoorRecipe = {
    neededTools = {
        "BlowTorch",
        "WeldingMask"
    },
    neededMaterials = {
        {
            Material = 'Base.SheetMetal',
            Amount = 4
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.GlassPane',
            Amount = 1
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 25
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
            Amount = 8
        },
        {
            Material = 'Base.MetalBar',
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 20
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
            Xp = 25
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 2
        },
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 1,
            Xp = 10
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
            Amount = 3
        },
        {
            Material = "Base.Nails",
            Amount = 6
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 3,
            Xp = 15
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 2
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 1,
            Xp = 10
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
            Amount = 4
        },
        {
            Material = "Base.Screws",
            Amount = 4
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 20
        }
    }
}

BuildingMenu.HighMetalFenceRecipe = {
    neededTools = {
        "BlowTorch",
        "WeldingMask"
    },
    neededMaterials = {
        {
            Material = "Base.SmallSheetMetal",
            Amount = 4
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
            Xp = 15
        }
    }
}

BuildingMenu.HighMetalFencePostRecipe = {
    neededTools = {
        "BlowTorch",
        "WeldingMask"
    },
    neededMaterials = {
        {
            Material = "Base.SmallSheetMetal",
            Amount = 2
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
            Xp = 25
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
            Amount = 5
        },
        {
            Material = "Base.Nails",
            Amount = 10
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
            Level = 4,
            Xp = 15
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 4
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
            Level = 4,
            Xp = 15
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 3,
            Xp = 15
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
            Amount = 3
        },
        {
            Material = 'Base.MetalBar',
            Amount = 2
        },
        {
            Material = 'Base.Screws',
            Amount = 5
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
            Xp = 35
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
            Level = 2,
            Xp = 25
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 2
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 1,
            Xp = 5
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
            Level = 6,
            Xp = 35
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
            Amount = 10
        },
        {
            Material = 'Base.Screws',
            Amount = 15
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
            Xp = 35
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
            Amount = 1
        },
        {
            Material = 'Base.Screws',
            Amount = 4
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
            Xp = 15
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
            Level = 2,
            Xp = 10
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
            Level = 1,
            Xp = 5
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
            Level = 1,
            Xp = 5
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
            Level = 4,
            Xp = 25
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
            Level = 4,
            Xp = 25
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
            Level = 2,
            Xp = 5
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
            Level = 2,
            Xp = 5
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
            Level = 2,
            Xp = 5
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
            Level = 2,
            Xp = 5
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
            Level = 2,
            Xp = 5
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 25
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
            Level = 4,
            Xp = 25
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
            Amount = 15
        },
        {
            Material = "Base.Nails",
            Amount = 10
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 9,
            Xp = 25
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
            Material = 'Base.GlassPane',
            Amount = 4
        },
        {
            Material = 'Base.MetalBar',
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 25
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
            Amount = 6
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 8
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 25
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
            Amount = 4
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 4
        },
        {
            Material = 'Base.Screws',
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
            Skill = "MetalWelding",
            Level = 4,
            Xp = 25
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
            Amount = 4
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 4
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
            Xp = 35
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
            Amount = 4
        },
        {
            Material = "Base.SheetMetal",
            Amount = 4
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 4
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
            Xp = 35
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
            Amount = 2
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 3
        },
        {
            Material = 'Base.Screws',
            Amount = 5
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
            Xp = 25
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
            Amount = 6
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 8
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 25
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
            Amount = 3
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 5
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
            Xp = 25
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
            Level = 2,
            Xp = 25
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
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 2,
            Xp = 10
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 4
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 10
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
            Level = 4,
            Xp = 15
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
            Xp = 15
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
            Level = 2,
            Xp = 10
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 5
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
            Level = 4,
            Xp = 10
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

BuildingMenu.WaterWellRecipe = {
    neededTools = {
        "Shovel"
    },
    neededMaterials = {
        {
            Material = "Base.Stone",
            Amount = 30
        }
    },
    useConsumable = {
        {
            Consumable = "Base.Dirtbag",
            Amount = 8
        },
        {
            Consumable = "Base.BucketWaterFull",
            Amount = 25
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
            Xp = 15
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
            Amount = 5
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
            Xp = 15
        },
        {
            Skill = "MetalWelding",
            Level = 4,
            Xp = 25
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
            Amount = 4
        },
        {
            Material = 'Base.SmallSheetMetal',
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
            Skill = "MetalWelding",
            Level = 3,
            Xp = 15
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
            Amount = 8
        },
        {
            Material = 'Base.SmallSheetMetal',
            Amount = 8
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
            Xp = 35
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
            Amount = 6
        },
        {
            Material = "Base.MetalBar",
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 20
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
            Xp = 35
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
            Amount = 7
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
            Amount = 20
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
            Xp = 35
        },
        {
            Skill = "Electricity",
            Level = 3,
            Xp = 15
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
            Amount = 4
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
            Amount = 20
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
            Xp = 35
        },
        {
            Skill = "Electricity",
            Level = 3,
            Xp = 15
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
            Amount = 10
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
            Amount = 20
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
            Xp = 35
        },
        {
            Skill = "Electricity",
            Level = 4,
            Xp = 15
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
            Amount = 2
        },
        {
            Material = "Base.SheetMetal",
            Amount = 7
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
            Amount = 20
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
            Xp = 35
        },
        {
            Skill = "Electricity",
            Level = 4,
            Xp = 15
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
            Amount = 8
        },
        {
            Material = "Base.Sheet",
            Amount = 4
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 10
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
            Amount = 8
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            Xp = 15
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
            Amount = 12
        },
        {
            Material = 'Base.Screws',
            Amount = 20
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

            Xp = 15
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
            Amount = 5
        },
        {
            Material = 'Base.RippedSheets',
            Amount = 30
        },
        {
            Material = 'Base.Screws',
            Amount = 10
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
            
            Xp = 15
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
            Amount = 20
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
            Xp = 35
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
            Amount = 5
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
            Amount = 20
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
            Xp = 15
        },
        {
            Skill = "Electricity",
            Level = 4,
            Xp = 25
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
            Amount = 6
        },
        {
            Material = "Base.Nails",
            Amount = 8
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 2,
            Xp = 25
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
            Amount = 8
        },
        {
            Material = "Base.Nails",
            Amount = 10
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 25
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
            Amount = 8
        },
        {
            Material = "Base.GlassPane",
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 10
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 4,
            Xp = 35
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
            Amount = 10
        },
        {
            Material = "Base.Nails",
            Amount = 10
        },
        {
            Material = "Base.Mattress",
            Amount = 1
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 6,
            Xp = 35
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
            Amount = 10
        },
        {
            Material = "Base.LeatherStrips",
            Amount = 20
        },
        {
            Material = "Base.Nails",
            Amount = 8
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 5,
            Xp = 35
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
            Amount = 10
        },
        {
            Material = "Base.RippedSheets",
            Amount = 20
        },
        {
            Material = "Base.Nails",
            Amount = 8
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
            Level = 5,
            Xp = 35
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
            Amount = 5
        },
        {
            Material = "Base.RippedSheets",
            Amount = 10
        },
        {
            Material = "Base.Nails",
            Amount = 5
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
            Level = 3,
            Xp = 25
        },
        {
            Skill = "Tailoring",
            Level = 2,
            Xp = 10
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
            Amount = 4
        },
        {
            Material = "Base.SheetMetal",
            Amount = 2
        },
        {
            Material = "Base.RippedSheets",
            Amount = 10
        },
        {
            Material = 'Base.Screws',
            Amount = 20
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
            Xp = 15
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
            Amount = 4
        },
        {
            Material = "Base.Nails",
            Amount = 8
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 3,
            Xp = 20
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 6
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 2,
            Xp = 15
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
            Amount = 2
        },
        {
            Material = "Base.Nails",
            Amount = 4
        },
        {
            Material = "Base.Twigs",
            Amount = 10
        }
    },
    skills = {
        {
            Skill = "Woodwork",
            Level = 2,
            Xp = 15
        }
    }
}
