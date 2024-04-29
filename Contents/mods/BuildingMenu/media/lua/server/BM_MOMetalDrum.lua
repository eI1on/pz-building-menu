if isClient() then return end

--- Generates a table to map sprite names to their corresponding functions and priorities.
---@return table ret A table mapping sprite names to their corresponding empty tables.
local function genTable()
	local ret = { [0] = {}, {}, {}, {} }
	for i = 24, 27 do
		ret["crafted_01_" .. i] = ret[i - 24]
	end
	return ret
end

local onNew = genTable()
local onLoad = genTable()

--- Populates a given table with function and priority for a sprite if it exists
---@param tbl table The table to populate
---@param sprite string The sprite identifier
---@param func LuaClosure The function to associate with the sprite
---@param prio number The priority of the function
local function populate(tbl, sprite, func, prio)
	if tbl[sprite] then
		tbl[sprite].func = func
		tbl[sprite].prio = prio
		tbl[sprite] = nil
	end
end

-- Temporary variables to hold the original map objects and their event handlers
local fakeMapObjects = {}
local oldMapObjects = MapObjects
local oldOnNewWithSprite = MapObjects.OnNewWithSprite
local oldOnLoadWithSprite = MapObjects.OnLoadWithSprite

--- Overrides the existing OnNewWithSprite method to capture and modify behavior when new map objects are created based on sprite
--- @param sprite string The sprite identifier
--- @param func LuaClosure The function to execute for the sprite
--- @param prio number The priority of the function
--- @param ... any Additional arguments
--- @return nil result The result of the original OnNewWithSprite function
function fakeMapObjects.OnNewWithSprite(sprite, func, prio, ...)
	populate(onNew, sprite, func, prio)
	return oldOnNewWithSprite(sprite, func, prio, ...)
end

--- @param sprite string The sprite identifier
--- @param func LuaClosure The function to execute for the sprite
--- @param prio number The priority of the function
--- @param ... any Additional arguments
--- @return nil result The result of the original OnLoadWithSprite function
function fakeMapObjects.OnLoadWithSprite(sprite, func, prio, ...)
	populate(onLoad, sprite, func, prio)
	return oldOnLoadWithSprite(sprite, func, prio, ...)
end

--- Set the metatable of fakeMapObjects to fallback to the oldMapObjects for undefined methods
setmetatable(fakeMapObjects, { __index = oldMapObjects })
MapObjects = fakeMapObjects

--- Specific path to the metal drum Lua script, used for reloading
local needle = "server/Map/MapObjects/MOMetalDrum.lua"
--- Reload the metal drum Lua file if it is currently loaded
for i = 0, getLoadedLuaCount() - 1 do
	if getLoadedLua(i):sub(- #needle) == needle then
		reloadLuaFile(getLoadedLua(i))
		break
	end
end
-- Restore the original MapObjects after modifications
MapObjects = oldMapObjects

-- Import custom list of valid drum sprites
local customBarrelTiles = require'BM_ValidDrums'

--- Setups handling for the colour variants of barrels
---@param prefix string The sprite prefix
---@param begin number The starting index for sprite numbering
local function setupForColour(prefix, begin)
	for i = begin, begin + 3 do
		local params = onNew[i % 4]
		MapObjects.OnNewWithSprite(prefix .. i, params.func, params.prio)
		params = onLoad[i % 4]
		MapObjects.OnLoadWithSprite(prefix .. i, params.func, params.prio)
	end
end

--- Add an event handler to setup custom barrel handling after tile definitions are loaded
Events.OnLoadedTileDefinitions.Add(function()
	for _, set in ipairs(customBarrelTiles) do
		for i = set.first, set.last, 4 do
			setupForColour(set.prefix, i)
		end
	end
end)
