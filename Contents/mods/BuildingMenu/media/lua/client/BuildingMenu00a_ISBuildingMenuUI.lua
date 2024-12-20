require("ISUI/ISCollapsableWindowJoypad")

---@type function
local getText = getText
---@type function
local getTexture = getTexture
---@type function
local pairs = pairs
---@type function
local getSprite = getSprite
---@type function
local getTextOrNull = getTextOrNull

local BM_Logger = require("BM_Logger");

---@class BuildingMenu
local BuildingMenu = require("BuildingMenu01_Main");

--- Class representing the tile picker list in the Building Menu
---@class BuildingMenuTilePickerList: ISPanel
BuildingMenuTilePickerList = ISPanel:derive("BuildingMenuTilePickerList")

local TILE_WIDTH, TILE_HEIGHT = 64, 128

function BuildingMenuTilePickerList:render()
    ISPanel.render(self);
    self:clearStencilRect();
    self:setStencilRect(1, 1, self:getWidth(), self:getHeight());

    local objectsBuffer = {};
    local maxCols = (self:getWidth() / TILE_WIDTH) - ((self:getWidth() / TILE_WIDTH) % 1);
    local totalItems = #(self.subCatData or {});
    local maxRows = (totalItems / maxCols) + ((totalItems % maxCols > 0) and 1 or 0);

    for r = 1, maxRows do
        for c = 1, maxCols do
            local objDef, objIndex = self:findNextObject(objectsBuffer);
            if objDef and objIndex then
                if objDef.data.isRecipeKnown == true or self.character:isRecipeKnown(objDef.data.isRecipeKnown) then
                    objectsBuffer[objIndex] = true;

                    self.posToObjectNameTable[r] = self.posToObjectNameTable[r] or {};
                    self.posToObjectNameTable[r][c] = { objDef = objDef, canBuild = false };

                    local spriteKeys = { "sprite", "northSprite", "corner" };
                    local objSpriteName, attachedSprites = nil, nil;
                    for i = 1, #spriteKeys do
                        local spriteName = objDef.data.sprites[spriteKeys[i]];
                        if spriteName then
                            objSpriteName = spriteName;
                            attachedSprites = objDef.data.sprites.attachedSprites and
                                objDef.data.sprites.attachedSprites[spriteKeys[i]];
                            break;
                        end
                    end

                    self:drawSprite(objSpriteName, c, r);
                    self:drawAttachedSprites(attachedSprites, c, r);
                end
            end
        end
    end
    self:setScrollHeight(maxRows * TILE_HEIGHT);
    self:updateTooltip(maxCols, maxRows);
    self:clearStencilRect();
end

--- Draws the main sprite on the correct tile position
---@param spriteName string|nil The name of the sprite to draw
---@param c number The column position in the grid
---@param r number The row position in the grid
function BuildingMenuTilePickerList:drawSprite(spriteName, c, r)
    if spriteName then
        local texture = self.textureCache[spriteName] or getTexture(spriteName);
        self.textureCache[spriteName] = texture;
        if texture then
            self:drawTextureScaledAspect(texture, (c - 1) * TILE_WIDTH, (r - 1) * TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT,
                1.0, 1.0, 1.0, 1.0);
        end
    end
end

--- Draws a list of attached sprites on the correct tile position
---@param attachedSpriteNames table|nil A table of attached sprite names
---@param c number The column position in the grid
---@param r number The row position in the grid
function BuildingMenuTilePickerList:drawAttachedSprites(attachedSpriteNames, c, r)
    if attachedSpriteNames then
        for i = 1, #attachedSpriteNames do
            self:drawSprite(attachedSpriteNames[i], c, r);
        end
    end
end

--- Finds the next object in the tile picker list using the index to track rendered objects
---@param objectsBuffer table
---@return table|nil, number|nil
function BuildingMenuTilePickerList:findNextObject(objectsBuffer)
    if not self.subCatData then return nil, nil; end
    for i = 1, #self.subCatData do
        if not objectsBuffer[i] then
            local objectDef = self.subCatData[i];
            return objectDef, i;
        end
    end
    return nil, nil;
end

--- Updates the tooltip for the tile picker list
---@param maxCols number
---@param maxRows number
function BuildingMenuTilePickerList:updateTooltip(maxCols, maxRows)
    if self.parent.drawJoypadFocus and self.parent.tilesListHasFocus then
        local selectedObject = self:getSelectedObject(maxCols, maxRows);
        if selectedObject then
            self:updateTooltipContent(selectedObject);
            local tileCenterX, tileCenterY = self:getTileCenterPosition(self.selectedTileCol, self.selectedTileRow);
            self.tooltip.followMouse = false;
            self.tooltip:setX(self:getAbsoluteX() + tileCenterX);
            self.tooltip:setY(self:getAbsoluteY() + tileCenterY + self:getYScroll());
            local borderColor = selectedObject.canBuild and BuildingMenu.ghsTable or BuildingMenu.bhsTable;
            self:drawRectBorder((self.selectedTileCol - 1) * TILE_WIDTH, (self.selectedTileRow - 1) * TILE_HEIGHT,
                TILE_WIDTH, TILE_HEIGHT, 0.6, unpack(borderColor));
            self:displayTooltip();
        else
            self:hideTooltip();
        end
    elseif self.parent.drawJoypadFocus and not self.parent.tilesListHasFocus then
        self:hideTooltip();
    else
        local mouseX, mouseY = self:getMouseX(), self:getMouseY();
        local panelY = self:getY() - self:getYScroll() - self.parent:titleBarHeight() - self.parent.panel.tabHeight;
        if mouseY < panelY or mouseY > panelY + self:getHeight() or mouseX < 0 or mouseX > self:getWidth() then
            self:clearStencilRect(); return;
        end

        local c = (mouseX / TILE_WIDTH) - ((mouseX / TILE_WIDTH) % 1);
        local r = (mouseY / TILE_HEIGHT) - ((mouseY / TILE_HEIGHT) % 1);

        if c >= 0 and r >= 0 and r < maxRows and c < maxCols and self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1] then
            local selectedObject = self.posToObjectNameTable[r + 1][c + 1];
            self:updateTooltipContent(selectedObject);
            local borderColor = selectedObject.canBuild and BuildingMenu.ghsTable or BuildingMenu.bhsTable;
            self:drawRectBorder(c * TILE_WIDTH, r * TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT, 0.6, unpack(borderColor));
            self:displayTooltip();
        else
            self:hideTooltip();
        end
    end
end

---@param maxCols number
---@param maxRows number
---@return table|nil
function BuildingMenuTilePickerList:getSelectedObject(maxCols, maxRows)
    if self.selectedTileRow > 0 and self.selectedTileCol > 0 and self.selectedTileRow <= maxRows and self.selectedTileCol <= maxCols then
        return self.posToObjectNameTable[self.selectedTileRow] and
            self.posToObjectNameTable[self.selectedTileRow][self.selectedTileCol];
    end
    return nil;
end

local containerDetailsBySpriteCache = {};
local containerPartNames = {
    "Tooltip_BuildingObject_Main_Part",
    "Tooltip_BuildingObject_Secondary_Part",
    "Tooltip_BuildingObject_Tertiary_Part",
    "Tooltip_BuildingObject_Quaternary_Part"
};


