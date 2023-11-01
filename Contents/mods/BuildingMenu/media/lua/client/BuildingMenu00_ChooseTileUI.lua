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

    local maxRow = 1
    local objectsBuffer = {}
    local tileWidth = 64;
    local tileHeight = 128;

    for r = 1, 128 do
        for c = 1, 4 do
            local objDef = self:findNextObject(objectsBuffer)
            if objDef then
                local objSpriteName = objDef.data.sprites.sprite
                if objDef.data.isRecipeKnown == true or self.character:isRecipeKnown(objDef.data.isRecipeKnown) then
                    objectsBuffer[objSpriteName] = true
                    self.posToObjectNameTable[r] = self.posToObjectNameTable[r] or {}
                    self.posToObjectNameTable[r][c] = { objDef = objDef, canBuild = false }
                    local texture = getTexture(objSpriteName)
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
    local parent = self:getParent()

    -- calculate the position of the tile list panel relative to the parent, considering the title bar height
    local panelY = self:getY() - self:getYScroll() - parent:titleBarHeight()
    if mouseY < panelY or mouseY > panelY + self:getHeight() then return end

    local c = math.floor(mouseX / tileWidth)
    local r = math.floor(mouseY / tileHeight)

    if c >= 0 and r >= 0 and r < maxRow and self.posToObjectNameTable[r + 1] and self.posToObjectNameTable[r + 1][c + 1] then
        local selectedObject = self.posToObjectNameTable[r + 1][c + 1];
        self.tooltip:addToUIManager();
        self.tooltip, selectedObject.canBuild = BuildingMenu.canBuildObject(self.character, self.tooltip, selectedObject.objDef.data.recipe);
        self.tooltip:setName(BuildingMenu.getMoveableDisplayName(selectedObject.objDef.name) or selectedObject.objDef.name);
        self.tooltip.description = selectedObject.objDef.description .. " <RGB:1,0,0> " .. self.tooltip.description;
        self.tooltip:setVisible(true);
        local borderColor = selectedObject.canBuild and { 0.6, 0, 1, 0 } or { 0.6, 1, 0, 0 }
        self:drawRectBorder(c * tileWidth, r * tileHeight, tileWidth, tileHeight, unpack(borderColor))
    else
        self.tooltip:setVisible(false);
        self.tooltip:removeFromUIManager()
    end
end


function BuildingMenuTilePickerList:findNextObject(objectsBuffer)
    for _, objectDef in pairs(self.subCatData) do
        if objectDef.data and objectDef.data.sprites then
            local objSpriteName = objectDef.data.sprites.sprite
            if not objectsBuffer[objSpriteName] then
                return objectDef
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


function BuildingMenuTilePickerList:new(x, y, w, h, character)
    local o = ISPanel.new(self, x, y, w, h)
    o.backgroundColor.a = 0.25;
    o.subCatData = nil
    o.character = character
    o.posToObjectNameTable = {};
    o.tooltip = nil;
    o.message = nil;
    return o
end


BuildingMenuChooseTileUI = ISCollapsableWindow:derive("BuildingMenuChooseTileUI");
BuildingMenuChooseTileUI.instance = nil


local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.MediumNew)


function BuildingMenuChooseTileUI.openPanel(x, y, playerObj)
    if y < 0 then y = 0 end
    if BuildingMenuChooseTileUI.instance == nil then
        -- local window = BuildingMenuChooseTileUI:new(x, y, 822, 660, playerObj)
        local window = BuildingMenuChooseTileUI:new(x, y, 570, 384, playerObj)
        window:initialise()
        window:addToUIManager()
        BuildingMenuChooseTileUI.instance = window
    end
end

