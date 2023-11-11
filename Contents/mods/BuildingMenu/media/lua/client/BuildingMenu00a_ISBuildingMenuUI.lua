require "ISUI/ISCollapsableWindow"

if not getBuildingMenuInstance then
    require("BuildingMenu01_Main")
end

local getText = getText
local getTexture = getTexture
local pairs = pairs

local BuildingMenu = getBuildingMenuInstance()

BuildingMenuTilePickerList = ISPanel:derive("BuildingMenuTilePickerList")

function BuildingMenuTilePickerList:render()
    ISPanel.render(self)

    self:setStencilRect(0, 0, self:getWidth(), self:getHeight())

    local maxRow = 1
    local objectsBuffer = {}
    local tileWidth, tileHeight = 64, 128;
    local cols = math.floor(self:getWidth() / tileWidth)

    for r = 1, 128 do
        for c = 1, cols do
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
                        self:drawTextureScaledAspect(texture, (c - 1) * tileWidth, (r - 1) * tileHeight, tileWidth, tileHeight, 1.0, 1.0, 1.0, 1.0)
                        maxRow = r
                    end
                end
            end
        end
    end
    self:setScrollHeight(maxRow * tileHeight)

    local mouseX = self:getMouseX()
    local mouseY = self:getMouseY()

    -- calculate the position of the tile list panel relative to the parent, considering the title bar height and panel tab height
    local panelY = self:getY() - self:getYScroll() - self.parent:titleBarHeight() - self.parent.panel.tabHeight
    if mouseY < panelY or mouseY > panelY + self:getHeight() then  self:clearStencilRect(); return  end

    local c = math.floor(mouseX / tileWidth)
    local r = math.floor(mouseY / tileHeight)

    if c >= 0 and r >= 0 and r < maxRow and c < cols and self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1] then
        local selectedObject = self.posToObjectNameTable[r + 1][c + 1];
        self.tooltip, selectedObject.canBuild = BuildingMenu.canBuildObject(self.character, self.tooltip, selectedObject.objDef.data.recipe);

        local borderColor = selectedObject.canBuild and { 0.6, 0, 1, 0 } or { 0.6, 1, 0, 0 }
        self:drawRectBorder(c * tileWidth, r * tileHeight, tileWidth, tileHeight, unpack(borderColor))
        self.tooltip:addToUIManager();
        self.tooltip:setName(BuildingMenu.getMoveableDisplayName(selectedObject.objDef.name) or selectedObject.objDef.name);
        self.tooltip.description = selectedObject.objDef.description .. " <RGB:1,0,0> " .. self.tooltip.description;
        self.tooltip:setVisible(true);
    else
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager()
    end
    self:clearStencilRect();
end


function BuildingMenuTilePickerList:findNextObject(objectsBuffer)
    if self.subCatData then
        for _, objectDef in pairs(self.subCatData) do
            if objectDef.data and objectDef.data.sprites then
                local objSpriteName = objectDef.data.sprites.sprite
                if not objectsBuffer[objSpriteName] then
                    return objectDef
                end
            end
        end
    end
    return nil
end


function BuildingMenuTilePickerList:onMouseWheel(del)
    self:setYScroll(self:getYScroll() - del * 128)
    return true
end


function BuildingMenuTilePickerList:onMouseDown(x, y)
    local c = math.floor(x / 64)
    local r = math.floor(y / 128)
    local objData = self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1]

    if objData and objData.canBuild then
        local spritesName = objData.objDef.data.sprites
        local objectName = objData.objDef.name
        local recipe = objData.objDef.data.recipe
        local options = objData.objDef.data.options
        local onBuild = objData.objDef.data.action

        onBuild(spritesName, objectName, self.character:getPlayerNum(), recipe, options)
    end
end


function BuildingMenuTilePickerList:onMouseUp(x, y)
    self.message = nil;
    if self.tooltip and self.tooltip:getIsVisible() then
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager();
    end
end


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


function BuildingMenuTilePickerList:new(x, y, w, h, character, parent)
    local o = ISPanel.new(self, x, y, w, h)
    o.backgroundColor.a = 0.25;
    o.subCatData = nil;
    o.character = character;
    o.posToObjectNameTable = {};
    o.textureCache = {};
    o.tooltip = nil;
    o.message = nil;
    o.parent = parent;
    return o
