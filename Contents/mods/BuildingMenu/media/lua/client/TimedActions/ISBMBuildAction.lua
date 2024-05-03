require "TimedActions/ISBaseTimedAction"
local BM_Utils = require("BM_Utils");
---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");

--- @class ISBMBuildAction : ISBuildAction
ISBMBuildAction = ISBuildAction:derive("ISBMBuildAction");

--- Tool audio mappings based on the tool type
--- @type table<string, string|table<string, string>>
ISBMBuildAction.toolAudioMappings = {
    ["Hammer"] = {default = "Hammering", wood = "Hammering", metal = "HammeringMetal"},
    ["Sledgehammer"] = "SledgehammerSwing",
    ["Paintbrush"] = "Painting",
    ["Screwdriver"] = {default = "ScrewingWood", wood = "ScrewingWood", metal = "ScrewingMetal"},
    ["Saw"] = "Sawing",
    ["HandShovel"] = "DigFurrowWithTrowel",
    ["Shovel"] = "DigFurrowWithShovel",
    ["BlowTorch"] = "BlowTorch",
    ["WeldingMask"] = "BlowTorch",
    ["Needle"] = "Sewing"
};

--- List of appropriate animations based on tool type
--- @type table<string, string[]>
ISBMBuildAction.appropriateAnimations = {
    ["Hammer"] = {"Build", "Build", "BuildLow"},
    ["Sledgehammer"] = {"Destroy", "Destroy", "DestroyFloor"},
    ["Paintbrush"] = {"paint", "paint", "paint"},
    ["Screwdriver"] = {"Disassemble", "Disassemble", "VehicleWorkOnTire"},
    ["Saw"] = {"SawLog", "SawLog", "SawLog"},
    ["HandShovel"] = {"DigTrowel", "DigTrowel", "DigTrowel"},
    ["Shovel"] = {"DigShovel", "DigShovel", "DigShovel"},
    ["BlowTorch"] = {"BlowTorch", "BlowTorchMid", "BlowTorchFloor"},
    ["Needle"] = {"Craft", "Craft", "Craft"}
};

--- Initializes animation and tools map for the action
function ISBMBuildAction:initAnimationAndToolsMap()
    for toolType, anims in pairs(ISBMBuildAction.appropriateAnimations) do
        self.animationAndToolsMap[toolType] = {
            anims = anims,
            secondHand = nil -- default, can be overridden
        };
    end
    -- High,        Mid,          Low
    self.animationAndToolsMap["Hammer"].secondHand = {"PlankWall", "PlankWall", "PlankFloor"};
end

--- Determines if the given animation is appropriate for the tool type
--- @param actionAnim string
--- @param toolType string
--- @return boolean
function ISBMBuildAction:isAppropriateAnimation(actionAnim, toolType)
    local validAnims = ISBMBuildAction.appropriateAnimations[toolType];
    if validAnims then
        for _, anim in pairs(validAnims) do
            if anim == actionAnim then
                return true;
            end
        end
    end
    return false;
end

--- Constructor for ISBMBuildAction
--- @param character IsoGameCharacter
--- @param item InventoryItem
--- @param x number
--- @param y number
--- @param z number
--- @param north boolean
--- @param spriteName string
--- @param time number
--- @return ISBuildAction ISBMBuildAction instance
function ISBMBuildAction:new(character, item, x, y, z, north, spriteName, time)
    local o = ISBuildAction.new(self, character, item, x, y, z, north, spriteName, time);
    setmetatable(o, self);
    self.__index = self;

    o.halfTime = time / 2;
    o.elapsedTime = 0;
    o.currentTool = 1;

    o.soundTime = 0;
    o.soundDelay = 6;

    o.tools = {};
    o.toolSoundsPointers = {};

    o.animationAndToolsMap = {};
    o.hasWood, o.hasMetal = false, false;
    o.isAnimHigh, o.isAnimMid, o.isAnimLow = false, false, false;

    return o;
end