local minOpaqueVal = 0;
local maxOpaqueVal = 0.5;
function BuildingMenuChooseTileUI:createChildren()
    ISCollapsableWindow.createChildren(self)
    local th = self:titleBarHeight()

    --gear button
    self.gearButton = ISButton:new((self.width - 19) - th / 2 - th, 1, th, th, "", self, BuildingMenuChooseTileUI.onGearButtonClick);
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


    self.searchCategoriesListEntryBox = ISTextEntryBox:new('', 0, th, 150, 20)
    self.searchCategoriesListEntryBox.font = UIFont.Medium
    self.searchCategoriesListEntryBox.onTextChange = BuildingMenuChooseTileUI.onTextChangeModulesList
    self:addChild(self.searchCategoriesListEntryBox)

    self.searchSubCategoriesListEntryBox = ISTextEntryBox:new('', self.searchCategoriesListEntryBox:getRight(), th, 150, 20)
    self.searchSubCategoriesListEntryBox.font = UIFont.Medium
    self.searchSubCategoriesListEntryBox.onTextChange = BuildingMenuChooseTileUI.onTextChangeSubModulesList
    self:addChild(self.searchSubCategoriesListEntryBox)

    self.categoriesList = ISScrollingListBox:new(0, self.searchCategoriesListEntryBox:getBottom(), 150, self.height - th - 20);
    self.categoriesList.anchorBottom = true;
    self.categoriesList:initialise();
    self.categoriesList:instantiate();
    self.categoriesList.itemPadY = 10;
    self.categoriesList.backgroundColor.a = 0.25;
    self.categoriesList.itemheight = FONT_HGT_MEDIUM + 20;
    self.categoriesList.selected = 0;
    self.categoriesList.font = UIFont.MediumNew;
    self.categoriesList.doDrawItem = self.doDrawSubCategoriesListItem;
    self.categoriesList.drawBorder = true;
    self.categoriesList.onmousedown = self.onSelectCateg;
    self:addChild(self.categoriesList);

    self.subCategoriesList = ISScrollingListBox:new(self.categoriesList:getRight(), self.searchSubCategoriesListEntryBox:getBottom(), 150, self.height - th - 20);
    self.subCategoriesList.anchorBottom = true;
    self.subCategoriesList:initialise();
    self.subCategoriesList:instantiate();
    self.subCategoriesList.itemPadY = 10;
    self.subCategoriesList.backgroundColor.a = 0.25;
    self.subCategoriesList.itemheight = FONT_HGT_MEDIUM + 10;
    self.subCategoriesList.selected = 0;
    self.subCategoriesList.font = UIFont.NewSmall;
    self.subCategoriesList.doDrawItem = self.doDrawSubCategoriesListItem;
    self.subCategoriesList.drawBorder = true;
    self.subCategoriesList.onmousedown = self.onSelectSubCat;
    self:addChild(self.subCategoriesList);

    self.tilesList = BuildingMenuTilePickerList:new(self.subCategoriesList:getRight(), th, self:getWidth() - 300, self:getHeight() - th, self.character)
    self.tilesList.anchorRight = true;
    self.tilesList.anchorBottom = true;
    self.tilesList:initialise();
    self.tilesList:instantiate();
    self.tilesList:addScrollBars();
    self:addChild(self.tilesList);

    self:populateCategoriesList();
    self:onMinOpaqueChange(minOpaqueVal);
    self:onMaxOpaqueChange(maxOpaqueVal);
end

BuildingMenuChooseTileUI.onMinOpaqueChange = function(target, value)
    target.minOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    minOpaqueVal = value;
end

BuildingMenuChooseTileUI.onMaxOpaqueChange = function(target, value)
    target.maxOpaque = logTo01(value);
    target.backgroundColor.a = target.maxOpaque;
    maxOpaqueVal = value;
end

function BuildingMenuChooseTileUI:onGearButtonClick()
    local context = ISContextMenu.get(0, self:getAbsoluteX() + self:getWidth(), self:getAbsoluteY() + self.gearButton:getY())

    local minOpaqueOption = context:addOption(getText("UI_chat_context_opaque_min"), BuildingMenuChooseTileUI.instance);
    local minOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(minOpaqueOption, minOpaqueSubMenu);
    local opaques = {0, 0.15, 0.25, 0.4, 0.5, 0.75, 1};
    for i = 1, #opaques do
        if logTo01(opaques[i]) <= self.maxOpaque then
            local option = minOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", BuildingMenuChooseTileUI.instance, BuildingMenuChooseTileUI.onMinOpaqueChange, opaques[i])
            local current = math.floor(self.minOpaque * 1000)
            local value = math.floor(logTo01(opaques[i]) * 1000)
            if current == value then
                minOpaqueSubMenu:setOptionChecked(option, true)
            end
        end
    end

    local maxOpaqueOption = context:addOption(getText("UI_chat_context_opaque_max"), BuildingMenuChooseTileUI.instance);
    local maxOpaqueSubMenu = context:getNew(context);
    context:addSubMenu(maxOpaqueOption, maxOpaqueSubMenu);
    for i = 1, #opaques do
        if logTo01(opaques[i]) >= self.minOpaque then
            local option = maxOpaqueSubMenu:addOption((opaques[i] * 100) .. "%", BuildingMenuChooseTileUI.instance, BuildingMenuChooseTileUI.onMaxOpaqueChange, opaques[i])
            local current = math.floor(self.maxOpaque * 1000)
            local value = math.floor(logTo01(opaques[i]) * 1000)
            if current == value then
                maxOpaqueSubMenu:setOptionChecked(option, true)
            end
        end
    end
