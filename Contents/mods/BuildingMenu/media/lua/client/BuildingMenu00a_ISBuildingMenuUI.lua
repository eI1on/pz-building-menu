require "ISUI/ISCollapsableWindow"

if not getBuildingMenuInstance then
    require("BuildingMenu01_Main")
end

---@type function
local getText = getText
---@type function
local getTexture = getTexture
---@type function
local pairs = pairs

---@class BuildingMenu
local BuildingMenu = getBuildingMenuInstance()


--- Class representing the tile picker list in the Building Menu.
---@class BuildingMenuTilePickerList: ISPanel
BuildingMenuTilePickerList = ISPanel:derive("BuildingMenuTilePickerList")

local TILE_WIDTH, TILE_HEIGHT = 64, 128

function BuildingMenuTilePickerList:render()
    ISPanel.render(self)

    self:setStencilRect(0, 0, self:getWidth(), self:getHeight())

    local objectsBuffer = {}
    local maxCols = math.floor(self:getWidth() / TILE_WIDTH)
    local maxRows = math.ceil(#(self.subCatData or {}) / maxCols)

    for r = 1, maxRows  do
        for c = 1, maxCols do
            local objDef = self:findNextObject(objectsBuffer)
            if objDef then
                local objSpriteName = objDef.data.sprites.sprite
                if objDef.data.isRecipeKnown == true or self.character:isRecipeKnown(objDef.data.isRecipeKnown) then
                    objectsBuffer[objSpriteName] = true
                    self.posToObjectNameTable[r] = self.posToObjectNameTable[r] or {}
                    self.posToObjectNameTable[r][c] = { objDef = objDef, canBuild = false }

                    -- use cached texture if available, otherwise load and cache it
                    local texture = self.textureCache[objSpriteName]
                    if not texture then
                        texture = getTexture(objSpriteName)
                        self.textureCache[objSpriteName] = texture
                    end

                    if texture then
                        self:drawTextureScaledAspect(texture, (c - 1) * TILE_WIDTH, (r - 1) * TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT, 1.0, 1.0, 1.0, 1.0)
                    end
                end
            end
        end
    end
    self:setScrollHeight(maxRows * TILE_HEIGHT);

    self:updateTooltip(maxCols, maxRows);
    self:clearStencilRect();
end

--- Updates the tooltip for the tile picker list. TODO: optimize BuildingMenu.canBuildObject
---@param maxCols number
---@param maxRows number
function BuildingMenuTilePickerList:updateTooltip(maxCols, maxRows)
    local mouseX, mouseY = self:getMouseX(), self:getMouseY()
    local panelY = self:getY() - self:getYScroll() - self.parent:titleBarHeight() - self.parent.panel.tabHeight
    if mouseY < panelY or mouseY > panelY + self:getHeight() or mouseX < 0 or mouseX > self:getWidth() then  self:clearStencilRect(); return  end

    local c = math.floor(mouseX / TILE_WIDTH)
    local r = math.floor(mouseY / TILE_HEIGHT)

    if c >= 0 and r >= 0 and r < maxRows and c < maxCols and self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1] then
        local selectedObject = self.posToObjectNameTable[r + 1][c + 1];
        self.tooltip, selectedObject.canBuild = BuildingMenu.canBuildObject(self.character, self.tooltip, selectedObject.objDef.data.recipe);

        local borderColor = selectedObject.canBuild and { 0.6, 0, 1, 0 } or { 0.6, 1, 0, 0 }
        self:drawRectBorder(c * TILE_WIDTH, r * TILE_HEIGHT, TILE_WIDTH, TILE_HEIGHT, unpack(borderColor))
        self.tooltip:addToUIManager();
        self.tooltip:setName(BuildingMenu.getMoveableDisplayName(selectedObject.objDef.name) or selectedObject.objDef.name);
        self.tooltip.description = selectedObject.objDef.description .. " <RGB:1,0,0> " .. self.tooltip.description;
        self.tooltip:setVisible(true);
    else
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager()
    end
end

--- Finds the next object in the tile picker list.
---@param objectsBuffer table
---@return table|nil
function BuildingMenuTilePickerList:findNextObject(objectsBuffer)
    if not self.subCatData then return nil end
    for _, objectDef in pairs(self.subCatData) do
        if objectDef.data and objectDef.data.sprites and not objectsBuffer[objectDef.data.sprites.sprite] then
            return objectDef
        end
    end
    return nil