function ISBMBuildAction:getSound(toolType)
    local soundEntry = self.toolAudioMappings[toolType];
    if type(soundEntry) == "table" then
        return (self.hasMetal and soundEntry.metal) or (self.hasWood and soundEntry.wood) or soundEntry.default;
    else
        return soundEntry;
    end
end

--- Item types for wood categorization
--- @type table<string, boolean>
local metalItemTypes = {
    ["MetalPipe"] = true,
    ["ScrapMetal"] = true,
    ["MetalBar"] = true,
    ["SheetMetal"] = true,
    ["SmallSheetMetal"] = true,
    ["LeadPipe"] = true
};

--- Item types for wood categorization
--- @type table<string, boolean>
local woodItemTypes = {
    ["Plank"] = true,
    ["Log"] = true
};

function ISBMBuildAction:checkForMaterials()
    local modData = self.item.modData;
    local hasWood, hasMetal = false, false;
    for index, _ in pairs(modData) do
        local itemType = self:extractItemType(index);
        if itemType then
            hasWood = hasWood or woodItemTypes[itemType];
            hasMetal = hasMetal or metalItemTypes[itemType];
        end
    end
    return hasWood, hasMetal;
end

function ISBMBuildAction:extractItemType(dataIndex)
    if luautils.stringStarts(dataIndex, "need:") or luautils.stringStarts(dataIndex, "use:") then
        local itemFullType = luautils.split(dataIndex, ":")[2];
        return luautils.split(itemFullType, ".")[2];
    end
    return nil;
end

--- Starts the building action, initializing materials checks and tools
function ISBMBuildAction:start()
    self.hasWood, self.hasMetal = self:checkForMaterials();

    local tools = {};
    for i, tool in ipairs(self.item.usedTools) do
        -- creating virtual tools even if they're not physically in the inventory if the player has ISBuildMenu.cheat active
        local toolType = tool.toolType;
        local invItem = tool.invItem;
        if not invItem and ISBuildMenu.cheat and BuildingMenu.Tools[toolType] then
            local toolData = BuildingMenu.Tools[toolType];
            if toolData.types then
                invItem = InventoryItemFactory.CreateItem(toolData.types[1]);
            end
        end
        if invItem and not invItem:IsClothing() then
            table.insert(
                tools,
                {
                    toolType = toolType,
                    sound = self:getSound(tool.toolType),
                    invItem = invItem
                }
            );
        end
    end
    self.tools = tools;

    self.toolSoundsPointers = {};
    for i = 1, #self.tools do
        table.insert(self.toolSoundsPointers, 0);
    end

    if #self.tools == 0 then
        print("No valid tools available for construction.");
    end

    self:initializeAnimationFlags();
    self:initAnimationAndToolsMap();

    ISBuildAction.start(self);
end


--- Initializes the animation flags based on object properties to determine the correct animation height
function ISBMBuildAction:initializeAnimationFlags()
    local objSprite = getSprite(self.item:getSprite());
    if objSprite then
        local objProps = objSprite:getProperties();
        if objProps then
            -- determine animation flags based on sprite properties
            self.isAnimHigh = self.item.buildHigh or self:isHighObject(objProps);
            self.isAnimMid = self.item.buildMid or self:isMidObject(objProps);
            self.isAnimLow = self.item.buildLow or self.item.floor or self:isLowObject(objProps);

            -- check for surface-specific height properties which can override other flags
            self:adjustAnimationFlagsByHeight(objSprite);

            if self.isAnimLow == true then
                self.isAnimHigh = false; self.isAnimMid = false;
            elseif self.isAnimMid == true then
                self.isAnimHigh = false; self.isAnimLow = false;
            elseif self.isAnimHigh == true then
                self.isAnimMid = false; self.isAnimLow = false;
            end

            print("isAnimLow ", self.isAnimLow)
            print("isAnimMid ", self.isAnimMid)
            print("isAnimHigh ", self.isAnimHigh)
        end
    end
end


