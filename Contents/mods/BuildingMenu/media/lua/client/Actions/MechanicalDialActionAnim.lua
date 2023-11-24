require "TimedActions/ISBaseTimedAction"

MechanicalDialActionAnim = ISBaseTimedAction:derive("MechanicalDialActionAnim")

function MechanicalDialActionAnim:isValid()
	return true
end

function MechanicalDialActionAnim:waitToStart()
	self.character:faceThisObject(self.part)
	return self.character:shouldBeTurning()
end

function MechanicalDialActionAnim:update()
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    end
end

function MechanicalDialActionAnim:start()
	self:setActionAnim("VehicleWorkOnMid")
	self:setOverrideHandModels(nil, nil)
end

function MechanicalDialActionAnim:stop()
	ISBaseTimedAction.stop(self)
end

function MechanicalDialActionAnim:perform()
	ISBaseTimedAction.perform(self)
end

function MechanicalDialActionAnim:new(character, part)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 100000
	o.part = part

	return o
end




