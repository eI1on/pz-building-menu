local BM_Utils = require("BM_Utils");

--- @class ISWaterWell : ISBuildingObject
ISWaterWell = ISBuildingObject:derive('ISWaterWell')

--- List of all water wells created.
ISWaterWell.WaterWells = {}

--- Debug flag to control output of debug information
ISWaterWell.wantNoise = getDebug()
local noise = function(msg)
    if (ISWaterWell.wantNoise) then 
        BM_Utils.debugPrint("[Building Menu DEBUG] Water Wells: ", msg);
    end
end

--- Creates a water well and places it in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the well faces north
--- @param sprite string The sprite to use for this object
function ISWaterWell:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound('breakdoor');

    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);

    ISWaterWell.waterAmount = ZombRand(10, 50);
    self.javaObject:getModData()['waterMax'] = self.waterMax;
    self.javaObject:getModData()['waterAmount'] = ISWaterWell.waterAmount;
    self.javaObject:setSpecialTooltip(true);

    local WaterWell = {};
    WaterWell.x = self.sq:getX();
    WaterWell.y = self.sq:getY();
    WaterWell.z = self.sq:getZ();
    WaterWell.waterAmount = ISWaterWell.waterAmount;
    WaterWell.waterMax = self.waterMax;
    WaterWell.exterior = self.sq:isOutside();
    table.insert(ISWaterWell.WaterWells, WaterWell);

    self.javaObject:transmitCompleteItemToServer();
end

--- Constructor for creating a new water well instance
--- @param sprite string Main sprite for the well
--- @param northSprite string North-facing sprite
--- @param waterMax integer Maximum water capacity
--- @param player integer Player ID
--- @return ISWaterWell ISBuildingObject instance
function ISWaterWell:new(sprite, northSprite, waterMax, player)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.name = 'Water Well';
    o.waterMax = waterMax;
    o.player = player;
    o.dismantable = false;
    o.canBarricade = false;
    o.blockAllTheSquare = true;
    return o;
end

--- Returns the health of the water well
--- @return integer health The health value
function ISWaterWell:getHealth()
    return 3000 + buildUtil.getWoodHealth(self);
end

--- Checks if the placement of the water well is valid
--- @param square IsoGridSquare The square to validate
--- @return boolean validity rue if placement is valid, false otherwise
function ISWaterWell:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false;
    end
    if not square:getMovingObjects():isEmpty() then
        return false;
    end
    for i = 1, square:getObjects():size() do
        local obj = square:getObjects():get(i - 1);
        if obj:getTextureName() and getSpecificPlayer(self.player):getZ() == 0 and
            (luautils.stringStarts(obj:getTextureName(), 'floors_exterior_natural') or
                luautils.stringStarts(obj:getTextureName(), 'blends_natural_01')) then
            return true;
        end
    end
    if not ISWaterWell.shovelledFloorCanDig(square) then return false; end
    if buildUtil.stairIsBlockingPlacement(square, true) then return false; end
    if not ISBuildingObject.isValid(self, square) then return false; end
    if not buildUtil.canBePlace(self, square) then return false; end
    return true;
end

--- Checks if the given square's floor type allows for digging
--- @param square IsoGridSquare The square to check
--- @return boolean validity True if digging is possible, false otherwise
function ISWaterWell.shovelledFloorCanDig(square)
    if (not square) or (not square:getFloor()) then return false; end
    if square:isInARoom() then return false; end
    local floor = square:getFloor();
    local sprites = floor:getModData() and floor:getModData().shovelledSprites;
    if sprites then
        for i = 1, #sprites do
            local sprite = sprites[i];
            if luautils.stringStarts(sprite, "floors_exterior_natural") or luautils.stringStarts(sprite, "blends_natural_01") then
                return true;
            end
        end
        return false;
    else
        return true;
    end
end

--- Renders the water well object in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the well will be placed
function ISWaterWell:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Checks whether the specified object is a water well
--- @param object IsoObject The object to check
--- @return boolean isWaterWell True if the object is a water well, false otherwise
function ISWaterWell.isISWaterWellObject(object)
    return object ~= nil and object:getModData()['IsWaterWell'];
end

--- Finds a water well object in a specified square
--- @param square IsoGridSquare The square to check
--- @return IsoObject|nil object The water well object if found, nil otherwise
function ISWaterWell.findObject(square)
    if not square then return nil; end
    for i = 0, square:getSpecialObjects():size() - 1 do
        local obj = square:getSpecialObjects():get(i);
        if ISWaterWell.isISWaterWellObject(obj) then
            return obj;
        end
    end
    return nil;
end

--- Updates water wells based on rainfall. Server/SP only
function ISWaterWell.checkRain()
    if isClient() then return; end

    local rainIntensity = Math.round(ClimateManager.getInstance():getRainIntensity() * 10) / 10 -- get rain intensity
    if rainIntensity > 0 then
        for iB, vB in ipairs(ISWaterWell.WaterWells) do
            if vB.waterAmount < vB.waterMax then
                local square = getCell():getGridSquare(vB.x, vB.y, vB.z)
                if square then
                    vB.exterior = square:isOutside()
                end
                if vB.exterior then
                    vB.waterAmount = math.min(vB.waterMax, vB.waterAmount + rainIntensity)
                    local obj = ISWaterWell.findObject(square)
                    if obj then
                        noise(string.format('Added rain water to WaterWell at %d,%d,%d: waterAmount=%d rainIntensity=%.1f', vB.x, vB.y, vB.z, vB.waterAmount, rainIntensity))
                        obj:setWaterAmount(vB.waterAmount);
                        obj:transmitModData();
                    end
                end
            end
        end
    end
