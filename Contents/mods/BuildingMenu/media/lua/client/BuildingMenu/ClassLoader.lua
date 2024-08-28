local string = string;

local Logger = require("BuildingMenu/Logger");

-- ClassRegistry maps class names to their respective module paths
local ClassRegistry = {
    Roof = "BuildingMenu/BuildableObjects/Roof",
    Barbecue = "BuildingMenu/BuildableObjects/Barbecue",
    ClothingDryer = "BuildingMenu/BuildableObjects/ClothingDryer",
    ClothingWasher = "BuildingMenu/BuildableObjects/ClothingWasher",
    CombiantionWasherDryer = "BuildingMenu/BuildableObjects/CombiantionWasherDryer",
    Container = "BuildingMenu/BuildableObjects/Container",
    Curtain = "BuildingMenu/BuildableObjects/Curtain",
    Door = "BuildingMenu/BuildableObjects/Door",
    ElectricOven = "BuildingMenu/BuildableObjects/ElectricOven",
    Floor = "BuildingMenu/BuildableObjects/Floor",
    FloorOverlay = "BuildingMenu/BuildableObjects/FloorOverlay",
    Fridge = "BuildingMenu/BuildableObjects/Fridge",
    Furniture = "BuildingMenu/BuildableObjects/Furniture",
    GarageDoor = "BuildingMenu/BuildableObjects/GarageDoor",
    Generator = "BuildingMenu/BuildableObjects/Generator",
    HighFence = "BuildingMenu/BuildableObjects/HighFence",
    LightSource = "BuildingMenu/BuildableObjects/LightSource",
    Mannequin = "BuildingMenu/BuildableObjects/Mannequin",
    MetalDrum = "BuildingMenu/BuildableObjects/MetalDrum",
    Railings = "BuildingMenu/BuildableObjects/Railings",
    RainCollectorBarrel = "BuildingMenu/BuildableObjects/RainCollectorBarrel",
    Stairs = "BuildingMenu/BuildableObjects/Stairs",
    Wall = "BuildingMenu/BuildableObjects/Wall",
    WallOverlay = "BuildingMenu/BuildableObjects/WallOverlay",
    WallWithDoorFrame = "BuildingMenu/BuildableObjects/WallWithDoorFrame",
    WallWithWindowFrame = "BuildingMenu/BuildableObjects/WallWithWindowFrame",
    WaterWell = "BuildingMenu/BuildableObjects/WaterWell",
    Window = "BuildingMenu/BuildableObjects/Window",
    WoodBurningStove = "BuildingMenu/BuildableObjects/WoodBurningStove",
};

--- Dynamically loads a class from the registry
--- @param className string The name of the class to load
--- @return table|nil module The class module or nil if not found
local function loadClass(className)
    local classPath = ClassRegistry[className];
    if classPath then
        return require(classPath);
    else
        Logger:error(string.format("Unknown buildable class: %s", tostring(className)));
        return nil;
    end
end

return {
    loadClass = loadClass,
    ClassRegistry = ClassRegistry,
};