local function getContainerDetailsFromSpriteProps(sprite, character)
    if containerDetailsBySpriteCache[sprite] then return containerDetailsBySpriteCache[sprite]; end

    local containerDetails = {};
    local cell = getWorld():getCell();
    local square = character:getCurrentSquare();
    local isoObject = IsoObject.new(cell, square, sprite);
    isoObject:createContainersFromSpriteProperties();

    for i = 1, isoObject:getContainerCount() do
        local itemContainer = isoObject:getContainerByIndex(i - 1);
        local containerCapacity = itemContainer:getEffectiveCapacity(character) or 0;
        local containerType = itemContainer:getType();
        local containerTitle = getTextOrNull("IGUI_ContainerTitle_" .. containerType) or containerType;

        table.insert(containerDetails, string.format("%s: %d", containerTitle, containerCapacity));
    end

    containerDetailsBySpriteCache[sprite] = containerDetails;
    return containerDetails;
end


local function getContainerDetailsFromObjectDef(sprite, containerType, capacity)
    if containerDetailsBySpriteCache[sprite] then return containerDetailsBySpriteCache[sprite]; end

    local containerDetails = {};
    local containerTitle = getTextOrNull("IGUI_ContainerTitle_" .. containerType) or containerType;
    table.insert(containerDetails, string.format("%s: %d", containerTitle, capacity));

    containerDetailsBySpriteCache[sprite] = containerDetails;
    return containerDetails;
end


--- Gets the container information for the selected object
---@param selectedObject table
---@param character IsoPlayer
---@return table
local function getContainerInfo(selectedObject, character)
    local containerInfo = {};
    local spriteKeys = { "sprite", "sprite2", "sprite3", "sprite4" };
    for i = 1, #spriteKeys do
        local sprite = selectedObject.objDef.data.sprites[spriteKeys[i]];
        if sprite then
            local containerDetails;
            if selectedObject.objDef.data.options and selectedObject.objDef.data.options.containerType and selectedObject.objDef.data.options.capacity then
                containerDetails = getContainerDetailsFromObjectDef(sprite,
                    selectedObject.objDef.data.options.containerType, selectedObject.objDef.data.options.capacity);
            else
                local props = getSprite(sprite):getProperties();
                if props:Is("container") or props:Is("Freezer") then
                    containerDetails = getContainerDetailsFromSpriteProps(sprite, character);
                end
            end
            if containerDetails and #containerDetails > 0 then
                local partName = containerPartNames[i] or "Tooltip_BuildingObject_Extra_Part";
                table.insert(containerInfo, getText(partName) .. ": " .. table.concat(containerDetails, " | "));
            end
        end
    end
    return containerInfo;
end


--- Gets the tooltip content for the selected object
---@param character IsoPlayer
---@param selectedObject table
---@return string
local function getTooltipContent(character, selectedObject)
    local tooltipDescription = "";
    tooltipDescription, selectedObject.canBuild, selectedObject.materialFoundIndexMatrix, selectedObject.consumablesFoundIndexMatrix, selectedObject.toolFoundIndexMatrix =
        BuildingMenu.canBuildObject(character, tooltipDescription, selectedObject.objDef.data.recipe);

    return tooltipDescription;
end


--- Gets the thumpable state string for the tooltip
---@param overwriteIsThumpable boolean
---@param onBuild function
---@return string
local function getIsThumpableStr(overwriteIsThumpable, onBuild)
    local isThumpableStr = "";
    if isDebugEnabled() or (not isServer() and not isClient() and not SandboxVars.BuildingMenu.isThumpable) or (isClient() and (isAdmin() or not SandboxVars.BuildingMenu.isThumpable)) then
        if overwriteIsThumpable then
            if not (onBuild == BuildingMenu.onBuildDoor or onBuild == BuildingMenu.onDoubleDoor or onBuild == BuildingMenu.onBuild3TileGarageDoor or onBuild == BuildingMenu.onBuild4TileGarageDoor) then
                isThumpableStr = " <LINE> " .. BuildingMenu.bhsString .. " INDESTRUCTIBLE ";
            end
        end
    end
    return isThumpableStr;
end


--- Updates the tooltip content for the selected object
---@param selectedObject table
function BuildingMenuTilePickerList:updateTooltipContent(selectedObject)
    local tooltipDescription = getTooltipContent(self.character, selectedObject);
    self.tooltip:setName(selectedObject.objDef.displayName or selectedObject.objDef.data.nameID);

    local containerInfo = getContainerInfo(selectedObject, self.character);
    local containerStr = #containerInfo > 0 and (table.concat(containerInfo, " <LINE> ") .. " <LINE>") or "";

    local isThumpableStr = getIsThumpableStr(self.overwriteIsThumpable, selectedObject.objDef.data.action);

    local description = selectedObject.objDef.description;
    local lineSeparator = description ~= "" and " <LINE> " or "";
    self.tooltip.description = string.format("%s %s <RGB:1,1,1> %s %s %s", description, lineSeparator, containerStr,
        isThumpableStr, tooltipDescription);

    self.tooltip.footNote = BuildingMenu.textCanRotate;
end

---@param col number
---@param row number
function BuildingMenuTilePickerList:getTileCenterPosition(col, row)
    return (col - 0.5) * TILE_WIDTH, (row - 0.5) * TILE_HEIGHT;
end

function BuildingMenuTilePickerList:displayTooltip()
    self.tooltip:addToUIManager();
    self.tooltip:setVisible(true);
end

function BuildingMenuTilePickerList:hideTooltip()
    self.tooltip:setVisible(false);
    self.tooltip:removeFromUIManager();
end

--- Handles mouse wheel events for the tile picker list
---@param del number
---@return boolean
function BuildingMenuTilePickerList:onMouseWheel(del)
    self:setYScroll(self:getYScroll() - del * 128);
    return true;
end

---@param objData table
function BuildingMenuTilePickerList:processBuild(objData)
    local playerNum = self.character:getPlayerNum();
    local spritesName = objData.objDef.data.sprites;
    local objectName = objData.objDef.data.nameID or objData.objDef.displayName;
    local recipe = objData.objDef.data.recipe;
    local options = objData.objDef.data.options;
    local onBuild = objData.objDef.data.action;

    local modifiedOptions = {};
    for k, v in pairs(options) do
        modifiedOptions[k] = v;
    end
    if self.overwriteIsThumpable or not SandboxVars.BuildingMenu.isThumpable then
        modifiedOptions.isThumpable = not self.overwriteIsThumpable;
    end


    local modifiedRecipe = {
        neededTools = recipe.neededTools,
        neededMaterials = {},
        useConsumable = {},
        skills = recipe.skills
    };


    local function clearTable(t)
        for k in pairs(t) do
            t[k] = nil;
        end
    end

    -- BM_Logger:debug("objData.materialFoundIndexMatrix");
    -- BM_Logger:debug(objData.materialFoundIndexMatrix);
    -- BM_Logger:debug("objData.consumablesFoundIndexMatrix");
    -- BM_Logger:debug(objData.consumablesFoundIndexMatrix);
    -- BM_Logger:debug("objData.toolFoundIndexMatrix");
    -- BM_Logger:debug(objData.toolFoundIndexMatrix);

    -- Helper function to process Material Groups or Consumable Groups
    local function processItems(itemGroupInfo, targetList, groupType)
        -- Iterate over each group's found items and amounts
        for i, groupInfo in pairs(itemGroupInfo) do
            -- Go through each Alternative Items within a group
            for j, itemDetails in pairs(groupInfo) do
                local totalNeeded = groupInfo[j].AmountNeeded;
                local totalCollected = 0;
                local tempItems = {}; -- Temporary list to hold items for the current alternative group

                for item, count in pairs(itemDetails[groupType .. "Details"]) do
                    -- Only use this item if we still need more and haven't used a full alternative
                    local amountToUse = count;
                    if totalNeeded - totalCollected < count then
                        amountToUse = totalNeeded - totalCollected;
                    end

                    if ISBuildMenu.cheat then amountToUse = totalNeeded; end

                    if amountToUse > 0 then
                        -- Add to the temporary list instead of inserting directly into the targetList
                        table.insert(tempItems, { [groupType] = item, Amount = amountToUse });
                        totalCollected = totalCollected + amountToUse;
                    end

                    -- If we've collected enough with this item, don't check further within this alternative group
                    if totalCollected >= totalNeeded then break; end
                end
                -- If we've collected enough with this alternative group, don't check further groups
                if totalCollected >= totalNeeded then
                    for _, item in ipairs(tempItems) do
                        table.insert(targetList, item);
                    end
                    break;
                end
            end

            -- If no items were added from any alternative group (including 0 items groups), we proceed to the next group
            if #targetList == 0 then
                clearTable(targetList); -- clearing targetList before checking the next group
            end
        end
    end

    -- Process Material Groups and Consumable Groups
    processItems(objData.materialFoundIndexMatrix, modifiedRecipe.neededMaterials, 'Material');
    processItems(objData.consumablesFoundIndexMatrix, modifiedRecipe.useConsumable, 'Consumable');


    -- passing the name break the ISMetalDrum and RainCollectorBarrel objects
    if onBuild == BuildingMenu.onMetalDrum or onBuild == BuildingMenu.onRainCollectorBarrel then
        objectName = nil; -- set objectName to nil for these specific actions
    end

    local object = onBuild(spritesName, objectName, playerNum, modifiedRecipe, modifiedOptions);
    object.usedTools = objData.toolFoundIndexMatrix;
    object.attachedSprites = spritesName.attachedSprites;
    BuildingMenu.buildObject(object, spritesName, objectName, playerNum, modifiedRecipe, modifiedOptions);
