require 'TimedActions/ISBaseTimedAction'

---@class ISToggleLight : ISBaseTimedAction
ISToggleLight = ISBaseTimedAction:derive('ISToggleLight')

--- Checks if the light source can be toggled.
---@return boolean
function ISToggleLight:isValid()
  if self.lightSource:getSquare():haveElectricity() or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier) or self.lightSource:isLightSourceOn() then
    return true
  end
  return false
end

function ISToggleLight:start()
end

function ISToggleLight:update()
end

function ISToggleLight:stop()
  ISBaseTimedAction.stop(self)
end

function ISToggleLight:perform()
  if isClient() then
    local sq = self.lightSource:getSquare()
    local args = {x = sq:getX(), y = sq:getY(), z = sq:getZ()}
    sendClientCommand(self.character, 'object', 'toggleElectricLight', args)
  else
    BM_Commands.addPole(self.lightSource:getSquare())
    self.lightSource:toggleLightSource(not self.lightSource:isLightSourceOn())
  end
  ISBaseTimedAction.perform(self)
end

--- Constructor for the ISToggleLight class.
---@param character IsoPlayer
---@param lightSource IsoObject
---@param time integer
---@return ISToggleLight
function ISToggleLight:new(character, lightSource, time)
  local o = ISBaseTimedAction.new(self, character)
  o.stopOnWalk = true
  o.stopOnRun = true
  o.maxTime = time
  o.lightSource = lightSource
  return o
end