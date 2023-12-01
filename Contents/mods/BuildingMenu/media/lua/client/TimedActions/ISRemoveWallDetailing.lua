require 'BuildingMenu01_Main'
require "TimedActions/ISBaseTimedAction"

local RemovableWallDetailingTiles = require 'ValidWallDetailingTiles'

ISRemoveWallDetailing = ISBaseTimedAction:derive("ISRemoveWallDetailing")

-- Checks if the action is valid.
---@return boolean true if valid, false otherwise.
function ISRemoveWallDetailing:isValid()
	if self.wallDetailing and not self:getWallDetailingObject(self.square) then
		return false
	end
	return (self.weapon and self.weapon:getCondition() > 0) or not self.weapon;
end

-- Waits for the action to start.
---@return boolean true to start the action, false otherwise.
function ISRemoveWallDetailing:waitToStart()
	if self.wallDetailing then
		local object = self:getWallDetailingObject(self.square)
		if object then
			self.character:faceThisObject(object)
		end
	else
		self.character:faceLocation(self.square:getX(), self.square:getY())
	end
	return self.character:shouldBeTurning()
end

function ISRemoveWallDetailing:update()
	if self.wallDetailing then
		local object = self:getWallDetailingObject(self.square)
		if object then self.character:faceThisObject(object) end
	else
		self.character:faceLocation(self.square:getX(), self.square:getY())
	end

	self.spriteFrame = self.character:getSpriteDef():getFrame()

    self.character:setMetabolicTarget(Metabolics.HeavyWork);
end

function ISRemoveWallDetailing:start()
    self.weapon = self.character:getPrimaryHandItem()
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 20, 10)
	self:setActionAnim("RemoveBushAxe")
end

function ISRemoveWallDetailing:stop()
    ISBaseTimedAction.stop(self)
end

-- Handles animation events.
---@param event string The animation event.
---@param parameter string The event parameter.
function ISRemoveWallDetailing:animEvent(event, parameter)
	if event == 'Chop' then
		local hammer = self.character:getPrimaryHandItem();
		self.character:playSound(hammer:getDoorHitSound())
	end
end

-- Gets the wall detailing object on a given square.
---@param square IsoGridSquare The square to search for the object.
---@return Object object, number i The object and its index, or nil if not found.
function ISRemoveWallDetailing:getWallDetailingObject(square)
	if not square then return nil end
	for i=0,square:getObjects():size()-1 do
		local object = square:getObjects():get(i);
		local attached = object:getAttachedAnimSprite()
		if attached then
			for n=1,attached:size() do
                local sprite = attached:get(n - 1)
                if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
                    local spriteName = sprite:getParentSprite():getName()
                    for _, pattern in ipairs(RemovableWallDetailingTiles) do
                        if luautils.stringStarts(spriteName, pattern) then
                            return object, n-1
                        end
                    end
                end
			end
		end
	end
	return nil
end

function ISRemoveWallDetailing:perform()
	local sq = self.square
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), wallDetailing = self.wallDetailing }
	sendClientCommand(self.character, 'object', 'removeWallDetailing', args)
    ISBaseTimedAction.perform(self)
end

function ISRemoveWallDetailing:useEndurance()
	if self.weapon and self.weapon:isUseEndurance() then
		local use = self.weapon:getWeight() * self.weapon:getFatigueMod(self.character) * self.character:getFatigueMod() * self.weapon:getEnduranceMod() * 0.1
		local useChargeDelta = 1.0
		use = use * useChargeDelta * 0.041
		if self.weapon:isTwoHandWeapon() and self.character:getSecondaryHandItem() ~= self.weapon then
			use = use + self.weapon:getWeight() / 1.5 / 10 / 20
		end
		self.character:getStats():setEndurance(self.character:getStats():getEndurance() - use)
	end
end

-- Creates a new instance of ISRemoveWallDetailing.
---@param character IsoPlayer The player character.
---@param square IsoGridSquare The target square.
---@param wallDetailing string The type of removal action.
---@return ISRemoveWallDetailing class The created instance.
function ISRemoveWallDetailing:new(character, square, wallDetailing)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.square = square
	o.stopOnWalk = true
	o.stopOnRun = true
	o.maxTime = 150
	o.spriteFrame = 0
	o.wallDetailing = wallDetailing
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
	return o
end