end

--- Handles mouse down events on the tile picker list
---@param x number
---@param y number
function BuildingMenuTilePickerList:onMouseDown(x, y)
    local c = (x - (x % 64)) / 64;
    local r = (y - (y % 128)) / 128;
    local selectedObject = self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1];

    if selectedObject and selectedObject.canBuild then
        self:processBuild(selectedObject);
    end
end

--- Spawns items in the player's inventory
---@param selectedObject table
function BuildingMenuTilePickerList:spawnItems(selectedObject)
    local objectRecipe = selectedObject.objDef.data.recipe;
    if not objectRecipe then return; end

    local inventory = self.character:getInventory();

    local function addItemToInventory(itemTable)
        local items, amount = itemTable.Material or itemTable.Consumable, tonumber(itemTable.Amount);

        if type(items) == "table" then
            items = items[1];
        end

        if items == "Base.BlowTorch" then return; end

        if items and amount then
            for i = 1, amount do
                inventory:AddItem(items);
            end
        else
            BM_Logger:error("Item or amount is nil for:");
            BM_Logger:error(items);
        end
    end

    for _, tool in ipairs(objectRecipe.neededTools or {}) do
        inventory:AddItem(BuildingMenu.Tools[tool].types[1]);
    end

    for _, material in pairs(objectRecipe.neededMaterials or {}) do
        addItemToInventory(type(material[1]) == "table" and material[1] or material);
    end

    for _, consumable in pairs(objectRecipe.useConsumable or {}) do
        addItemToInventory(type(consumable[1]) == "table" and consumable[1] or consumable);
    end
end

--- Handles mouse down events on the tile picker list
---@param x number
---@param y number
function BuildingMenuTilePickerList:onRightMouseDown(x, y)
    if not isDebugEnabled() then return; end
    if not self.character or self.character:isDead() then return; end

    local c = (x - (x % 64)) / 64;
    local r = (y - (y % 128)) / 128;
    local selectedObject = self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1];

    if selectedObject then
        self:spawnItems(selectedObject);
    end
end

--- Handles joypad down events on the tile picker list
---@param button Joypad
function BuildingMenuTilePickerList:onJoypadDown(button)
    if button == Joypad.AButton then
        local selectedObject = self:getSelectedObjectFromJoypad();
        if selectedObject and selectedObject.canBuild then
            self:processBuild(selectedObject);

            if JoypadState.players[self.parent.playerNum + 1] then
                setJoypadFocus(self.parent.playerNum, nil);
            end
        end
    end
end

function BuildingMenuTilePickerList:getSelectedObjectFromJoypad()
    return self.posToObjectNameTable[self.selectedTileRow] and
        self.posToObjectNameTable[self.selectedTileRow][self.selectedTileCol];
end

--- Handles mouse up events on the tile picker list
---@param x number
---@param y number
function BuildingMenuTilePickerList:onMouseUp(x, y)
    self.message = nil;
    if self.tooltip and self.tooltip:getIsVisible() then
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager();
    end
end

--- Handles mouse movement outside the tile picker list
---@param dx number
---@param dy number
function BuildingMenuTilePickerList:onMouseMoveOutside(dx, dy)
    self.message = nil;
    if self.tooltip and self.tooltip:getIsVisible() then
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager();
    end
end

function BuildingMenuTilePickerList:createChildren()
    ISPanel.createChildren(self);

    self.selectedTileRow = 1;
    self.selectedTileCol = 1;

    self.tooltip = ISToolTip:new();
    self.tooltip:initialise();
    self.tooltip:addToUIManager();
    self.tooltip:setAlwaysOnTop(true);
    self.tooltip:setOwner(self);
    self.tooltip:setVisible(false);
end

function BuildingMenuTilePickerList:onJoypadDirUp()
    if self.selectedTileRow > 1 then
        local newRow = self.selectedTileRow - 1;
        -- check if the new position has an object
        if self.posToObjectNameTable[newRow] and self.posToObjectNameTable[newRow][self.selectedTileCol] then
            self.selectedTileRow = newRow;
        end
    end
    self:ensureVisible(self.selectedTileRow, self.selectedTileCol);
end

function BuildingMenuTilePickerList:onJoypadDirDown()
    local maxCols = (self:getWidth() / TILE_WIDTH) - ((self:getWidth() / TILE_WIDTH) % 1);
    local totalItems = #(self.subCatData or {});
    local maxRows = (totalItems / maxCols) + ((totalItems % maxCols > 0) and 1 or 0);
    if self.selectedTileRow < maxRows then
        local newRow = self.selectedTileRow + 1;
        -- check if the new position has an object
        if self.posToObjectNameTable[newRow] and self.posToObjectNameTable[newRow][self.selectedTileCol] then
            self.selectedTileRow = newRow;
        end
    end
    self:ensureVisible(self.selectedTileRow, self.selectedTileCol);
end

function BuildingMenuTilePickerList:onJoypadDirLeft()
    if self.selectedTileCol > 1 then
        local newCol = self.selectedTileCol - 1;
        -- check if the new position has an object
        if self.posToObjectNameTable[self.selectedTileRow] and self.posToObjectNameTable[self.selectedTileRow][newCol] then
            self.selectedTileCol = newCol;
        end
    else
        self.parent.subCategoriesListHasFocus = true;
        self.parent.tilesListHasFocus = false;
    end
end

function BuildingMenuTilePickerList:onJoypadDirRight()
    local maxCols = (self:getWidth() / TILE_WIDTH) - ((self:getWidth() / TILE_WIDTH) % 1);
    if self.selectedTileCol < maxCols then
        local newCol = self.selectedTileCol + 1
        -- check if the new position has an object
        if self.posToObjectNameTable[self.selectedTileRow] and self.posToObjectNameTable[self.selectedTileRow][newCol] then
            self.selectedTileCol = newCol;
        end
    end
end

function BuildingMenuTilePickerList:ensureVisible(row, col)
    local tileTop = (row - 1) * TILE_HEIGHT;
    local tileBottom = row * TILE_HEIGHT;

    if tileTop == 0 or tileBottom == 0 then self:setYScroll(0); end

    if tileTop < self:getYScroll() then
        self:setYScroll(-tileTop);
    elseif tileBottom > self:getYScroll() + self:getHeight() then
        self:setYScroll(-(tileBottom - self:getHeight()));
    end