end


--- Handles mouse wheel events for the tile picker list.
---@param del number
---@return boolean
function BuildingMenuTilePickerList:onMouseWheel(del)
    self:setYScroll(self:getYScroll() - del * 128)
    return true
end


--- Handles mouse down events on the tile picker list.
---@param x number
---@param y number
function BuildingMenuTilePickerList:onMouseDown(x, y)
    local c = math.floor(x / 64)
    local r = math.floor(y / 128)
    local objData = self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1]

    if objData and objData.canBuild then
        local playerNum = self.character:getPlayerNum()
        local spritesName = objData.objDef.data.sprites
        local objectName = objData.objDef.name
        local recipe = objData.objDef.data.recipe
        local options = objData.objDef.data.options
        local onBuild = objData.objDef.data.action

        local modifiedOptions = {}
        for k, v in pairs(options) do
            modifiedOptions[k] = v
        end
        if self.overwriteIsThumpable or not SandboxVars.BuildingMenu.isThumpable then
            modifiedOptions.isThumpable = false
        end

        -- passing the name break the ISMetalDrum and RainCollectorBarrel objects
        if objData.objDef.data.action == BuildingMenu.onMetalDrum or objData.objDef.data.action == BuildingMenu.onRainCollectorBarrel then
            objectName = nil -- set objectName to nil for these specific actions
        end

        local object = onBuild(spritesName, objectName, playerNum, recipe);
        BuildingMenu.buildObject(object, objectName, playerNum, recipe, modifiedOptions);
    end
end

--- Handles mouse up events on the tile picker list.
---@param x number
---@param y number
function BuildingMenuTilePickerList:onMouseUp(x, y)
    self.message = nil;
    if self.tooltip and self.tooltip:getIsVisible() then
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager();
    end
end

--- Handles mouse movement outside the tile picker list.
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

    self.tooltip = ISToolTip:new();
    self.tooltip:initialise();
    self.tooltip:addToUIManager();
    self.tooltip:setAlwaysOnTop(true);
    self.tooltip:setOwner(self);
    self.tooltip:setVisible(false);
end


--- Constructor for BuildingMenuTilePickerList.
---@param x number
---@param y number
---@param w number
---@param h number
---@param character IsoPlayer
---@param parent any
---@return BuildingMenuTilePickerList class
function BuildingMenuTilePickerList:new(x, y, w, h, character, parent)
    local o = ISPanel.new(self, x, y, w, h)
    o.backgroundColor.a = 0.25;
    o.subCatData = nil;
    o.character = character;
    o.posToObjectNameTable = {};
    o.textureCache = {};
    o.tooltip = nil;
    o.message = nil;
    o.overwriteIsThumpable = false;
    o.parent = parent;
    return o
end


---@class ISBuildingMenuUI: ISCollapsableWindow
ISBuildingMenuUI = ISCollapsableWindow:derive("ISBuildingMenuUI");

--- Singleton instance of ISBuildingMenuUI.
---@type ISBuildingMenuUI|nil
ISBuildingMenuUI.instance = nil
ISBuildingMenuUI.largeFontHeight = getTextManager():getFontHeight(UIFont.Large)
ISBuildingMenuUI.mediumNewFontHeight = getTextManager():getFontHeight(UIFont.MediumNew)
ISBuildingMenuUI.smallFontHeight = getTextManager():getFontHeight(UIFont.Small)
ISBuildingMenuUI.upArrow = Keyboard.KEY_UP;
ISBuildingMenuUI.downArrow = Keyboard.KEY_DOWN;

--- Opens the Building Menu UI panel.
---@param x number
---@param y number
---@param playerObj IsoPlayer
function ISBuildingMenuUI.openPanel(x, y, playerObj)
    if y < 0 then y = 0 end
    if ISBuildingMenuUI.instance == nil then
        local window = ISBuildingMenuUI:new(x, y, 570, 400, playerObj);
        window:initialise();
        window:addToUIManager();
        ISBuildingMenuUI.instance = window;
    end
end


