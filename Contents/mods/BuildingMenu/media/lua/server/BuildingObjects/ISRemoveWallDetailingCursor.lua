local RemovableWallDetailingTiles = require 'ValidWallDetailingTiles'

ISRemoveWallDetailingCursor = ISBuildingObject:derive("ISRemoveWallDetailingCursor")

local function predicateHasTag(item, tag)
    return not item:isBroken() and item:hasTag(tag);
end

-- Create a new instance of ISRemoveWallDetailingCursor.
---@param x number The X-coordinate.
---@param y number The Y-coordinate.
---@param z number The Z-coordinate.
---@param north boolean Indicates if the cursor is facing north.
---@param sprite IsoSprite The sprite for the cursor.
function ISRemoveWallDetailingCursor:create(x, y, z, north, sprite)
	local square = getWorld():getCell():getGridSquare(x, y, z);
	if self.removeType == "wallDetailing" then
		BuildingMenu.doRemoveWallDetailing(self.character, square, true);
	end
end

-- Check if the cursor action is valid for a given square.
---@param square IsoGridSquare The target square.
---@return boolean true if valid, false otherwise.
function ISRemoveWallDetailingCursor:isValid(square)
	if self.removeType == "wallDetailing" then
		local playerInv = self.character:getInventory();
		local hasHammerTool = playerInv:containsEvalRecurse(function(item) return predicateHasTag(item, "Hammer") end);
		if not hasHammerTool then
			return false;
		end
	end
	return self:getRemovableObject(square) ~= nil;
end

-- Render the tile on the screen.
---@param x number The X-coordinate.
---@param y number The Y-coordinate.
---@param z number The Z-coordinate.
---@param square IsoGridSquare The target square.
function ISRemoveWallDetailingCursor:render(x, y, z, square)
	if not ISRemoveWallDetailingCursor.floorSprite then
		ISRemoveWallDetailingCursor.floorSprite = IsoSprite.new();
		ISRemoveWallDetailingCursor.floorSprite:LoadFramesNoDirPageSimple('media/ui/FloorTileCursor.png');
	end
	local hc = getCore():getBadHighlitedColor();
	if self:isValid(square) then
		hc = getCore():getGoodHighlitedColor()
		self:getRemovableObject(square):setHighlighted(true);
		self:getRemovableObject(square):setHighlightColor(0.0, 1.0, 0.0, 1.0);
	end
	ISRemoveWallDetailingCursor.floorSprite:RenderGhostTileColor(x, y, z, hc:getR(), hc:getG(), hc:getB(), 0.8)
end

-- Get the removable object from a given square.
---@param square IsoGridSquare The target square.
---@return IsoObject object The removable object or nil if not found.
function ISRemoveWallDetailingCursor:getRemovableObject(square)
	for i = 1, square:getObjects():size() do
        local o = square:getObjects():get(i - 1);
        if self.removeType == "wallDetailing" then
            local attached = o:getAttachedAnimSprite();
            if attached then
                for n = 1, attached:size() do
                    local sprite = attached:get(n - 1);
                    if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                        local spriteName = sprite:getParentSprite():getName();
                        for _, pattern in ipairs(RemovableWallDetailingTiles) do
                            if luautils.stringStarts(spriteName, pattern) then
                                return o;
                            end
                        end
                    end
                end
            end
        end
    end
	return nil;
end

function ISRemoveWallDetailingCursor:getAPrompt()
	if self.removeType == "wallDetailing" then return getText("ContextMenu_RemoveWallDetailing") end
	return nil;
end

function ISRemoveWallDetailingCursor:getLBPrompt()
	return nil;
end

function ISRemoveWallDetailingCursor:getRBPrompt()
	return nil;
end

-- Create a new instance of ISRemoveWallDetailingCursor.
---@param character IsoPlayer The player character.
---@param removeType string The type of removal action.
---@return ISRemoveWallDetailingCursor class The created instance.
function ISRemoveWallDetailingCursor:new(character, removeType)
	local o = ISBuildingObject.new(self);
	o:init();
	o.character = character;
	o.player = character:getPlayerNum();
	o.noNeedHammer = true;
	o.skipBuildAction = true;
	o.isYButtonResetCursor = true;
	o.removeType = removeType;
	return o
end


