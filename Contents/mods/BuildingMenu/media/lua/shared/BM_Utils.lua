---@class BM_Utils
BM_Utils = BM_Utils or {}

--- Sets a sprite property.
---@param props PropertyContainer The properties object of the sprite.
---@param propertyName string|IsoFlagType The name of the property to set or an IsoFlagType.
---@param propertyValue string|nil The value to set the property to.
---@param checkIsoFlagType boolean|nil Additional flag to indicate if IsoFlagType should be checked.
function BM_Utils.setSpriteProperty(props, propertyName, propertyValue, checkIsoFlagType)
    if type(propertyName) == "userdata" and IsoFlagType[propertyName] and propertyValue == nil then
        props:Set(propertyName)
    elseif type(propertyName) == "string" and type(propertyValue) == "string" then
        if checkIsoFlagType == nil then
            props:Set(propertyName, propertyValue)
        else
            props:Set(propertyName, propertyValue, checkIsoFlagType)
        end
    elseif type(propertyName) == "userdata" and IsoFlagType[propertyName] and type(propertyValue) == "string" then
        props:Set(propertyName, propertyValue)
    else
        print("[Building Menu] Invalid parameter types or count for Set function")
        print(propertyName, " ", propertyValue, " ", checkIsoFlagType)
    end
end

--- Unsets a sprite property.
---@param props PropertyContainer The properties object of the sprite.
---@param propertyName string|IsoFlagType The name of the property to unset or an IsoFlagType.
function BM_Utils.unsetSpriteProperty(props, propertyName)
    if type(propertyName) == "string" then
        props:UnSet(propertyName)
    elseif type(propertyName) == "userdata" and IsoFlagType[propertyName] then
        props:UnSet(propertyName)
    else
        print("[Building Menu] Invalid parameter type for UnSet function")
    end
end

--- Prints property names and flags list for a sprite.
---@param sprite string The sprite name.
function BM_Utils.printPropNamesFromSprite(sprite)
    local props = IsoSpriteManager.instance:getSprite(sprite):getProperties();
    print("[Building Menu] Property Names for ".. sprite .." :", props:getPropertyNames());
    print("[Building Menu] Flags List for ".. sprite .." :", props:getFlagsList());
end