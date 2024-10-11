local BM_Logger = require("BM_Logger");

---@class BM_Utils
local BM_Utils = {};

--- Sets a sprite property
---@param props PropertyContainer The properties object of the sprite
---@param propertyName string|IsoFlagType The name of the property to set or an IsoFlagType
---@param propertyValue string|nil The value to set the property to
---@param checkIsoFlagType boolean|nil Additional flag to indicate if IsoFlagType should be checked
function BM_Utils.setSpriteProperty(props, propertyName, propertyValue, checkIsoFlagType)
    if type(propertyName) == "userdata" and propertyValue == nil then
        props:Set(propertyName);
    elseif type(propertyName) == "string" and type(propertyValue) == "string" then
        if checkIsoFlagType == nil then
            props:Set(propertyName, propertyValue);
        else
            props:Set(propertyName, propertyValue, checkIsoFlagType);
        end
    elseif type(propertyName) == "userdata" and type(propertyValue) == "string" then
        props:Set(propertyName, propertyValue);
    else
        BM_Logger:error("Invalid parameter types or count for Set function");
        BM_Logger:error((propertyName or "nil") .. " " .. (propertyValue or "nil") .. " " .. (checkIsoFlagType or "nil"));
    end
end

--- Unsets a sprite property
---@param props PropertyContainer The properties object of the sprite
---@param propertyName string|IsoFlagType The name of the property to unset or an IsoFlagType
function BM_Utils.unsetSpriteProperty(props, propertyName)
    if type(propertyName) == "string" then
        props:UnSet(propertyName)
    elseif type(propertyName) == "userdata" then
        props:UnSet(propertyName)
    else
        BM_Logger:error("Invalid parameter type for UnSet function")
        BM_Logger:error((propertyName or "nil"))
    end
end

--- Function to set or unset sprite properties
---@param manager IsoSpriteManager The sprite manager
---@param spriteList table The list of sprite names
---@param setProperties table|nil A list of properties to set
---@param unsetProperties table|nil A list of properties to unset
function BM_Utils.setOrUnsetSpriteProperties(manager, spriteList, setProperties, unsetProperties)
    local props;
    for _, sprite in ipairs(spriteList) do
        props = manager:getSprite(sprite):getProperties();
        -- set properties
        if setProperties then
            for _, prop in ipairs(setProperties) do
                BM_Utils.setSpriteProperty(props, unpack(prop));
            end
        end
        -- unset properties
        if unsetProperties then
            for _, prop in ipairs(unsetProperties) do
                BM_Utils.unsetSpriteProperty(props, prop);
            end
        end
        props:CreateKeySet();
    end
end

--- Prints property names and their values, as well as flags list for a sprite
---@param sprite string The sprite name
function BM_Utils.printPropNamesFromSprite(sprite)
    local isoSprite = IsoSpriteManager.instance:getSprite(sprite);
    if not isoSprite then
        BM_Logger:debug("No properties for " .. sprite); return;
    end

    local props = isoSprite:getProperties();

    local propertyNames = props:getPropertyNames();
    if propertyNames and propertyNames:size() > 0 then
        BM_Logger:debug("Property Names and Values for " .. sprite .. ":");
        for i = 0, propertyNames:size() - 1 do
            local propName = propertyNames:get(i);
            local propValue = props:Val(propName) or "nil";
            BM_Logger:debug(string.format("    %s = %s", propName, propValue));
        end
    else
        BM_Logger:debug("No property names for " .. sprite);
    end

    local flagsList = props:getFlagsList();
    if flagsList and flagsList:size() > 0 then
        BM_Logger:debug("Flags List for " .. sprite .. ":");
        for i = 0, flagsList:size() - 1 do
            local flag = flagsList:get(i);
            BM_Logger:debug("    " .. tostring(flag));
        end
    else
        BM_Logger:debug("No flags for " .. sprite);
    end
end

--- Calculates the health of metal buildings based on Metalwelding perk
---@param ISItem ISBuildingObject
---@return number
function BM_Utils.getMetalHealth(ISItem)
    if not ISItem or not ISItem.player then return 200; end
    local playerObj = getSpecificPlayer(ISItem.player)
    local health = (playerObj:getPerkLevel(Perks.MetalWelding) * 75);
    if playerObj:HasTrait("Handy") then
        health = health + 150;
    end
    return health;
end

function BM_Utils.safeCallMethod(object, methodName, ...)
    if type(object[methodName]) == "function" then
        return object[methodName](object, ...);
    end
