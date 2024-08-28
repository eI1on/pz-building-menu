local Logger = require("BuildingMenu/Logger");
local JSON = require("BuildingMenu/JSON");

local Utils = {};
Utils.jsonutil = {};

--- Reads all data from a BufferedReader line by line and returns it as a string
--- @param bufferedReader BufferedReader The BufferedReader instance
--- @return string result The contents of the file as a string
local function readAllLines(bufferedReader)
    local buffer = {};
    local line = bufferedReader:readLine();

    while line do
        table.insert(buffer, line);
        line = bufferedReader:readLine();
    end

    return table.concat(buffer, "\n");
end

--- Loads JSON data from a file within a mod's directory and decodes it
--- @param modName string The name of the mod
--- @param filePath string The path to the file relative to the mod's media directory
--- @return table|nil data The decoded JSON data as a Lua table, or nil if an error occurs
function Utils.jsonutil.load(modName, filePath)
    if not modName or not filePath then
        Logger:error('[jsonutil.load] Mod name or file path not set.');
        return nil;
    end

    local fileReaderObj = getModFileReader(modName, filePath, false);
    if not fileReaderObj then
        Logger:error(string.format('[jsonutil.load] File not found (%s/%s).', modName, filePath));
        return nil;
    end

    local json = readAllLines(fileReaderObj);
    fileReaderObj:close();

    if json and json ~= '' then
        local status, res = pcall(JSON.parse, json);
        if not status then
            Logger:error(string.format('[jsonutil.load] Cannot decode JSON (%s) (%s/%s).', res, modName, filePath));
            return nil;
        end
        return res;
    end

    Logger:error(string.format('[jsonutil.load] No JSON content found (%s/%s).', modName, filePath));
    return nil;
end

--- Saves Lua data to a file in JSON format.
--- @param fileName string The filename to save JSON data to.
--- @param data table The Lua table data to encode and save as JSON.
function Utils.jsonutil.save(fileName, data)
    if not data then return; end

    local fileWriterObj = getFileWriter(fileName, true, false);
    if not fileWriterObj then
        Logger:error(string.format('[jsonutil.save] Cannot write to %s', fileName));
        return;
    end

    local status, json = pcall(JSON.stringify, data);
    if not status then
        Logger:error(string.format('[jsonutil.save] Cannot encode JSON (%s)', json));
        return;
    end

    fileWriterObj:write(json);
    fileWriterObj:close();
end

return Utils;
