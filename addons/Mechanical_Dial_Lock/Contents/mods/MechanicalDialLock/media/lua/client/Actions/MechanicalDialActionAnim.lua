require "TimedActions/ISBaseTimedAction"

---@class MechanicalDialActionAnim : ISBaseTimedAction
---@field character any
---@field maxTime any
---@field part IsoObject
MechanicalDialActionAnim = ISBaseTimedAction:derive("MechanicalDialActionAnim")

--- Checks if the action is valid.
---@return boolean
function MechanicalDialActionAnim:isValid()
	return true
end

--- Waits for the action to start.
---@return boolean
function MechanicalDialActionAnim:waitToStart()
	self.character:faceThisObject(self.part)
	return self.character:shouldBeTurning()
end

--- Updates the action.
function MechanicalDialActionAnim:update()
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    end
end

--- Starts the action.
function MechanicalDialActionAnim:start()
	self:setActionAnim("DialLockActionAnim")
	self:setOverrideHandModels(nil, nil)
end

--- Stops the action.
function MechanicalDialActionAnim:stop()
	ISBaseTimedAction.stop(self)
end

--- Performs the action.
function MechanicalDialActionAnim:perform()
	ISBaseTimedAction.perform(self)
end

--- Creates a new instance of MechanicalDialActionAnim.
---@param character IsoPlayer
---@param part IsoObject
---@return MechanicalDialActionAnim
function MechanicalDialActionAnim:new(character, part)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 100000
	o.part = part

	return o
end