end

-- Function to add a list of values to a specified property in the world's property value map
---@param propertyName string The name of the property to which values are added
---@param values table A table of values to ensure they are present in the property map
function BM_Utils.addValuesToPropertyMap(propertyName, values)
    local currentValues = IsoWorld.PropertyValueMap:get(propertyName) or ArrayList.new()

    for _, value in ipairs(values) do
        if not currentValues:contains(value) then
            currentValues:add(value)
        end
    end

    IsoWorld.PropertyValueMap:put(propertyName, currentValues)
end

--- Sets attached sprites for the specified building object based on its orientation
--- @param buildingObject ISBuildingObject The wall object containing attached sprites information
--- @param isCorner boolean Indicates if the building object is a corner piece
function BM_Utils.setAttachedSprites(buildingObject, isCorner)
    if not buildingObject.attachedSprites then return; end
    local attachedSprites = nil;

    if isCorner then
        attachedSprites = buildingObject.attachedSprites.corner;
    else
        if buildingObject.north then
            attachedSprites = buildingObject.attachedSprites.northSprite;
        elseif buildingObject.west then
            attachedSprites = buildingObject.attachedSprites.sprite;
        elseif buildingObject.south then
            attachedSprites = buildingObject.attachedSprites.southSprite;
        elseif buildingObject.east then
            attachedSprites = buildingObject.attachedSprites.eastSprite;
        end
    end

    if attachedSprites ~= nil then
        buildingObject.javaObject:setAttachedAnimSprite(ArrayList:new());
        for i = 1, #attachedSprites do
            buildingObject.javaObject:getAttachedAnimSprite():add(getSprite(attachedSprites[i]):newInstance());
        end
    end
end

--- Checks if two walls can form a corner, places the corner object if necessary, and returns whether a corner was placed
--- Also handles placing pillars at the correct positions when placing a corner
--- @param x number The x-coordinate of the grid square
--- @param y number The y-coordinate of the grid square
--- @param z number The z-coordinate (floor level)
--- @param north boolean Whether the building object is facing north
--- @param buildingObject ISBuildingObject The object containing relevant data for corner placement
--- @return boolean validity true if a corner was placed, or false otherwise
function BM_Utils.checkCorner(x, y, z, north, buildingObject)
    if not buildingObject.corner then return false; end

    -- find second wall (neighbor wall to form a corner)
    local secondWall = nil;
    for i = 0, buildingObject.sq:getSpecialObjects():size() - 1 do
        local worldObj = buildingObject.sq:getSpecialObjects():get(i);
        if instanceof(worldObj, "IsoThumpable") or (instanceof(worldObj, "IsoWindow") and worldObj:getModData()["WindowWall"]) then
            local secondWallSpriteName = worldObj:getSprite():getName();
            if (north and not worldObj:getNorth() and secondWallSpriteName == buildingObject.sprite) or
                (not north and worldObj:getNorth() and secondWallSpriteName == buildingObject.northSprite) then
                secondWall = worldObj;
                break;
            end
        end
    end

    if secondWall then
        buildingObject.sq:transmitRemoveItemFromSquare(secondWall);
        buildingObject.sq:RemoveTileObject(secondWall);

        local cell = getWorld():getCell();
        if buildingObject.Type == "ISWindowWallObj" then
            buildingObject.javaObject = IsoWindow.new(cell, buildingObject.sq, getSprite(buildingObject.corner), north);
        else
            buildingObject.javaObject = IsoThumpable.new(cell, buildingObject.sq, buildingObject.corner, north,
                buildingObject);
        end

        BM_Utils.setAttachedSprites(buildingObject, true);
        BM_Utils.placeCornerPillars(x, y, z, north, buildingObject);

        return true;
    end
    return false;
end

--- Checks if the wall object conflicts with the current building object for pillar placement
--- @param worldObj IsoThumpable The wall object to check
--- @param north boolean Indicates whether the building object is oriented north
--- @param buildingObject ISBuildingObject The building object for context
--- @return boolean True if there is a conflict; otherwise, false
local function isRelevantWall(worldObj, north, buildingObject)
    local sprite = worldObj:getSprite();
    if not sprite then return false; end

    local isWallSE = sprite:getProperties():Is(IsoFlagType.WallSE);
    local isWallNW = sprite:getProperties():Is(IsoFlagType.WallNW);
    local isOtherWallNorth = worldObj:getNorth();
    local isCornerWallNW = (not buildingObject.sprite and not buildingObject.northSprite and buildingObject.corner) and
        getSprite(buildingObject.corner):getProperties():Is(IsoFlagType.WallNW);

    return (isOtherWallNorth ~= north and not isWallSE) or isWallNW or isCornerWallNW;
