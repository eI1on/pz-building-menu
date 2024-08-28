--- Constants module
local Constants = require("BuildingMenu/Constants");

--- @class Logger
local Logger = {};
Logger.__index = Logger;

--- Singleton instance of Logger
--- @type Logger
local instance = nil;

--- @return Logger logger Singleton instance of the Logger class
function Logger:new()
    if instance then return instance; end

    --- @type Logger
    local o = {};
    setmetatable(o, self);

    --- The current log level (default is INFO)
    --- @type string
    o.currentLogLevel = Constants.LOG_LEVELS.INFO;

    --- log level mapping to priority values
    --- @type table<string, number>
    o.levels = {
        [Constants.LOG_LEVELS.ERROR] = 1,
        [Constants.LOG_LEVELS.WARNING] = 2,
        [Constants.LOG_LEVELS.INFO] = 3,
        [Constants.LOG_LEVELS.DEBUG] = 4,
    };

    instance = o;
    return instance;
end

--- Sets the log level of the logger
--- @param level string The log level to set (e.g., "ERROR", "WARNING", "INFO", "DEBUG")
function Logger:setLogLevel(level)
    self.currentLogLevel = level;
end

--- Checks if a message should be logged based on the current log level
--- @param level string The level of the log message
--- @return boolean shouldLog
function Logger:shouldLog(level)
    return self.levels[level] <= self.levels[self.currentLogLevel];
end

--- Logs a message at the specified log level
--- @param level string The level of the log message (e.g., "ERROR", "WARNING", "INFO", "DEBUG")
--- @param message string
function Logger:log(level, message)
    if self:shouldLog(level) then
        print(string.format("[%s] [%s]: %s", Constants.MOD_ID, level, message));
    end
end

--- Logs an error message
--- @param message string
function Logger:error(message)
    self:log(Constants.LOG_LEVELS.ERROR, message);
end

--- Logs a warning message
--- @param message string
function Logger:warning(message)
    self:log(Constants.LOG_LEVELS.WARNING, message);
end

--- Logs an info message
--- @param message string
function Logger:info(message)
    self:log(Constants.LOG_LEVELS.INFO, message);
end

--- Logs a debug message
--- @param message string
function Logger:debug(message)
    self:log(Constants.LOG_LEVELS.DEBUG, message);
end

--- Recursively pretty-prints a table
--- @param t table The table to pretty print
--- @param indent string|nil The current indentation level (used for recursion)
--- @return string result The pretty-printed string representation of the table
function Logger:prettyPrintTable(t, indent)
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
function Logger:logTable(level, t)
    if self:shouldLog(level) then
        local prettyStr = self:prettyPrintTable(t);
        self:log(level, prettyStr);
    end
end

return Logger:new()