local minOpaqueVal = 0;
local maxOpaqueVal = 0.5;
--- Creates child elements for the Building Menu UI.
function ISBuildingMenuUI:createChildren()
    ISCollapsableWindow.createChildren(self)
    local th = self:titleBarHeight();
    local rh = self.resizable and self:resizeWidgetHeight() or 0;

    --gear button
    self.gearButton = ISButton:new((self.width - 19) - th / 2 - th, 1, th, th, "", self, ISBuildingMenuUI.onGearButtonClick);
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


    self.panel = ISTabPanel:new(0, th, self.width, self.height-th-rh);
    self.panel:initialise();
    self.panel:setAnchorRight(true)
    self.panel:setAnchorBottom(true)
    self.panel.borderColor = { r = 0, g = 0, b = 0, a = 0};
    self.panel.backgroundColor.a = 0.25;
    self.panel.tabSelected = nil;
    self.panel.tabUnSelected = nil;
    self.panel.tabHeight = getTextManager():getFontHeight(UIFont.Small) + 10
    self.panel.target = self;
    self.panel:setEqualTabWidth(false);
    self:addChild(self.panel);


    self.tabs = {};
    for _, tab in pairs(BuildingMenu.Tabs) do
        local newTab = ISBuildingMenuTabUI:new(0, 0, self.width, self.panel.height - self.panel.tabHeight, self)
        newTab:initialise();
        newTab:setAnchorRight(true);
        newTab:setAnchorBottom(true);
        local tabName = tab.tabName;
        newTab.tab = tabName;
        self.panel:addView(tabName, newTab);
        newTab.infoText = getText("UI_BuildingMenuUI");
        newTab.parent = self;

        if tab.categories then
            newTab.categories = tab.categories;
            for _, category in pairs(tab.categories) do
                local catName = category.categoryName;
                local catIcon = category.categoryIcon;
                local subCatData = category.subcategories;
                newTab.categoriesList:addItem(catName, {icon = catIcon, subCatData = subCatData});
            
                if category.subcategories then
                    local subCategories = newTab.categoriesList.items[newTab.categoriesList.selected].item.subCatData;
                    for _, subcategories in pairs(subCategories) do
                        local subCatName = subcategories.subcategoryName;
                        local subCatIcon = subcategories.subCategoryIcon;
                        local objectsData = subcategories.objects;
        
                        newTab.subCategoriesList:addItem(subCatName, {icon = subCatIcon, objectsData = objectsData});
                    end
                end
            end
        end

        table.insert(self.tabs, newTab);
    end
    self.panel:activateView(getText("IGUI_BuildingMenuTab_General"));

    self.tilesList = BuildingMenuTilePickerList:new(self.width/2, self.panel.tabHeight + th, self.width/2, self:getHeight() - th - rh - self.panel.tabHeight, self.character, self);
    self.tilesList.anchorBottom = true;
    self.tilesList:initialise();
    self.tilesList:instantiate();
    self.tilesList:addScrollBars();
    self:addChild(self.tilesList);


    self:onMinOpaqueChange(minOpaqueVal);
    self:onMaxOpaqueChange(maxOpaqueVal);
end

--- Changes the maximum opacity of the UI.
---@class target ISBuildingMenuUI
---@param value number
ISBuildingMenuUI.onMinOpaqueChange = function(target, value)
    target.minOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    minOpaqueVal = value;
end

--- Changes the maximum opacity of the UI.
---@class target ISBuildingMenuUI
---@param value number
ISBuildingMenuUI.onMaxOpaqueChange = function(target, value)
    target.maxOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    maxOpaqueVal = value;
end

