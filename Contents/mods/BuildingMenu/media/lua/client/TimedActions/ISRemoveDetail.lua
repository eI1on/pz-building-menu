require 'BuildingMenu01_Main'
require "TimedActions/ISBaseTimedAction"

local WallDetailingTiles = require 'BM_ValidWallDetailingTiles'
local removableWallDetailingTiles = WallDetailingTiles.getTiles()

local TrafficLineTiles = require 'BM_ValidTrafficLineTiles'
local removableTrafficLineTiles = TrafficLineTiles.getTiles()

ISRemoveDetail = ISBaseTimedAction:derive("ISRemoveDetail")

-- Checks if the action is valid.
---@return boolean true if valid, false otherwise.
function ISRemoveDetail:isValid()
	if self.removeType and not self:getRemovableObject(self.square) then
		return false;
	end
	return (self.weapon and self.weapon:getCondition() > 0) or not self.weapon;
end

-- Waits for the action to start.
---@return boolean true to start the action, false otherwise.
function ISRemoveDetail:waitToStart()
	if self.removeType then
		local object = self:getRemovableObject(self.square);
		if object then
			self.character:faceThisObject(object);
		end
	else
		self.character:faceLocation(self.square:getX(), self.square:getY());
	end
	return self.character:shouldBeTurning();
end

function ISRemoveDetail:update()
	if self.removeType then
		local object = self:getRemovableObject(self.square);
		if object then self.character:faceThisObject(object); end
	else
		self.character:faceLocation(self.square:getX(), self.square:getY());
	end

	self.spriteFrame = self.character:getSpriteDef():getFrame();

	self.character:setMetabolicTarget(Metabolics.HeavyWork);
end

function ISRemoveDetail:start()
	self.weapon = self.character:getPrimaryHandItem();
	if self.removeType == "wallDetailing" then
		self:setActionAnim("RemoveBushAxe");
		self.sound = self.character:playSound(self.weapon:getDoorHitSound());
	elseif self.removeType == "trafficLine" then
		self:setActionAnim(ISFarmingMenu.getShovelAnim(self.weapon));
		self.sound = self.character:playSound("DigFurrowWithTrowel");
	end
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 20, 10);
end

function ISRemoveDetail:stop()
	if self.sound and self.sound ~= 0 then
		self.character:getEmitter():stopOrTriggerSound(self.sound);
	end
	ISBaseTimedAction.stop(self);
end

-- Handles animation events.
---@param event string The animation event.
---@param parameter string The event parameter.
function ISRemoveDetail:animEvent(event, parameter)
end

-- Gets the wall detailing object on a given square.
---@param square IsoGridSquare The square to search for the object.
---@return IsoObject object, number i The object and its index, or nil if not found.
function ISRemoveDetail:getRemovableObject(square)
	if not square then return nil; end
	for i = 1, square:getObjects():size() do
		local o = square:getObjects():get(i - 1);
		local attached = o:getAttachedAnimSprite();
		if attached then
			for n = 1, attached:size() do
				local sprite = attached:get(n - 1);
				if sprite and sprite:getParentSprite() and sprite:getParentSprite():getName() then
					local spriteName = sprite:getParentSprite():getName();
					for _, pattern in ipairs(self.removableTable) do
						if luautils.stringStarts(spriteName, pattern) then
							return o;
						end
					end
				end
			end
		end
	end
	return nil;
end

function ISRemoveDetail:perform()
	if self.sound and self.sound ~= 0 then
		self.character:getEmitter():stopOrTriggerSound(self.sound);
	end

	local sq = self.square;
	local args = { x = sq:getX(), y = sq:getY(), z = sq:getZ(), removeType = self.removeType };

	sendClientCommand(self.character, 'object', 'removeDetailing', args);
	ISBaseTimedAction.perform(self);
end

function ISRemoveDetail:useEndurance()
	if self.weapon and self.weapon:isUseEndurance() then
		local use = self.weapon:getWeight() * self.weapon:getFatigueMod(self.character) * self.character:getFatigueMod() *
		self.weapon:getEnduranceMod() * 0.1;
		local useChargeDelta = 1.0;
		use = use * useChargeDelta * 0.041;
		if self.weapon:isTwoHandWeapon() and self.character:getSecondaryHandItem() ~= self.weapon then
			use = use + self.weapon:getWeight() / 1.5 / 10 / 20;
		end
		self.character:getStats():setEndurance(self.character:getStats():getEndurance() - use);
	end
end

-- Creates a new instance of ISRemoveDetail.
---@param character IsoPlayer The player character.
---@param square IsoGridSquare The target square.
---@param removeType string The type of removal action.
---@return ISRemoveDetail class The created instance.
function ISRemoveDetail:new(character, square, removeType)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o.character = character;
	o.square = square;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 200;
	o.spriteFrame = 0;
	o.removeType = removeType;
	if removeType == "wallDetailing" then
		o.removableTable = removableWallDetailingTiles;
	elseif removeType == "trafficLine" then
		o.removableTable = removableTrafficLineTiles;
	else
		o.removableTable = nil;
	end
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	return o;
end
