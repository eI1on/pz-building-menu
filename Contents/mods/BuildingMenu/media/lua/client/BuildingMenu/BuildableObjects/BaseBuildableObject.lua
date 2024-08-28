require "ISBaseObject";

local tostring = tostring;

local Logger = require("BuildingMenu/Logger");

--- @class BaseBuildableObject: ISBaseObject
local BaseBuildableObject = ISBaseObject:derive("BaseBuildableObject");

--- @type table<string, boolean>
local idRegistry = {};

--- Generates a numeric hash based on the sprite name.
--- @param spriteName string
--- @return number hash
local function generateHash(spriteName)
    local hash = 0;
    for i = 1, #spriteName do
        hash = (hash + spriteName:byte(i) * i) % 1000000;
    end
    return hash;
end

--- Generates a unique ID for a buildable object, avoiding collisions.
--- @param spriteName string
--- @return number uniqueID
local function generateUniqueID(spriteName)
    local uniqueID, suffix = generateHash(spriteName), 1;
    while idRegistry[uniqueID] do
        -- Logger:warning(string.format("ID collision detected for sprite '%s'. Collision on ID: %d. Resolving...",
        --     spriteName,
        --     uniqueID));
        uniqueID = (uniqueID + suffix) % 1000000;
        suffix = suffix + 1;
    end
    return uniqueID;
end