--- Checks if the object should be treated as a high object based on its properties
--- @param objProps PropertyContainer The properties of the object's sprite
--- @return boolean
function ISBMBuildAction:isHighObject(objProps)
    return objProps:Is("IsHigh") or objProps:Is("FenceTypeHigh") or objProps:Is("WallStyle") or
            objProps:Is("WallType") or objProps:Is("TallHoppableN") or objProps:Is("TallHoppableW") or
            objProps:Is("Door") or objProps:Is("DoorFrame") or objProps:Is("GarageDoor") or objProps:Is("WallW") or 
            objProps:Is("WallN") or objProps:Is("WallNW") or objProps:Is("WallSE") or objProps:Is("DoorWallW") or 
            objProps:Is("DoorWallN") or objProps:Is("WindowW") or objProps:Is("WindowN") or objProps:Is(IsoFlagType.doorN) or 
            objProps:Is(IsoFlagType.doorW) or objProps:Is(IsoFlagType.HoppableN) or objProps:Is(IsoFlagType.HoppableW) or
            (objProps:Is("ContainerPosition") and objProps:Val("ContainerPosition") == "High");
end


--- Checks if the object should be treated as a mid object based on its properties
--- @param objProps PropertyContainer The properties of the object's sprite
--- @return boolean
function ISBMBuildAction:isMidObject(objProps)
    return objProps:Is("IsLow") or objProps:Is("FenceTypeLow") or objProps:Is("IsTable") or objProps:Is("HoppableN") or 
        objProps:Is("HoppableW") or (objProps:Is("ContainerPosition") and objProps:Val("ContainerPosition") == "Low") or
        (objProps:Is("IsoType") and objProps:Val("IsoType") == "IsoMannequin") or objProps:Is(IsoFlagType.windowN) or objProps:Is(IsoFlagType.windowW) or objProps:Is(IsoFlagType.bed);
end


--- Checks if the object should be treated as a low object based on its properties
--- @param objProps PropertyContainer The properties of the object's sprite
--- @return boolean
function ISBMBuildAction:isLowObject(objProps)
    return objProps:Is("IsTableTop") or objProps:Is("solidFloor") or objProps:Is("attachedFloor") or
            objProps:Is("diamondFloor") or objProps:Is("IsFloor") or objProps:Is("natureFloor") or
            objProps:Is("grassFloor") or objProps:Is(IsoFlagType.FloorOverlay);
end


--- Adjusts animation flags based on object height properties like Surface or ItemHeight
--- @param objSprite IsoSprite The object main sprite instance
function ISBMBuildAction:adjustAnimationFlagsByHeight(objSprite)
    local objProps = objSprite:getProperties();
    local heightVal = tonumber(objProps:Val("Surface") or objProps:Val("ItemHeight") or nil);
    if heightVal then
        if heightVal <= 32 then
            self.isAnimLow = true; self.isAnimHigh = false; self.isAnimMid = false;
        elseif heightVal > 32 and heightVal <= 64 then
            self.isAnimLow = false; self.isAnimMid = true; self.isAnimHigh = false;
        elseif heightVal > 64 then
            self.isAnimLow = false; self.isAnimHigh = true; self.isAnimMid = false;
        end
    end
    if objProps:Is("IsStackable") and self.square then
        local props = ISMoveableSpriteProps.new(objSprite);
        local tableHeight = tonumber(props:getTotalTableHeight(self.square));
        if tableHeight < 32 then
            self.isAnimLow = true; self.isAnimHigh = false; self.isAnimMid = false;
        elseif tableHeight >= 32 and tableHeight < 64 then
            self.isAnimMid = true; self.isAnimHigh = false; self.isAnimLow = false;
        elseif tableHeight >= 64 then
            self.isAnimHigh = true; self.isAnimMid = false; self.isAnimLow = false;
        end
    end
end