end

--- Constructor for BuildingMenuTilePickerList
---@param x number
---@param y number
---@param w number
---@param h number
---@param character IsoPlayer
---@param parent any
---@return BuildingMenuTilePickerList class
function BuildingMenuTilePickerList:new(x, y, w, h, character, parent)
    local o                = ISPanel.new(self, x, y, w, h)
    o.backgroundColor.a    = 0;
    o.subCatData           = nil;
    o.character            = character;
    o.posToObjectNameTable = {};
    o.textureCache         = {};
    o.tooltip              = nil;
    o.message              = nil;
    o.overwriteIsThumpable = SandboxVars.BuildingMenu.isThumpable ~= nil and not SandboxVars.BuildingMenu.isThumpable or
        false;
    o.parent               = parent;
    return o;
end

---@class ISBuildingMenuUI: ISCollapsableWindowJoypad
ISBuildingMenuUI                     = ISCollapsableWindowJoypad:derive("ISBuildingMenuUI");

--- Singleton instance of ISBuildingMenuUI
---@type ISBuildingMenuUI|nil
ISBuildingMenuUI.instance            = nil;
ISBuildingMenuUI.largeFontHeight     = getTextManager():getFontHeight(UIFont.Large);
ISBuildingMenuUI.mediumNewFontHeight = getTextManager():getFontHeight(UIFont.MediumNew);
ISBuildingMenuUI.smallFontHeight     = getTextManager():getFontHeight(UIFont.Small);
ISBuildingMenuUI.bottomInfoHeight    = ISBuildingMenuUI.smallFontHeight * 2
ISBuildingMenuUI.leftTab             = Keyboard.KEY_LEFT;
ISBuildingMenuUI.rightTab            = Keyboard.KEY_RIGHT;
ISBuildingMenuUI.upArrowCategory     = Keyboard.KEY_UP;
ISBuildingMenuUI.downArrowCategory   = Keyboard.KEY_DOWN;
ISBuildingMenuUI.players             = {};

local objectsInitialized             = false;

--- Opens the Building Menu UI panel for the player.
---@param playerObj IsoPlayer
function ISBuildingMenuUI.openPanel(playerObj)
    local function calculateDurationMs(startTime, endTime)
        local durationNs = endTime - startTime;
        return string.format("%.2f", durationNs / 1000000);
    end

    local modData = playerObj:getModData();
    local savedPosition = modData.BMUIPosition;

    local screenWidth = getCore():getScreenWidth();
    local screenHeight = getCore():getScreenHeight();

    local width, height, x, y = 570, 400, (screenWidth / 2) - 285, (screenHeight / 2) - 200;

    if savedPosition then
        width = savedPosition.width;
        height = savedPosition.height;
        x = savedPosition.x;
        y = savedPosition.y;
    end

    x = math.max(0, math.min(x, screenWidth - width));
    y = math.max(0, math.min(y, screenHeight - height));

    GameTime.setServerTimeShift(0);
    local getTime = GameTime.getServerTime;

    if not objectsInitialized then
        local startTime = getTime();
        triggerEvent("OnInitializeBuildingMenuRecipes");
        local midTime = getTime();
        triggerEvent("OnInitializeBuildingMenuObjects");
        local endTime = getTime();

        BM_Logger:debug("Time taken to initialize recipes: " .. calculateDurationMs(startTime, midTime) .. " ms");
        BM_Logger:debug("Time taken to initialize objects: " .. calculateDurationMs(midTime, endTime) .. " ms");

        objectsInitialized = true;
    end

    local uiStartTime = getTime();
    containerDetailsBySpriteCache = {};

    local BMUI = ISBuildingMenuUI.instance;
    if not BMUI then
        local window = ISBuildingMenuUI:new(x, y, width, height, playerObj);
        window:initialise();
        window:addToUIManager();
        ISBuildingMenuUI.instance = window;
        if JoypadState.players[window.playerNum + 1] then
            setJoypadFocus(window.playerNum, window);
        end
    else
        local playerNum = playerObj:getPlayerNum();
        if JoypadState.players[playerNum + 1] then
            setJoypadFocus(playerNum, BMUI);
        end
    end

    local uiEndTime = getTime();
    BM_Logger:debug("Time taken to initialize UI: " .. calculateDurationMs(uiStartTime, uiEndTime) .. " ms");
end

function ISBuildingMenuUI:close()
    local modData = self.character:getModData();
    modData.BMUIPosition = { x = self:getX(), y = self:getY(), width = self:getWidth(), height = self:getHeight() };

    ISBuildingMenuUI.instance = nil;
    self:setVisible(false);
    self:removeFromUIManager();
    if JoypadState.players[self.playerNum + 1] then
        setJoypadFocus(self.playerNum, nil);
    end
end

function ISBuildingMenuUI:toggleBuildingMenuUI(playerObj)
    local ui = self.instance;
    if ui and ui:getIsVisible() then
        ui:close();
    else
        self.openPanel(playerObj);
    end
end

Events.OnPlayerDeath.Add(function(playerObj)
    local ui = ISBuildingMenuUI.instance;
    if ui and ui:getIsVisible() then
        ui:close();
    end
end)

local minOpaqueVal = 0;
local maxOpaqueVal = 0.5;
--- Creates child elements for the Building Menu UI
function ISBuildingMenuUI:createChildren()
    ISCollapsableWindowJoypad.createChildren(self);
    local th = self:titleBarHeight();
    local rh = self.resizable and self:resizeWidgetHeight() or 0;

    --gear button
    self.gearButton = ISButton:new((self.width - 19) - th / 2 - th, 1, th, th, "", self,
        ISBuildingMenuUI.onGearButtonClick);
    self.gearButton.anchorRight = true;
    self.gearButton.anchorLeft = false;
    self.gearButton:initialise();
    self.gearButton.borderColor.a = 0.0;
    self.gearButton.backgroundColor.a = 0;
    self.gearButton.backgroundColorMouseOver.a = 0;
    self.gearButton:setImage(getTexture("media/ui/Panel_Icon_Gear.png"));
    self.gearButton:setUIName("building menu gear button");
    self:addChild(self.gearButton);
    self.gearButton:setVisible(true);


    self.panel = ISTabPanel:new(0, th, self.width, self.height - th - rh - ISBuildingMenuUI.bottomInfoHeight);
    self.panel:initialise();
    self.panel:setAnchorRight(true)
    self.panel:setAnchorBottom(true)
    self.panel.borderColor = { r = 0, g = 0, b = 0, a = 0 };
    self.panel.backgroundColor.a = 0.25;
    self.panel.tabSelected = nil;
    self.panel.tabUnSelected = nil;
    self.panel.tabHeight = getTextManager():getFontHeight(UIFont.Small) + 10;
    self.panel.target = self;
    self.panel:setEqualTabWidth(false);
    self:addChild(self.panel);


    self.tabs = {};
    for i = 1, #BuildingMenu.Tabs do
        local tab = BuildingMenu.Tabs[i];
        local newTab = ISBuildingMenuTabUI:new(0, 0, self.width, self.panel.height - self.panel.tabHeight, self);
        newTab:initialise();
        newTab:setAnchorRight(true);
        newTab:setAnchorBottom(true);
        local tabName = tab.tabName;
        newTab.tab = tabName;
        self.panel:addView(getText(tabName), newTab);
        newTab.infoText = getText("UI_BuildingMenuUI");
        newTab.parent = self;

        if tab.categories then
            newTab.categories = tab.categories;
            for j = 1, #tab.categories do
                local category = tab.categories[j];
                local catName = category.categoryName;
                local catIcon = category.categoryIcon;
                local subCatData = category.subcategories;
                newTab.categoriesList:addItem(catName, { icon = catIcon, subCatData = subCatData });

                if category.subcategories then
                    local subCategories = newTab.categoriesList.items[newTab.categoriesList.selected].item.subCatData;
                    for k = 1, #subCategories do
                        local subcategories = subCategories[k];
                        local subCatName = subcategories.subcategoryName;
                        local subCatIcon = subcategories.subCategoryIcon;
                        local objectsData = subcategories.objects;

                        newTab.subCategoriesList:addItem(subCatName, { icon = subCatIcon, objectsData = objectsData });
                    end
                end
            end
        end

        table.insert(self.tabs, newTab);
    end
    self.panel:activateView(getText("IGUI_BuildingMenuTab_General"));

    self.tilesList = BuildingMenuTilePickerList:new(self.width / 2, self.panel.tabHeight + th, self.width / 2,
        self:getHeight() - th - rh - self.panel.tabHeight - ISBuildingMenuUI.bottomInfoHeight, self.character, self);
    self.tilesList.anchorBottom = true;
    self.tilesList:initialise();
    self.tilesList:instantiate();
    self.tilesList:addScrollBars();
    self:addChild(self.tilesList);


    self:onMinOpaqueChange(minOpaqueVal);
    self:onMaxOpaqueChange(maxOpaqueVal);

    self.keysRichText = ISRichTextLayout:new(self.width);
    self.keysRichText:setMargins(5, 0, 5, 0);
