BM_Utils = BM_Utils or {}

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
    end
end

function BM_Utils.unsetSpriteProperty(props, propertyName)
    if type(propertyName) == "string" then
        props:UnSet(propertyName)
    elseif type(propertyName) == "userdata" and IsoFlagType[propertyName] then
        props:UnSet(propertyName)
    else
        print("[Building Menu] Invalid parameter type for UnSet function")
    end
end
