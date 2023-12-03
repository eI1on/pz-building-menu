ISWallOverlay = ISBuildingObject:derive("ISWallOverlay");

--************************************************************************--
--** ISWallOverlay:new
--**
--************************************************************************--
local function isRelevantWall(isCorner, object, north)
    local properties = object:getProperties()

    if object:getModData().WindowWall then return true end

    if isCorner then
        return properties:Is("WallNW") and not instanceof(object, "IsoWindow")
    end

    if not instanceof(object, "IsoWindow") then
        return (north and (properties:Is("WallN") or properties:Is("WindowN") or properties:Is("WallNW") or properties:Is("DoorWallN"))) or 
               (not north and (properties:Is("WallW") or properties:Is("WindowW") or properties:Is("WallNW") or properties:Is("DoorWallW")))
    end

    return false
end


function ISWallOverlay:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z);
	buildUtil.consumeMaterial(self);

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

