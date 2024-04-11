# Development Guidelines for Building Menu Addons 
End-users can ignore this document. 
This document is currently a work in progress and presents practical guidelines for modders who wish to expand the Building Menu mod by adding new buildable structures.
<br>
<br>
<br>

Table of Contents
=================

  * [Development Guidelines for Building Menu Addons ](#development-guidelines-for-building-menu-addons)
  * [Creating Buildable Objects](#creating-buildableobjects)
  * [Inserting Objects into Categories](#inserting-objects-into-categories)
  * [Integrating with Sandbox Options](#integrating-with-sandbox-options)
  * [Recipes](#recipes)
    * [Creating new Recipes](#creating-new-recipes)
  * [Buildables Options](#buildables-options)
  * [Buildables Sprites](#buildables-sprites)  
<br>

# Creating Buildable Objects
<br>
To add new buildable objects into the menu, you'll need to create them using the provided Lua function. Each object requires a set of parameters that define its characteristics and behavior in the game.

Here's the function signature and a brief description of each parameter (can be found in [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L50-L71)):

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
<br>

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
<br>

**name**: Display name of the object, it needs to be a key that will be used to retrieve the localized text string from the translation file. Please use the **Tooltip_BuildingMenuObj_Object_Name** convention, in a 'Tooltip_' file.  
*Note:* If not provided, it defaults to the *Movable Name* or *Sprite Name*.  

**description**: A brief description of the object, displayed on the tooltip.  
*Note:* Defaults to an empty string if not provided.  

**action**: Action performed to create the object type. This is where objects get their IsoObject type. The whole list is in [BuildingMenu03_OnBuilds.lua](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu03_OnBuilds.lua).  

**recipe**: Crafting recipe for the object, you can use predefined recipes for consistency. Or you can create your own. Whole list 
[BuildingMenu02_Recipes](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu02_Recipes.lua). Additionally see the "[Recipes](#recipes)" section to define new recipes.  

**isRecipeKnown**: Determines whether the recipe is known to the player (can be true or string with the recipe, i.e. "Make Metal Fences") or false and will never be buildable.  

**options**: Additional options for the object. See Section [Buildables Options](#buildables-options)  

**sprites**: The visual representation of the object in the game. See Section [Buildables Sprites](#buildables-sprites)  
<br>
<br>
# Inserting Objects into Categories


Once your objects are defined, you need to insert them into the Building Menu under the appropriate categories using the ```addObjectsToCategories``` function (can be found in [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L21-L47)).


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

**tabName**: The name of the tab under which the category falls. Please use the **IGUI_BuildingMenuTab_** convention, in a 'IGUI_' file.  

**categoryName**: The name of the category. Please use the **IGUI_BuildingMenuCat_** convention, in a 'IGUI_' file.   

**categoryIcon**: The icon representing the category (optional). If it is a new category, it is *mandatory*, otherwise the players will not be able to favorite it.  

**subcategoryName**: The name of the subcategory. Please use the **IGUI_BuildingMenuSubCat_** convention, in a 'IGUI_' file.    

**subCategoryIcon**: The icon representing the subcategory (optional). If it is a new subcategory, it is *mandatory*, otherwise the players will not be able to favorite it.  

**objects**: The table of objects to add to the subcategory (table of objects created with the ```BuildingMenu.createObject``` function).  

Example of usage: [BuildingMenu05_ExtraCategories.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu05_ExtraCategories.lua#L970-L987)

<br>
<br>

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
Example of usage [BuildingMenu04_CategoriesDefinitions.lua](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu04_CategoriesDefinitions.lua#L37079-L37225)  
For the whole list with the Sandbox-options refer to [sandbox-options.txt](https://github.com/eI1on/pz-building-menu/blob/main/Contents/mods/BuildingMenu/media/sandbox-options.txt)


# Recipes
## Creating new Recipes

The code snippets provided below demonstrates how to initialize new recipes within the mod's framework.

**Recipe Structure**  
<br>
Each recipe is defined as a Lua table with specific fields that outline the requirements for constructing an object. These fields include:

**neededTools**: A list of tool names required to build the object. Tools are keys from the ```BuildingMenu.Tools``` table, such as "*Hammer*" or "*Paintbrush*". Full table can be found [BuildingMenu.Tools](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L39-L134).

**neededMaterials**: An array of materials required for the construction. Each material entry is a table specifying the material's in-game item Full Type (Material) and the quantity needed (Amount). 

* **Items Alternatives**: Group of Item Types (Material/Consumable) which can be combined to fullfill the Material/Consumable Group, e.g. the [Glass Pane](https://github.com/eI1on/pz-building-menu/blob/c37d0dd961c9d63fc1beb6f88f42708314be5fe4/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L140-L147) item requirement now recognizes various types of glass from mods like Improvised Glass, Soul's Building Time and Snake's Mod Pack which can be combined to meet the requirement.

* **Groups Alternative**: Groups of Materials/Consumables where one group can be used as an alternative to the entire first group(or the other groups) to fulfill the requirement, e.g., in the [Nails](https://github.com/eI1on/pz-building-menu/blob/06ae6a0d1cc30c5fc2649e123c940cdf82d0e2c0/Contents/mods/BuildingMenu/media/lua/client/BuildingMenu01_Main.lua#L152-L161) requirement group, you can now use "TW.LargeBolt" as an alternative to "Base.Nails", with a conversion multiplier of 0.75 (you can build an object that has as requirement 8 Nails or 6 Large Bolts, for Wells you can build them with 1 Rope or 1 Sheet Rope).  
 

**useConsumable**: An array similar to neededMaterials, but for consumable items that will be used up in the construction process, also supports Alternative Items and Groups.  

**skills**: Defines the skill requirements for constructing the object. Each entry is a table specifying the skill name (Skill), whole list can be found [PerkFacotry.Perks](https://projectzomboid.com/modding/zombie/characters/skills/PerkFactory.Perks.html), the minimum level required (Level), and the experience points awarded upon successful construction (Xp).  

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
                Material = "TW.LargeBolt", -- This can be used as an alternative to the entire first alternative group. (seen with an "or" in front in the tooltip)
                Amount = bigWallNailsCount
            }
        },
        { -- Alternative Groups: Same as above
            generateGroupAlternatives(BuildingMenu.GroupsAlternatives.Nails, bigWallNailsCount, "Material")
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
*Note: If you want to change recipes based on sandbox options, you must initialize them at **Event.OnInitGlobalModData**, this event is called right after the Sandbox Options are initialized.*


# Buildables Options  

When creating buildable objects using the ```BuildingMenu.createObject``` function, you can specify a set of options that define the behavior and characteristics of these objects in the game.
<br>
## Option Keys

Name | Type | Description
--- | --- | ---
actionAnim | string | The animation played by the character when building the object | 
blockAllTheSquare | boolean | It dictates if the object will occupy the entire tile, preventing other objects from being placed on the same spot | 
canBarricade | boolean | Determines whether the object can be barricaded | 
canPassThrough | boolean | Allows players to walk through the object, for decorative items or non-collidable structures | 
canScrap | boolean | Indicates if the object can be scrapped or dismantled after being built | 
completionSound | string | The sound effect played upon completing the construction of the object. For example, "BuildWoodenStructureLarge" for large wooden structures | 
containerType | boolean | Specifies the type of container the buildable object will be if it will be a container. Different types represent different in-game storage containers, each with its own storage capacity | 
craftingBank | string | Determines the sound when crafting the buildable object | 
firstItem | string | Indicates the primary tool | 
secondItem | string | Indicates the secondary tool |
hoppable | boolean | Value indicating whether the object (like fences or low walls) is hoppable, **true** allows players and zombies to jump over it. | 
isCorner | boolean | Value indicating whether the object is meant to be placed at corners| 
isContainer | boolean | Value indicating whether the object is a container or not | 
isThumpable | boolean | Value indicating if the object can be destroyed by zombies or players. **true** allows for the object to be thumped. I recommend that all buildables be thumpable because players can select from the sandbox options whether they can be destroyed or not | 
modData | table | A table containing custom data that can be used to store additional information about the object, such as its type | 
needToBeAgainstWall | boolean | For objects that must be built adjacent to a wall | 
noNeedHammer | boolean | Value indicating whether the object requires a hammer to be built. Setting this to **false** means a hammer is needed. Set it to **true** for recipes that have shovels, propane torch, or anything other than hammers as the primary tool. | 
renderFloorHelper | boolean | Value indicating that will render a helper wooden floor, useful for objects that are suspended such as roofs, shelves etc... |  
## Option Values

<br>

**actionAnim**:
```lua
"Build", "BuildLow", "BlowTorch", "BlowTorchMid", "DigTrowel", "BlowTorchFloor", "DigShovel", "DestroyFloor", "paint", "VehicleWorkOnTire"
```   

<br>

**completionSound**:
```lua
"BuildWoodenStructureLarge", "BuildWoodenStructureSmall", "BuildMetalStructureWallFrame", "BuildMetalStructureMedium", "DropSoilFromGravelBag", "BuildFenceCairn"
```  

<br>

**containerType**:
```lua
"displaycasebakery", "fridge", "shelves", "smallcrate", "smallbox", "garage_storage", "militarycrate", "filingcabinet", "bin", "locker", "metal_shelves", "militarylocker", "officedrawers", "sidetable", "wardrobe", "counter", "desk", "crate", "logs", "postbox"
```   

<br>

**craftingBank**:
```lua
"BlowTorch", "Shoveling", "SledgehammerHit", "Painting", "ClothesRipping"
```   

<br>

**firstItem**:
```lua
"BlowTorch",
```

<br>

**secondItem**:
```lua
"WeldingMask",
```

<br>

**modData**:
```lua
"wall", "doorframe", "windowsframe", "pillar", "doorframe"
```

# Buildables Sprites