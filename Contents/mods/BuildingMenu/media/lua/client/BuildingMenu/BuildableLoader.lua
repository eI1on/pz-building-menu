local Logger = require("BuildingMenu/Logger");
local Utils = require("BuildingMenu/Utils");
local ClassLoader = require("BuildingMenu/ClassLoader")

local BuildableLoader = {};
BuildableLoader.scripts = {};

function BuildableLoader.loadFromMods()
    BuildableLoader.scripts = {};
    local list = getActivatedMods();

    for i = 0, list:size() - 1 do
        local mod = tostring(list:get(i));
        local configPath = "media/buildables/buildable_config.lua";
        local fileReader = getModFileReader(mod, configPath, false);

        if fileReader then
            Logger:info(string.format("Found 'buildable_config.lua' in mod '%s'.", mod));

            local fileContent = "";
            local line = fileReader:readLine();
            while line do
                fileContent = fileContent .. line .. "\n";
                line = fileReader:readLine();
            end
            fileReader:close();

            local status, configTable = pcall(loadstring(fileContent));
            if status and type(configTable) == "table" and configTable.buildables then
                local entry = { mod = mod, buildableFiles = configTable.buildables };
                BuildableLoader.scripts[#BuildableLoader.scripts + 1] = entry;
            else
                Logger:error(string.format("Failed to load or parse 'buildable_config.lua' in mod '%s'.", mod));
            end
        end
    end
end

--- Loads all buildable objects from the collected scripts
--- @return table BuildableObjectsRepository A table containing all the created buildable objects from all mods
function BuildableLoader.loadAllBuildables()
    local BuildableObjectsRepository = {};

    for _, script in ipairs(BuildableLoader.scripts) do
        for _, jsonFilename in ipairs(script.buildableFiles) do

            local startTime = getTimestampMs();

            local buildableData = Utils.jsonutil.load(script.mod, jsonFilename);

            local endTime = getTimestampMs();
            local loadTime = endTime - startTime;
            Logger:info(string.format("Loaded JSON file '%s' from mod '%s' in %d ms", jsonFilename, script.mod, loadTime));

            if buildableData then
                for _, data in ipairs(buildableData) do
                    local class = data.class;
                    local ClassModule = ClassLoader.loadClass(class);
                    local obj;

                    if ClassModule then
                        obj = ClassModule:new(data);
                    end

                    if obj then
                        BuildableObjectsRepository[data.primaryCategory] = BuildableObjectsRepository[data.primaryCategory] or {};
                        local primary = BuildableObjectsRepository[data.primaryCategory];

                        if data.secondaryCategory then
                            primary[data.secondaryCategory] = primary[data.secondaryCategory] or {};
                            local secondary = primary[data.secondaryCategory];

                            if data.tertiaryCategory then
                                secondary[data.tertiaryCategory] = secondary[data.tertiaryCategory] or {};
                                local tertiary = secondary[data.tertiaryCategory];
                                tertiary[obj:getID()] = obj;
                            else
                                secondary[obj:getID()] = obj;
                            end
                        else
                            primary[obj:getID()] = obj;
                        end
                    end
                end
            else
                Logger:error(string.format("Failed to load buildable objects from JSON: %s in mod %s", jsonFilename, script.mod));
            end
        end
    end

    return BuildableObjectsRepository;
end

return BuildableLoader