--- Handles the gear button click in the Building Menu UI.
function ISBuildingMenuUI:onGearButtonClick()
    local context = ISContextMenu.get(0, self:getAbsoluteX() + self:getWidth(), self:getAbsoluteY() + self.gearButton:getY())

    if isDebugEnabled() or (isClient() and (getAccessLevel() == "admin")) then
        local option = context:addOption("Not Thumpable", self, function(self) 
            self.tilesList.overwriteIsThumpable = not self.tilesList.overwriteIsThumpable
            if isDebugEnabled() then
                BuildingMenu.debugPrint("[Building Menu Debug] self.tilesList.overwriteIsThumpable: ", self.tilesList.overwriteIsThumpable)
            end
        end)
        context:setOptionChecked(option, self.tilesList.overwriteIsThumpable)
    end

    local minOpaqueOption = context:addOption(getText("UI_chat_context_opaque_min"), ISBuildingMenuUI.instance);
    local minOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(minOpaqueOption, minOpaqueSubMenu);
    local opaques = {0, 0.15, 0.25, 0.4, 0.5, 0.75, 1};
    for i = 1, #opaques do
        if logTo01(opaques[i]) <= self.maxOpaque then
            local option = minOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", ISBuildingMenuUI.instance, ISBuildingMenuUI.onMinOpaqueChange, opaques[i])
            local current = math.floor(self.minOpaque * 1000)
            local value = math.floor(logTo01(opaques[i]) * 1000)
            if current == value then
                minOpaqueSubMenu:setOptionChecked(option, true)
            end
        end
    end

    local maxOpaqueOption = context:addOption(getText("UI_chat_context_opaque_max"), ISBuildingMenuUI.instance);
    local maxOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(maxOpaqueOption, maxOpaqueSubMenu);
    for i = 1, #opaques do
        if logTo01(opaques[i]) >= self.minOpaque then
            local option = maxOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", ISBuildingMenuUI.instance, ISBuildingMenuUI.onMaxOpaqueChange, opaques[i])
            local current = math.floor(self.maxOpaque * 1000)
            local value = math.floor(logTo01(opaques[i]) * 1000)
            if current == value then
                maxOpaqueSubMenu:setOptionChecked(option, true)
            end
        end
    end
end

--- Retrieves the currently active tab in the UI.
---@return ISBuildingMenuTabUI
function ISBuildingMenuUI:getActiveTab()
    return self.panel.activeView.view;
end

--- Retrieves the favorite tab in the UI.
---@return ISBuildingMenuTabUI|nil
function ISBuildingMenuUI:getFavoriteTab()
    for _, tab in pairs(self.tabs) do
        if tab.tab == getText("IGUI_BuildingMenuTab_Favorite") then
            return tab
        end
    end
    return nil
end

--- Retrieves the active categories list in the UI.
---@return ISUIElement|nil
function ISBuildingMenuUI:getActiveCategoriesList()
    return self.panel.activeView.view.categoriesList;
end

--- Retrieves the active subcategories list in the UI.
---@return ISUIElement|nil
function ISBuildingMenuUI:getActiveSubCategoriesList()
    return self.panel.activeView.view.subCategoriesList;
end


function ISBuildingMenuUI:initialise()
    ISCollapsableWindow.initialise(self);
end


function ISBuildingMenuUI:render()
    ISCollapsableWindow.render(self);
    if self.isCollapsed then return end
end

function ISBuildingMenuUI:update()
    local currentTab = self:getActiveTab()

    if self.lastActiveTab ~= currentTab then
        if self.lastActiveTab then
            self.lastActiveTab.selectedCategoryIndex = self.lastSelectedCategoryIndex;
            self.lastActiveTab.selectedSubCategoryIndex = self.lastSelectedSubCategoryIndex;
        end

        self.lastSelectedCategoryIndex = currentTab.selectedCategoryIndex or 1;
        self.lastSelectedSubCategoryIndex = currentTab.selectedSubCategoryIndex or 1;
        self.lastActiveTab = currentTab;

        -- update categories list for the new tab
        self:updateCategoriesList(currentTab.categories)

        if currentTab.tab == getText("IGUI_BuildingMenuTab_Favorite") then
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
        self.lastSelectedCategoryIndex = currentTab.categoriesList.selected
        local selectedCategoryItem = currentTab.categoriesList.items[currentTab.categoriesList.selected]
        if selectedCategoryItem then
            self:updateSubCategoriesList(selectedCategoryItem.item.subCatData)

            -- reset subcategory selection
            currentTab.subCategoriesList.selected = 1
            self.lastSelectedSubCategoryIndex = 1

            -- update tiles list for the first subcategory of the new category
            if #selectedCategoryItem.item.subCatData > 0 then
                self:updateTilesList(selectedCategoryItem.item.subCatData[1].objects)
            end
        end
    end

    -- check and update for subcategory change within the same category
    if self.lastSelectedSubCategoryIndex ~= currentTab.subCategoriesList.selected then
        self.lastSelectedSubCategoryIndex = currentTab.subCategoriesList.selected
        local selectedSubCategoryItem = currentTab.subCategoriesList.items[currentTab.subCategoriesList.selected]
        if selectedSubCategoryItem then
            self:updateTilesList(selectedSubCategoryItem.item.objectsData);
        else
            self:updateTilesList(nil);
        end
    end
