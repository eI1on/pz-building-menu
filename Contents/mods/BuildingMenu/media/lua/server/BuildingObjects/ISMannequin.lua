---@class ISMannequin : ISBuildingObject
ISMannequin = ISBuildingObject:derive('ISMannequin')

--- Creates and places a mannequin in the game world at the specified location
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param north boolean Whether the mannequin is facing north
--- @param sprite string The sprite to use for this mannequin
function ISMannequin:create(x, y, z, north, sprite)
    local cell = getWorld():getCell();
    self.sq = cell:getGridSquare(x, y, z);

    self.javaObject = IsoMannequin.new(cell, self.sq, getSprite(sprite));

    if self.scriptStr then
        local mannequinScript = getScriptManager():getMannequinScript(self.scriptStr);
        self.javaObject:setMannequinScriptName(mannequinScript:getName());
    end

    self.javaObject:setMovedThumpable(true);
    self.javaObject:createContainersFromSpriteProperties();
    for i = 1, self.javaObject:getContainerCount() do
        self.javaObject:getContainerByIndex(i - 1):setExplored(true);
    end

    buildUtil.consumeMaterial(self);

    self.sq:AddSpecialObject(self.javaObject);
    self.javaObject:transmitCompleteItemToServer();
end

--- Validates if the mannequin can be placed at the given square
--- @param square IsoGridSquare The square to check for placement validity
--- @return boolean Returns true if the mannequin can be placed, otherwise false
function ISMannequin:isValid(square)
    if not ISBuildingObject.isValid(self, square) then
        return false;
    end
    return true;
end

--- Renders a ghost tile of the mannequin for placement preview
--- @param x number x coordinate in the world
--- @param y number y coordinate in the world
--- @param z number z coordinate (floor level)
--- @param square IsoGridSquare The square where the mannequin will be placed
function ISMannequin:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for creating a new instance of ISMannequin
--- @param playerNum integer The player index building the mannequin
--- @param sprite string The sprite for the mannequin
--- @return ISMannequin The created mannequin instance
function ISMannequin:new(playerNum, sprite)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o.canBarricade = false;
    o.player = playerNum;
    o.dismantable = true;
    o.name = "Mannequin";
    o.scriptStr = nil;
    o.stopOnWalk = false;
    o.stopOnRun = false;
    o.blockAllTheSquare = false;
    o.canBeAlwaysPlaced = false;
    o.maxTime = 800;
    return o;
end
