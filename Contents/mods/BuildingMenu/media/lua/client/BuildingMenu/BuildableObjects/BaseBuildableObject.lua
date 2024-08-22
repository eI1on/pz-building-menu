require "ISBaseObject";
local Logger = require("BuildingMenu/Logger");

local BaseBuildableObject = ISBaseObject:derive("BaseBuildableObject");

setmetatable(BaseBuildableObject, {
    __call = function() Logger:error("Cannot instantiate an abstract class (BaseBuildableObject). Derive a new class to use.") end
});

local idRegistry = {};

local function generateHash(spriteName)
    local hash = 0;
    for i = 1, #spriteName do
        hash = (hash + spriteName:byte(i) * i) % 1000000;
    end
    return hash;
end

local function generateUniqueID(spriteName)
    local uniqueID, suffix = generateHash(spriteName), 1;
    while idRegistry[uniqueID] do
        Logger:warn(string.format("ID collision detected for sprite '%s'. Collision on ID: %d. Resolving...", spriteName, uniqueID));
        uniqueID = (uniqueID + suffix) % 1000000;
        suffix = suffix + 1;
    end
    idRegistry[uniqueID] = true;
    return uniqueID;
end

function BaseBuildableObject:new(params)
    local o = ISBaseObject:new();
    setmetatable(o, {
        __index = self,
        __newindex = function() Logger:error("Cannot directly modify attributes of (BaseBuildableObject). Use provided setters.") end
    });

    o.displayName = params.displayName or "IGUI_BuildingName_Unnamed_Object";
    o.info = params.info or "Tooltip_BuildingInfo_Default_Object";
    o.sprites = params.sprites or { sprite = "" };
    o.attrs = params.attrs or {};
    o.recipe = params.recipe or { materials = {}, consumables = {}, tools = {} };

    o.id = params.id and params.id ~= "" and not idRegistry[params.id] and params.id or generateUniqueID(o.sprites.sprite);
    if idRegistry[o.id] then
        Logger:warn(string.format("Duplicate ID '%s' provided for sprite '%s'. Generating a new unique ID.", params.id, o.sprites.sprite));
        o.id = generateUniqueID(o.sprites.sprite);
    end
    idRegistry[o.id] = true;

    return o;
end

function BaseBuildableObject:getID() return self.id; end
function BaseBuildableObject:getDisplayName() return self.displayName; end
function BaseBuildableObject:getSprites() return self.sprites; end
function BaseBuildableObject:getRecipe() return self.recipe; end
function BaseBuildableObject:getAttributes() return self.attrs; end

function BaseBuildableObject:setID(id)
    if not idRegistry[id] then
        idRegistry[self.id] = nil;
        self.id = id;
        idRegistry[id] = true;
    else
        Logger:error("Attempted to set a duplicate ID: " .. id);
    end
end

function BaseBuildableObject:setDisplayName(displayName) self.displayName = displayName; end
function BaseBuildableObject:setSprites(sprites) self.sprites = sprites; end
function BaseBuildableObject:setAttributes(attrs) self.attrs = attrs; end
function BaseBuildableObject:setRecipe(recipe) self.recipe = recipe; end

function BaseBuildableObject:setMaterials(materials) self.recipe.materials = materials; end
function BaseBuildableObject:setMaterial(material, amount) self.recipe.materials[material] = amount; end
function BaseBuildableObject:setConsumables(consumables) self.recipe.consumables = consumables; end
function BaseBuildableObject:setConsumable(consumable, amount) self.recipe.consumables[consumable] = amount; end

function BaseBuildableObject:setTools(tools) self.recipe.tools = tools; end
function BaseBuildableObject:setTool(tool) self.recipe.tools[tool] = true; end

return BaseBuildableObject
