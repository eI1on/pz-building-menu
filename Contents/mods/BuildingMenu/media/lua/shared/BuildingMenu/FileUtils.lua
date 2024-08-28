local Logger = require("BuildingMenu/Logger");
local JSON = require("BuildingMenu/JSON");

local FileUtils = {};

--- Reads the entire content of a file
--- @param fileReader BufferedReader The BufferedReader instance
--- @return string|nil content The content of the file or nil if an error occurs
local function bufferedRead(fileReader)
    local buffer = {};
    local line = fileReader:readLine();

    while line do
        table.insert(buffer, line);
        line = fileReader:readLine();
    end

    fileReader:close();
    return table.concat(buffer, "\n");
end

--- Writes content to a file
--- @param fileWriter LuaFileWriter The LuaFileWriter instance
--- @param content string The content to write to the file
--- @return boolean success Returns true if writing was successful, false otherwise
local function bufferedWrite(fileWriter, content)
    local success, err = pcall(function()
        fileWriter:write(content)
        fileWriter:close()
    end);

    if not success then
        Logger:error(string.format("Failed to write content: %s", err));
    end

    return success;
end

--- Reads a text file from mod or Lua directory
--- @param filePath string The path to the file
--- @param options table { modId: string|nil, isModFile: boolean, createIfNull: boolean }
--- @return string|nil content The content of the file or nil if an error occurs
function FileUtils.readFile(filePath, options)
    options = options or {};
    local fileReader;

    if options.isModFile and options.modId then
        fileReader = getModFileReader(options.modId, filePath, options.createIfNull or false);
    else
        fileReader = getFileReader(filePath, options.createIfNull or false);
    end

    if not fileReader then
        -- Logger:error(string.format("Failed to open file for reading: %s in mod '%s'", filePath, options.modId));
        return nil;
    end

    return bufferedRead(fileReader);
end

--- Writes text content to a file in mod or Lua directory
--- @param filePath string The path to the file
--- @param content string The content to write
--- @param options table { modId: string|nil, isModFile: boolean, createIfNull: boolean, append: boolean }
--- @return boolean success Returns true if writing was successful, false otherwise
function FileUtils.writeFile(filePath, content, options)
    options = options or {};
    local fileWriter;

    if options.isModFile and options.modId then
        fileWriter = getModFileWriter(options.modId, filePath, options.createIfNull or false, options.append or false);
    else
        fileWriter = getFileWriter(filePath, options.createIfNull or false, options.append or false);
    end

    if not fileWriter then
        -- Logger:error(string.format("Failed to open file for writing: %s in mod '%s'", filePath, options.modId));
        return false;
    end

    return bufferedWrite(fileWriter, content);
end

--- Reads and parses a JSON file from mod or Lua directory.
--- @param filePath string The path to the JSON file.
--- @param options table { modId: string|nil, isModFile: boolean }
--- @return table|nil data The parsed JSON data as a Lua table or nil if an error occurs.
function FileUtils.readJson(filePath, options)
    local content = FileUtils.readFile(filePath, options);
    if not content then return nil; end

    local success, data = pcall(JSON.parse, content)
    if not success then
        Logger:error(string.format("Failed to parse JSON from file: %s in mod '%s'. Error: %s", filePath,
            options.modId or 'nil', data));
        return nil;
    end

    return data;
end

--- Serializes and writes a Lua table as JSON to a file in mod or Lua directory.
--- @param filePath string The path to the JSON file.
--- @param data table The Lua table to serialize and write.
--- @param options table { modId: string|nil, isModFile: boolean, append: boolean }
--- @return boolean success Returns true if writing was successful, false otherwise.
function FileUtils.writeJson(filePath, data, options)
    local success, content = pcall(JSON.stringify, data);
    if not success then
        Logger:error(string.format("Failed to serialize data to JSON for file: %s in mod '%s'. Error: %s", filePath,
            options.modId or 'nil', content));
        return false;
    end

    return FileUtils.writeFile(filePath, content, options);
end

return FileUtils
