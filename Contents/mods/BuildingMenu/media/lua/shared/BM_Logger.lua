--- BM_Constants module
local BM_Constants = require("BM_Constants");

--- @class BM_Logger
local BM_Logger = {};
BM_Logger.__index = BM_Logger;

--- Singleton instance of BM_Logger
--- @type BM_Logger
local instance = nil;

--- @return BM_Logger BM_Logger Singleton instance of the BM_Logger class
function BM_Logger:new()
    if instance then return instance; end

    --- @type BM_Logger
    local o = {};
    setmetatable(o, self);

    --- The current log level (default is INFO)
    --- @type string
    o.currentLogLevel = isDebugEnabled() and BM_Constants.LOG_LEVELS.DEBUG or BM_Constants.LOG_LEVELS.INFO;

    --- log level mapping to priority values
    --- @type table<string, number>
    o.levels = {
        [BM_Constants.LOG_LEVELS.ERROR] = 1,
        [BM_Constants.LOG_LEVELS.WARNING] = 2,
        [BM_Constants.LOG_LEVELS.INFO] = 3,
        [BM_Constants.LOG_LEVELS.DEBUG] = 4,
    };

    instance = o;
    return instance;
end

--- Sets the log level of the BM_Logger
--- @param level string The log level to set (e.g., "ERROR", "WARNING", "INFO", "DEBUG")
function BM_Logger:setLogLevel(level)
    self.currentLogLevel = level;
end

--- Checks if a message should be logged based on the current log level
--- @param level string The level of the log message
--- @return boolean shouldLog
function BM_Logger:shouldLog(level)
    return self.levels[level] <= self.levels[self.currentLogLevel];
end

--- Logs a message at the specified log level
--- @param level string The level of the log message (e.g., "ERROR", "WARNING", "INFO", "DEBUG")
--- @param message string|table|nil
function BM_Logger:log(level, message)
    if self:shouldLog(level) then
        local outputMessage = type(message) == "table" and self:prettyPrintTable(message) or tostring(message);
        print(string.format("[%s] [%s]: %s", BM_Constants.MOD_ID, level, outputMessage));
    end
end

--- Logs an error message
--- @param message string|table|nil
function BM_Logger:error(message)
    self:log(BM_Constants.LOG_LEVELS.ERROR, message);
end

--- Logs a warning message
--- @param message string|table|nil
function BM_Logger:warning(message)
    self:log(BM_Constants.LOG_LEVELS.WARNING, message);
end

--- Logs an info message
--- @param message string|table|nil
function BM_Logger:info(message)
    self:log(BM_Constants.LOG_LEVELS.INFO, message);
end

--- Logs a debug message
--- @param message string|table|nil
function BM_Logger:debug(message)
    self:log(BM_Constants.LOG_LEVELS.DEBUG, message);
end

--- Recursively pretty-prints a table
--- @param t table The table to pretty print
--- @param indent string|nil The current indentation level (used for recursion)
--- @return string result The pretty-printed string representation of the table
function BM_Logger:prettyPrintTable(t, indent)
    indent = indent or "";
    if type(t) ~= "table" then
        return tostring(t);
    end
    local result = "{\n";
    local nextIndent = indent .. "    ";
    for k, v in pairs(t) do
        local keyStr = string.format("%s[%s]", nextIndent, tostring(k));
        if type(v) == "table" then
            result = result .. string.format("%s = %s,\n", keyStr, self:prettyPrintTable(v, nextIndent));
        else
            result = result .. string.format("%s = %s,\n", keyStr, tostring(v));
        end
    end
    result = result .. indent .. "}";
    return result;
end

--- Logs a pretty-printed table at the specified log level
--- @param level string The level of the log message (e.g., "ERROR", "WARNING", "INFO", "DEBUG")
--- @param t table The table to pretty print
function BM_Logger:logTable(level, t)
    if self:shouldLog(level) then
        local prettyStr = self:prettyPrintTable(t);
        self:log(level, prettyStr);
    end
end

return BM_Logger:new()
