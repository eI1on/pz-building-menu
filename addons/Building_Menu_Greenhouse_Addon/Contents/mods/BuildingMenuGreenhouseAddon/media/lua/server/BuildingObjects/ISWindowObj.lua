--- @class ISWindowObj : ISBuildingObject
ISWindowObj = ISBuildingObject:derive('ISWindowObj')

--- Creates a window object and places it in the game world
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param north boolean Indicates if the window faces north
--- @param sprite string The sprite to use for this object
function ISWindowObj:create(x, y, z, north, sprite)
    local cell = getWorld():getCell()
    self.sq = cell:getGridSquare(x, y, z)
    self.javaObject = IsoWindow.new(getCell(), self.sq, getSprite(sprite), north)
    buildUtil.consumeMaterial(self)
    self.sq:AddSpecialObject(self.javaObject)
    self.javaObject:setIsLocked(false)
    self.javaObject:transmitCompleteItemToServer()
end

--- List of valid sprites for window objects.
local validSprites = {
    ["fixtures_windows_01_72"] = true,
    ["fixtures_windows_01_73"] = true,
    ["edit_ddd_RUS_Forest Survival_01_14"] = true,
    ["edit_ddd_RUS_Forest Survival_01_15"] = true,
};

--- Prefix checks for texture validation.
local prefixCheck = {
    ["fixtures_windows_01_72"] = { "walls_interior_house_05_", "walls_exterior_house_03_" },
    ["fixtures_windows_01_73"] = { "walls_interior_house_05_", "walls_exterior_house_03_" },
    ["edit_ddd_RUS_Forest Survival_01_14"] = { "building_menu_03_ddd_Forest_Survival_0", "building_menu_03_ddd_Forest_Survival_1" },
    ["edit_ddd_RUS_Forest Survival_01_15"] = { "building_menu_03_ddd_Forest_Survival_0", "building_menu_03_ddd_Forest_Survival_1" },
};

--- Validates the placement of a window object
--- @param square IsoGridSquare The square to validate
--- @return boolean validity True if placement is valid, false otherwise
function ISWindowObj:isValid(square)
    if not self:haveMaterial(square) then return false; end
    if square:isVehicleIntersecting() then return false; end

    local sprite = self:getSprite();
    if not sprite then return false; end

    if validSprites[sprite] then
        for i = 1, square:getObjects():size() do
            local object = square:getObjects():get(i - 1);
            local objectSprite = object:getTextureName();
            if object.getNorth and type(object.getNorth) == "function" then
                if objectSprite and object:getNorth() == self.north then
                    for _, prefix in ipairs(prefixCheck[sprite]) do
                        if luautils.stringStarts(objectSprite, prefix) then
                            return true;
                        end
                    end
                end
            end
        end
        return false;
    end

    local sharedSprite = getSprite(sprite)
    if sharedSprite then
        local props = ISMoveableSpriteProps.new(sharedSprite);
        return props:canPlaceMoveable('bogus', square, nil);
    end
    return false;
end

--- Renders a ghost tile of the window for placement preview
--- @param x integer x coordinate in the world
--- @param y integer y coordinate in the world
--- @param z integer z coordinate (floor level)
--- @param square IsoGridSquare The square where the window will be placed
function ISWindowObj:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for creating a new window object instance
--- @param sprite string Main sprite for the window
--- @param northSprite string North-facing sprite
--- @param playerNum integer The player index who is building the window
--- @return ISWindowObj ISBuildingObject instance
function ISWindowObj:new(sprite, northSprite, playerNum)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.player = playerNum;
    o.canBarricade = true;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = 150;
    return o;
end

