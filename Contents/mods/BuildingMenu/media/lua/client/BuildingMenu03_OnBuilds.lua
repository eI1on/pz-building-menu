local BM_Utils = require("BM_Utils");

---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");

---@type table<string, boolean>
local exclusions = {
    health = true,
    firstItem = true,
    secondItem = true,
    noNeedHammer = true
};

--- Builds an object
---@param object any
---@param spritesName string|nil
---@param name string|nil
---@param playerNum number
---@param objectRecipe table
---@param objectOptions table
function BuildingMenu.buildObject(object, spritesName, name, playerNum, objectRecipe, objectOptions)
    if name then
        object.name = name;
    end
    object.player = playerNum;

    if not objectRecipe then return; end

    local modData = object.modData; -- cache modData reference.

    modData.isBuiltObject = true;

    if objectRecipe.neededMaterials then
        for _, material in pairs(objectRecipe.neededMaterials) do
            modData["need:" .. material.Material] = material.Amount;
        end
    end

    if objectRecipe.useConsumable then
        for _, consumable in pairs(objectRecipe.useConsumable) do
            modData["use:" .. consumable.Consumable] = consumable.Amount;
        end
    end

    if objectRecipe.skills then
        for _, skill in pairs(objectRecipe.skills) do
            modData["xp:" .. skill.Skill] = skill.Xp;
        end
    end

    local neededTools = objectRecipe.neededTools;
    local needHammer = false;
    if neededTools then
        if neededTools[1] == "Hammer" then needHammer = true; end
        BuildingMenu.equipToolPrimary(object, playerNum, neededTools[1]);
        if neededTools[2] then
            BuildingMenu.equipToolSecondary(object, playerNum, neededTools[2]);
        end
    end

    if objectOptions then
        for option, value in pairs(objectOptions) do
            if not exclusions[option] then
                if option == "modData" then
                    for modDataOption, modDataValue in pairs(value) do
                        modData[modDataOption] = modDataValue;
                    end
                else
                    object[option] = value;
                end
            elseif option == "noNeedHammer" then
                object[option] = not needHammer;
            end
        end
        local inv = getSpecificPlayer(playerNum):getInventory();
        local item = nil;
        if objectOptions.firstItem then
            item = BuildingMenu.getAvailableTool(inv, objectOptions.firstItem);
            if item and instanceof(item, "InventoryItem") then
                objectOptions.firstItem = item:getType()
            elseif not ISBuildMenu.cheat then
                print("[Building Menu ERROR] ",
                    string.format("At selecting - firstItem - for: %s  objectOptions.firstItem: %s", name or "",
                        objectOptions.firstItem or ""));
                return;
            end
        end
        if objectOptions.secondItem then
            item = BuildingMenu.getAvailableTool(inv, objectOptions.secondItem);
            if item and instanceof(item, "InventoryItem") then
                objectOptions.secondItem = item:getType();
            elseif not ISBuildMenu.cheat then
                print("[Building Menu ERROR] ",
                    string.format("At selecting - secondItem - for: %s  objectOptions.secondItem: %s", name or "",
                        objectOptions.secondItem or ""));
                return;
            end
        end
        if objectOptions.containerType then
            object.getHealth = function(self)
                local health = 200 + buildUtil.getWoodHealth(self);
                BM_Utils.debugPrint("[Building Menu DEBUG] ",
                    string.format("objectOptions.health: %s  buildUtil.getWoodHealth(self): %s",
                        objectOptions.health or 0, health or 0));
                return objectOptions.health or health;
            end
        end

        BM_Utils.debugPrint("[Building Menu DEBUG] ", name);
        BM_Utils.debugPrint("[Building Menu DEBUG] ", objectOptions);
        BM_Utils.debugPrint("[Building Menu DEBUG] ", objectRecipe);
        if spritesName then
            if spritesName["sprite"] then
                BM_Utils.printPropNamesFromSprite(spritesName["sprite"]);
            end
            if spritesName["sprite1"] then
                BM_Utils.printPropNamesFromSprite(spritesName["sprite1"]);
            end
            if spritesName["northSprite"] then
                BM_Utils.printPropNamesFromSprite(spritesName["northSprite"]);
            end
            if spritesName["northSprite1"] then
                BM_Utils.printPropNamesFromSprite(spritesName["northSprite1"]);
            end
        end
    end

    getCell():setDrag(object, playerNum);
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildSpecialObject = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _specialObj = ISSpecialObject:new(sprites.sprite, sprites.northSprite, getSpecificPlayer(playerNum));

    if sprites.eastSprite then
        _specialObj:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _specialObj:setSouthSprite(sprites.southSprite);
    end

    return _specialObj;
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildSink = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _sink = ISSink:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _sink:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _sink:setSouthSprite(sprites.southSprite);
    end

    return _sink;
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildBathtub = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _bathtub = ISBathtub:new(playerNum, name, sprites.sprite, sprites.sprite2, sprites.northSprite,
        sprites.northSprite2);

    return _bathtub;
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildFireplace = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _fireplace = ISStove:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _fireplace:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _fireplace:setSouthSprite(sprites.southSprite);
    end

    return _fireplace
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildOven = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _oven = ISOven:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _oven:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _oven:setSouthSprite(sprites.southSprite);
    end

    return _oven
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildStove = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _stove = ISStove:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _stove:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _stove:setSouthSprite(sprites.southSprite);
    end

    return _stove
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildBarbecue = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _stove = ISBarbecue:new(playerNum, name, sprites.sprite, sprites.northSprite)

    return _stove
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildGenerator = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _generator = ISGenerator:new(sprites.sprite, sprites.northSprite)

    return _generator
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildMicrowaveOven = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _microwaveOven = ISMicrowaveOven:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _microwaveOven:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _microwaveOven:setSouthSprite(sprites.southSprite);
    end

    return _microwaveOven
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildSimpleFridge = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _simpleFridge = ISFridge:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _simpleFridge:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _simpleFridge:setSouthSprite(sprites.southSprite);
    end

    return _simpleFridge
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildLargeFridge = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _doubleFridge = ISDoubleFridge:new(playerNum, name, sprites.sprite, sprites.sprite2, sprites.northSprite,
        sprites.northSprite2);

    return _doubleFridge
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildTripleFridge = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _tripleFridge = ISTripleFridge:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.northSprite,
        sprites.northSprite2, sprites.northSprite3)

    return _tripleFridge
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildPopsicleFridge = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _popsicleFridge = ISPopsicleFridge:new(playerNum, name, sprites.sprite, sprites.sprite2, sprites.northSprite,
        sprites.northSprite2);

    return _popsicleFridge
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildCombinationWasherDryer = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _combinationWasherDryer = ISCombinationWasherDryer:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _combinationWasherDryer:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _combinationWasherDryer:setSouthSprite(sprites.southSprite);
    end

    return _combinationWasherDryer
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildClothingDryer = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _clothingDryer = ISClothingDryer:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingDryer:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingDryer:setSouthSprite(sprites.southSprite);
    end

    return _clothingDryer
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildClothingWasher = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _clothingWasher = ISClothingWasher:new(playerNum, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingWasher:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingWasher:setSouthSprite(sprites.southSprite);
    end

    return _clothingWasher
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWashingBin = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _washingBin = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _washingBin:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _washingBin:setSouthSprite(sprites.southSprite);
    end

    return _washingBin
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildMetalCounter = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _metalCounter = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _metalCounter:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _metalCounter:setSouthSprite(sprites.southSprite);
    end

    return _metalCounter
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onMetalDrum = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _barrel = ISMetalDrum:new(playerNum, sprites.sprite)

    return _barrel
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onRainCollectorBarrel = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _barrel = RainCollectorBarrel:new(playerNum, sprites.sprite, objectOptions.waterMax or 400)

    return _barrel
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildDoubleMetalShelf = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _metalDoubleShelf = ISDoubleMetalShelf:new(playerNum, name, sprites.sprite, sprites.sprite2,
        sprites.northSprite,
        sprites.northSprite2);

    return _metalDoubleShelf
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildDoubleTileContainer = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _doubleTileContainer = ISDoubleTileContainer:new(playerNum, name, sprites.sprite, sprites.sprite2,
        sprites.northSprite, sprites.northSprite2);

    return _doubleTileContainer
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildMannequin = function(sprites, name, playerNum, objectRecipe, objectOptions)
    -- TODO: Make the placing of Mannequins 3D ? Now it's possible to place only facing N. It should be changed in ISMannequin file

    -- local scriptName = objectOptions.scriptName
    -- local scripts = getScriptManager():getAllMannequinScripts()
    -- local script = nil
    -- for i=1,scripts:size() do
    --     local s = scripts:get(i-1)
    --     if s:getName() == scriptName then
    --         script = s;
    --     end
    -- end
    -- if script then
    --     local spriteName = script:isFemale() and "location_shop_mall_01_65" or "location_shop_mall_01_68";
    --     local obj = IsoMannequin.new(getCell(), nil, getSprite(spriteName));
    --     obj:setMannequinScriptName(script:getName());

    --     local item = InventoryItemFactory.CreateItem("Moveables.Moveable");
    --     item:ReadFromWorldSprite(spriteName);
    --     obj:setCustomSettingsToItem(item);
    --     item:setActualWeight(tonumber("1"));
    --     item:setCustomWeight(true);
    -- 	   getSpecificPlayer(playerNum):getInventory():AddItem(item);

    --     local mo = ISMoveableCursor:new(getSpecificPlayer(playerNum));
    --     mo:setMoveableMode("place");
    --     mo:tryInitialItem(item);
    --     BuildingMenu.buildObject(mo, nil, mo.playerNum)
    --     -- getCell():setDrag(mo, mo.playerNum);
    -- else
    --     BM_Utils.debugPrint("[BuildingMenu] ", "Mannequin script now found!!!")
    --     return
    -- end

    local _mannequin = ISMannequin:new(playerNum, sprites.sprite)

    if sprites.northSprite then
        _mannequin:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _mannequin:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _mannequin:setSouthSprite(sprites.southSprite);
    end

    return _mannequin
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildScarecrow = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _scarecrow = ISScarecrow:new(playerNum, sprites.sprite)

    if sprites.northSprite then
        _scarecrow:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _scarecrow:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _scarecrow:setSouthSprite(sprites.southSprite);
    end

    return _scarecrow
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildSkeleton = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _skeleton = ISSkeleton:new(playerNum, sprites.sprite)

    if sprites.northSprite then
        _skeleton:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _skeleton:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _skeleton:setSouthSprite(sprites.southSprite);
    end

    return _skeleton
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildClothingRack = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _clothingRack = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingRack:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingRack:setSouthSprite(sprites.southSprite);
    end

    return _clothingRack
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildDoubleTileFurniture = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _doubleTileFurniture = ISDoubleTileFurniture:new(name, sprites.sprite, sprites.sprite2, sprites.northSprite,
        sprites.northSprite2)

    return _doubleTileFurniture
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildBarricade = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _barricade = ISSimpleFurniture:new(name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _barricade:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _barricade:setSouthSprite(sprites.southSprite)
    end

    local playerObj = getSpecificPlayer(playerNum)
    local health = (playerObj:getPerkLevel(Perks.Woodwork) * 100);
    if playerObj:HasTrait("Handy") then health = health + 250; end

    _barricade.getHealth = function(self)
        if isDebugEnabled() then
            print("[Building Menu] objectOptions.health: ", objectOptions.health,
                " (_barricade.health or 2500) + health: ", (_barricade.health or 2500) + health)
        end
        return (_barricade.health or 2500) + health;
    end

    return _barricade
end


---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWoodenContainer = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _woodenContainer = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _woodenContainer:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _woodenContainer:setSouthSprite(sprites.southSprite)
    end

    return _woodenContainer
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildSimpleFurniture = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _simpleFurniture = ISSimpleFurniture:new(name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _simpleFurniture:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _simpleFurniture:setSouthSprite(sprites.southSprite)
    end

    return _simpleFurniture
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildDoor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _door = ISWoodenDoor:new(sprites.sprite, sprites.northSprite, sprites.openSprite, sprites.openNorthSprite)

    if sprites.eastSprite then
        _door:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _door:setSouthSprite(sprites.southSprite)
    end

    return _door
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onDoubleDoor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local spriteIndexLength = tostring(objectOptions.spriteIndex):len();
    local baseSprite = sprites.sprite:sub(1, -spriteIndexLength - 1);
    local _doubleDoor = ISDoubleDoor:new(baseSprite, objectOptions.spriteIndex);

    return _doubleDoor
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuild3TileGarageDoor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _garageDoor = ISThreeTileGarageDoor:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.northSprite,
        sprites.northSprite2, sprites.northSprite3)

    return _garageDoor
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuild4TileGarageDoor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _garageDoor = ISFourTileGarageDoor:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.sprite4,
        sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    return _garageDoor
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildThreeTileSimpleFurniture = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _threeTileSimpleFurniture = ISThreeTileSimpleFurniture:new(sprites.sprite, sprites.sprite2, sprites.sprite3,
        sprites.northSprite, sprites.northSprite2, sprites.northSprite3)

    return _threeTileSimpleFurniture
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildFourTileSimpleFurniture = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _fourTileSimpleFurniture = ISFourTileSimpleFurniture:new(sprites.sprite, sprites.sprite2, sprites.sprite3,
        sprites.sprite4, sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    return _fourTileSimpleFurniture
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildFourTileFurniture = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _fourTileFurniture = ISFourTileFurniture:new(name, sprites.sprite, sprites.sprite2, sprites.sprite3,
        sprites.sprite4, sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    return _fourTileFurniture
end

BuildingMenu.onBuildDoorFrame = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _doorFrame = ISWoodenDoorFrame:new(sprites.sprite, sprites.northSprite, sprites.corner)

    return _doorFrame
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWall = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _wall = ISWoodenWall:new(sprites.sprite, sprites.northSprite, sprites.corner)

    if sprites.eastSprite then
        _wall:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _wall:setSouthSprite(sprites.southSprite)
    end

    return _wall
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildMetalWall = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _metalWall = ISMetalWall:new(sprites.sprite, sprites.northSprite, sprites.corner)

    if sprites.eastSprite then
        _metalWall:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _metalWall:setSouthSprite(sprites.southSprite)
    end

    return _metalWall
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWaterWell = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _waterwell = ISWaterWell:new(sprites.sprite, sprites.northSprite,
        SandboxVars.BuildingMenuRecipes.maxWaterWellStorageAmount or 1500, getSpecificPlayer(playerNum))

    _waterwell.modData['IsWaterWell'] = true

    return _waterwell
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildHighMetalFence = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _highMetalFence = ISHighMetalFence:new(sprites.sprite, sprites.sprite2, sprites.northSprite,
        sprites.northSprite2)

    return _highMetalFence
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildNaturalFloor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local playerObj = getSpecificPlayer(playerNum);
    local inv = playerObj:getInventory();
    local bag, uses = nil, nil;

    ---@param inv ItemContainer
    ---@param consumables table
    ---@return InventoryItem|nil item, number|nil amount
    local function findBagAndUses(inv, consumables)
        local requiredBags = { ["Base.Dirtbag"] = true, ["Base.Gravelbag"] = true, ["Base.Sandbag"] = true };
        for _, consumable in pairs(consumables) do
            if requiredBags[consumable.Consumable] then
                return inv:getFirstTypeRecurse(consumable.Consumable), consumable.Amount;
            end
        end
    end

    if objectRecipe.useConsumable then
        bag, uses = findBagAndUses(inv, objectRecipe.useConsumable);
    end

    local _floor = ISBMNaturalFloor:new(sprites.sprite, sprites.northSprite, bag, uses, playerObj)

    if sprites.eastSprite then
        _floor:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _floor:setSouthSprite(sprites.southSprite)
    end

    return _floor
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildFloor = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _floor = nil

    if ISBuildingMenuUI.instance and ISBuildingMenuUI.instance.floorIsRoof then
        print("ISBuildingMenuUI.instance.floorIsRoof ", ISBuildingMenuUI.instance.floorIsRoof)
        _floor = ISWoodenRoof:new(sprites.sprite, sprites.northSprite);
    else
        _floor = ISWoodenFloor:new(sprites.sprite, sprites.northSprite);
    end

    if sprites.eastSprite then
        _floor:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _floor:setSouthSprite(sprites.southSprite)
    end

    return _floor
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildFloorOverlay = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _floorOverlay = ISFloorOverlay:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _floorOverlay:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _floorOverlay:setSouthSprite(sprites.southSprite)
    end

    return _floorOverlay
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWallOverlay = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _wallOverlay = ISWallOverlay:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _wallOverlay:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _wallOverlay:setSouthSprite(sprites.southSprite)
    end

    return _wallOverlay
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildStairs = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _stairs = ISWoodenStairs:new(sprites.upToLeft01, sprites.upToLeft02, sprites.upToLeft03, sprites.upToRight01,
        sprites.upToRight02, sprites.upToRight03, sprites.pillar, sprites.pillarNorth)

    return _stairs
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWindowWall = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _windowWall = ISWindowWallObj:new(sprites.sprite, sprites.northSprite, playerNum)

    return _windowWall
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildWindow = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _window = ISWindowObj:new(sprites.sprite, sprites.northSprite, playerNum);

    return _window;
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildGeneratorPoweredLight = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _genPoweredLightSource = ISBMLightSource:new(sprites.sprite, sprites.northSprite, getSpecificPlayer(playerNum));
    _genPoweredLightSource.offsetX = 0;
    _genPoweredLightSource.offsetY = 0;

    if sprites.eastSprite then
        _genPoweredLightSource:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _genPoweredLightSource:setSouthSprite(sprites.southSprite);
    end

    return _genPoweredLightSource;
end

---@param sprites table
---@param name string
---@param playerNum number
---@return ISBuildingObject
BuildingMenu.onBuildBatteryPoweredLight = function(sprites, name, playerNum, objectRecipe, objectOptions)
    local _batteryPoweredLightSource = ISBMLightSource:new(sprites.sprite, sprites.sprite, getSpecificPlayer(playerNum));
    _batteryPoweredLightSource.offsetX = 0;
    _batteryPoweredLightSource.offsetY = 0;

    if sprites.eastSprite then
        _batteryPoweredLightSource:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _batteryPoweredLightSource:setSouthSprite(sprites.southSprite);
    end

    return _batteryPoweredLightSource;
end
