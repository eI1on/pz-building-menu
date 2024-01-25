# Building Menu Addons Development Guide

End-users can ignore this document. 
This document is intended for modders who wish to expand the Building Menu mod by adding new buildable structures.

# Creating Buildable Objects


To introduce new buildable objects into the menu, you'll need to create them using the provided Lua function. Each object requires a set of parameters that define its characteristics and behavior in the game.

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

name: Display name of the object, if not provided, it defaults to the sprite name.  
description: A brief description of the object, displayed on the tooltip. Defaults to an empty string if not provided.  
action: Action performed to create the object type. The whole list is in [BuildingMenu03_OnBuilds.lua](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu03_OnBuilds.lua)  
recipe: Crafting recipe for the object, use predefined recipes for consistency, an upcoming update will allow players to customize recipe requirements. Or you can create your own. Whole list [BuildingMenu02_Recipes](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu02_Recipes.lua)  
isRecipeKnown: Determines whether the recipe is known to the player (can be true or string with the recipe, for ex. "Make Metal Fences") or false and will never be buildable  
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