if isClient() then return end

local RemovableWallVinesTiles = require 'BM_ValidWallVineTiles'
local RemovableWallDetailingTiles = require 'BM_ValidWallDetailingTiles'
local RemovableTrafficLineTiles = require'BM_ValidTrafficLineTiles'

BM_Commands = {}
BM_Commands.object = {}
BM_Commands.Lightpoles = {}


BM_Commands.wantNoise = getDebug()
local noise = function(msg)
	if (BM_Commands.wantNoise) then
		print('ClientCommand: ' .. msg)
	end
end


local getThumpableElectricLight = function(x, y, z)
	local gs = getCell():getGridSquare(x, y, z)
	if not gs then return nil end

	for i = 0, gs:getSpecialObjects():size() - 1 do
		local o = gs:getSpecialObjects():get(i)
		if o and instanceof(o, 'IsoThumpable') then
			if not o:haveFuel() and o:getModData()['IsLighting']then
				return o
			end
		end
	end
	return nil
end


BM_Commands.object.toggleElectricLight = function(player, args)
	local o = getThumpableElectricLight(args.x, args.y, args.z)
	if o then
		if o:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
			o:toggleLightSource(not o:isLightSourceOn())
			o:sendObjectChange('lightSource')
		else
			o:toggleLightSource(false)
			o:sendObjectChange('lightSource')
		end
		if o:isLightSourceOn() then
			BM_Commands.addPole(o:getSquare())
		else
			BM_Commands.removePole(o:getSquare())
		end
	end
end


function BM_Commands.removePole(square)
	for i, v in ipairs(BM_Commands.Lightpoles) do
		if v.x == square:getX() and v.y == square:getY() and v.z == square:getZ() then
			table.remove(BM_Commands.Lightpoles, i)
			break
		end
	end
end


function BM_Commands.addPole(square)
	local Lightpole = {}
	Lightpole.x = square:getX()
	Lightpole.y = square:getY()
	Lightpole.z = square:getZ()
	table.insert(BM_Commands.Lightpoles, Lightpole)
end


function BM_Commands.findObject(square)
	if not square then
		return nil
	end
	for i = 0, square:getSpecialObjects():size() - 1 do
		local o = square:getSpecialObjects():get(i)
		if o and instanceof(o, 'IsoThumpable') then
			if not o:haveFuel() then
				if o:getModData()['IsLighting'] then
					return o
				end
			end
		end
	end
	return nil
end

function BM_Commands.checkPower()
	if isClient() then return end
	local temptable = BM_Commands.Lightpoles
	for i, v in ipairs(temptable) do
		local square = getCell():getGridSquare(v.x, v.y, v.z)
		if square then
			if not (square:haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier)) then
				local obj = BM_Commands.findObject(square)
				if obj then
					obj:toggleLightSource(false)
					obj:sendObjectChange('lightSource')
					BM_Commands.removePole(square)
				else
					BM_Commands.removePole(square)
				end
			end
		end
	end
end

BM_Commands.OnObjectAdded = function(o)
	if isClient() then return end

	if o and instanceof(o, 'IsoThumpable') then
		if not o:haveFuel() then
			if o:getModData()['IsLighting'] then
				if o:isLightSourceOn() then
					BM_Commands.addPole(o:getSquare())
				end
			end
		end
	end
end

function BM_Commands.OnDestroyIsoThumpable(o, player)
	if isClient() then return end
	if not o:getSquare() or not (o:getModData()['IsLighting']) then
		return
	end
	local sq = o:getSquare()
	BM_Commands.removePole(sq)
end

Events.EveryTenMinutes.Add(BM_Commands.checkPower)
Events.OnObjectAdded.Add(BM_Commands.OnObjectAdded)
Events.OnDestroyIsoThumpable.Add(BM_Commands.OnDestroyIsoThumpable)

local function _getWallVineObject(square)
	if not square then return end
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n=1,attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName()
                    for _, pattern in ipairs(RemovableWallVinesTiles) do
                        if luautils.stringStarts(spriteName, pattern) then
                            return object, n-1
                        end
                    end
                end
			end
		end
	end
end

local function _getDetailingObject(square, removableTable)
	if not square then return end
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n=1,attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName()
                    for _, pattern in ipairs(removableTable) do
                        if luautils.stringStarts(spriteName, pattern) then
                            return object, n-1
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
            local object, index = _getDetailingObject(sq, RemovableWallDetailingTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				sq:removeErosionObject("WallVines")
			end
			local topSq = getCell():getGridSquare(sq:getX(), sq:getY(), sq:getZ() + 1)
			local object, index = _getDetailingObject(topSq, RemovableWallDetailingTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
				topSq:removeErosionObject("WallVines")
			end
        end
		if args.removeType == "trafficLine" then
            local object, index = _getDetailingObject(sq, RemovableTrafficLineTiles)
			if object and index then
				object:RemoveAttachedAnim(index)
				object:transmitUpdatedSpriteToClients()
			end
			local topSq = getCell():getGridSquare(sq:getX(), sq:getY(), sq:getZ() + 1)
			local object, index = _getDetailingObject(topSq, RemovableTrafficLineTiles)
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
		noise('received ' .. module .. ' ' .. command .. ' ' .. tostring(player) .. argStr)
        BM_Commands[module][command](player, args)
    end
end
Events.OnClientCommand.Add(BM_Commands.OnClientCommand)