end

--- Changes the minimum opacity of the UI
---@param target ISBuildingMenuUI
---@param value number
ISBuildingMenuUI.onMinOpaqueChange = function(target, value)
    target.minOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    minOpaqueVal = value;
end

--- Changes the maximum opacity of the UI
---@param target ISBuildingMenuUI
---@param value number
ISBuildingMenuUI.onMaxOpaqueChange = function(target, value)
    target.maxOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    maxOpaqueVal = value;
end

--- Handles the gear button click in the Building Menu UI
function ISBuildingMenuUI:onGearButtonClick()
    local context = ISContextMenu.get(0, self:getAbsoluteX() + self:getWidth(),
        self:getAbsoluteY() + self.gearButton:getY());

    if isDebugEnabled() or (not isServer() and not isClient() and not SandboxVars.BuildingMenu.isThumpable) or (isClient() and (isAdmin() or not SandboxVars.BuildingMenu.isThumpable)) then
        local option = context:addOption("Not Thumpable", self, function(self)
            self.tilesList.overwriteIsThumpable = not self.tilesList.overwriteIsThumpable;
            BM_Logger:info("Overwrite Is Thumpable: " .. tostring(self.tilesList.overwriteIsThumpable));
        end);
        context:setOptionChecked(option, self.tilesList.overwriteIsThumpable);
    end


    local isBuildRoofActive = getActivatedMods():contains("BuildRoof")
    if isBuildRoofActive then
        local option = context:addOption("Floor is Ceiling", self, function(self)
            self.floorIsRoof = not self.floorIsRoof;
            BM_Logger:info("Floor Is Roof: " .. tostring(self.floorIsRoof));
        end);
        context:setOptionChecked(option, self.floorIsRoof);
    end


    local minOpaqueOption = context:addOption(getText("UI_chat_context_opaque_min"), ISBuildingMenuUI.instance);
    local minOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(minOpaqueOption, minOpaqueSubMenu);
    local opaques = { 0, 0.15, 0.25, 0.4, 0.5, 0.75, 1 };
    for i = 1, #opaques do
        if logTo01(opaques[i]) <= self.maxOpaque then
            local option = minOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", ISBuildingMenuUI.instance,
                ISBuildingMenuUI.onMinOpaqueChange, opaques[i]);
            local current = (self.minOpaque * 1000) - (self.minOpaque * 1000) % 1;
            local value = (logTo01(opaques[i]) * 1000) - (logTo01(opaques[i]) * 1000) % 1;
            if current == value then
                minOpaqueSubMenu:setOptionChecked(option, true);
            end
        end
    end

    local maxOpaqueOption = context:addOption(getText("UI_chat_context_opaque_max"), ISBuildingMenuUI.instance);
    local maxOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(maxOpaqueOption, maxOpaqueSubMenu);
    for i = 1, #opaques do
        if logTo01(opaques[i]) >= self.minOpaque then
            local option = maxOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", ISBuildingMenuUI.instance,
                ISBuildingMenuUI.onMaxOpaqueChange, opaques[i]);
            local current = (self.maxOpaque * 1000) - (self.maxOpaque * 1000) % 1;
            local value = (logTo01(opaques[i]) * 1000) - (logTo01(opaques[i]) * 1000) % 1;
            if current == value then
                maxOpaqueSubMenu:setOptionChecked(option, true);
            end
        end
    end
end

--- Retrieves the currently active tab in the UI
---@return ISBuildingMenuTabUI
function ISBuildingMenuUI:getActiveTab()
    return self.panel.activeView.view;
end

--- Retrieves the favorite tab in the UI
---@return ISBuildingMenuTabUI|nil
function ISBuildingMenuUI:getFavoriteTab()
    for i = 1, #self.tabs do
        local tab = self.tabs[i];
        if tab.tab == "IGUI_BuildingMenuTab_Favorite" then
            return tab;
        end
    end
    return nil;
end

--- Retrieves the active categories list in the UI
---@return ISUIElement|nil
function ISBuildingMenuUI:getActiveCategoriesList()
    return self.panel.activeView.view.categoriesList;
end

--- Retrieves the active subcategories list in the UI
---@return ISUIElement|nil
function ISBuildingMenuUI:getActiveSubCategoriesList()
    return self.panel.activeView.view.subCategoriesList;
end

function ISBuildingMenuUI:initialise()
    ISCollapsableWindowJoypad.initialise(self);
end

function ISBuildingMenuUI:render()
    ISCollapsableWindowJoypad.render(self)
    if self.isCollapsed then return; end

    local rh = self.resizable and self:resizeWidgetHeight() or 0;
    local bottomY = self:getHeight() - rh - ISBuildingMenuUI.bottomInfoHeight;
    local textY = bottomY + (ISBuildingMenuUI.bottomInfoHeight - ISBuildingMenuUI.smallFontHeight) / 2;
    local buttonY = bottomY + (ISBuildingMenuUI.bottomInfoHeight - 20) / 2;

    self:drawRectBorder(0, 0, self:getWidth(), self:getHeight(), self.borderColor.a, self.borderColor.r,
        self.borderColor.g, self.borderColor.b);
    self.javaObject:DrawTextureScaledColor(nil, 0, bottomY, self:getWidth(), 1, self.borderColor.r, self.borderColor.g,
        self.borderColor.b, self.borderColor.a);

    if self.drawJoypadFocus then
        local labels, icons = self:getJoypadFocusLabelsAndIcons();
        local totalWidth = self:calculateTotalWidth(labels, 20, 8);
        local left = (self.width - totalWidth) / 2;

        for i = 1, #labels do
            self:drawTextureScaled(icons[i], left, buttonY, 20, 20, 1, 1, 1, 1);
            self:drawText(labels[i], left + 20 + 8, textY, 1, 1, 1, 1, UIFont.Small);
            left = left + 20 + 8 + getTextManager():MeasureStringX(UIFont.Small, labels[i]) + 32;
        end
        self:highlightFocusedUI();
    else
        self:drawBottomInfoText(bottomY);
    end
end