--- Updates the building action, managing tools, sounds, and animations
function ISBMBuildAction:update()
    self.worldSoundRadius = 0;
    self.elapsedTime = self.elapsedTime + getGameTime():getMultiplier();

    if self.elapsedTime >= self.halfTime and self.currentTool == 1 then
        self:switchTool();
    end

    if self.soundTime + self.soundDelay < getTimestamp() then
        self:manageToolAnimationsAndSounds();

        if self.worldSoundRadius > 0 then
            self.soundTime = getTimestamp();
            ISBuildAction.worldSoundTime = self.soundTime;
            addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), self.worldSoundRadius, self.worldSoundRadius);
        end
    end

    self.character:setMetabolicTarget(Metabolics.HeavyWork);
    self:faceLocation();
end

--- Manages tool animations and sounds based on current tool and state
function ISBMBuildAction:manageToolAnimationsAndSounds()
    local currentToolInfo = self.tools[self.currentTool];
    local currentSoundPointer = self.toolSoundsPointers[self.currentTool];

    if currentToolInfo and currentToolInfo.invItem and not currentToolInfo.invItem:IsClothing() then
        local isPlaying = currentSoundPointer ~= 0 and self.character:getEmitter():isPlaying(currentSoundPointer);

        if not isPlaying then
            self:setAnimationAndTools(currentToolInfo);
            currentSoundPointer = self.character:getEmitter():playSound(currentToolInfo.sound);
            self.toolSoundsPointers[self.currentTool] = currentSoundPointer;
        end
        self.worldSoundRadius = currentToolInfo.invItem:getScriptItem():getSoundRadius() or 15;
    end
end

--- Switches to the next tool if conditions are met
function ISBMBuildAction:switchTool()
    local currentToolInfo = self.tools[self.currentTool];
    if self.currentTool < #self.tools then
        local nextToolInfo = self.tools[self.currentTool + 1];
        if (nextToolInfo.invItem and not nextToolInfo.invItem:IsClothing()) and currentToolInfo.sound ~= nextToolInfo.sound then
            local soundPointer = self.toolSoundsPointers[self.currentTool];
            if soundPointer and self.character:getEmitter():isPlaying(soundPointer) then
                self.character:getEmitter():stopSound(soundPointer);
            end
            self.toolSoundsPointers[self.currentTool] = nil;
        end
        self.currentTool = self.currentTool + 1;
    end
end

--- Sets the animation and tools for the current action
--- @param currentToolInfo table The current tool information
function ISBMBuildAction:setAnimationAndTools(currentToolInfo)
    local toolConfig = self.animationAndToolsMap[currentToolInfo.toolType];
    if toolConfig then
        local heightFlag = (self.isAnimHigh and 1) or (self.isAnimMid and 2) or (self.isAnimLow and 3) or 1;
        -- select the animation based on the height flags
        local anim = toolConfig.anims[heightFlag];
        -- select the second hand item based on the height flags, defaulting to the first item if no specific conditions are met
        local secondHandItem = toolConfig.secondHand and InventoryItemFactory.CreateItem(toolConfig.secondHand[heightFlag]):getStaticModel() or nil;

        if self.item.actionAnim and self:isAppropriateAnimation(self.item.actionAnim, currentToolInfo.toolType) then
            anim = self.item.actionAnim;
        end

        self:setActionAnim(anim);
        self:setOverrideHandModels(currentToolInfo.invItem, secondHandItem);
    else
        -- default case if tool type is not defined in the map
        self:setActionAnim(CharacterActionAnims.Build);
        self:setOverrideHandModels(currentToolInfo.invItem, nil);
    end
end

--- Stops all sound pointers that are currently playing
function ISBMBuildAction:stopSoundPointers()
    if self.toolSoundsPointers then
        for _, soundPointer in pairs(self.toolSoundsPointers) do
            if soundPointer and self.character:getEmitter():isPlaying(soundPointer) then
                self.character:getEmitter():stopSound(soundPointer);
            end
        end
    end
    self.toolSoundsPointers = {};
end

--- Stops the build action
function ISBMBuildAction:stop()
    self:stopSoundPointers();
    ISBuildAction.stop(self);
end

--- Performs the build action to completion
function ISBMBuildAction:perform()
    self:stopSoundPointers();
    ISBuildAction.perform(self);
end
