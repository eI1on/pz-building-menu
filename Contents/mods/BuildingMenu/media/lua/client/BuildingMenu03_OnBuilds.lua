if not getBuildingMenuInstance then
    require("BuildingMenu01_Main")
end

local BuildingMenu = getBuildingMenuInstance()

local exclusions = {
    health = true
}

function BuildingMenu.buildObject(object, name, player, objectRecipe, objectOptions)
    object.name = name;
    object.player = player;

    if not objectRecipe then return end

    local modData = object.modData; -- cache modData reference.

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

    local neededTools = objectRecipe.neededTools
    if neededTools then
        BuildingMenu.equipToolPrimary(object, player, neededTools[1]);
        -- if neededTools[2] then
        --     BuildingMenu.equipToolSecondary(object, player, neededTools[2]);
        -- end
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
            end
        end

        if objectOptions.containerType then
            object.getHealth = function(self)
                return objectOptions.health or buildUtil.getWoodHealth(self)
            end
        end

        if isDebugEnabled() then
            BuildingMenu.debugPrint("[Building Menu Debug] ", objectOptions)
        end
    end

    getCell():setDrag(object, player)
end




BuildingMenu.onBuildSink = function( sprites, name, player, objectRecipe, objectOptions)
    local _sink = ISSink:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _sink:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _sink:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_sink, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildBathtub = function( sprites, name, player, objectRecipe, objectOptions)
    local _bathtub = ISBathtub:new(player, name, sprites.sprite, sprites.sprite2, sprites.northSprite1, sprites.northSprite2);

    BuildingMenu.buildObject(_bathtub, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildFireplace = function( sprites, name, player, objectRecipe, objectOptions)
    local _fireplace = ISStove:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _fireplace:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _fireplace:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_fireplace, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildOven = function( sprites, name, player, objectRecipe, objectOptions)
    local _oven = ISOven:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _oven:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _oven:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_oven, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildStove = function( sprites, name, player, objectRecipe, objectOptions)
    local _stove = ISStove:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _stove:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _stove:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_stove, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildBarbecue = function( sprites, name, player, objectRecipe, objectOptions)
    local _stove = ISBarbecue:new(player, name, sprites.sprite, sprites.northSprite)

    BuildingMenu.buildObject(_stove, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildGenerator = function( sprites, name, player, objectRecipe, objectOptions)
    local _generator = ISGenerator:new(sprites.sprite, sprites.northSprite)

    BuildingMenu.buildObject(_generator, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildMicrowaveOven = function( sprites, name, player, objectRecipe, objectOptions)
    local _microwaveOven = ISMicrowaveOven:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _microwaveOven:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _microwaveOven:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_microwaveOven, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildSimpleFridge = function( sprites, name, player, objectRecipe, objectOptions)
    local _simpleFridge = ISFridge:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _simpleFridge:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _simpleFridge:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_simpleFridge, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildLargeFridge = function( sprites, name, player, objectRecipe, objectOptions)
    local _doubleFridge = ISDoubleFridge:new(player, name, sprites.sprite, sprites.sprite2, sprites.northSprite1, sprites.northSprite2);

    BuildingMenu.buildObject(_doubleFridge, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildPopsicleFridge = function( sprites, name, player, objectRecipe, objectOptions)
    local _popsicleFridge = ISPopsicleFridge:new(player, name, sprites.sprite, sprites.sprite2, sprites.northSprite1, sprites.northSprite2);

    BuildingMenu.buildObject(_popsicleFridge, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildCombinationWasherDryer = function( sprites, name, player, objectRecipe, objectOptions)
    local _combinationWasherDryer = ISCombinationWasherDryer:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _combinationWasherDryer:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _combinationWasherDryer:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_combinationWasherDryer, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildClothingDryer = function( sprites, name, player, objectRecipe, objectOptions)
    local _clothingDryer = ISClothingDryer:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingDryer:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingDryer:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_clothingDryer, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildClothingWasher = function( sprites, name, player, objectRecipe, objectOptions)
    local _clothingWasher = ISClothingWasher:new(player, name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingWasher:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingWasher:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_clothingWasher, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildWashingBin = function( sprites, name, player, objectRecipe, objectOptions)
    local _washingBin = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
    _washingBin:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
    _washingBin:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_washingBin, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildMetalCounter = function( sprites, name, player, objectRecipe, objectOptions)
    local _metalCounter = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _metalCounter:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _metalCounter:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_metalCounter, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildMetalShelf = function( sprites, name, player, objectRecipe, objectOptions)
    local _metalshelf = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _metalshelf:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _metalshelf:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_metalshelf, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildDoubleMetalShelf = function( sprites, name, player, objectRecipe, objectOptions)
    local _metalDoubleShelf = ISDoubleMetalShelf:new(player, name, sprites.sprite, sprites.sprite2, sprites.northSprite1, sprites.northSprite2);

    BuildingMenu.buildObject(_metalDoubleShelf, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildMannequin = function( sprites, name, player, objectRecipe, objectOptions)
    local _mannequin = ISMannequin:new(player, sprites.sprite)

    if sprites.northSprite then
        _mannequin:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _mannequin:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _mannequin:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_mannequin, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildScarecrow = function( sprites, name, player, objectRecipe, objectOptions)
    local _scarecrow = ISScarecrow:new(player, sprites.sprite)

    if sprites.northSprite then
        _scarecrow:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _scarecrow:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _scarecrow:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_scarecrow, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildSkeleton = function( sprites, name, player, objectRecipe, objectOptions)
    local _skeleton = ISSkeleton:new(player, sprites.sprite)

    if sprites.northSprite then
        _skeleton:setNorthSprite(sprites.northSprite);
    end

    if sprites.eastSprite then
        _skeleton:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _skeleton:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_skeleton, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildClothingRack = function( sprites, name, player, objectRecipe, objectOptions)
    local _clothingRack = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _clothingRack:setEastSprite(sprites.eastSprite);
    end

    if sprites.southSprite then
        _clothingRack:setSouthSprite(sprites.southSprite);
    end

    BuildingMenu.buildObject(_clothingRack, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildDoubleClothingRack = function( sprites, name, player, objectRecipe, objectOptions)
    local _doubleClothingRack = ISDoubleClothingRack:new(player, name, sprites.sprite, sprites.sprite2, sprites.northSprite1, sprites.northSprite2);

    BuildingMenu.buildObject(_doubleClothingRack, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildDoubleTileFurniture = function( sprites, name, player, objectRecipe, objectOptions)
    local _doubleTileFurniture = ISDoubleTileFurniture:new(name, sprites.sprite, sprites.sprite2, sprites.northSprite, sprites.northSprite2)

    BuildingMenu.buildObject(_doubleTileFurniture, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildWoodenContainer = function( sprites, name, player, objectRecipe, objectOptions)
    local _woodenContainer = ISWoodenContainer:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _woodenContainer:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _woodenContainer:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_woodenContainer, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildSimpleFurniture = function( sprites, name, player, objectRecipe, objectOptions)
    local _simpleFurniture = ISSimpleFurniture:new(name, sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _simpleFurniture:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _simpleFurniture:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_simpleFurniture, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildDoor = function( sprites, name, player, objectRecipe, objectOptions)
    local _door = ISWoodenDoor:new(sprites.sprite, sprites.northSprite, sprites.openSprite, sprites.openNorthSprite)

    if sprites.eastSprite then
        _door:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _door:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_door, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuild3TileGarageDoor = function( sprites, name, player, objectRecipe, objectOptions)
    local _garageDoor = ISThreeTileGarageDoor:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.northSprite, sprites.northSprite2, sprites.northSprite3)

    BuildingMenu.buildObject(_garageDoor, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuild4TileGarageDoor = function( sprites, name, player, objectRecipe, objectOptions)
    local _garageDoor = ISFourTileGarageDoor:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.sprite4, sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    BuildingMenu.buildObject(_garageDoor, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildThreeTileSimpleFurniture = function( sprites, name, player, objectRecipe, objectOptions)
    local _threeTileSimpleFurniture = ISThreeTileGarageDoor:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.northSprite, sprites.northSprite2, sprites.northSprite3)

    BuildingMenu.buildObject(_threeTileSimpleFurniture, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildFourTileSimpleFurniture = function( sprites, name, player, objectRecipe, objectOptions)
    local _fourTileSimpleFurniture = ISFourTileSimpleFurniture:new(sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.sprite4, sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    BuildingMenu.buildObject(_fourTileSimpleFurniture, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildFourTileFurniture = function( sprites, name, player, objectRecipe, objectOptions)
    local _fourTileFurniture = ISFourTileFurniture:new(name, sprites.sprite, sprites.sprite2, sprites.sprite3, sprites.sprite4, sprites.northSprite, sprites.northSprite2, sprites.northSprite3, sprites.northSprite4)

    BuildingMenu.buildObject(_fourTileFurniture, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildDoorFrame = function( sprites, name, player, objectRecipe, objectOptions)
    local _doorFrame = ISWoodenDoorFrame:new(sprites.sprite, sprites.northSprite, sprites.corner)

    BuildingMenu.buildObject(_doorFrame, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildWall = function( sprites, name, player, objectRecipe, objectOptions)
    local _wall = ISWoodenWall:new(sprites.sprite, sprites.northSprite, sprites.corner)

    if sprites.eastSprite then
        _wall:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _wall:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_wall, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildWaterWell = function( sprites, name, player, objectRecipe, objectOptions)
    local _waterwell = ISWaterWell:new(sprites.sprite, sprites.northSprite, getSpecificPlayer(player))

    BuildingMenu.buildObject(_waterwell, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildHighMetalFence = function( sprites, name, player, objectRecipe, objectOptions)
    local _highMetalFence = ISHighMetalFence:new(sprites.sprite, sprites.sprite2, sprites.northSprite, sprites.northSprite2)

    BuildingMenu.buildObject(_highMetalFence, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildFloor = function( sprites, name, player, objectRecipe, objectOptions)
    local _floor = ISWoodenFloor:new(sprites.sprite, sprites.northSprite)

    if sprites.eastSprite then
        _floor:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _floor:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_floor, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildStairs = function( sprites, name, player, objectRecipe, objectOptions)
    local _stairs = ISWoodenStairs:new(sprites.upToLeft01, sprites.upToLeft02, sprites.upToLeft03, sprites.upToRight01, sprites.upToRight02, sprites.upToRight03, sprites.pillar, sprites.pillarNorth)

    BuildingMenu.buildObject(_stairs, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildWindowWall = function( sprites, name, player, objectRecipe, objectOptions)
    local _windowWall = ISWindowWallObj:new(sprites.sprite, sprites.northSprite, player)

    BuildingMenu.buildObject(_windowWall, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildWindow = function( sprites, name, player, objectRecipe, objectOptions)
    local _window = ISWindowObj:new(sprites.sprite, sprites.northSprite, player)

    BuildingMenu.buildObject(_window, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildLightSource = function( sprites, name, player, objectRecipe, objectOptions)
    local _lightSource = ISLightSource:new(sprites.sprite, sprites.northSprite, getSpecificPlayer(player))

    _lightSource.offsetX = 0
    _lightSource.offsetY = 0

    _lightSource.fuel = 'Base.Battery'
    _lightSource.baseItem = 'Base.LightBulb'
    _lightSource.radius = 40

    _lightSource.modData['IsLighting'] = true

    if sprites.eastSprite then
        _lightSource:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _lightSource:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_lightSource, name, player, objectRecipe, objectOptions)
end

BuildingMenu.onBuildLightPole = function( sprites, name, player, objectRecipe, objectOptions)
    local _lightPole = ISLightSource:new(sprites.sprite, sprites.sprite, getSpecificPlayer(player))

    _lightPole.offsetX = 0
    _lightPole.offsetY = 0

    _lightPole.fuel = 'Base.Battery'
    _lightPole.baseItem = 'Base.LightBulb'
    _lightPole.radius = 20

    _lightPole.modData['IsLighting'] = true

    if sprites.eastSprite then
        _lightPole:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _lightPole:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_lightPole, name, player, objectRecipe, objectOptions)
end


BuildingMenu.onBuildOutdoorLight = function( sprites, name, player, objectRecipe, objectOptions)
    local _outdoorLight = ISLightSource:new(sprites.sprite, sprites.northSprite, getSpecificPlayer(player))

    _outdoorLight.offsetX = 0
    _outdoorLight.offsetY = 0

    _outdoorLight.fuel = 'Base.Battery'
    _outdoorLight.baseItem = 'Base.LightBulb'
    _outdoorLight.radius = 20

    _outdoorLight.modData['IsLighting'] = true

    if sprites.eastSprite then
        _outdoorLight:setEastSprite(sprites.eastSprite)
    end

    if sprites.southSprite then
        _outdoorLight:setSouthSprite(sprites.southSprite)
    end

    BuildingMenu.buildObject(_outdoorLight, name, player, objectRecipe, objectOptions)
end
