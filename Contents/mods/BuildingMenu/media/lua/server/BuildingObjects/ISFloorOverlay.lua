ISFloorOverlay = ISBuildingObject:derive("ISFloorOverlay");

--************************************************************************--
--** ISFloorOverlay:new
--**
--************************************************************************--
function ISFloorOverlay:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z);
	buildUtil.consumeMaterial(self);

    local objects = self.sq:getObjects()
    local objectsSize = objects:size()
    local spriteInstance = getSprite(sprite):newInstance()

    for i = 0, objectsSize - 1 do
        local object = objects:get(i)
        local properties = object:getProperties()
        if (properties and properties:Is(IsoFlagType.solidfloor)) or object:isFloor() then
            local attachedAnimSprite = object:getAttachedAnimSprite()
            if attachedAnimSprite == nil then
                attachedAnimSprite = ArrayList:new()
                object:setAttachedAnimSprite(attachedAnimSprite)
            end
            attachedAnimSprite:add(spriteInstance)
            if isClient() then object:transmitUpdatedSpriteToServer() end
        end
    end

    -- self.sq:disableErosion()
    -- local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ() }
    -- sendClientCommand('erosion', 'disableForSquare', args)
end


function ISFloorOverlay:new(sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.buildLow = true;
	o.floor = true;
	return o;
end

function ISFloorOverlay:isValid(square)
	if not self:haveMaterial(square) then return false end
	if square:getZ() > 0 then
		local below = getCell():getGridSquare(square:getX(), square:getY(), square:getZ() - 1)
		if below and below:HasStairs() then
			return false
		end
	end
	for i = 0, square:getObjects():size() - 1 do
		local item = square:getObjects():get(i);
		if (item:getTextureName() and luautils.stringStarts(item:getTextureName(), "vegetation_farming")) or
				(item:getSpriteName() and luautils.stringStarts(item:getSpriteName(), "vegetation_farming")) 
				-- or not (item:getProperties() and item:getProperties():Is(IsoFlagType.solidfloor)) 
					then
						return false;
		end
	end
	return square:connectedWithFloor();
end

function ISFloorOverlay:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

