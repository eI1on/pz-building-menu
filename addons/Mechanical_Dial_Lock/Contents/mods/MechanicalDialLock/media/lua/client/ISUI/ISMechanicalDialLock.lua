require "ISUI/ISPanelJoypad"

---@class ISMechanicalDialLock : ISPanelJoypad
ISMechanicalDialLock = ISPanelJoypad:derive("ISMechanicalDialLock");

---@type number
local xPos = 150;
---@type number
local yPos = 150;

---@type number
local steps = 100;
---@type number
local stepSize = 3.6;

---@type Vector3f
local tmpVec1 = Vector3f.new();
---@type Vector3f
local tmpVec2 = Vector3f.new():set(1, 0, 0);

---@function ISMechanicalDialLock:initialise
function ISMechanicalDialLock:initialise()
    ISPanel.initialise(self);
    ISMechanicalDialLock.instance = self;

    local keys = {"Left", "Right", "Forward", "Backward", "Melee"}
    for _, key in ipairs(keys) do
        local bindingKey = "DialLock_" .. key
        self.character:getModData()[bindingKey] = getCore():getKey(key)
        getCore():addKeyBinding(key, nil)
    end

	self.richtext = ISRichTextPanel:new(0, self.height-120, self:getWidth(), 150);
	self.richtext.anchorRight = true
	self.richtext.anchorBottom = true
	self.richtext:initialise();
	self:addChild(self.richtext);
    if self.isNewCode then
        self.richtext.text = getText("IGUI_LockDial_NewCode");
    else
        self.richtext.text = getText("IGUI_LockDial_Controls");
    end
	self.richtext:paginate();

    self.cancel = ISButton:new(self:getWidth() - 110, self:getHeight() - 25, 100, 25, "Cancel", self, ISMechanicalDialLock.onClick);
    self.cancel.internal = "CANCEL";
    self.cancel:initialise();
    self.cancel:instantiate();
    self.cancel.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.cancel);

    if self.isNewCode then
        self.lockCombination = {};

        self.ok = ISButton:new(10, self:getHeight() - 25, 100, 25, "OK", self, ISMechanicalDialLock.onClick);
        self.ok.internal = "OK";
        self.ok:initialise();
        self.ok:instantiate();
        self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
        self:addChild(self.ok);
    else
        self.lockCombination = self:parseCombination(self.thumpable:getModData().code);
    end

    self.currentNumberIndex = 1;
    self.matchedNumbers = {};    
    self.numberWidth = getTextManager():MeasureStringX(UIFont.Intro, "00");
    self.startX = self.dialTextureBack:getXStart() + self:getWidth() / 2 - self.numberWidth * 1.5;
    self.startY = self.dialTextureBack:getYStart() - 50;
    self.currentNumberStayTime = 0
    self.lastNumberMatchedTime = 0

    ISTimedActionQueue.clear(self.character);
    ISTimedActionQueue.add(MechanicalDialActionAnim:new(self.character, self.thumpable));
end

function ISMechanicalDialLock:render()
    self:DrawTextureAngle(self.dialTextureBack, xPos, yPos, 0);
    self:DrawTextureAngle(self.dialTextureFront, xPos, yPos, self.dialAngle);

    if not self.isNewCode then
        self:drawDirectionArrow();
        self:updateDial(self.lastAngle);
    end

    local numberX = self.startX
    for i = 1, 3 do
        local color = 'white'
        local number = self:convertAngleToNumber(self.dialAngle)

        if i < self.currentNumberIndex then
            color = 'grey'
            number = self.lockCombination[i]
        elseif i > self.currentNumberIndex then
            number = nil
        end

        if number then
            self:drawNumber(number, color, numberX, self.startY)
            numberX = numberX + 50
        end
    end


    if self.isEnd then
        self:setVisible(false);
        self:removeFromUIManager();
        self:close();
    end
end

--- Draws a number on the screen.
---@param number number The number to draw.
---@param color string The color of the number.
---@param x number The x coordinate.
---@param y number The y coordinate.
function ISMechanicalDialLock:drawNumber(number, color, x, y)
    local r, g, b = 1, 1, 1
    if color == 'grey' then
        r, g, b = 0.6, 0.6, 0.6
    end

    local numberWidth = getTextManager():MeasureStringX(UIFont.Intro, tostring(number))
    local centeredX = x - numberWidth / 2

    self:drawText(tostring(number), centeredX, y, r, g, b, 1, UIFont.Intro)
end

