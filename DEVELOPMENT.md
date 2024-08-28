# Development Guidelines for Building Menu Addons

End-users can ignore this document.
This document is currently a work in progress and presents practical guidelines for modders who wish to expand the Building Menu mod by adding new buildable structures.
<br>
<br>

# Table of Contents

- [Development Guidelines for Building Menu Addons](#development-guidelines-for-building-menu-addons)
- [Table of Contents](#table-of-contents)
- [Buildables Options](#buildables-options)
  - [Option Keys](#option-keys)
  - [Option Values](#option-values)
- [Building Menu Events](#building-menu-events)
<br>
<br>

# Buildables Options

When creating buildable objects using the `BuildingMenu.createObject` function, you can specify a set of options that define the behavior and characteristics of these objects in the game.
<br>
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
| ``dontNeedFrame``          | boolean       | false         | Determines if the door can be build without a door frame.                                                                                                                                                                                                               |
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
<br>

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
<br>
<br>


# Building Menu Events

## OnBuildActionPerformed

(Client) OnBuildActionPerformed: This event is triggered after the ``ISBuildAction.perform`` function is executed. It passes the ``ISBuildingObject`` object instance, allowing to hook into the build action completion process.

**Parameters**

| Name | Type | Notes |
| --- | --- | --- |
| ``object`` | ISBuildingObject | The instance of the ``ISBuildingObject`` object. |

## OnBeforeSetDragBuildObject

(Client) OnBeforeSetDragBuildObject: This event is triggered right before setting the drag object for the player cursor in the ``BuildingMenu.buildObject`` function. It allows to manipulate or utilize the build object and player number before the object is set as the drag object.

**Parameters**

| Name | Type | Notes |
| --- | --- | --- |
| ``object`` | ISBuildingObject | The build object that is being set. |
| ``playerNum`` | integer | The index of the player performing the build action. |
