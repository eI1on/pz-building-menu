# Development Guidelines for Building Menu Addons

End-users can ignore this document.
This document is currently a work in progress and presents practical guidelines for modders who wish to expand the Building Menu mod by adding new buildable structures.
<br>
<br>

# Table of Contents

- [Development Guidelines for Building Menu Addons](#development-guidelines-for-building-menu-addons)
- [Table of Contents](#table-of-contents)
- [Creating Buildable Objects](#creating-buildable-objects)
- [Inserting Objects into Categories](#inserting-objects-into-categories)
- [Integrating with Sandbox Options](#integrating-with-sandbox-options)
- [Recipes](#recipes)
  - [Creating new Recipes](#creating-new-recipes)
- [Buildables Options](#buildables-options)
  - [Option Keys](#option-keys)
  - [Option Values](#option-values)
- [Buildables Sprites](#buildables-sprites)
  - [Sprites Definition](#sprites-definition)
- [Building Menu Events](#building-menu-events)
<br>
<br>

# Creating Buildable Objects

These are the relevant modules to call when creating your add-on.
```lua
---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main")
require("BuildingMenu04_CategoriesDefinitions")
```
`BuildingMenu01_Main` contains the main functions of the mod 
`BuildingMenu04_CategoriesDefinitions` contains the function declarations for inserting objects in the menu

<br>
To add new buildable objects into the menu, you'll need to create them using the provided Lua function. Each object requires a set of parameters that define its characteristics and behavior in the game.

Here's the function signature and a brief description of each parameter (can be found in [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L50-L71)):

```lua
function BuildingMenu.createObject(displayName, description, action, recipe, isRecipeKnown, options, sprites, nameID)
```
<br>

`displayName` display name of the object, it needs to be a translation key that will be used to retrieve the localized text string from the translation file. Please use the **Tooltip_BuildingMenuObj_Object_Name** convention, in a `Tooltip_` file. If not provided, it defaults to the _movable name_ or _sprite name_.<br>

`description` a brief description of the object, displayed on the tooltip. Please use the **Tooltip_Object_Name** convention, in a `Tooltip_` file. Defaults to an _empty string_ if not provided.<br>

`nameID` the ID of the built object, this is used in crafting recipes if the object acts as a workbench. Defaults to the translations key name of the object without the prefix "**Tooltip_BuildingMenuObj_**" if it has a display name or to the moveable name composed from **CustomName** and **GroupName** tile properties, or the sprite name.<br>

`action` action performed to create the object type. This is where objects get their IsoObject type. The whole list is in [BuildingMenu03_OnBuilds.lua](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu03_OnBuilds.lua).<br>

`recipe` crafting recipe for the object, you can use predefined recipes for consistency. Or you can create your own. Whole list
[BuildingMenu02_Recipes](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu02_Recipes.lua). Additionally see the "[Recipes](#recipes)" section to define new recipes. If not specified, the object cannot be build and the text _RECIPE IS NULL_ will appear in the tooltip.<br>

`isRecipeKnown` determines whether the recipe is known to the player (can be true or string with the recipe, i.e. "Make Metal Fences") or `false` and will never be buildable.<br>

`options` additional options for the object. See Section [Buildables Options](#buildables-options).<br>

`sprites` the visual representation of the object in the game. See Section [Buildables Sprites](#buildables-sprites).<br>
<br>

Example of Object Integration

```lua
local exampleObject = BuildingMenu.createObject(
    "Tooltip_BuildingMenuObj_Object_Name", -- Name of the object
    "Tooltip_Object_Name",                 -- Description
    BuildingMenu.onBuildWall,              -- Action
    BuildingMenu.BigWoodWallRecipe,        -- Recipe identifier
    true,                                  -- Recipe known status/Recipe name
    {   -- Options
        actionAnim = "Build",
        noNeedHammer = false,
        completionSound = "BuildWoodenStructureLarge",
        isThumpable = true,
        canBarricade = false,
        modData = {wallType = "wall"}
    },
    {   -- Sprites
        sprite = "walls_exterior_roofs_06_34",
        northSprite = "walls_exterior_roofs_06_27"
    },
    "ObjectID" -- Object identified used in Crafting Recipes
)
```
<br>

# Inserting Objects into Categories

Once your objects are defined, you need to insert them into the Building Menu under the appropriate categories using the `addObjectsToCategories` function (can be found in [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L21-L47)).

```lua
function BuildingMenu.addObjectsToCategories(tabName, categoryName, categoryIcon, subcategoryName, subCategoryIcon, objects)
```

``tabName`` the name of the tab under which the category falls. Please use the **IGUI_BuildingMenuTab_TabName** convention, in a '**IGUI\_**' file.

``categoryName`` the name of the category. Please use the **IGUI_BuildingMenuCat_CategoryName** convention, in a '**IGUI\_**' file.

``categoryIcon`` the icon representing the category (usually the sprite name of an object inside this category). If it's a new category, it is _mandatory_, otherwise the players will not be able to favorite it.

``subcategoryName`` the name of the subcategory. Please use the **IGUI_BuildingMenuSubCat_SubcategoryName** convention, in a '**IGUI\_**' file.

``subCategoryIcon`` the icon representing the subcategory (usually the sprite name of an object inside this subcategory). If it's a new subcategory, it is _mandatory_, otherwise the players will not be able to favorite it.

``objects`` the _table_ of objects to add to the subcategory (table of objects created with the `BuildingMenu.createObject` function).

For the earlier example you can insert the object like this:
```lua
    BuildingMenu.addObjectsToCategories(
        getText("IGUI_BuildingMenuTab_General"),        -- tabName
        getText("IGUI_BuildingMenuCat_Cat_Test"),       -- categoryName
        "",                                             -- categoryIcon
        getText("IGUI_BuildingMenuSubCat_SubCat_Test"), -- subcategoryName
        "",                                             -- subCategoryIcon
        {
            exampleObject
        }
    )
```

Example of usage [BuildingMenu05_ExtraCategories.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu05_ExtraCategories.lua#L7-L39)

<br>

# Integrating with Sandbox Options

To accommodate additional categories, such as those required for tilepack addons, ensure your objects are integrated with the sandbox options. This allows players to enable or disable specific categories based on their preferences.

Example: Adding Categories Based on Sandbox Options

```lua
local function addCategoriesToBuildingMenu()
    if SandboxVars.BuildingMenu.woodWallsSubCategory then
        addWoodWallsToMenu()
    end
    if SandboxVars.BuildingMenu.clapboardWallsSubCategory then
        addClapboardWallsToMenu()
    end
end
Events.OnGameStart.Add(addCategoriesToBuildingMenu)
```

In this example, new categories for wood walls and clapboard walls are added to the Building Menu based on the corresponding sandbox settings. <br>
Example of usage [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L37079-L37225)  
For the whole list with the Sandbox-options refer to [sandbox-options.txt](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/sandbox-options.txt)

# Recipes

## Creating new Recipes

The code snippets provided below demonstrates how to initialize new recipes within the mod's framework.

**Recipe Structure**  
<br>
Each recipe is defined as a Lua table with specific fields that outline the requirements for constructing an object. These fields include:

``neededTools`` a list of tool names required to build the object. Tools are keys from the `BuildingMenu.Tools` table, such as "_Hammer_" or "_Paintbrush_". Full table can be found [BuildingMenu.Tools](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L39-L134).

``neededMaterials`` a table of materials required for the construction. Each material entry is a table specifying the material's in-game item Full Type (Material) and the quantity needed (Amount).

- ``Items Alternatives`` group of Item Types (Material/Consumable) which can be combined to fullfill the Material/Consumable Group, for example the [Glass Pane](https://github.com/eI1on/pz-building-menu/blob/c37d0dd961c9d63fc1beb6f88f42708314be5fe4/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L140-L147) item requirement now recognizes various types of glass from mods like Improvised Glass, Soul's Building Time and Snake's Mod Pack which can be combined to meet the requirement.

- ``Groups Alternative`` groups of Materials/Consumables where one group can be used as an alternative to the entire first group(or the other groups) to fulfill the requirement, for example in the [Nails](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L152-L161) requirement group, you can now use "TW.LargeBolt" as an alternative to "Base.Nails", with a conversion multiplier of 0.75 (you can build an object that has as requirement 8 Nails or 6 Large Bolts, for Wells you can build them with 1 Rope or 1 Sheet Rope).

``useConsumable`` an array similar to ``neededMaterials``, but for consumable items that will be used up in the construction process, also supports ``Items Alternatives`` and ``Groups Alternative``.

``skills`` defines the skill requirements for constructing the object. Each entry is a table specifying the skill name (Skill), whole list can be found [PerkFacotry.Perks](https://projectzomboid.com/modding/zombie/characters/skills/PerkFactory.Perks.html), the minimum level required (Level), and the experience points awarded upon successful construction (Xp).

**Example**  
Here's an example of defining and integrating a new recipe for a "Grey Big Stone Wall":

```lua
BuildingMenu.GreyBigStoneWallRecipe = {
    neededTools = {
        "Hammer",
        "Paintbrush"
    },
    neededMaterials = { -- Contains Groups of Materials
        { -- Material that is required and have no alternatives
            Material = "Base.Plank",
            Amount = bigWallWoodCount
        },

        { -- Alternative Groups
            {
                Material = { "Base.Nails", "Base.Screws" }, -- Alternative Items: Within this group these items can be combined to meet the requirement
                Amount = bigWallNailsCount
            },
            {
                Material = "TW.LargeBolt", -- This can be used as an alternative to the entire first alternative group. (seen with an "or" in front in the material name)
                Amount = bigWallNailsCount
            }
        },

        { -- Alternative Groups: Same as above
            BuildingMenu.generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount, "Material")
        },

        { -- Alternative Items
            Material = { "Base.GlassPane", "ImprovisedGlass.GlassPane", "filcher.SFGlassPanel", "Base.SmallGlassPanel" },
            Amount = 1
        },

        { -- Alternative Items: Same as above
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
```

<sup>_Note: If you want to change recipes based on sandbox options, you must initialize them at **Event.OnInitGlobalModData**, this event is called right after the Sandbox Options are initialized._</sup>
<br>
<br>
# Buildables Options

When creating buildable objects using the `BuildingMenu.createObject` function, you can specify a set of options that define the behavior and characteristics of these objects in the game.
<br>

## Option Keys

| Name                 | Type          | Default Value | Description                                                                                                                                                                                                                                                                  |
| -------------------- | ------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ``actionAnim``           | string        | auto          | (DEPRECATED) Animation the character performs when constructing the object. Handled automatically based on the current tool used and height of the object. But if specified it will overwrite the automatically selected animation. See below the currently used animations. |
| ``blockAllTheSquare``    | boolean       | false         | If set to true, the object occupies the entire tile, preventing other objects from being placed in the same spot.                                                                                                                                                            |
| ``buildHigh``            | boolean       | false         | Indicates if the object is built at a higher height, like **walls** or **tall fences**. Used to choose the animation. If specified it will overwrite the automatic selection.                                                                                                |
| ``buildMid``             | boolean       | false         | Indicates if the object is built at a middle height, like **low walls fences**, or **counters**. Used to choose the animation. If specified it will overwrite the automatic selection.                                                                                       |
| ``buildLow``             | boolean       | false         | Indicates if the object is built at a lower height, like **floors**. Used to choose the animation. If specified it will overwrite the automatic selection.                                                                                                                   |
| ``capacity``             | integer       | auto          | Defines the storage capacity if the object is a container; defaults to the type-specific capacity if not specified.                                                                                                                                                          |
| ``canBarricade``         | boolean       | false         | Specifies whether the object can be barricaded.                                                                                                                                                                                                                              |
| ``canBeAlwaysPlaced``    | boolean       | false         | Allows the object to be placed under any circumstances, ignoring typical placement restrictions.                                                                                                                                                                             |
| ``canBeLockedByPadlock`` | boolean       | false         | Specifies whether the object can be locked with a padlock.                                                                                                                                                                                                                   |
| ``canPassThrough``       | boolean       | false         | Determines if characters can walk through the object, for decorative or non-collidable structures.                                                                                                                                                                           |
| ``canBePlastered``       | boolean       | false         | Determines if the object can be plastered, applicable to walls.                                                                                                                                                                                                              |
| ``canScrap``             | boolean       | false         | Indicates if the object can be dismantled or scrapped after construction.                                                                                                                                                                                                    |
| ``completionSound``      | string        | none          | Sound effect played upon the successful construction of the object, for example "BuildWoodenStructureLarge". See below the full list.                                                                                                                                              |
| ``containerType``        | string        | auto          | Specifies the type of container the buildable object will be if it will be a container. Different types represent different in-game storage containers, each with its own storage capacity. If it's not specified and the tile has container properties it will be created with them.  |
| ``craftingBank``         | string        | auto          | (DEPRECATED) Handled automatically based on tool used. Sound effect played during the construction of the object. But if specified it will overwrite the automatically selected sound effects.                                                                               |
| ``crossSpeed``           | double        | 1.0           | Determines the speed at which characters can cross the object, with 1.0 representing normal speed.                                                                                                                                                                           |
| ``dismantable``          | boolean       | false         | Determines if the object can be dismantled after construction.                                                                                                                                                                                                               |
| ``equipBothHandItem``    | InventoryItem | auto          | (DEPRECATED) Handled automatically, if the tool is two handed will be equipped on both hands.                                                                                                                                                                                |
| ``firstItem``            | string        | auto          | (DEPRECATED) Handled automatically based on the first tool in the recipe. Primary tool required for the construction.                                                                                                                                                        |
| ``floor``                | boolean       | false         | Indicates if the object is a floor structure.                                                                                                                                                                                                                                |
| ``secondItem``           | string        | auto          | (DEPRECATED) Handled automatically based on the second tool in the recipe. Secondary tool required for the construction.                                                                                                                                                     |
| ``hoppable``             | boolean       | false         | Indicates if the object can be jumped over, such as fences or low walls. **true** allows players and zombies to jump over it.                                                                                                                                                |
| ``isCorner``             | boolean       | false         | Specifies if the object is designed to be placed at corners.                                                                                                                                                                                                                 |
| ``isContainer``          | boolean       | false         | Indicates if the object functions as a container.                                                                                                                                                                                                                            |
| ``isDoor``               | boolean       | false         | Specifies if the object is a door.                                                                                                                                                                                                                                           |
| ``isDoorFrame``          | boolean       | false         | Indicates if the object is a door frame.                                                                                                                                                                                                                                     |
| ``isThumpable``          | boolean       | true          | Value indicating if the object can be destroyed by zombies or players. **true** allows for the object to be thumped. I recommend that all buildables to be thumpable because players can select from the sandbox options whether they can be destroyed or not.               |
| ``isWallLike``           | boolean       | false         | Indicates if the object functions as a wall.                                                                                                                                                                                                                                 |
| ``maxTime``              | integer       | 200           | Maximum time required to build the object, measured in game units.                                                                                                                                                                                                           |
| ``modData``              | table         | nil           | Custom data storage for additional information about the object.                                                                                                                                                                                                             |
| ``name``                 | string        | string        | Name of the buildable object. Taken from the initialization of the BuildingMenu object.                                                                                                                                                                                      |
| ``needToBeAgainstWall``  | boolean       | false         | Specifies if the object must be placed adjacent to an existing wall.                                                                                                                                                                                                         |
| ``noNeedHammer``         | boolean       | true          | Value indicating whether the object requires a hammer to be built. Setting this to **false** means a hammer is needed. Set it to **true** for recipes that have shovels, propane torch, or anything other than hammers as the primary tool.                                  |
| ``player``               | integer       | 0             | Index of the player constructing the object.                                                                                                                                                                                                                                 |
| ``renderFloorHelper``    | boolean       | false         | Value indicating that will render a helper wooden floor, useful for objects that are suspended such as roofs, shelves etc...                                                                                                                                                 |
| ``skipBuildAction``      | boolean       | false         | Skips the build action for instant builds.                                                                                                                                                                                                                                   |
| ``stopOnWalk``           | boolean       | false         | Interrupts the building process if the player starts walking.                                                                                                                                                                                                                |
| ``stopOnRun``            | boolean       | false         | Interrupts the building process if the player starts running.                                                                                                                                                                                                                |
| ``thumpDmg``             | integer       | 8             | Specifies the amount of damage that zombies can inflict on the structure when attacking it.                                                                                                                                                                                  |

## Option Values

<br>

``actionAnim``:

```lua
--- List of appropriate animations based on tool type
--- @type table<string, string[]>
ISBMBuildAction.appropriateAnimations = {
    ["Hammer"] = {"Build", "Build", "BuildLow"},
    ["Sledgehammer"] = {"Destroy", "Destroy", "DestroyFloor"},
    ["Paintbrush"] = {"paint", "paint", "paint"},
    ["Screwdriver"] = {"Disassemble", "Disassemble", "VehicleWorkOnTire"},
    ["Saw"] = {"SawLog", "SawLog", "SawLog"},
    ["HandShovel"] = {"DigTrowel", "DigTrowel", "DigTrowel"},
    ["Shovel"] = {"DigShovel", "DigShovel", "DigShovel"},
    ["BlowTorch"] = {"BlowTorch", "BlowTorchMid", "BlowTorchFloor"},
    ["Needle"] = {"Craft", "Craft", "Craft"},
    ["Wrench"] = {"Craft", "Craft", "VehicleTrailer"},
    ["Scissors"] = {"Craft", "Craft", "Craft"},
    ["BareHands"] = {"Pour", "Pour", "Pour"},
};
```

<br>

``completionSound``:

```lua
--- Wood
"BuildWoodenStructureLarge", "BuildWoodenStructureMedium", "BuildWoodenStructureSmall"

--- Metal
---     Walls
"BuildMetalStructureWallFrame", "BuildMetalStructureMedium", "BuildMetalStructureSmall"
---     Big Fences
"BuildMetalStructureLargeWiredFence", "BuildMetalStructureLargePoleFence"
---     Small Fences
"BuildMetalStructureSmallWiredFence", "BuildMetalStructureSmallPoleFence"
---     Other Small Metal Things
"BuildMetalStructureSmallScrap",

--- Others
"BuildFenceGravelbag", "BuildFenceCairn", "BuildFenceSandbag"
```

<br>

``containerType``:

```lua
"displaycasebakery", "displaycase", "fridge", "shelves", "smallcrate", "smallbox", "garage_storage", "militarycrate", "filingcabinet", "bin", "locker", "metal_shelves", "militarylocker", "officedrawers", "sidetable", "wardrobe", "counter", "desk", "crate", "logs", "postbox"
```

<br>

``craftingBank``:

```lua
--- Tool audio mappings based on the tool type
--- @type table<string, string|table<string, string>>
ISBMBuildAction.toolAudioMappings = {
    ["Hammer"] = {default = "Hammering", wood = "Hammering", metal = "HammeringMetal"},
    ["Sledgehammer"] = "SledgehammerSwing",
    ["Paintbrush"] = "Painting",
    ["Screwdriver"] = {default = "ScrewingWood", wood = "ScrewingWood", metal = "ScrewingMetal"},
    ["Saw"] = "Sawing",
    ["HandShovel"] = "DigFurrowWithTrowel",
    ["Shovel"] = "DigFurrowWithShovel",
    ["BlowTorch"] = "BlowTorch",
    ["WeldingMask"] = "BlowTorch",
    ["Needle"] = "Sewing",
    ["Wrench"] = "RepairWithWrench",
    ["Scissors"] = {default = "ScissorsDefault", paper = "ScissorsPaper", cloth = "ScissorsCloth"},
    ["BareHands"] = {default = "BuildingGeneric", gravel = "DropSoilFromGravelBag", sand = "DropSoilFromSandBag", dirt = "DropSoilFromDirtBag"},
};
```

<br>

``modData``:

```lua
"wall", "doorframe", "windowsframe", "pillar", "doorframe"
```

# Buildables Sprites

## Sprites Definition

Each buildable object in the game can have multiple sprites associated with it to handle its appearance from different angles or states.  
**sprite** and **northSprite** are mandatory, if the object has only one face you can put the same string in both keys.  
<br>

**Example of Sprite Usage**:

``BuildingMenu.onBuildSink``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildBathtub``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onBuildFireplace``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildOven``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildStove``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildBarbecue``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildGenerator``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildMicrowaveOven``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildSimpleFridge``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildLargeFridge``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onBuildTripleFridge``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = ""
}
```

``BuildingMenu.onBuildCombinationWasherDryer``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildClothingDryer``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildClothingWasher``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildWashingBin``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

(DEPRECATED) ``BuildingMenu.onBuildMetalCounter``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onRainCollectorBarrel``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildDoubleMetalShelf``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onBuildDoubleTileContainer``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onBuildMannequin``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildScarecrow``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildSkeleton``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildClothingRack``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildDoubleTileFurniture``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = ""
}
```

``BuildingMenu.onBuildBarricade``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildWoodenContainer``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildSimpleFurniture``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onDoubleDoor``:

```lua
--- it needs 'spriteIndex'
sprites =   {
    sprite = "fixtures_doors_fences_Simon_MD_0",
}
```

``BuildingMenu.onBuild3TileGarageDoor``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = ""
}
```

``BuildingMenu.onBuild4TileGarageDoor``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    sprite4 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = "",
    northSprite4 = ""
}
```

``BuildingMenu.onBuildThreeTileSimpleFurniture``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = ""
}
```

``BuildingMenu.onBuildFourTileSimpleFurniture``:

```lua
- Sprite positions
-                        / \
-                       / x \ > sprite4
-                     / \y-3/
-          sprite3 < / x \ /
-                  / \y-2/
-       sprite2 < / x \ /
-               / \y-1/
-  sprite or > / x \ /
- northSprite  \ y / \
-               \ /x+1\
-  northSprite2 < \ y / \
-                  \ /x+2\
-     northSprite3 < \ y / \
-                     \ /x+3\
-                       \ y / > northSprite4
-                        \ /

sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    sprite4 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = "",
    northSprite4 = ""
}
```

``BuildingMenu.onBuildFourTileFurniture``:

```lua
- Sprite positions
-     / \   / \
-    /x-1\ / x \              sprite4             northSprite4
-  / \ y / \y-1/ \
- /x-1\ / x \ /x+1\    sprite3       sprite/northSprite     northSprite3
- \y+1/ \ y / \y-1/
-  \ / x \ /x+1\ /            sprite2             northSprite2
-    \y+1/ \ y /
-     \ /   \ /

sprites =   {
    sprite = "",
    sprite2 = "",
    sprite3 = "",
    sprite4 = "",
    northSprite = "",
    northSprite2 = "",
    northSprite3 = "",
    northSprite4 = ""
}
```

``BuildingMenu.onBuildDoorFrame``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    corner = ""
}
```

``BuildingMenu.onBuildWall``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    corner = ""
}
```

``BuildingMenu.onBuildMetalWall``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    corner = ""
}
```

``BuildingMenu.onBuildWaterWell``:

```lua
sprites =   {
    sprite = "",
    northSprite = ""
}
```

``BuildingMenu.onBuildHighMetalFence``:

```lua
sprites =   {
    sprite = "",
    sprite2 = "",
    northSprite = "",
    northSprite2 = "",
    corner = ""
}
```

``BuildingMenu.onBuildNaturalFloor``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildFloor``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildFloorOverlay``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildWallOverlay``:

```lua
sprites =   {
    sprite = "",
    northSprite = ""
}
```

``BuildingMenu.onBuildStairs``:

```lua
sprites =   {
    sprite = "",
    upToLeft01 = "",
    upToLeft02 = "",
    upToLeft03 = "",
    upToRight01 = "",
    upToRight02 = "",
    upToRight03 = "",
    pillar = "",
    pillarNorth = ""
}
```

``BuildingMenu.onBuildWindowWall``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    corner = ""
}
```

``BuildingMenu.onBuildWindow``:

```lua
sprites =   {
    sprite = "",
    northSprite = ""
}
```

``BuildingMenu.onBuildGeneratorPoweredLight``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

``BuildingMenu.onBuildBatteryPoweredLight``:

```lua
sprites =   {
    sprite = "",
    northSprite = "",
    eastSprite = "",
    southSprite = ""
}
```

# Building Menu Events

## OnBuildActionPerformed

(Client) OnBuildActionPerformed: This event is triggered after the ``ISBuildAction.perform`` function is executed. It passes the ``ISBuildingObject`` object instance, allowing to hook into the build action completion process.

**Parameters**

| Name | Type | Notes |
| --- | --- | --- |
| object | ISBuildingObject | The instance of the ``ISBuildingObject`` object. |

## OnBeforeSetDragObject

(Client) OnBeforeSetDragObject: This event is triggered right before setting the drag object for the player cursor in the ``BuildingMenu.buildObject`` function. It allows to manipulate or utilize the build object and player number before the object is set as the drag object.

**Parameters**

| Name | Type | Notes |
| --- | --- | --- |
| object | ISBuildingObject | The build object that is being set. |
| playerNum | ISBuildingObject | The index of the player performing the build action. |