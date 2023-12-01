require("Moveables/ISMoveableSpriteProps")
require("Moveables/ISMoveablesAction")


local wallModeTable = {
    WallDoorframe = { N = {"DoorWallN"}, W = {"DoorWallW"} },
}


local function getWallForFacing( _square, _dir, _mode )
    if not _dir then return; end
    if _dir == "N" then
        _square = _square and _square:getTileInDirection(IsoDirections.S);
    elseif _dir == "W" then
        _square = _square and _square:getTileInDirection(IsoDirections.E);
    end

    local lookup = wallModeTable.WallDoorframe;
    if _mode and _mode ~= "WallDoorframe" and wallModeTable[_mode] then
        lookup = wallModeTable[_mode];
    end

    local square, tag1, tag2, tag3;
    if _dir == "S" or _dir == "N" then
        square, tag1, tag2, tag3 = _square, lookup.N[1], lookup.N[2], lookup.N[3];
    elseif _dir == "E" or _dir == "W" then
        square, tag1, tag2, tag3 = _square, lookup.W[1], lookup.W[2], lookup.W[3];
    end

    if square and (tag1 or tag2 or tag3) then
        if (tag1 and square:Is(tag1)) or (tag2 and square:Is(tag2)) or (tag3 and square:Is(tag3)) then
            for i = 0, square:getObjects():size()-1 do
                local obj = square:getObjects():get(i);
                local sprite = obj:getSprite();
                if sprite and sprite:getProperties() then
                    local props = sprite:getProperties();
                    if props then
                        if (tag1 and props:Is(tag1)) or (tag2 and props:Is(tag2)) or (tag3 and props:Is(tag3)) then
                            return obj;
                        end
                    end
                end
            end
        end
    end
end


local oldCanPlaceMoveableInternal = ISMoveableSpriteProps.canPlaceMoveableInternal
function ISMoveableSpriteProps:canPlaceMoveableInternal(_character, _square, _item, _forceTypeObject)
    local canPlace = false
    if _square and _square:isVehicleIntersecting() then return false end

    if self.isMoveable then
        local hasTileFloor = _square and _square:getFloor();
        if not hasTileFloor and self.type ~= "Window" then
            return false;
        end
        if self.type == "WindowObject" then
            canPlace = self:hasFaces() and getWallForFacing( _square, self.facing, "WallDoorframe" );
            if canPlace then
                if _square:Is(IsoFlagType.exterior) or (_character:getSquare() and _character:getSquare():Is(IsoFlagType.exterior)) then
                    canPlace = false;
                end
            end
            if canPlace then
                for i = 0, _square:getObjects():size()-1 do
                    local obj = _square:getObjects():get(i);
                    local sprite = obj:getSprite();
                    if sprite and sprite:getProperties() then
                        local props = sprite:getProperties();
                        if props then
                            if props:Is("MoveType") and props:Val("MoveType") == "WindowObject" then
                                if props:Is("Facing") and props:Val("Facing") == self.facing then
                                    canPlace = false;
                                    break;
                                end
                            end
                        end
                    end

                    if instanceof(obj, "IsoCurtain") then
                        if self.facing == "S" and obj:getType() == IsoObjectType.curtainN then
                            canPlace = false;
                            break;
                        end
                        if self.facing == "N" and obj:getType() == IsoObjectType.curtainS then
                            canPlace = false;
                            break;
                        end
                        if self.facing == "E" and obj:getType() == IsoObjectType.curtainW then
                            canPlace = false;
                            break;
                        end
                        if self.facing == "W" and obj:getType() == IsoObjectType.curtainE then
                            canPlace = false;
                            break;
                        end
                    end
                end
            end
        end
        if not canPlace then
            return oldCanPlaceMoveableInternal(self, _character, _square, _item, _forceTypeObject)
        end
    end
    return canPlace
end


local oldPlaceMoveableInternal = ISMoveableSpriteProps.placeMoveableInternal
function ISMoveableSpriteProps:placeMoveableInternal(_square, _item, _spriteName)
    if self.type == "WindowObject" then
        local north = self.facing and (self.facing == "N" or self.facing == "S")
        local wallFrame = getWallForFacing(_square, self.facing, "WallDoorframe")
        if wallFrame then
            local obj = IsoCurtain.new(getCell(), _square, _spriteName, north)
            local objects = _square:getObjects()
            local insertIndex = objects:size()

            for i = 0, objects:size() - 1 do
                local object = objects:get(i)
                if object == wallFrame then
                    insertIndex = i + 1
                    break
                end
            end

            if obj then
                _square:AddSpecialObject(obj, insertIndex)
                if isClient() then obj:transmitCompleteItemToServer() end
                triggerEvent("OnObjectAdded", obj)
            end

            return
        end
    end
    return oldPlaceMoveableInternal(self, _square, _item, _spriteName)
end


local oldSnapFaceToSquare = ISMoveableSpriteProps.snapFaceToSquare
function ISMoveableSpriteProps:snapFaceToSquare( _square )
    if self.isMoveable and self:hasFaces() then
        local faces = self:getFaces();
        if self.type == "WindowObject" then
            if faces.S and getWallForFacing( _square, "S", "WallDoorframe" ) then
                return 3;
            elseif faces.E and getWallForFacing( _square, "E", "WallDoorframe" ) then
                return 4;
            elseif faces.N and getWallForFacing( _square, "N", "WallDoorframe" ) then
                return 1;
            elseif faces.W and getWallForFacing( _square, "W", "WallDoorframe" ) then
                return 2;
            end
        end
    end
    return oldSnapFaceToSquare(self, _square)
end


local oldWalkToAndEquip = ISMoveableSpriteProps.walkToAndEquip
function ISMoveableSpriteProps:walkToAndEquip(_character, _square, _mode)
    if self.type == "WindowObject" then
        local dir = self.facing
        local windowFrame = getWallForFacing(_square, dir, "WallDoorframe")
        if windowFrame then
            local dowalk = luautils.walkAdjWindowOrDoor(_character, _square, windowFrame, false)
            if dowalk and _mode ~= "scrap" then
                local usesTool = (_mode == "pickup" and self.pickUpTool) or (_mode == "place" and self.placeTool)
                if usesTool then
                    local tool = self:hasTool(_character, _mode)
                    if tool then
                        ISWorldObjectContextMenu.equip(_character, _character:getPrimaryHandItem(), tool:getType(), true)
                        return true
                    end
                else
                    return true
                end
            end
        end
    end
    return oldWalkToAndEquip(self, _character, _square, _mode)
end


