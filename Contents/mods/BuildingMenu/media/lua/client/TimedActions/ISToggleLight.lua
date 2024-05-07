require 'TimedActions/ISBaseTimedAction'

---@class ISToggleLight : ISBaseTimedAction
ISToggleLight = ISBaseTimedAction:derive('ISToggleLight');

--- Checks if the light source can be toggled
---@return boolean
function ISToggleLight:isValid()
  if self.lightSource:getSquare():DistToProper(self.character) >= 2 then return false; end

  if self.lightSource:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) then
    return true;
  end
  return false;
end

function ISToggleLight:waitToStart()
  local sq = self.lightSource:getSquare();
	self.character:faceLocation(sq:getX(), sq:getY());
	return self.character:shouldBeTurning();
end

function ISToggleLight:start()
  self.character:faceThisObject(self.lightSource);
end

function ISToggleLight:update()
end

function ISToggleLight:stop()
  ISBaseTimedAction.stop(self);
end

function ISToggleLight:perform()
  self.lightSource:toggle();
  ISBaseTimedAction.perform(self);
end

--- Constructor for the ISToggleLight class.
---@param character IsoPlayer
---@param lightSource IsoObject
---@param time integer
---@return ISToggleLight ISBaseTimedAction instance
function ISToggleLight:new(character, lightSource, time)
  local o = ISBaseTimedAction.new(self, character);
  o.stopOnWalk = true;
  o.stopOnRun = true;
  o.maxTime = time;
  o.lightSource = lightSource;
  return o;
end
