if isClient() then return end

local function genTable()
	local ret = {[0] = {}, {}, {}, {}}
	ret.crafted_01_24 = ret[0]
	ret.crafted_01_25 = ret[1]
	ret.crafted_01_26 = ret[2]
	ret.crafted_01_27 = ret[3]
	return ret
end

local onNew = genTable()
local onLoad = genTable()

local function populate(tbl, sprite, func, prio)
	local data = tbl[sprite]
	if data then
		data.func = func
		data.prio = prio
		tbl[sprite] = nil
	end
end

local fakeMapObjects = {}

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

local oldMapObjects = MapObjects
setmetatable(fakeMapObjects, { __index = oldMapObjects })
MapObjects = fakeMapObjects
local needle = "server/Map/MapObjects/MOMetalDrum.lua"
for i = 0, getLoadedLuaCount() - 1 do
	local path = getLoadedLua(i)
	if path:sub(#path - #needle + 1) == needle then
		reloadLuaFile(path)
		break
	end
end
MapObjects = oldMapObjects

local customBarrelTiles = unpack(require 'ValidDrums')
local function setupForColour(prefix, begin)
	for i = begin, begin + 3 do
		local params = onNew[i % 4]
		MapObjects.OnNewWithSprite(prefix .. i, params.func, params.prio)
		params = onLoad[i % 4]
		MapObjects.OnLoadWithSprite(prefix .. i, params.func, params.prio)
	end
end

Events.OnLoadedTileDefinitions.Add(function()
	for _,set in ipairs(customBarrelTiles) do
		for i = set.first, set.last, 4 do
			setupForColour(set.prefix, i)
		end
	end
end)