function ISMechanicalDialLock:drawDirectionArrow()
    local arrowTexture
    local arrowX, arrowY = self.dialTextureBack:getXStart() - 30, self.dialTextureBack:getYStart()
    if self.currentNumberIndex == 2 then
        arrowTexture = getTexture("media/textures/MechanicalDialLock_RightArrow.png")
        arrowX = self:getWidth() - arrowTexture:getWidth() + 30
    else
        arrowTexture = getTexture("media/textures/MechanicalDialLock_LeftArrow.png")
    end
    if arrowTexture then
        self:drawTexture(arrowTexture, arrowX, arrowY, 1, 1, 1, 1)
    end
end

--- Updates the dial based on the new angle.
---@param newAngle number The new angle.
function ISMechanicalDialLock:updateDial(newAngle)
    local angleDiff = self:calculateAngleDifference(newAngle, self.lastAngle)

    local isLeftRotationAllowed = (self.currentNumberIndex == 1 or self.currentNumberIndex == 3)
    local isRightRotationAllowed = (self.currentNumberIndex == 2)

    if self.isNewCode or (isLeftRotationAllowed and angleDiff < 0) or (isRightRotationAllowed and angleDiff > 0) then
        self.dialAngle = (self.dialAngle + angleDiff) % 360
        self.lastAngle = newAngle

        local step = math.floor(self.dialAngle / stepSize)
        if step ~= self.lastStep then
            self.character:getEmitter():playSound("safe_lock_click_a" .. ZombRand(1, 5))
            self.lastStep = step
        end

        local currentNumber = self:convertAngleToNumber(self.dialAngle)
        if currentNumber == self.lockCombination[self.currentNumberIndex] then
            if self.lastNumberMatchedTime == 0 then
                self.lastNumberMatchedTime = getTimeInMillis()
            end
            self.currentNumberStayTime = getTimeInMillis() - self.lastNumberMatchedTime
            if self.currentNumberStayTime >= 1000 then
                self:isNumberMatched()
            end
        else
            self.currentNumberStayTime = 0
            self.lastNumberMatchedTime = 0
        end
    end
end


--- Handles mouse movement.
---@param dx number The change in x coordinate.
---@param dy number The change in y coordinate.
function ISMechanicalDialLock:onMouseMove(dx, dy)
    if self.mouseDown then
        local newAngle = self:getMouseAngle()
        self:updateDial(newAngle)
    end
end

--- Handles mouse button press.
---@param x number The x coordinate of the mouse.
---@param y number The y coordinate of the mouse.
function ISMechanicalDialLock:onMouseDown(x, y)
    self.mouseDown = true;
    self.lastAngle = self:getMouseAngle();
end

--- Handles mouse button release.
---@param x number The x coordinate of the mouse.
---@param y number The y coordinate of the mouse.
function ISMechanicalDialLock:onMouseUp(x, y)
    self.mouseDown = false;
end

--- Handles button click events.
---@param button ISButton The clicked button.
function ISMechanicalDialLock:onClick(button)
    if button.internal == "CANCEL" then
        self.isCancelled = true;
        self:close();
    elseif button.internal == "OK" and self.isNewCode then
        local currentNumber = self:convertAngleToNumber(self.dialAngle);
        self.currentNumberIndex = self.currentNumberIndex + 1;
        table.insert(self.lockCombination, currentNumber);
        if #self.lockCombination == 3 then
            self.thumpable:getModData().code = self:getCode();
            self.thumpable:transmitModData();
            self:close();
        end
    end
end

--- Checks if a number on the dial is matched.
function ISMechanicalDialLock:isNumberMatched()
    local currentNumber = self:convertAngleToNumber(self.dialAngle)
    if self.lockCombination[self.currentNumberIndex] == currentNumber then
        self.currentNumberIndex = self.currentNumberIndex + 1
        self.character:getEmitter():playSound("WoodDoorUnlock")
        self.matchedNumbers[self.currentNumberIndex] = currentNumber

        if self.currentNumberIndex > #self.lockCombination then
            self.isEnd = true
            self:close()
        end
        return true
    end
    return false
end

--- Converts an angle to a number on the dial.
---@param angle number The angle to convert.
---@return number number The converted number.
function ISMechanicalDialLock:convertAngleToNumber(angle)
    local adjustedAngle = (360 - angle) % 360;
    local number = math.floor(adjustedAngle / (360 / steps));
    return number;
end

--- Gets the mouse angle relative to the dial.
---@return number number The mouse angle.
function ISMechanicalDialLock:getMouseAngle()
    tmpVec1:set(self:getMouseX() - xPos, self:getMouseY() - yPos, 0);
    local angle = tmpVec1:angle(tmpVec2);
    if tmpVec1:y() > 0 then angle = -angle; end
    return -((angle / math.pi) * 180) % 360
end

