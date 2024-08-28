local Logger = require("BuildingMenu/Logger");
local FileUtils = require("BuildingMenu/FileUtils");
local ClassLoader = require("BuildingMenu/ClassLoader");

local BuildableLoader = {};
BuildableLoader.scripts = {};

--- Loads buildable configurations from all activated mods.
function BuildableLoader.loadFromMods()
    BuildableLoader.scripts = {};
    local activatedMods = getActivatedMods();

    for i = 0, activatedMods:size() - 1 do
        local modId = tostring(activatedMods:get(i));
        local configPath = "media/buildables/buildable_config.lua";

        local fileContent = FileUtils.readFile(configPath, { modId = modId, isModFile = true, createIfNull = false });

        if fileContent then
            local loadFunction, loadError = loadstring(fileContent);
            if not loadFunction then
                Logger:error(string.format("Failed to load 'buildable_config.lua' in mod '%s': %s", modId, loadError));
            else
                local success, configTable = pcall(loadFunction);
                if success and type(configTable) == "table" and configTable.buildables then
                    table.insert(BuildableLoader.scripts, {
                        modId = modId,
                        buildableFiles = configTable.buildables
                    });
                    Logger:info(string.format("Loaded buildable configuration from mod '%s'.", modId));
                else
                    Logger:error(string.format("Invalid configuration in 'buildable_config.lua' of mod '%s'.", modId));
                end
            end
        else
            -- Logger:warning(string.format("'buildable_config.lua' not found in mod '%s'.", modId));
        end
    end
end

--- Loads all buildable objects from the collected scripts.
--- @return table buildableObjectsRepository A table containing all the created buildable objects from all mods.
function BuildableLoader.loadAllBuildables()
    local buildableObjectsRepository = {};

    for _, script in ipairs(BuildableLoader.scripts) do
        for _, jsonFilename in ipairs(script.buildableFiles) do
            local filePath = "media/buildables/" .. jsonFilename;
            local startTime = getTimestampMs();

            local buildableData = FileUtils.readJson(filePath,
                { modId = script.modId, isModFile = true, createIfNull = false });

            local endTime = getTimestampMs();
            local loadTime = endTime - startTime;
            Logger:info(string.format("Loaded JSON file '%s' from mod '%s' in %d ms", jsonFilename, script.modId,
                loadTime));

            if buildableData then
                for _, data in ipairs(buildableData) do
                    local className = data.class;
                    local classModule = ClassLoader.loadClass(className);

                    if classModule then
                        local buildableObject = classModule:new(data);
                        if buildableObject then
                            local primaryCategory = data.primaryCategory or "Uncategorized";
                            local secondaryCategory = data.secondaryCategory;
                            local tertiaryCategory = data.tertiaryCategory;

                            buildableObjectsRepository[primaryCategory] = buildableObjectsRepository[primaryCategory] or
                                {};
                            local primary = buildableObjectsRepository[primaryCategory];

                            if secondaryCategory then
                                primary[secondaryCategory] = primary[secondaryCategory] or {};
                                local secondary = primary[secondaryCategory];

                                if tertiaryCategory then
                                    secondary[tertiaryCategory] = secondary[tertiaryCategory] or {};
                                    local tertiary = secondary[tertiaryCategory];
                                    tertiary[buildableObject:getID()] = buildableObject;
                                else
                                    secondary[buildableObject:getID()] = buildableObject;
                                end
                            else
                                primary[buildableObject:getID()] = buildableObject;
                            end
                        else
                            Logger:error(string.format("Failed to create buildable object for class '%s' in mod '%s'.",
                                className, script.modId));
                        end
                    else
                        Logger:error(string.format("Class '%s' not found for buildable object in mod '%s'.", className,
                            script.modId));
                    end
                end
            else
                Logger:error(string.format("Failed to load buildable data from '%s' in mod '%s'.", jsonFilename,
                    script.modId));
            end
        end
    end

    return buildableObjectsRepository;
end

return BuildableLoader;