end

function ISWaterWell.checkEveryHours()
    if isClient() then return; end

    for iB, vB in ipairs(ISWaterWell.WaterWells) do
        if vB.waterAmount < vB.waterMax then
            local square = getCell():getGridSquare(vB.x, vB.y, vB.z);
            if square then
                vB.waterAmount = math.min(vB.waterMax, vB.waterAmount + ZombRand(1, 5));
                local obj = ISWaterWell.findObject(square);
                if obj then
                    noise(string.format('Added water to WaterWell at %d,%d,%d: waterAmount=%d', vB.x, vB.y, vB.z, vB.waterAmount));
                    obj:setWaterAmount(vB.waterAmount);
                    obj:transmitModData();
                end
            end
        end
    end
end

--- Loads a water well object from a grid square
--- @param square IsoGridSquare The grid square to check
function ISWaterWell.LoadGridsquare(square)
    if isClient() then return; end

    for i = 0, square:getSpecialObjects():size() - 1 do
        local obj = square:getSpecialObjects():get(i);
        if ISWaterWell.isISWaterWellObject(obj) then
            ISWaterWell.loadRainWaterWell(obj);
            break;
        end
    end
end

--- Hooks into Java to load water well data
--- @param sq IsoGridSquare The grid square being loaded
--- @param object IsoObject The object to check
function ISWaterWell.loadGridsquareJavaHook(sq, object)
    if isClient() then return; end

    if ISWaterWell.isISWaterWellObject(object) then
        ISWaterWell.loadRainWaterWell(object);
    end
end

--- Loads water well data from an object
--- @param WaterWellObject IsoObject The water well object to load data from
function ISWaterWell.loadRainWaterWell(WaterWellObject)
    if not WaterWellObject or not WaterWellObject:getSquare() then return; end
    local square = WaterWellObject:getSquare();
    local WaterWell = nil;
    for i, v in ipairs(ISWaterWell.WaterWells) do
        if v.x == square:getX() and v.y == square:getY() and v.z == square:getZ() then
            WaterWell = v;
            break;
        end
    end
    if not WaterWell then
        WaterWell = {};
        WaterWell.x = square:getX();
        WaterWell.y = square:getY();
        WaterWell.z = square:getZ();
        WaterWell.waterAmount = WaterWellObject:getWaterAmount();
        WaterWell.waterMax = WaterWellObject:getModData()['waterMax'];
        if square:getModData()['waterAmount'] then
            WaterWell.waterAmount = tonumber(square:getModData()['waterAmount']);
            square:getModData()['waterAmount'] = ISWaterWell.waterAmount;
            square:getModData()['waterMax'] = "1200";
            square:getModData()['alwaysTakeWater'] = nil;
        end
        table.insert(ISWaterWell.WaterWells, WaterWell)
        noise(string.format('New WaterWell created at %d,%d,%d: waterAmount=%d', WaterWell.x, WaterWell.y, WaterWell.z, WaterWell.waterAmount));
    else
        noise(string.format('Found existing WaterWell at %d,%d,%d: waterAmount=%d', WaterWell.x, WaterWell.y, WaterWell.z, WaterWell.waterAmount));
        WaterWellObject:setWaterAmount(WaterWell.waterAmount);
    end
    WaterWellObject:getModData()['waterMax'] = WaterWell.waterMax;
    WaterWell.exterior = square:isOutside();
end

ISWaterWell.OnWaterAmountChange = function(object, prevAmount)
    if isClient() then return; end
    if not ISWaterWell.isISWaterWellObject(object) then return; end

    for iB, vB in ipairs(ISWaterWell.WaterWells) do
        if vB.x == object:getX() and vB.y == object:getY() and vB.z == object:getZ() then
            noise(string.format('Water amount changed for WaterWell to waterAmount=%d at %d,%d,%d', object:getWaterAmount(), vB.x, vB.y, vB.z));
            vB.waterAmount = object:getWaterAmount();
            break;
        end
    end
end


ISWaterWell.OnObjectAdded = function(object)
    if isClient() then return; end

    if ISWaterWell.isISWaterWellObject(object) then
        ISWaterWell.loadRainWaterWell(object);
    end
end

function ISWaterWell.OnDestroyIsoThumpable(thump, player)
    if isClient() then return; end

    if not thump:getSquare() or not ISWaterWell.isISWaterWellObject(thump) then return; end
    local sq = thump:getSquare();
    if not sq then return; end
    for iB, vB in ipairs(ISWaterWell.WaterWells) do
        if vB.x == sq:getX() and vB.y == sq:getY() and vB.z == sq:getZ() then
            noise(string.format('WaterWell destroyed at %d,%d,%d', vB.x, vB.y, vB.z));
            table.remove(ISWaterWell.WaterWells, iB);
            break;
        end
    end
end

Events.EveryTenMinutes.Add(ISWaterWell.checkRain);
Events.EveryHours.Add(ISWaterWell.checkEveryHours);
Events.LoadGridsquare.Add(ISWaterWell.LoadGridsquare);
Events.OnWaterAmountChange.Add(ISWaterWell.OnWaterAmountChange);
Events.OnObjectAdded.Add(ISWaterWell.OnObjectAdded);
Events.OnDestroyIsoThumpable.Add(ISWaterWell.OnDestroyIsoThumpable);