end


function BuildingMenuChooseTileUI:onTextChangeModulesList()
    BuildingMenuChooseTileUI.instance:populateCategoriesList()
end


function BuildingMenuChooseTileUI:onTextChangeSubModulesList()
    BuildingMenuChooseTileUI.instance:populateSubCategoriesList()
end


function BuildingMenuChooseTileUI.onSelectSubCat(_, item)
    BuildingMenuChooseTileUI.instance.tilesList.posToObjectNameTable = {};
    BuildingMenuChooseTileUI.instance.tilesList.subCatData = item.objectsData
end


function BuildingMenuChooseTileUI.onSelectCateg(_, item)
    BuildingMenuChooseTileUI.instance.tilesList.posToObjectNameTable = {};
    BuildingMenuChooseTileUI.instance:populateSubCategoriesList()
end


function BuildingMenuChooseTileUI:populateSubCategoriesList()
    local searchText = self.searchSubCategoriesListEntryBox:getInternalText();
    self.subCategoriesList:clear();

    local subCategories = self.categoriesList.items[self.categoriesList.selected].item.subCatData
    for _, subcategories in pairs(subCategories) do
        local subCatName = subcategories.subcategoryName
        local subCatIcon = subcategories.subCategoryIcon
        local objectsData = subcategories.objects

        if subCatName ~= nil and (string.contains(string.lower(subCatName), string.lower(searchText)) or searchText == "") then
            self.subCategoriesList:addItem(subCatName, {icon = subCatIcon, objectsData = objectsData});
        end
    end

    local selectedSubCategory = self.subCategoriesList.items[self.subCategoriesList.selected];
    if selectedSubCategory and selectedSubCategory.item then
        self.tilesList.subCatData = self.subCategoriesList.items[self.subCategoriesList.selected].item.objectsData
    end
end


function BuildingMenuChooseTileUI:doDrawSubCategoriesListItem(y, item, alt)
    self:drawRectBorder(0, (y), self:getWidth(), self.itemheight - 1, 0.9, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    if self.selected == item.index then
        self:drawRect(0, (y), self:getWidth(), self.itemheight - 1, 0.3, 0.7, 0.35, 0.15);
    end
    local texture = getTexture(item.item.icon);
    if texture then
        self:drawTextureScaledAspect(texture, 1, y, 25, self.itemheight, 1, 1, 1, 1);
    end

    self:drawText(item.text, 25, y + (self.itemheight - FONT_HGT_MEDIUM) / 2, 1, 1, 1, 0.9, self.font);
    return y + self.itemheight;
end


function BuildingMenuChooseTileUI:populateCategoriesList()
    local searchText = self.searchCategoriesListEntryBox:getInternalText()
    self.categoriesList:clear();
    self.subCategoriesList:clear();

    local allCategories = BuildingMenu.Categories
    for _, categories in pairs(allCategories) do
        local catName = categories.categoryName
        local catIcon = categories.categoryIcon
        local subCatData = categories.subcategories
        if catName ~= nil and (string.contains(string.lower(catName), string.lower(searchText)) or searchText == "") then
            self.categoriesList:addItem(catName, {icon = catIcon, subCatData = subCatData});
        end
    end

    local selectedCategory = self.categoriesList.items[self.categoriesList.selected]
    if selectedCategory and selectedCategory.item then
        self:populateSubCategoriesList()
    end
end


function BuildingMenuChooseTileUI:close()
    BuildingMenuChooseTileUI.instance = nil
    self:setVisible(false);
    self:removeFromUIManager();
end


function BuildingMenuChooseTileUI:new(x, y, width, height, character)
    local o = ISCollapsableWindow.new(self, x, y, width, height);
    o:setResizable(false)
    o.title = getText("IGUI_BuildingMenu")
    o.character = character
    o.minOpaque = 1; -- in percentage
    o.maxOpaque = 1; -- in percentage
    return o;
end