end


ISBuildingMenuUI = ISCollapsableWindow:derive("ISBuildingMenuUI");
ISBuildingMenuUI.instance = nil
ISBuildingMenuUI.largeFontHeight = getTextManager():getFontHeight(UIFont.Large)
ISBuildingMenuUI.mediumNewFontHeight = getTextManager():getFontHeight(UIFont.MediumNew)
ISBuildingMenuUI.smallFontHeight = getTextManager():getFontHeight(UIFont.Small)
ISBuildingMenuUI.upArrow = Keyboard.KEY_UP;
ISBuildingMenuUI.downArrow = Keyboard.KEY_DOWN;



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
        newTab.parent = self;

        newTab.categories = tab.categories;

        for _, category in pairs(tab.categories) do
            local catName = category.categoryName;
            local catIcon = category.categoryIcon;
            local subCatData = category.subcategories;
            newTab.categoriesList:addItem(catName, {icon = catIcon, subCatData = subCatData});
        
            local subCategories = newTab.categoriesList.items[newTab.categoriesList.selected].item.subCatData;
            for _, subcategories in pairs(subCategories) do
                local subCatName = subcategories.subcategoryName;
                local subCatIcon = subcategories.subCategoryIcon;
                local objectsData = subcategories.objects;

                newTab.subCategoriesList:addItem(subCatName, {icon = subCatIcon, objectsData = objectsData});
            end
        end

        table.insert(self.tabs, newTab);
    end


    self.tilesList = BuildingMenuTilePickerList:new(self.width/2, self.panel.tabHeight + th, self.width/2, self:getHeight() - th - rh - self.panel.tabHeight, self.character, self);
    self.tilesList.anchorBottom = true;
    self.tilesList:initialise();
    self.tilesList:instantiate();
    self.tilesList:addScrollBars();
    self:addChild(self.tilesList);


    self:onMinOpaqueChange(minOpaqueVal);
    self:onMaxOpaqueChange(maxOpaqueVal);
end


ISBuildingMenuUI.onMinOpaqueChange = function(target, value)
    target.minOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    minOpaqueVal = value;
end


ISBuildingMenuUI.onMaxOpaqueChange = function(target, value)
    target.maxOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    maxOpaqueVal = value;
end


function ISBuildingMenuUI:onGearButtonClick()
    local context = ISContextMenu.get(0, self:getAbsoluteX() + self:getWidth(), self:getAbsoluteY() + self.gearButton:getY())

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


function ISBuildingMenuUI:getActiveCategoriesList()
    return self.panel.activeView.view.categoriesList;
end

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
    local currentTab = self.panel.activeView.view

    -- check if the active tab has changed
    if self.lastActiveTab ~= currentTab then
        self.lastActiveTab = currentTab
        self.lastSelectedCategoryIndex = nil
        self.lastSelectedSubCategoryIndex = nil

        -- update categories list for the new tab
        self:updateCategoriesList(currentTab.categories)
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
            self:updateTilesList(selectedSubCategoryItem.item.objectsData)
        end
    end
end


function ISBuildingMenuUI:updateCategoriesList(categories)
    local currentCategoriesList = self:getActiveCategoriesList();
    currentCategoriesList:clear();

    for _, category in pairs(categories) do
        currentCategoriesList:addItem(category.categoryName, { icon = category.categoryIcon, subCatData = category.subcategories });
    end
end


function ISBuildingMenuUI:updateSubCategoriesList(subCatData)
    local currentSubCategoriesList = self:getActiveSubCategoriesList();
    currentSubCategoriesList:clear();

    for _, subCategory in pairs(subCatData) do
        currentSubCategoriesList:addItem(subCategory.subcategoryName, { icon = subCategory.subCategoryIcon, objectsData = subCategory.objects });
    end
end


function ISBuildingMenuUI:updateTilesList(objectsData)
    self.tilesList.posToObjectNameTable = {};
    self.tilesList.subCatData = objectsData;
    self.tilesList.textureCache = {};
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
end


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