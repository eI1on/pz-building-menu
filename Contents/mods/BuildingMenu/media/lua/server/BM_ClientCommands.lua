if isClient() then return; end
local BM_Logger = require("BM_Logger");
local BM_Utils = require("BM_Utils");

local WallVinesTiles = require 'BM_ValidWallVineTiles';
local removableWallVinesTiles = WallVinesTiles.getTiles();

local WallDetailingTiles = require 'BM_ValidWallDetailingTiles';
local removableWallDetailingTiles = WallDetailingTiles.getTiles();

local TrafficLineTiles = require 'BM_ValidTrafficLineTiles';
local removableTrafficLineTiles = TrafficLineTiles.getTiles();


BM_Commands = {};
BM_Commands.object = {};

local function _getWallVineObject(square)
	if not square then return end
	for i = 0, square:getObjects():size() - 1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n = 1, attached:size() do
				local sprite = attached:get(n - 1)
				if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
					local spriteName = sprite:getParentSprite():getName()
					for _, pattern in ipairs(removableWallVinesTiles) do
						if luautils.stringStarts(spriteName, pattern) then
							return object, n - 1
						end
					end
				end
			end
		end
	end
end

local function _getDetailingObject(square, removableTable)
	if not square then return end
	for i = 0, square:getObjects():size() - 1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n = 1, attached:size() do
				local sprite = attached:get(n - 1)
				if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
					local spriteName = sprite:getParentSprite():getName()
					for _, pattern in ipairs(removableTable) do
						if luautils.stringStarts(spriteName, pattern) then
							return object, n - 1
						end
					end
				end
			end
		end
	end
end

BM_Commands.object.removeBush = function(player, args)
	local sq = getCell():getGridSquare(args.x, args.y, args.z)
	if sq then
		if args.wallVine then
			local object, index = _getWallVineObject(sq)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				sq:removeErosionObject("WallVines")
			end
			local topSq = getCell():getGridSquare(sq:getX(), sq:getY(), sq:getZ() + 1)
			local object, index = _getWallVineObject(topSq)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				topSq:removeErosionObject("WallVines")
			end
		end
	end
end

BM_Commands.object.removeDetailing = function(player, args)
	local sq = getCell():getGridSquare(args.x, args.y, args.z)
	if sq then
		if args.removeType == "wallDetailing" then
			local object, index = _getDetailingObject(sq, removableWallDetailingTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				sq:removeErosionObject("WallVines")
			end
			local topSq = getCell():getGridSquare(sq:getX(), sq:getY(), sq:getZ() + 1)
			local object, index = _getDetailingObject(topSq, removableWallDetailingTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				topSq:removeErosionObject("WallVines")
			end
		end
		if args.removeType == "trafficLine" then
			local object, index = _getDetailingObject(sq, removableTrafficLineTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
			end
			local topSq = getCell():getGridSquare(sq:getX(), sq:getY(), sq:getZ() + 1)
			local object, index = _getDetailingObject(topSq, removableTrafficLineTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
			end
		end
	end
end

BM_Commands.onClientCommand = function(module, command, player, args)
    if BM_Commands[module] and BM_Commands[module][command] then
        local argStr = '';
        for k, v in pairs(args or {}) do
            argStr = argStr .. ' ' .. k .. '=' .. tostring(v)
        end
        local playerStr = player and tostring(player) or "nil";
        module = module or "nil";
        command = command or "nil";

        BM_Logger:debug('received command: ' .. module .. ' ' .. command .. ' ' .. playerStr .. argStr);

        BM_Commands[module][command](player, args);
    end
end
Events.OnClientCommand.Add(BM_Commands.onClientCommand)