---@return table labels
---@return table icons
function ISBuildingMenuUI:getJoypadFocusLabelsAndIcons()
    local labels, icons = {}, {};
    local labelMove = self.uiHasFocus and self.LabelStopMove or self.LabelMove;
    if self.tilesListHasFocus then
        table.insert(labels, labelMove);
        table.insert(icons, Joypad.Texture.XButton);
        table.insert(labels, self.LabelBuild);
        table.insert(icons, Joypad.Texture.AButton);
        table.insert(labels, self.LabelClose);
        table.insert(icons, Joypad.Texture.BButton);
    else
        table.insert(labels, labelMove);
        table.insert(icons, Joypad.Texture.XButton)
        table.insert(labels, self.LabelFavorite);
        table.insert(icons, Joypad.Texture.YButton);
        table.insert(labels, self.LabelClose);
        table.insert(icons, Joypad.Texture.BButton);
    end
    return labels, icons;
end

function ISBuildingMenuUI:calculateTotalWidth(labels, buttonSize, buttonSpace)
    local totalWidth = 0;
    for i = 1, #labels do
        totalWidth = totalWidth + buttonSize + buttonSpace + getTextManager():MeasureStringX(UIFont.Small, labels[i]) +
            32;
    end
    return totalWidth - 32;
end

function ISBuildingMenuUI:drawBottomInfoText(bottomY)
    local text = self.bottomInfoText;
    local noteX = 0;
    local noteWidth = self.width;
    if noteWidth ~= self.keysRichText.width then
        self.keysRichText:setWidth(noteWidth);
        self.keysRichText.textDirty = true;
    end
    if text ~= self.keysText then
        self.keysText = text;
        self.keysRichText:setText(" <CENTRE> " .. text);
        self.keysRichText.textDirty = true;
    end
    local noteY = bottomY + (ISBuildingMenuUI.bottomInfoHeight - self.keysRichText.height) / 2;
    self.keysRichText:render(noteX, noteY, self);
end

function ISBuildingMenuUI:highlightFocusedUI()
    local focusedUI = self.categoriesListHasFocus and self:getActiveCategoriesList() or
        self.subCategoriesListHasFocus and self:getActiveSubCategoriesList();
    if focusedUI then
        local dx, dy = 0, self:titleBarHeight();
        local parent = focusedUI.parent;
        while parent ~= self do
            dx = dx + parent:getX();
            dy = dy + parent:getY();
            parent = parent.parent;
        end
        self:drawRectBorder(focusedUI:getX(), dy + focusedUI:getY(), focusedUI:getWidth(), focusedUI:getHeight(), 0.4,
            0.2, 1.0, 1.0);
        self:drawRectBorder(focusedUI:getX() + 1, dy + focusedUI:getY() + 1, focusedUI:getWidth() - 2,
            focusedUI:getHeight() - 2, 0.4, 0.2, 1.0, 1.0);
    end
    if self.tilesListHasFocus and self.tilesList then
        local ui = self.tilesList;
        self:drawRectBorder(ui:getX(), ui:getY(), ui:getWidth(), ui:getHeight(), 0.4, 0.2, 1.0, 1.0);
        self:drawRectBorder(ui:getX() + 1, ui:getY() + 1, ui:getWidth() - 2, ui:getHeight() - 2, 0.4, 0.2, 1.0, 1.0);
    end
end

function ISBuildingMenuUI:update()
    local currentTab = self:getActiveTab();

    if self.lastActiveTab ~= currentTab then
        if self.lastActiveTab then
            self.lastActiveTab.selectedCategoryIndex = self.lastSelectedCategoryIndex;
            self.lastActiveTab.selectedSubCategoryIndex = self.lastSelectedSubCategoryIndex;
        end

        self.lastSelectedCategoryIndex = currentTab.selectedCategoryIndex or 1;
        self.lastSelectedSubCategoryIndex = currentTab.selectedSubCategoryIndex or 1;
        self.lastActiveTab = currentTab;

        -- update categories list for the new tab
        self:updateCategoriesList(currentTab.categories);

        if currentTab.tab == "IGUI_BuildingMenuTab_Favorite" then
            self:populateFavoritesTab();
        end

        currentTab.categoriesList.selected = self.lastSelectedCategoryIndex;

        -- update subcategories list based on the selected category
        local selectedCategoryItem = currentTab.categoriesList.items[self.lastSelectedCategoryIndex];
        if selectedCategoryItem then
            self:updateSubCategoriesList(selectedCategoryItem.item.subCatData);
            currentTab.subCategoriesList.selected = self.lastSelectedSubCategoryIndex;

            -- update tiles list for the selected subcategory
            local selectedSubCategoryItem = currentTab.subCategoriesList.items[self.lastSelectedSubCategoryIndex]
            if selectedSubCategoryItem then
                self:updateTilesList(selectedSubCategoryItem.item.objectsData);
            else
                self:updateTilesList(nil);
            end
        end
    end

    -- check and update for category change within the same tab
    if self.lastSelectedCategoryIndex ~= currentTab.categoriesList.selected then
        self.lastSelectedCategoryIndex = currentTab.categoriesList.selected;
        local selectedCategoryItem = currentTab.categoriesList.items[currentTab.categoriesList.selected];
        if selectedCategoryItem then
            self:updateSubCategoriesList(selectedCategoryItem.item.subCatData);

            -- reset subcategory selection
            currentTab.subCategoriesList.selected = 1;
            self.lastSelectedSubCategoryIndex = 1;

            -- update tiles list for the first subcategory of the new category
            if #selectedCategoryItem.item.subCatData > 0 then
                self:updateTilesList(selectedCategoryItem.item.subCatData[1].objects);
            end
        end
    end

    -- check and update for subcategory change within the same category
    if self.lastSelectedSubCategoryIndex ~= currentTab.subCategoriesList.selected then
        self.lastSelectedSubCategoryIndex = currentTab.subCategoriesList.selected;
        local selectedSubCategoryItem = currentTab.subCategoriesList.items[currentTab.subCategoriesList.selected];
        if selectedSubCategoryItem then
            self:updateTilesList(selectedSubCategoryItem.item.objectsData);
        else
            self:updateTilesList(nil);
        end
    end
end

--- Populates the favorites tab in the Building Menu UI
function ISBuildingMenuUI:populateFavoritesTab()
    local favoriteTab = self:getFavoriteTab();
    if not favoriteTab or self:getActiveTab() ~= favoriteTab then return; end

    local favorites = self.favorites;

    favoriteTab.categoriesList:clear();
    favoriteTab.subCategoriesList:clear();

    for i = 1, #BuildingMenu.Tabs do
        local tab = BuildingMenu.Tabs[i];
        local favoriteTabData = favorites[self:stripTabPrefix(tab.tabName)];
        if favoriteTabData then
            for j = 1, #tab.categories do
                local category = tab.categories[j];
                local favoriteCategoryData = favoriteTabData[self:stripCategoryPrefix(category.categoryName)];
                if favoriteCategoryData then
                    local subCatData = {};
                    for k = 1, #category.subcategories do
                        local subcategory = category.subcategories[k];
                        if favoriteCategoryData[self:stripSubCategoryPrefix(subcategory.subcategoryName)] then
                            table.insert(subCatData, subcategory);
                        end
                    end
                    if #subCatData > 0 then
                        favoriteTab.categoriesList:addItem(category.categoryName,
                            { icon = category.categoryIcon, subCatData = subCatData, tabName = tab.tabName });
                    end
                end
            end
        end
    end
end