end


--- Checks if a pillar can be added at the specified coordinates
--- @param x number The x-coordinate of the grid square
--- @param y number The y-coordinate of the grid square
--- @param z number The z-coordinate (floor level)
--- @param north boolean Indicates whether the building object is oriented north
--- @param buildingObject ISBuildingObject The building object containing relevant data for pillar placement
function BM_Utils.checkPillar(x, y, z, north, buildingObject)
    if buildingObject.sq then
        for i = 0, buildingObject.sq:getSpecialObjects():size() - 1 do
            local worldObj = buildingObject.sq:getSpecialObjects():get(i);
            if instanceof(worldObj, "IsoThumpable") and worldObj:getModData()["wallType"] == "pillar" then
                buildingObject.sq:transmitRemoveItemFromSquare(worldObj);
                buildingObject.sq:RemoveTileObject(worldObj);
            end
        end
    end

    local wallOffsetX, wallOffsetY = 1, -1;
    local pillarCoordX, pillarCoordY = x + 1, y;
    if not north then
        wallOffsetX, wallOffsetY = -1, 1;
        pillarCoordX, pillarCoordY = x, y + 1;
    end

    local otherWallSq = getCell():getGridSquare(x + wallOffsetX, y + wallOffsetY, z);
    for i = 0, otherWallSq:getSpecialObjects():size() - 1 do
        local worldObj = otherWallSq:getSpecialObjects():get(i);
        if instanceof(worldObj, "IsoThumpable") and isRelevantWall(worldObj, north, buildingObject) then
            BM_Utils.addPillar(pillarCoordX, pillarCoordY, z, buildingObject);
        end
    end

    -- we are adding the second pillar only on true corners buildable objects
    if (not buildingObject.sprite and not buildingObject.northSprite and buildingObject.corner) then
        local secondWallOffsetX, secondWallOffsetY = -wallOffsetX, -wallOffsetY;
        local secondPillarCoordX, secondPillarCoordY = pillarCoordX - wallOffsetX, pillarCoordY - wallOffsetY;

        local oppositeWallSq = getCell():getGridSquare(x + secondWallOffsetX, y + secondWallOffsetY, z);
        for i = 0, oppositeWallSq:getSpecialObjects():size() - 1 do
            local worldObj = oppositeWallSq:getSpecialObjects():get(i);
            if instanceof(worldObj, "IsoThumpable") and isRelevantWall(worldObj, north, buildingObject) then
                BM_Utils.addPillar(secondPillarCoordX, secondPillarCoordY, z, buildingObject);
            end
        end
    end
end

--- Places two pillars for the corner, in the correct adjacent tiles
--- @param x number The x-coordinate of the grid square where the corner is placed
--- @param y number The y-coordinate of the grid square where the corner is placed
--- @param z number The z-coordinate (floor level)
--- @param north boolean Indicates the orientation of the corner
--- @param buildingObject ISBuildingObject The building object containing pillar data
function BM_Utils.placeCornerPillars(x, y, z, north, buildingObject)
    BM_Utils.checkPillar(x, y, z, true, buildingObject);
    BM_Utils.checkPillar(x, y, z, false, buildingObject);
end

--- Adds a pillar at the specified coordinates
--- @param x number The x-coordinate of the grid square
--- @param y number The y-coordinate of the grid square
--- @param z number The z-coordinate (floor level)
--- @param buildingObject ISBuildingObject The building object containing pillar data
function BM_Utils.addPillar(x, y, z, buildingObject)
    local pillarSq = getCell():getGridSquare(x, y, z);
    if (pillarSq and pillarSq:getWallFull()) or not buildingObject.pillar then return; end

    local pillar = IsoThumpable.new(getCell(), pillarSq, buildingObject.pillar, false, nil);
    pillar:setCorner(true);
    pillar:setCanBarricade(false);
    pillar:setModData(copyTable({ wallType = "pillar" }));

    pillarSq:AddSpecialObject(pillar);
    pillarSq:RecalcAllWithNeighbours(true);

    pillar:transmitCompleteItemToServer();
end

return BM_Utils
