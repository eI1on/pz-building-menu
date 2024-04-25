if isClient() then return end

local function genTable()
	local ret = { [0] = {}, {}, {}, {} }
	for i = 24, 27 do
		ret["crafted_01_" .. i] = ret[i - 24]
	end
	return ret
end

local onNew = genTable()
local onLoad = genTable()

local function populate(tbl, sprite, func, prio)
	if tbl[sprite] then
		tbl[sprite].func = func
		tbl[sprite].prio = prio
		tbl[sprite] = nil
	end
end

local fakeMapObjects = {}
local oldMapObjects = MapObjects
local oldOnNewWithSprite = MapObjects.OnNewWithSprite
local oldOnLoadWithSprite = MapObjects.OnLoadWithSprite

function fakeMapObjects.OnNewWithSprite(sprite, func, prio, ...)
	populate(onNew, sprite, func, prio)
	return oldOnNewWithSprite(sprite, func, prio, ...)
end

function fakeMapObjects.OnLoadWithSprite(sprite, func, prio, ...)
	populate(onLoad, sprite, func, prio)
	return oldOnLoadWithSprite(sprite, func, prio, ...)
end

setmetatable(fakeMapObjects, { __index = oldMapObjects })
MapObjects = fakeMapObjects

local needle = "server/Map/MapObjects/MOMetalDrum.lua"
for i = 0, getLoadedLuaCount() - 1 do
	if getLoadedLua(i):sub(- #needle) == needle then
		reloadLuaFile(getLoadedLua(i))
		break
	end
end
MapObjects = oldMapObjects

local customBarrelTiles = require'BM_ValidDrums'
local function setupForColour(prefix, begin)
	for i = begin, begin + 3 do
		local params = onNew[i % 4]
		MapObjects.OnNewWithSprite(prefix .. i, params.func, params.prio)
		params = onLoad[i % 4]
		MapObjects.OnLoadWithSprite(prefix .. i, params.func, params.prio)
	end
end

Events.OnLoadedTileDefinitions.Add(function()
	for _, set in ipairs(customBarrelTiles) do
		for i = set.first, set.last, 4 do
			setupForColour(set.prefix, i)
		end
	end
end)