--- Updates the subcategories list for the favorite tab
---@param favoriteTab ISBuildingMenuTabUI
function ISBuildingMenuUI:updateSubCategoriesListForFavorite(favoriteTab)
    local favorites = self.favorites;

    local selectedCategoryIndex = favoriteTab.categoriesList.selected;
    if selectedCategoryIndex > 0 then
        local selectedCategoryItem = favoriteTab.categoriesList.items[selectedCategoryIndex];
        favoriteTab.subCategoriesList:clear();
        if selectedCategoryItem then
            local selectedCategoryTabName = selectedCategoryItem.item and selectedCategoryItem.item.tabName;
            selectedCategoryTabName = self:stripTabPrefix(selectedCategoryTabName);

            local selectedCategoryName = self:stripCategoryPrefix(selectedCategoryItem.text);

            for i = 1, #selectedCategoryItem.item.subCatData do
                local subcategory = selectedCategoryItem.item.subCatData[i];
                if favorites[selectedCategoryTabName] and favorites[selectedCategoryTabName][selectedCategoryName].favorite then
                    if favorites[selectedCategoryTabName][selectedCategoryName][self:stripSubCategoryPrefix(subcategory.subcategoryName)] then
                        favoriteTab.subCategoriesList:addItem(subcategory.subcategoryName,
                            { icon = subcategory.subCategoryIcon, objectsData = subcategory.objects });
                    end
                end
            end
        end
    end
end

--- Updates the categories list in the UI
---@param categories table
function ISBuildingMenuUI:updateCategoriesList(categories)
    local currentCategoriesList = self:getActiveCategoriesList();
    if not currentCategoriesList then return; end

    currentCategoriesList:clear();

    for i = 1, #categories do
        local category = categories[i];
        currentCategoriesList:addItem(category.categoryName,
            { icon = category.categoryIcon, subCatData = category.subcategories });
    end
end

--- Updates the subcategories list in the UI
---@param subCatData table
function ISBuildingMenuUI:updateSubCategoriesList(subCatData)
    local currentSubCategoriesList = self:getActiveSubCategoriesList();
    if not currentSubCategoriesList then return; end

    currentSubCategoriesList:clear();

    for i = 1, #subCatData do
        local subCategory = subCatData[i];
        currentSubCategoriesList:addItem(subCategory.subcategoryName,
            { icon = subCategory.subCategoryIcon, objectsData = subCategory.objects });
    end
end

--- Updates the tiles list in the UI
---@param objectsData table|nil
function ISBuildingMenuUI:updateTilesList(objectsData)
    self.tilesList.posToObjectNameTable = {};
    self.tilesList.textureCache = {};
    self.tilesList.subCatData = objectsData;
end

function ISBuildingMenuUI:onResize()
    ISUIElement.onResize(self);
    self.tilesList:setWidth(self.width / 2);
    self.tilesList:setX(self.width / 2);
    self.tilesList.posToObjectNameTable = {};
end

function ISBuildingMenuUI:isKeyConsumed(key)
    return key == Keyboard.KEY_ESCAPE or
        key == getCore():getKey("BuildingMenu") or
        key == ISBuildingMenuUI.upArrowCategory or
        key == ISBuildingMenuUI.downArrowCategory or
        key == ISBuildingMenuUI.leftTab or
        key == ISBuildingMenuUI.rightTab;
end

function ISBuildingMenuUI.onKeyPressed(key)
    local ui = ISBuildingMenuUI.instance;
    if not ui then return; end
    if not ui.panel or not ui.panel.activeView then return; end
    local playerObj = ui.character;

    if key == Keyboard.KEY_ESCAPE then
        ISBuildingMenuUI:toggleBuildingMenuUI(playerObj);
        return;
    end

    local categoriesList = ui.panel.activeView.view.categoriesList;
    if key == ISBuildingMenuUI.upArrowCategory then
        categoriesList.selected = categoriesList.selected - 1;
        if categoriesList.selected <= 0 then
            categoriesList.selected = categoriesList.count;
        end
    elseif key == ISBuildingMenuUI.downArrowCategory then
        categoriesList.selected = categoriesList.selected + 1;
        if categoriesList.selected > categoriesList.count then
            categoriesList.selected = 1;
        end
    end

    local viewIndex = ui.panel:getActiveViewIndex();
    local oldViewIndex = viewIndex;
    if key == ISBuildingMenuUI.leftTab then
        if viewIndex == 1 then
            viewIndex = #ui.panel.viewList;
        else
            viewIndex = viewIndex - 1;
        end
    elseif key == ISBuildingMenuUI.rightTab then
        if viewIndex == #ui.panel.viewList then
            viewIndex = 1;
        else
            viewIndex = viewIndex + 1;
        end
    end

    if key == Keyboard.KEY_F then
        ui.panel.activeView.view:addToFavorite(true, "categoriesList");
    end

    if oldViewIndex ~= viewIndex then
        ui.panel:activateView(ui.panel.viewList[viewIndex].name);
    end
    ui.panel.activeView.view.categoriesList:ensureVisible(ui.panel.activeView.view.categoriesList.selected);
end

Events.OnKeyPressed.Add(ISBuildingMenuUI.onKeyPressed);


function ISBuildingMenuUI:saveFavorites(favorites)
    self.favorites = favorites;
end

