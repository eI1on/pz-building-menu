local OpenableContainers = require "BuildingMenu_ThrottlekittysTiles_ContextMenu"

require "TimedActions/ISBaseTimedAction"

ISOpenOpenableContainer = ISBaseTimedAction:derive("ISOpenOpenableContainer");

function ISOpenOpenableContainer:isValid()
    return true;
end

function ISOpenOpenableContainer:update()
end

function ISOpenOpenableContainer:start()
    self.character:faceThisObject(self.object)
end

function ISOpenOpenableContainer:stop()
    ISBaseTimedAction.stop(self)
end

function ISOpenOpenableContainer:perform()
    OpenableContainers.toggleContainer(self.character, self.object);
    ISBaseTimedAction.perform(self)
end

function ISOpenOpenableContainer:new(character, object)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.stopOnWalk = false;
    o.stopOnRun = false;
    o.maxTime = 10;
    o.object = object;
    return o;
end