--- Creates a new BaseBuildableObject instance.
--- @param params table Parameters for initializing the buildable object.
--- @return BaseBuildableObject
function BaseBuildableObject:new(params)
    local o = {};
    setmetatable(o, {
        __index = self,
        __newindex = function(table, key, value)
            local setters = {
                id = self.setID,
                displayName = self.setDisplayName,
                info = self.setInfo,
                sprites = self.setSprites,
                attrs = self.setAttributes,
                recipes = self.setRecipes,
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
        local sprite = "";
        if params.sprites and params.sprites[1] then
            sprite = params.sprites[1].sprite or params.sprites[1].northSprite or "";
        end
        idToSet = generateUniqueID(sprite);
    end

    o:setID(idToSet);

    o:setDisplayName(params.displayName and "IGUI_BuildableName_" .. params.displayName or
        "IGUI_BuildableName_Unnamed_Object");
    o:setInfo(params.info and "IGUI_BuildableInfo_" .. params.info or "");

    o:setSprites(params.sprites or {});
    o:setRecipes(params.recipes or {});

    o:setAttributes(params.attrs or {});

    return o;
end

--- Returns the ID of the buildable object.
--- @return string
function BaseBuildableObject:getID() return self.id; end

--- Returns the translation key for the display name of the buildable object.
--- @return string
function BaseBuildableObject:getDisplayName() return self.displayName; end

--- Returns the information translation key of the buildable object.
--- @return string
function BaseBuildableObject:getInfo() return self.info; end

--- Returns the sprites associated with the buildable object. Optionally for a specific stage.
--- @param stage number|nil The stage of construction (optional).
--- @return table
function BaseBuildableObject:getSprites(stage)
    if stage then
        return self.sprites[stage];
    else
        return self.sprites;
    end
end

--- Returns the recipe for the buildable object. Optionally for a specific stage.
--- @param stage number|nil The stage of construction (optional).
--- @return table
function BaseBuildableObject:getRecipe(stage)
    if stage then
        return self.recipes[stage];
    else
        return self.recipes;
    end
end

--- Returns the attributes of the buildable object. Optionally for a specific stage.
--- @param stage number|nil The stage of construction (optional).
--- @return table
function BaseBuildableObject:getAttributes(stage)
    if stage then
        return self.attrs[stage];
    else
        return self.attrs;
    end
end

--- Sets the ID of the buildable object, ensuring no duplicates.
--- @param id string
function BaseBuildableObject:setID(id)
    if idRegistry[id] then
        Logger:error(string.format("Attempted to set a duplicate ID: %s. Current ID: %s", tostring(id), tostring(self.id)));
    else
        if self.id then
            idRegistry[self.id] = nil;
        end
        rawset(self, "id", id);
        idRegistry[id] = true;
    end
end

--- Sets the display name of the buildable object.
--- @param displayName string
function BaseBuildableObject:setDisplayName(displayName)
    if type(displayName) ~= "string" then
        Logger:error(string.format("ID: %s. Invalid displayName: %s. Expected a string.", tostring(self.id),
            tostring(displayName)));
    else
        rawset(self, "displayName", displayName);
    end
end

--- Sets the information tooltip for the buildable object.
--- @param info string
function BaseBuildableObject:setInfo(info)
    if type(info) ~= "string" then
        Logger:error(string.format("ID: %s. Invalid info: %s. Expected a string.", tostring(self.id), tostring(info)))
    else
        rawset(self, "info", info)
    end
end

--- Sets the sprites for the buildable object.
--- @param sprites table
function BaseBuildableObject:setSprites(sprites)
    if type(sprites) ~= "table" then
        Logger:error(string.format("ID: %s. Invalid sprites: %s. Expected a table.", tostring(self.id), tostring(sprites)))
        return
    end

    for stage, spriteTable in ipairs(sprites) do
        if type(spriteTable) ~= "table" or not spriteTable.sprite then
            Logger:error(string.format(
            "ID: %s. Invalid sprite data for stage %d: %s. Expected a table with at least a 'sprite' field.",
                tostring(self.id), stage, tostring(spriteTable)))
            return
        end
    end

    rawset(self, "sprites", sprites);
end

--- Sets the attributes for the buildable object.
--- @param attrs table
function BaseBuildableObject:setAttributes(attrs)
    if type(attrs) ~= "table" then
        Logger:error(string.format("ID: %s. Invalid attributes: %s. Expected a table.", tostring(self.id),
            tostring(attrs)))
    else
        rawset(self, "attrs", attrs)
    end
end

--- Sets the recipes for the buildable object.
--- @param recipes table
function BaseBuildableObject:setRecipes(recipes)
    if type(recipes) ~= "table" then
        Logger:error(string.format("ID: %s. Invalid recipes: %s. Expected a table.", tostring(self.id), tostring(recipes)));
        return;
    end

    for stage, recipeTable in ipairs(recipes) do
        if type(recipeTable) ~= "table" then
            Logger:error(string.format("ID: %s. Invalid recipe data for stage %d: %s. Expected a table.",
                tostring(self.id), stage, tostring(recipeTable)));
            return;
        end

        if recipeTable.skills then
            for _, skill in ipairs(recipeTable.skills) do
                if not skill.skill or not skill.level then
                    Logger:error(string.format(
                    "ID: %s. Invalid skill data in stage %d: %s. Expected a 'skill' and 'level'.", tostring(self.id),
                        stage, tostring(skill)));
                    return;
                end
                if not skill.xp then
                    skill.xp = "auto"; -- "auto" if not provided
                end
            end
        end
    end

    rawset(self, "recipes", recipes);
end

--- Sets the sprite information for a specific construction stage.
--- @param stage number The stage of construction.
--- @param spriteTable table A table containing sprite data.
function BaseBuildableObject:setStageSprite(stage, spriteTable)
    if type(spriteTable) ~= "table" or not spriteTable.sprite then
        Logger:error(string.format(
        "ID: %s. Invalid sprite data for stage %d: %s. Expected a table with at least a 'sprite' field.",
            tostring(self.id), stage, tostring(spriteTable)));
        return;
    end

    if not self.sprites[stage] then
        self.sprites[stage] = {};
    end
    for k, v in pairs(spriteTable) do
        self.sprites[stage][k] = v;
    end
end

--- Sets the recipe information for a specific construction stage.
--- @param stage number The stage of construction.
--- @param recipeTable table A table containing recipe data.
function BaseBuildableObject:setStageRecipe(stage, recipeTable)
    if type(recipeTable) ~= "table" then
        Logger:error(string.format("ID: %s. Invalid recipe data for stage %d: %s. Expected a table.", tostring(self.id),
            stage, tostring(recipeTable)));
        return;
    end

    if recipeTable.skills then
        for _, skill in ipairs(recipeTable.skills) do
            if not skill.skill or not skill.level then
                Logger:error(string.format("ID: %s. Invalid skill data in stage %d: %s. Expected a 'skill' and 'level'.",
                    tostring(self.id), stage, tostring(skill)));
                return;
            end
            if not skill.xp then
                skill.xp = "auto"; -- "auto" if not provided
            end
        end
    end

    if not self.recipes[stage] then
        self.recipes[stage] = {
            materials = {},
            consumables = {},
            tools = {},
            skills = {}
        };
    end
    for k, v in pairs(recipeTable) do
        self.recipes[stage][k] = v;
    end
end

--- Sets the materials required for a specific construction stage.
--- @param stage number The stage of construction.
--- @param materials table A table containing material data.
function BaseBuildableObject:setStageMaterials(stage, materials)
    self:setStageRecipe(stage, { materials = materials });
end

--- Sets the consumables required for a specific construction stage.
--- @param stage number The stage of construction.
--- @param consumables table A table containing consumable data.
function BaseBuildableObject:setStageConsumables(stage, consumables)
    self:setStageRecipe(stage, { consumables = consumables });
end

--- Sets the tools required for a specific construction stage.
--- @param stage number The stage of construction.
--- @param tools table A table containing tool data.
function BaseBuildableObject:setStageTools(stage, tools)
    self:setStageRecipe(stage, { tools = tools });
end

--- Sets the skills required for a specific construction stage.
--- @param stage number The stage of construction.
--- @param skills table A table containing skill data.
function BaseBuildableObject:setStageSkills(stage, skills)
    self:setStageRecipe(stage, { skills = skills });
end

return BaseBuildableObject