--- Strips the given prefix from the full name if it exists
---@param fullName string The full name to strip the prefix from
---@param prefix string The prefix to remove
---@return string fullName The name without the prefix, or the original name if the prefix does not exist
local function stripPrefix(fullName, prefix)
    if fullName:sub(1, #prefix) == prefix then
        return fullName:sub(#prefix + 1);
    else
        return fullName;
    end
end

--- Adds the given prefix to the name if it is not already present
---@param name string The name to add the prefix to
---@param prefix string The prefix to add
---@return string name The name with the prefix, or the original name if the prefix already exists
local function addPrefix(name, prefix)
    if name:sub(1, #prefix) ~= prefix then
        return prefix .. name;
    else
        return name;
    end
end

--- Strips the "IGUI_BuildingMenuTab_" prefix from the tab name
---@param tabName string The full tab name to strip the prefix from
---@return string tabName The stripped tab name
function ISBuildingMenuUI:stripTabPrefix(tabName)
    return stripPrefix(tabName, "IGUI_BuildingMenuTab_");
end

--- Strips the "IGUI_BuildingMenuCat_" prefix from the category name
---@param categoryName string The full category name to strip the prefix from
---@return string categoryName The stripped category name
function ISBuildingMenuUI:stripCategoryPrefix(categoryName)
    return stripPrefix(categoryName, "IGUI_BuildingMenuCat_");
end

--- Strips the "IGUI_BuildingMenuSubCat_" prefix from the subcategory name
---@param subCategoryName string The full subcategory name to strip the prefix from
---@return string subCategoryName The stripped subcategory name
function ISBuildingMenuUI:stripSubCategoryPrefix(subCategoryName)
    return stripPrefix(subCategoryName, "IGUI_BuildingMenuSubCat_");
end

--- Adds the "IGUI_BuildingMenuTab_" prefix to the tab name if it is not present
---@param tabName string The tab name to which the prefix should be added
---@return string tabName The tab name with the prefix
function ISBuildingMenuUI:addTabPrefix(tabName)
    return addPrefix(tabName, "IGUI_BuildingMenuTab_");
end

--- Adds the "IGUI_BuildingMenuCat_" prefix to the category name if it is not present
---@param categoryName string The category name to which the prefix should be added
---@return string categoryName The category name with the prefix
function ISBuildingMenuUI:addCategoryPrefix(categoryName)
    return addPrefix(categoryName, "IGUI_BuildingMenuCat_");
end

--- Adds the "IGUI_BuildingMenuSubCat_" prefix to the subcategory name if it is not present
---@param subCategoryName string The subcategory name to which the prefix should be added
---@return string subCategoryName The subcategory name with the prefix
function ISBuildingMenuUI:addSubCategoryPrefix(subCategoryName)
    return addPrefix(subCategoryName, "IGUI_BuildingMenuSubCat_");
end

--- Constructor for ISBuildingMenuUI
---@param x number
---@param y number
---@param width number
---@param height number
---@param character IsoPlayer
---@return ISBuildingMenuUI
function ISBuildingMenuUI:new(x, y, width, height, character)
    local o = {};
    o = ISCollapsableWindowJoypad.new(self, x, y, width, height);
    o:setResizable(true);

    o.title                        = getText("IGUI_BuildingMenu");
    o.character                    = character;
    o.playerNum                    = character and character:getPlayerNum() or -1;
    o.minOpaque                    = 1; -- in percentage
    o.maxOpaque                    = 1; -- in percentage
    o.minimumWidth                 = 570;
    o.minimumHeight                = 400;
    o.fgBar                        = { r = 0, g = 0.6, b = 0, a = 0.7 };

    o.lastActiveTab                = nil;
    o.lastSelectedCategoryIndex    = nil;
    o.lastSelectedSubCategoryIndex = nil;
    o.selectedIndex                = {};

    o.categoriesListHasFocus       = true;
    o.uiHasFocus                   = false;
    o.joypadMoveSpeed              = 20;

    o.LabelDash                    = "-";
    o.LabelDashWidth               = getTextManager():MeasureStringX(UIFont.Small, o.LabelDash);
    o.LabelMove                    = getText("IGUI_BuildingMenuUI_Move_UI");
    o.LabelStopMove                = getText("IGUI_BuildingMenuUI_Stop_Move_UI");
    o.LabelBuild                   = getText("IGUI_BuildingMenuUI_Build");
    o.LabelFavorite                = getText("IGUI_BuildingMenuUI_Favorite");
    o.LabelClose                   = getText("IGUI_BuildingMenuUI_Close");

    o.LabelTabLeft                 = getText("IGUI_BuildingMenuUI_Tab_Left");
    o.LabelTabRight                = getText("IGUI_BuildingMenuUI_Tab_Right");

    o.LabelListLeft                = getText("IGUI_BuildingMenuUI_List_Left");
    o.LabelListRight               = getText("IGUI_BuildingMenuUI_List_Right");
    o.LabelListUp                  = getText("IGUI_BuildingMenuUI_List_Up");
    o.LabelListDown                = getText("IGUI_BuildingMenuUI_List_Down");

    o.bottomInfoText               = getText("IGUI_BuildingMenuUI_Controls",
        getKeyName(ISBuildingMenuUI.upArrowCategory), getKeyName(ISBuildingMenuUI.downArrowCategory),
        getKeyName(ISBuildingMenuUI.leftTab), getKeyName(ISBuildingMenuUI.rightTab));

    o.floorIsRoof                  = false;
    o.favorites                    = ModData.getOrCreate("BuildingMenu_Favorites");

    return o;
end

function ISBuildingMenuUI:setVisible(bVisible)
    self.javaObject:setVisible(bVisible);
    self.javaObject:setEnabled(bVisible);

    if not bVisible then -- save the selected index
        self.selectedIndex = {};
        for i = 1, #self.tabs do
            local v = self.tabs[i];
            self.selectedIndex[v.tab] = v.categoriesList.selected;
        end
    end
    if bVisible then
        self:refresh();
    end
    if bVisible then
        for i = 1, #self.tabs do
            local v = self.tabs[i];
            if self.selectedIndex[v.tab] then
                v.categoriesList.selected = self.selectedIndex[v.tab];
            end
        end
    end

    local categoriesListBox = self:getActiveCategoriesList();
    if categoriesListBox then
        categoriesListBox:ensureVisible(categoriesListBox.selected);
    end
    local subCategoriesListBox = self:getActiveSubCategoriesList();
    if subCategoriesListBox then
        subCategoriesListBox:ensureVisible(subCategoriesListBox.selected);
    end
end

function ISBuildingMenuUI:onLoseJoypadFocus()
    self.drawJoypadFocus = false;
end

function ISBuildingMenuUI:onGainJoypadFocus(joypadData)
    self.drawJoypadFocus = true;
end

function ISBuildingMenuUI:onJoypadDown(button)
    local ui = ISBuildingMenuUI.instance;
    if not ui then return; end
    if not ui.panel or not ui.panel.activeView then return; end
    local playerObj = ui.character;
    if button == Joypad.XButton then
        ui.uiHasFocus = not ui.uiHasFocus;
    end
    if button == Joypad.AButton then
        ui.tilesList:onJoypadDown(button);
    end
    if button == Joypad.BButton then
        self:toggleBuildingMenuUI(playerObj);
    end
    if button == Joypad.YButton then
        if self.categoriesListHasFocus == true then
            self.panel.activeView.view:addToFavorite(true, "categoriesList");
        elseif self.subCategoriesListHasFocus == true then
            self.panel.activeView.view:addToFavorite(true, "subCategoriesList");
        end
    end
    if button == Joypad.LBumper or button == Joypad.RBumper then
        local viewIndex = self.panel:getActiveViewIndex();
        if button == Joypad.LBumper then
            if viewIndex == 1 then
                viewIndex = #self.panel.viewList;
            else
                viewIndex = viewIndex - 1;
            end
        elseif button == Joypad.RBumper then
            if viewIndex == #self.panel.viewList then
                viewIndex = 1;
            else
                viewIndex = viewIndex + 1;
            end
        end
        self.panel:activateView(self.panel.viewList[viewIndex].name);
        local categoriesListBox = self:getActiveCategoriesList();
        if categoriesListBox then
            categoriesListBox:ensureVisible(categoriesListBox.selected);
        end
        local subCategoriesListBox = self:getActiveSubCategoriesList();
        if subCategoriesListBox then
            subCategoriesListBox:ensureVisible(subCategoriesListBox.selected);
        end
    end
end

function ISBuildingMenuUI:onJoypadDirUp()
    if self.uiHasFocus then
        self:setY(self:getY() - self.joypadMoveSpeed);
    elseif self.categoriesListHasFocus then
        self:getActiveCategoriesList():onJoypadDirUp();
    elseif self.subCategoriesListHasFocus then
        self:getActiveSubCategoriesList():onJoypadDirUp();
    elseif self.tilesList then
        self.tilesList:onJoypadDirUp();
    end
end

function ISBuildingMenuUI:onJoypadDirDown()
    if self.uiHasFocus then
        self:setY(self:getY() + self.joypadMoveSpeed);
    elseif self.categoriesListHasFocus then
        self:getActiveCategoriesList():onJoypadDirDown();
    elseif self.subCategoriesListHasFocus then
        self:getActiveSubCategoriesList():onJoypadDirDown();
    elseif self.tilesList then
        self.tilesList:onJoypadDirDown();
    end
end

function ISBuildingMenuUI:onJoypadDirLeft()
    if self.uiHasFocus then
        self:setX(self:getX() - self.joypadMoveSpeed);
    elseif self.tilesListHasFocus then
        self.tilesList:onJoypadDirLeft();
    elseif self.subCategoriesListHasFocus then
        self.subCategoriesListHasFocus = false;
        self.categoriesListHasFocus = true;
    end
end

function ISBuildingMenuUI:onJoypadDirRight()
    if self.uiHasFocus then
        self:setX(self:getX() + self.joypadMoveSpeed);
    elseif self.categoriesListHasFocus and self:getActiveSubCategoriesList():getIsVisible() then
        self.categoriesListHasFocus = false;
        self.subCategoriesListHasFocus = true;
    elseif self.subCategoriesListHasFocus and self.tilesList:getIsVisible() then
        self.subCategoriesListHasFocus = false;
        self.tilesListHasFocus = true;
    elseif self.tilesListHasFocus then
        self.tilesList:onJoypadDirRight();
    end
end
