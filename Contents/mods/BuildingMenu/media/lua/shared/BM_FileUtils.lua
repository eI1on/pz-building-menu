local BM_Logger = require("BM_Logger");
local BM_Json = require("BM_Json");

local BM_FileUtils = {};

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
local function writeToFile(fileWriter, content)
    local success, err = pcall(function() fileWriter:write(content); fileWriter:close(); end);

    if not success then
        BM_Logger:error(string.format("Failed to write content: %s", err));
    end

    return success;
end

--- Reads a text file from mod or Lua directory
--- @param filePath string The path to the file
--- @param options table { modId: string|nil, isModFile: boolean, createIfNull: boolean }
--- @return string|nil content The content of the file or nil if an error occurs
function BM_FileUtils.readFile(filePath, options)
    options = options or {};
    local fileReader;

    if options.isModFile and options.modId then
        fileReader = getModFileReader(options.modId, filePath, options.createIfNull or false);
    else
        fileReader = getFileReader(filePath, options.createIfNull or false);
    end

    if not fileReader then
        -- BM_Logger:error(string.format("Failed to open file for reading: %s in mod '%s'", filePath, options.modId));
        return nil;
    end

    return bufferedRead(fileReader);
end

--- Writes text content to a file in mod or Lua directory
--- @param filePath string The path to the file
--- @param content string The content to write
--- @param options table { modId: string|nil, isModFile: boolean, createIfNull: boolean, append: boolean }
--- @return boolean success Returns true if writing was successful, false otherwise
function BM_FileUtils.writeFile(filePath, content, options)
    options = options or {};
    local fileWriter;

    if options.isModFile and options.modId then
        fileWriter = getModFileWriter(options.modId, filePath, options.createIfNull or false, options.append or false);
    else
        fileWriter = getFileWriter(filePath, options.createIfNull or false, options.append or false);
    end

    if not fileWriter then
        -- BM_Logger:error(string.format("Failed to open file for writing: %s in mod '%s'", filePath, options.modId));
        return false;
    end

    return writeToFile(fileWriter, content);
end

--- Reads and parses a json file from mod or Lua directory.
--- @param filePath string The path to the json file.
--- @param options table { modId: string|nil, isModFile: boolean }
--- @return table|nil data The parsed json data as a Lua table or nil if an error occurs.
function BM_FileUtils.readJson(filePath, options)
    local content = BM_FileUtils.readFile(filePath, options);
    if not content then return nil; end

    local success, data = pcall(BM_Json.parse, content)
    if not success then
        BM_Logger:error(string.format("Failed to parse json from file: %s in mod '%s'. Error: %s", filePath,
            options.modId or 'nil', data));
        return nil;
    end

    return data;
end

--- Serializes and writes a Lua table as json to a file in mod or Lua directory.
--- @param filePath string The path to the json file.
--- @param data table The Lua table to serialize and write.
--- @param options table { modId: string|nil, isModFile: boolean, append: boolean }
--- @return boolean success Returns true if writing was successful, false otherwise.
function BM_FileUtils.writeJson(filePath, data, options)
    local success, content = pcall(BM_Json.stringify, data);
    if not success then
        BM_Logger:error(string.format("Failed to serialize data to json for file: %s in mod '%s'. Error: %s", filePath,
            options.modId or 'nil', content));
        return false;
    end

    return BM_FileUtils.writeFile(filePath, content, options);
end

return BM_FileUtils
