ISWaterWell = ISBuildingObject:derive('ISWaterWell')

ISWaterWell.WaterWells = {}

ISWaterWell.wantNoise = getDebug()
local noise = function(msg)
    if (ISWaterWell.wantNoise) then print('[Building Menu] Water Well: ' .. msg); end
end

function ISWaterWell:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoThumpable.new(cell, self.sq, sprite, north, self);
    buildUtil.setInfo(self.javaObject, self);
    buildUtil.consumeMaterial(self);
    self.javaObject:setMaxHealth(self:getHealth());
    self.javaObject:setHealth(self.javaObject:getMaxHealth());
    self.javaObject:setBreakSound('breakdoor');
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

function ISWaterWell:new( sprite, northSprite, waterMax, player)
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

function ISWaterWell:getHealth()
    return 3000 + buildUtil.getWoodHealth(self);
end

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

function ISWaterWell.shovelledFloorCanDig(square)
	if (not square) or (not square:getFloor()) then return false; end
	if square:isInARoom() then return false; end
	local floor = square:getFloor();
	local sprites = floor:getModData() and floor:getModData().shovelledSprites;
	if sprites then
		for i=1,#sprites do
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


function ISWaterWell:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

function ISWaterWell.isISWaterWellObject(object)
    return object ~= nil and object:getModData()['IsWaterWell'];
end

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
                        noise('added rain to WaterWell at ' .. vB.x .. ',' .. vB.y .. ',' .. vB.z .. ' waterAmount=' .. vB.waterAmount .. ' rainIntensity=' .. rainIntensity);
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
            local square = getCell():getGridSquare(vB.x, vB.y, vB.z)
            if square then
                vB.waterAmount = math.min(vB.waterMax, vB.waterAmount + ZombRand(1, 5))
                local obj = ISWaterWell.findObject(square)
                if obj then
                    noise('added water to WaterWell at ' .. vB.x .. ',' .. vB.y .. ',' .. vB.z .. ' waterAmount=' .. vB.waterAmount);
                    obj:setWaterAmount(vB.waterAmount);
                    obj:transmitModData();
                end
            end
        end
    end
end

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

function ISWaterWell.loadGridsquareJavaHook(sq, object)
    if isClient() then return; end

    if ISWaterWell.isISWaterWellObject(object) then
        ISWaterWell.loadRainWaterWell(object);
    end
end

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
        noise('new WaterWell created ' .. WaterWell.x .. ',' .. WaterWell.y .. ' with ' .. WaterWell.waterAmount .. ' water');
    else
        noise('found existed WaterWell ' .. WaterWell.x .. ',' .. WaterWell.y .. ' with ' .. WaterWell.waterAmount);
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
            noise('waterAmount changed to ' .. object:getWaterAmount() .. ' at ' .. vB.x .. ',' .. vB.y .. ',' .. vB.z);
            vB.waterAmount = object:getWaterAmount();
            break;
        end
    end
end

ISWaterWell.OnClientCommand = function(module, command, player, args)
    if module ~= 'object' then return; end

    if command == 'takeWater' then
        local gs = getCell():getGridSquare(args.x, args.y, args.z);
        if gs then
            for i = 0, gs:getObjects():size() - 1 do
                local obj = gs:getObjects():get(i);
                if obj:useWater(args.units) > 0 then
                    obj:transmitModData();
                    break
                end
            end
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
            noise('destroyed at ' .. vB.x .. ',' .. vB.y .. ',' .. vB.z);
            table.remove(ISWaterWell.WaterWells, iB);
            break
        end
    end
end

Events.EveryTenMinutes.Add(ISWaterWell.checkRain);
Events.EveryHours.Add(ISWaterWell.checkEveryHours);
Events.LoadGridsquare.Add(ISWaterWell.LoadGridsquare);
Events.OnWaterAmountChange.Add(ISWaterWell.OnWaterAmountChange);
Events.OnClientCommand.Add(ISWaterWell.OnClientCommand);
Events.OnObjectAdded.Add(ISWaterWell.OnObjectAdded);
Events.OnDestroyIsoThumpable.Add(ISWaterWell.OnDestroyIsoThumpable);