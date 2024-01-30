# Building Menu Addons Development Guide

End-users can ignore this document. 
This document is intended for modders who wish to expand the Building Menu mod by adding new buildable structures.

# Creating Buildable Objects


To add new buildable objects into the menu, you'll need to create them using the provided Lua function. Each object requires a set of parameters that define its characteristics and behavior in the game.

Here's the function signature and a brief description of each parameter (can be found in [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/2797ac20eb03e65ad8b7ddc1d45a263614fcdcc2/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L38-L50)):

```lua
function BuildingMenu.createObject(name, description, action, recipe, isRecipeKnown, options, sprites)
    return {
        name = getTextOrNull(name) or BuildingMenu.getMoveableDisplayName(sprites.sprite) or sprites.sprite,
        description = getTextOrNull(description) or "",
        data = {
            action = action,
            recipe = recipe,
            isRecipeKnown = isRecipeKnown,
            options = options,
            sprites = sprites
        }
    }
end
```
Example of Object Integration
```lua
local exampleObject = BuildingMenu.createObject(
    "Tooltip_BuildingMenuObj_Object_Name", -- Name of the object
    "Tooltip_Object_Name", -- Description
    BuildingMenu.onBuildWall, -- Action
    BuildingMenu.BigWoodWallRecipe, -- Recipe identifier
    true, -- Recipe known status
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
    }
)
```
name: Display name of the object, it needs to be a key that will be used to retrieve the localized text string from the translation file. Please use the **Tooltip_BuildingMenuObj_Object_Name** convention, in a Tooltip_ file. If not provided, it defaults to the Movable Name or Sprite Name.  

description: A brief description of the object, displayed on the tooltip. Defaults to an empty string if not provided.  

action: Action performed to create the object type. This is where objects get their IsoObject type. The whole list is in [BuildingMenu03_OnBuilds.lua](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu03_OnBuilds.lua)  

recipe: Crafting recipe for the object, you can use predefined recipes for consistency. Or you can create your own. Whole list 
[BuildingMenu02_Recipes](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu02_Recipes.lua). Additionally see the Recipes section to define new recipes.  

isRecipeKnown: Determines whether the recipe is known to the player (can be true or string with the recipe, i.e. "Make Metal Fences") or false and will never be buildable  

options: Additional options for the object. See Section Options  

sprites: The visual representation of the object in the game. See Section Sprites  

# Inserting Objects into Categories


Once your objects are defined, you need to insert them into the Building Menu under the appropriate categories using the addObjectsToCategories function.


```lua
function BuildingMenu.addObjectsToCategories(tabName, categoryName, categoryIcon, subcategoryName, subCategoryIcon, objects)
    if not BuildingMenu.Tabs then return end

    local tab = findOrCreateItem(BuildingMenu.Tabs, "tabName", tabName, {tabName = tabName, categories = {}})
    local category = findOrCreateItem(tab.categories, "categoryName", categoryName, {categoryName = categoryName, subcategories = {}})

    if categoryIcon ~= nil and categoryIcon ~= "" then
        category.categoryIcon = category.categoryIcon or categoryIcon
    end

    local subcategory = findOrCreateItem(category.subcategories, "subcategoryName", subcategoryName, {subcategoryName = subcategoryName, objects = {}})
    subcategory.subCategoryIcon = subcategory.subCategoryIcon or subCategoryIcon

    for _, obj in ipairs(objects) do
        table.insert(subcategory.objects, obj)
    end
end
```

tabName: The name of the tab under which the category falls.  

categoryName: The name of the category.  

categoryIcon: The icon representing the category (optional). If it is a new category, it is mandatory, otherwise the players will not be able to favorite it.  

subcategoryName: The name of the subcategory.  

subCategoryIcon: The icon representing the subcategory (optional). If it is a new subcategory, it is mandatory, otherwise the players will not be able to favorite it.  

objects: The list of objects to add to the subcategory (table of objects created with the BuildingMenu.createObject function).  

Example of usage: [BuildingMenu05_ExtraCategories.lua](https://github.com/eI1on/pz-building-menu/blob/2797ac20eb03e65ad8b7ddc1d45a263614fcdcc2/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu05_ExtraCategories.lua#L1066-L1073)

#  Integrating with Sandbox Options


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

In this example, new categories for wood walls and clapboard walls are added to the Building Menu based on the corresponding sandbox settings.
Example of usage [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/2797ac20eb03e65ad8b7ddc1d45a263614fcdcc2/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L35186-L35323)  
For the whole list with the Sandbox-options refer to [sandbox-options.txt](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/sandbox-options.txt)



#  Creating new Recipes

The code snippets provided below demonstrates how to initialize new recipes within the mod's framework.

**Recipe Structure**  
Each recipe is defined as a Lua table with specific fields that outline the requirements for constructing an object. These fields include:

neededTools: A list of tool names required to build the object. Tools are keys from the BuildingMenu.Tools table, such as "Hammer" or "Paintbrush". Full table can be found [BuildingMenu.Tools](https://github.com/eI1on/pz-building-menu/blob/2797ac20eb03e65ad8b7ddc1d45a263614fcdcc2/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L42-L121).

neededMaterials: An array of materials required for the construction. Each material entry is a table specifying the material's in-game item Full Type (Material) and the quantity needed (Amount).  

useConsumable: An array similar to neededMaterials, but for consumable items that will be used up in the construction process.  

skills: Defines the skill requirements for constructing the object. Each entry is a table specifying the skill name (Skill), the minimum level required (Level), and the experience points awarded upon successful construction (Xp).  

**Example**  
Here's an example of defining and integrating a new recipe for a "Grey Big Stone Wall":
```lua
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
            Xp = BuildingMenu.round(bigObjectsCarpentrySkill * carpentryXpPerLevel)
        }
    }
}
```
Note: if you want to change the recipes based to the sandbox options you have to calculate them at **Event.OnInitGlobalModData** because then Sandbox Options are initialized.


# Buildables Options  
# Buildables Sprites