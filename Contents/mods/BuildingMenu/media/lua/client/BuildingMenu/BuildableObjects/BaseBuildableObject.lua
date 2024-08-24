require "ISBaseObject";
local Logger = require("BuildingMenu/Logger");

local BaseBuildableObject = ISBaseObject:derive("BaseBuildableObject");

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
    return uniqueID;
end

function BaseBuildableObject:new(params)
    local o = {};
    setmetatable(o, {
        __index = self,
        __newindex = function(table, key, value)
            local setters = {
                id = self.setID,
                displayName = self.setDisplayName,
                sprites = self.setSprites,
                attrs = self.setAttributes,
                recipe = self.setRecipe,
            }
            if setters[key] then
                setters[key](table, value);
            else
                rawset(table, key, value);
            end
        end
    });

    local idToSet = params.id;
    if not idToSet or idRegistry[idToSet] then
        idToSet = generateUniqueID(params.sprites and params.sprites.sprite or "");
    end

    o:setID(idToSet);
    o:setDisplayName(params.displayName or "IGUI_BuildingName_Unnamed_Object");
    o:setSprites(params.sprites or { sprite = "" });
    o:setAttributes(params.attrs or {});
    o:setRecipe(params.recipe or { materials = {}, consumables = {}, tools = {} });

    return o;
end

function BaseBuildableObject:getID() return self.id; end
function BaseBuildableObject:getDisplayName() return self.displayName; end
function BaseBuildableObject:getSprites() return self.sprites; end
function BaseBuildableObject:getRecipe() return self.recipe; end
function BaseBuildableObject:getAttributes() return self.attrs; end

function BaseBuildableObject:setID(id)
    if idRegistry[id] then
        Logger:error("Attempted to set a duplicate ID: " .. id);
    else
        if self.id then idRegistry[self.id] = nil; end
        rawset(self, "id", id);
        idRegistry[id] = true;
    end
end

function BaseBuildableObject:setDisplayName(displayName) rawset(self, "displayName", displayName); end
function BaseBuildableObject:setSprites(sprites) rawset(self, "sprites", sprites); end
function BaseBuildableObject:setAttributes(attrs) rawset(self, "attrs", attrs); end
function BaseBuildableObject:setRecipe(recipe) rawset(self, "recipe", recipe); end

function BaseBuildableObject:setMaterials(materials) rawset(self.recipe, "materials", materials); end
function BaseBuildableObject:setMaterial(material, amount) rawset(self.recipe.materials, material, amount); end

function BaseBuildableObject:setConsumables(consumables) rawset(self.recipe, "consumables", consumables); end
function BaseBuildableObject:setConsumable(consumable, amount) rawset(self.recipe.consumables, consumable, amount); end

function BaseBuildableObject:setTools(tools) rawset(self.recipe, "tools", tools); end
function BaseBuildableObject:setTool(tool) rawset(self.recipe.tools, tool, true); end

return BaseBuildableObject