--- Calculates the difference between two angles.
---@param newAngle number The new angle.
---@param lastAngle number The last angle.
---@return number number The angle difference.
function ISMechanicalDialLock:calculateAngleDifference(newAngle, lastAngle)
    local diff = newAngle - lastAngle;
    if diff > 180 then diff = diff - 360; end
    if diff < -180 then diff = diff + 360; end
    return diff
end

--- Parses the combination code.
---@param code number The code to parse.
---@return table table The parsed combination.
function ISMechanicalDialLock:parseCombination(code)
    local combination = {};
    while code > 0 do
        table.insert(combination, 1, code % 100);
        code = math.floor(code / 100);
    end
    while #combination < 3 do
        table.insert(combination, 1, 0);
    end
    return combination
end

--- Gets the combination code.
---@return number number The combination code.
function ISMechanicalDialLock:getCode()
    local code = 0;
    for i = 1, #self.lockCombination do
        code = code * 100 + self.lockCombination[i];
    end
    return code
end

--- Closes the ISMechanicalDialLock panel.
function ISMechanicalDialLock:close()
    local keys = {"Left", "Right", "Forward", "Backward", "Melee"}
    for _, key in ipairs(keys) do
        local bindingKey = "DialLock_" .. key
        getCore():addKeyBinding(key, self.character:getModData()[bindingKey])
        self.character:getModData()[bindingKey] = nil
    end

    UIManager.setShowPausedMessage(true);
    self:setVisible(false);
    self:removeFromUIManager();
    if UIManager.getSpeedControls() then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1);
    end

    if JoypadState.players[self.player+1] then
        setJoypadFocus(self.player, nil);
    end
    if not self.isCancelled and self.onclick ~= nil then
        self.onclick(self.target, self, self.character, self.thumpable);
    end

    ISMechanicalDialLock.instance = nil;
    ISTimedActionQueue.clear(self.character);
    ISPanel.close(self);
end

--- Creates a new instance of ISMechanicalDialLock.
---@param x number The x coordinate of the panel.
---@param y number The y coordinate of the panel.
---@param width number The width of the panel.
---@param height number The height of the panel.
---@param target any The target of the panel.
---@param onclick function The onclick function.
---@param player number The player number.
---@param thumpable IsoThumpable The thumpable object.
---@param isNew boolean Indicates if it's a new code.
---@return ISMechanicalDialLock ISMechanicalDialLock The created instance.
function ISMechanicalDialLock:new(x, y, width, height, target, onclick, player, thumpable, isNew)
    local o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self);
    self.__index = self;
    local playerObj = player and getSpecificPlayer(player) or nil;
    o.character = playerObj;
    o.player = player;
    o.playerX = playerObj and playerObj:getX() or -1;
    o.playerY = playerObj and playerObj:getY() or -1;
    o.name = nil;
    o.borderColor = {r=0, g=0, b=0, a=0};
    o.backgroundColor = {r=1, g=1, b=1, a=0};
    if y == 0 then
		o.y = getPlayerScreenTop(player) + (getPlayerScreenHeight(player) - height) / 2;
        o:setY(o.y);
    end
    if x == 0 then
		o.x = getPlayerScreenLeft(player) + (getPlayerScreenWidth(player)/0.75 - width) / 2;
        o:setX(o.x);
    end
    o.width = width;
    o.height = height;
    o.target = target;
    o.onclick = onclick;
    o.thumpable = thumpable;
    o.mouseDown = false;
    o.dialTextureFront = getTexture("media/textures/MechanicalDialLock_Front.png");
    o.dialTextureBack = getTexture("media/textures/MechanicalDialLock_Background.png");

    o.lockCombination = {};
    o.currentNumberIndex = 1;
    o.dialAngle = 0;
    o.lastAngle = 0;

    o.isNewCode = isNew;
    o.isCancelled = false;
    o.isEnd = false;
    o.moveWithMouse = true;
    return o
end

--- Event handler for key press events.
---@param key number The key code.
Events.OnKeyKeepPressed.Add(function(key)
    if ISMechanicalDialLock.instance then
        local dialAngle = ISMechanicalDialLock.instance.lastAngle
        local angleIncrement = stepSize * math.pi / 180
        if key == Keyboard.KEY_LEFT or key == Keyboard.KEY_A then
            dialAngle = (dialAngle - angleIncrement) % 360
            ISMechanicalDialLock.instance:updateDial(dialAngle)
        elseif key == Keyboard.KEY_RIGHT or key == Keyboard.KEY_D then
            dialAngle = (dialAngle + angleIncrement) % 360
            ISMechanicalDialLock.instance:updateDial(dialAngle)
        end
    end
end)