end

--- Populates the favorites tab in the Building Menu UI.
function ISBuildingMenuUI:populateFavoritesTab()
    local modData = self.character:getModData()
    local favorites = modData.favorites or { categories = {}, subcategories = {} }

    local favoriteTab = self:getFavoriteTab()
    if not favoriteTab or self:getActiveTab() ~= favoriteTab then return end

    favoriteTab.categoriesList:clear()
    favoriteTab.subCategoriesList:clear()

    for _, tab in pairs(BuildingMenu.Tabs) do
        for _, category in pairs(tab.categories) do
            if favorites.categories[category.categoryIcon] then
                local subCatData = {}
                for _, subcategory in pairs(category.subcategories) do
                    if favorites.subcategories[subcategory.subCategoryIcon] then
                        table.insert(subCatData, subcategory)
                    end
                end
                if #subCatData > 0 then
                    favoriteTab.categoriesList:addItem("[" ..tab.tabName.. "] " .. category.categoryName, {icon = category.categoryIcon, subCatData = subCatData})
                end
            end
        end
    end
end

--- Updates the subcategories list for the favorite tab.
---@param favoriteTab ISBuildingMenuTabUI
function ISBuildingMenuUI:updateSubCategoriesListForFavorite(favoriteTab)
    local modData = self.character:getModData()
    local favorites = modData.favorites or { categories = {}, subcategories = {} }

    local selectedCategoryIndex = favoriteTab.categoriesList.selected
    if selectedCategoryIndex > 0 then
        local selectedCategoryItem = favoriteTab.categoriesList.items[selectedCategoryIndex]
        favoriteTab.subCategoriesList:clear()
        if selectedCategoryItem then
            for _, subcategory in pairs(selectedCategoryItem.item.subCatData) do
                if favorites.subcategories[subcategory.subCategoryIcon] then
                    favoriteTab.subCategoriesList:addItem(subcategory.subcategoryName, {icon = subcategory.subCategoryIcon, objectsData = subcategory.objects})
                end
            end
        end
    end
end


--- Updates the categories list in the UI.
---@param categories table
function ISBuildingMenuUI:updateCategoriesList(categories)
    local currentCategoriesList = self:getActiveCategoriesList();
    currentCategoriesList:clear();

    for _, category in pairs(categories) do
        currentCategoriesList:addItem(category.categoryName, { icon = category.categoryIcon, subCatData = category.subcategories });
    end
end

--- Updates the subcategories list in the UI.
---@param subCatData table
function ISBuildingMenuUI:updateSubCategoriesList(subCatData)
    local currentSubCategoriesList = self:getActiveSubCategoriesList();
    currentSubCategoriesList:clear();

    for _, subCategory in pairs(subCatData) do
        currentSubCategoriesList:addItem(subCategory.subcategoryName, { icon = subCategory.subCategoryIcon, objectsData = subCategory.objects });
    end
end

--- Updates the tiles list in the UI.
---@param objectsData table|nil
function ISBuildingMenuUI:updateTilesList(objectsData)
    self.tilesList.posToObjectNameTable = {};
    self.tilesList.textureCache = {};
    self.tilesList.subCatData = objectsData;
end


function ISBuildingMenuUI:close()
    ISBuildingMenuUI.instance = nil;
    self:setVisible(false);
    self:removeFromUIManager();
end


function ISBuildingMenuUI:onResize()
    ISUIElement.onResize(self);
    self.tilesList:setWidth(self.width/2);
    self.tilesList:setX(self.width/2);
    self.tilesList.posToObjectNameTable = {};
end


--- Constructor for ISBuildingMenuUI.
---@param x number
---@param y number
---@param width number
---@param height number
---@param character IsoPlayer
---@return ISBuildingMenuUI
function ISBuildingMenuUI:new(x, y, width, height, character)
    local o = ISCollapsableWindow.new(self, x, y, width, height);
    o:setResizable(true);
    
    o.title = getText("IGUI_BuildingMenu");
    o.character = character;
    o.minOpaque = 1; -- in percentage
    o.maxOpaque = 1; -- in percentage
    o.minimumWidth = 570;
    o.minimumHeight = 400;
    o.lastActiveTab = nil;
    o.lastSelectedCategoryIndex = nil;
    o.lastSelectedSubCategoryIndex = nil;

    return o;
end
