if isServer() then return; end
local OpenableContainers = require "BuildingMenu_ThrottlekittysTiles_ContextMenu"

local originalDoClickSpecificObject = ISObjectClickHandler.doClickSpecificObject
function ISObjectClickHandler.doClickSpecificObject(object, playerNum, playerObj)
    local ret = originalDoClickSpecificObject(object, playerNum, playerObj);
    if object:getSquare():DistToProper(playerObj) >= 10 then return false; end

    local openableContainer, textureName = nil, nil;

    if instanceof(object, "IsoThumpable") then
        textureName = object:getTextureName()
        if textureName then
            local isContainer = OpenableContainers.isContainerSprite(textureName);
            if isContainer and not openableContainer then
                openableContainer = object;
            end
        end
        if openableContainer then
            OpenableContainers.onToggleContainer(nil, openableContainer, playerNum);
        end
        return true;
    end
    return ret;
end
