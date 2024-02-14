ISWallOverlay = ISBuildingObject:derive("ISWallOverlay");

--************************************************************************--
--** ISWallOverlay:new
--**
--************************************************************************--
local function isRelevantWall(isCorner, object, north)
    if instanceof(object, "IsoWindow") or object:getProperties():Is(IsoFlagType.solidfloor) then return false; end

    if object:getModData().WindowWall then return true; end

    local properties = object:getProperties()

    if isCorner then
        return properties:Is(IsoFlagType.WallNW) or properties:Is(IsoFlagType.WallSE);
    end

    if north then
        return properties:Is(IsoFlagType.WallN) or properties:Is(IsoFlagType.WindowN) or properties:Is(IsoFlagType.WallNW) or properties:Is(IsoFlagType.WallSE) or properties:Is(IsoFlagType.DoorWallN);
    end

    return properties:Is(IsoFlagType.WallW) or properties:Is(IsoFlagType.WindowW) or properties:Is(IsoFlagType.WallNW) or properties:Is(IsoFlagType.WallSE) or properties:Is(IsoFlagType.DoorWallW);
end


function ISWallOverlay:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z);

    local objects = self.sq:getObjects()
    local spriteInstance = getSprite(sprite):newInstance()

    for i = 0, objects:size() - 1 do
        local object = objects:get(i)
        if isRelevantWall(self.isCorner, object, north) then
            local attachedAnimSprite = object:getAttachedAnimSprite()
            if attachedAnimSprite == nil then
                attachedAnimSprite = ArrayList:new()
                object:setAttachedAnimSprite(attachedAnimSprite)
            end
            attachedAnimSprite:add(spriteInstance)
            if isClient() then object:transmitUpdatedSpriteToServer() end
			break;
        end
    end

	buildUtil.consumeMaterial(self);

    -- self.sq:disableErosion()
    -- local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ() }
    -- sendClientCommand('erosion', 'disableForSquare', args)
end


function ISWallOverlay:new(sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	return o;
end

function ISWallOverlay:isValid(square)
    if not self:haveMaterial(square) then return false; end
	if self.needToBeAgainstWall then
        for i=0,square:getObjects():size()-1 do
           local obj = square:getObjects():get(i);
           if isRelevantWall(self.isCorner, obj, self.north) then
               return true;
           end
        end
        return false;
    else
        if buildUtil.stairIsBlockingPlacement( square, true ) then return false; end
    end
    return true;
end

function ISWallOverlay:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end