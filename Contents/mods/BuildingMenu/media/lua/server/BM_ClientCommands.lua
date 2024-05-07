if isClient() then return; end
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

BM_Commands.OnClientCommand = function(module, command, player, args)
	if BM_Commands[module] and BM_Commands[module][command] then
		local argStr = ''
		for k, v in pairs(args) do
			argStr = argStr .. ' ' .. k .. '=' .. tostring(v)
		end
		noise(' received ' .. module .. ' ' .. command .. ' ' .. tostring(player) .. argStr)
		BM_Commands[module][command](player, args)
	end
end
Events.OnClientCommand.Add(BM_Commands.OnClientCommand)


--- FIX FOR 
--- Issue: Cannot read field "ID" because `closedSprite` is null, preventing chunks from saving.

-- local function loadGridsquare(sq)
--     if not sq then return; end
--     if isClient() then return; end

-- 	for i=0, sq:getObjects():size()-1 do
-- 		local isoObject = sq:getObjects():get(i);
-- 		if isoObject and instanceof(isoObject, "IsoDoor") then
-- 			local x, y, z = sq:getX(), sq:getY(), sq:getZ();
-- 			local isoSprite = isoObject:getSprite();
-- 			local openIsoSprite = isoObject:getOpenSprite();

-- 			local isoSpriteName = isoSprite and isoSprite:getName() or nil;
-- 			local openIsoSpriteName = openIsoSprite and openIsoSprite:getName() or nil;

--             if not isoSpriteName then
--                 print(string.format("[Building Menu DEBUG] Reverting missing Closed Sprite at coords: (%d, %d, %d)", x, y, z));
--             end
--             if not openIsoSpriteName then
--                 print(string.format("[Building Menu DEBUG] Reverting missing Opened Sprite at coords: (%d, %d, %d)", x, y, z));
--             end

-- 			if isoSpriteName and not openIsoSpriteName then
-- 				local baseName, number = string.match(isoSpriteName, "(.-)(%d+)$");
-- 				if baseName and number then
-- 					number = tonumber(number) + 2;
-- 					openIsoSpriteName = baseName .. number;
-- 					local newOpenSprite = getSprite(openIsoSpriteName);
-- 					if newOpenSprite then
-- 						newOpenSprite:setName(openIsoSpriteName);
--                         isoObject:setOpenSprite(newOpenSprite);
--                         print(string.format("[Building Menu DEBUG] Set new open sprite '%s' at coords: (%d, %d, %d)", openIsoSpriteName, x, y, z));
--                         isoObject:transmitUpdatedSpriteToClients();
--                     else
--                         print(string.format("[Building Menu ERROR] Failed to retrieve sprite for '%s' at coords: (%d, %d, %d)", openIsoSpriteName, x, y, z));
--                     end
-- 				end
-- 			elseif openIsoSpriteName and not isoSpriteName then
-- 				local baseName, number = string.match(openIsoSpriteName, "(.-)(%d+)$");
-- 				if baseName and number then
-- 					number = tonumber(number) - 2;
-- 					isoSpriteName = baseName .. number;
-- 					local newClosedSprite = getSprite(isoSpriteName);
-- 					if newClosedSprite then
-- 						newClosedSprite:setName(isoSpriteName);
--                         isoObject:setSprite(newClosedSprite);
--                         print(string.format("[Building Menu DEBUG] Set new closed sprite '%s' at coords: (%d, %d, %d)", isoSpriteName, x, y, z));
--                         isoObject:transmitUpdatedSpriteToClients();
--                     else
--                         print(string.format("[Building Menu ERROR] Failed to retrieve sprite for '%s' at coords: (%d, %d, %d)", isoSpriteName, x, y, z));
--                     end
-- 				end
-- 			end
-- 		end
-- 	end
-- end
-- Events.LoadGridsquare.Add(loadGridsquare);