if isClient() then return end

local RemovableWallVinesTiles = require 'ValidWallVineTiles'


local BM_Commands = {}
BM_Commands.object = {}

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


BM_Commands.OnClientCommand = function(module, command, player, args)
	if BM_Commands[module] and BM_Commands[module][command] then
        BM_Commands[module][command](player, args)
    end
end
Events.OnClientCommand.Add(BM_Commands.OnClientCommand)
