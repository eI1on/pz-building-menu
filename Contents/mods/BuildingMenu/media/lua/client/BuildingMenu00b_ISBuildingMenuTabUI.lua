require "ISUI/ISPanel"

---@type function
local getTexture = getTexture;
---@type function
local getText = getText;

--- Class representing a tab in the Building Menu UI
---@class ISBuildingMenuTabUI: ISPanelJoypad
ISBuildingMenuTabUI = ISPanelJoypad:derive("ISBuildingMenuTabUI");

--- Singleton instance of ISBuildingMenuTabUI
---@type ISBuildingMenuTabUI|nil
ISBuildingMenuTabUI.instance = nil;
---@type number
ISBuildingMenuTabUI.largeFontHeight = getTextManager():getFontHeight(UIFont.Large);
---@type number
ISBuildingMenuTabUI.mediumNewFontHeight = getTextManager():getFontHeight(UIFont.MediumNew);
---@type number
ISBuildingMenuTabUI.smallFontHeight = getTextManager():getFontHeight(UIFont.Small);


function ISBuildingMenuTabUI:initialise()
    ISPanelJoypad.initialise(self);
    self:create();
end

--- Creates the UI components for the tab
function ISBuildingMenuTabUI:create()
    self.categoriesList = ISScrollingListBox:new(0, 0, self.width / 4, self.height);
    self.categoriesList.anchorBottom = true;
    self.categoriesList:initialise();
    self.categoriesList:instantiate();
    self.categoriesList:setAnchorRight(false);
    self.categoriesList:setAnchorBottom(true);
    self.categoriesList.itemPadY = 10;
    self.categoriesList.backgroundColor.a = 0.25;
    self.categoriesList.itemheight = ISBuildingMenuTabUI.mediumNewFontHeight + 20;
    self.categoriesList.selected = 1;
    self.categoriesList.listType = "categoriesList";
    self.categoriesList.font = UIFont.MediumNew;
    self.categoriesList.doDrawItem = self.doDrawListItem;
    self.categoriesList.onMouseDown = self.onMouseDown_List;
    self.categoriesList.joypadParent = self;
    self.categoriesList.drawBorder = true;
    self:addChild(self.categoriesList);

    self.subCategoriesList = ISScrollingListBox:new(self.categoriesList:getRight(), 0, self.width / 4, self.height);
    self.subCategoriesList.anchorBottom = true;
    self.subCategoriesList:initialise();
    self.subCategoriesList:instantiate();
    self.subCategoriesList:setAnchorRight(false);
    self.subCategoriesList:setAnchorBottom(true);
    self.subCategoriesList.itemPadY = 10;
    self.subCategoriesList.backgroundColor.a = 0.25;
    self.subCategoriesList.itemheight = ISBuildingMenuTabUI.mediumNewFontHeight + 15;
    self.subCategoriesList.selected = 1;
    self.subCategoriesList.listType = "subCategoriesList";
    self.subCategoriesList.font = UIFont.NewSmall;
    self.subCategoriesList.doDrawItem = self.doDrawListItem;
    self.subCategoriesList.onMouseDown = self.onMouseDown_List;
    self.subCategoriesList.joypadParent = self;
    self.subCategoriesList.drawBorder = true;
    self:addChild(self.subCategoriesList);
end

--- Draws a list item in the tab
---@param y number
---@param item table
---@param alt boolean
---@return number
function ISBuildingMenuTabUI:doDrawListItem(y, item, alt)
    self:drawRectBorder(0, y, self:getWidth(), self.itemheight - 1, 0.9, self.borderColor.r, self.borderColor.g,
        self.borderColor.b);
    if self.selected == item.index then
        self:drawRect(0, y, self:getWidth(), self.itemheight - 1, 0.3, 0.7, 0.35, 0.15);
    end
    local texture = getTexture(item.item.icon);
    if texture then
        self:drawTextureScaledAspect(texture, 1, y, 25, self.itemheight, 1, 1, 1, 1);
    end

    local buildingMenuTab = self.parent;

    local tabNameKey = item.item.tabName or "";
    local textKey = item.text or "";
    local cachedTabName = buildingMenuTab.textCache[tabNameKey] or
        (item.item and item.item.tabName and getText(item.item.tabName) or "");
    local cachedText = buildingMenuTab.textCache[textKey] or (item.text and getText(item.text) or "");

    buildingMenuTab.textCache[tabNameKey] = cachedTabName;
    buildingMenuTab.textCache[textKey] = cachedText;

    local itemText = (self.listType == "categoriesList" and buildingMenuTab.tab == "IGUI_BuildingMenuTab_Favorite") and
        ("[" .. cachedTabName .. "] " .. cachedText) or cachedText;
    self:drawText(itemText, 25, y + (self.itemheight - ISBuildingMenuTabUI.mediumNewFontHeight) / 2, 1, 1, 1, 0.9,
        self.font);

    local favoriteStar, favoriteAlpha = nil, 1;

    local isFavorite = false;
    local favorites = buildingMenuTab.buildingMenuUI.favorites;

    if self.listType == "categoriesList" then
        local selectedCategoryTabName = item.item and item.item.tabName or buildingMenuTab.tab;
        selectedCategoryTabName = buildingMenuTab.buildingMenuUI:stripTabPrefix(selectedCategoryTabName);
        local selectedCategoryName = buildingMenuTab.buildingMenuUI:stripCategoryPrefix(item.text);
        isFavorite = favorites[selectedCategoryTabName] and
            favorites[selectedCategoryTabName][selectedCategoryName] and
            favorites[selectedCategoryTabName][selectedCategoryName].favorite == true;
    else
        local selectedCategoryItem = buildingMenuTab.categoriesList.items[buildingMenuTab.categoriesList.selected];

        local selectedCategoryTabName = selectedCategoryItem.item and selectedCategoryItem.item.tabName or
            buildingMenuTab.tab;
        selectedCategoryTabName = buildingMenuTab.buildingMenuUI:stripTabPrefix(selectedCategoryTabName);

        if selectedCategoryItem then
            local selectedCategoryName = buildingMenuTab.buildingMenuUI:stripCategoryPrefix(selectedCategoryItem.text);
            isFavorite = favorites[selectedCategoryTabName] and
                favorites[selectedCategoryTabName][selectedCategoryName] and
                favorites[selectedCategoryTabName][selectedCategoryName]
                [buildingMenuTab.buildingMenuUI:stripSubCategoryPrefix(item.text)] == true;
        end
    end

    if item.index == self.mouseoverselected and not self:isMouseOverScrollBar() and not buildingMenuTab.parent.tilesList:isMouseOver() and self:getMouseX() <= self:getWidth() then
        if self:getMouseX() >= buildingMenuTab:getFavoriteX(self.listType) then
            favoriteStar = isFavorite and buildingMenuTab.favCheckedTex or buildingMenuTab.favNotCheckedTex;
            favoriteAlpha = 0.9;
        else
            favoriteStar = isFavorite and buildingMenuTab.favoriteStar or buildingMenuTab.favNotCheckedTex;
            favoriteAlpha = isFavorite and 0.9 or 0.3;
        end
    elseif isFavorite then
        favoriteStar = buildingMenuTab.favoriteStar;
    end

    if favoriteStar then
        self:drawTexture(favoriteStar, buildingMenuTab:getFavoriteX(self.listType) + buildingMenuTab.favPadX,
            y + (item.height / 2 - favoriteStar:getHeight() / 2), favoriteAlpha, 1, 1, 1);
    end

    return y + self.itemheight;
end

--- Gets the favorite icon X position in the list
---@param listType string
---@return number
function ISBuildingMenuTabUI:getFavoriteX(listType)
    local scrollBarWid = self[listType]:isVScrollBarVisible() and 13 or 0;
    return self[listType]:getWidth() - scrollBarWid - self.favPadX - self.favWidth - self.favPadX;
end

--- Checks if the mouse is over the favorite icon
---@param x number
---@param listType string
---@return boolean
function ISBuildingMenuTabUI:isMouseOverFavorite(x, listType)
    return (x >= self:getFavoriteX(listType)) and not self[listType]:isMouseOverScrollBar();
end

--- Handles the mouse down event on the list
---@param x number
---@param y number
function ISBuildingMenuTabUI:onMouseDown_List(x, y)
    local row = self:rowAt(x, y);
    if row == -1 then return; end
    if self.parent:isMouseOverFavorite(x, self.listType) then
        self.parent:addToFavorite(false, self.listType);
    elseif not self:isMouseOverScrollBar() then
        self.selected = row;
    end
end

function ISBuildingMenuTabUI:update()
    if not self.parent:getIsVisible() then return; end

    self.categoriesList:setWidth(self.width / 4);

    self.subCategoriesList:setWidth(self.width / 4);
    self.subCategoriesList:setX(self.categoriesList:getRight());
end

--- Add or remove an item from favorites
---@param fromKeyboard boolean
---@param listType string
function ISBuildingMenuTabUI:addToFavorite(fromKeyboard, listType)
    local list = self[listType];
    if list:size() == 0 then return; end

    local selectedIndex = fromKeyboard and list.selected or list:rowAt(list:getMouseX(), list:getMouseY());
    local selectedItem = list.items[selectedIndex];

    local favorites = self.buildingMenuUI.favorites
    if listType == "categoriesList" then
        self:toggleCategoryFavorite(selectedItem, favorites);
    elseif listType == "subCategoriesList" then
        self:toggleSubCategoryFavorite(selectedItem, favorites);
    end

    self.buildingMenuUI:saveFavorites(favorites);

    if self.buildingMenuUI then
        self.buildingMenuUI:populateFavoritesTab()
        if self.buildingMenuUI:getActiveTab().tab == "IGUI_BuildingMenuTab_Favorite" and listType == "subCategoriesList" then
            self.buildingMenuUI:updateSubCategoriesListForFavorite(self.buildingMenuUI:getActiveTab());
        end
    end
end

--- Toggle favorite status for a category
---@param selectedItem table
---@param favorites table
function ISBuildingMenuTabUI:toggleCategoryFavorite(selectedItem, favorites)
    local selectedCategoryTabName = self.buildingMenuUI:stripTabPrefix(selectedItem.item and selectedItem.item.tabName or
        self.tab);
    local selectedCategoryName = self.buildingMenuUI:stripCategoryPrefix(selectedItem.text);

    favorites[selectedCategoryTabName] = favorites[selectedCategoryTabName] or {};
    favorites[selectedCategoryTabName][selectedCategoryName] = favorites[selectedCategoryTabName][selectedCategoryName] or
        {};

    local categoryFavorites = favorites[selectedCategoryTabName][selectedCategoryName];

    if categoryFavorites.favorite then
        favorites[selectedCategoryTabName][selectedCategoryName] = nil;
    else
        categoryFavorites.favorite = true;
    end
end

--- Toggle favorite status for a subcategory
---@param selectedItem table
---@param favorites table
function ISBuildingMenuTabUI:toggleSubCategoryFavorite(selectedItem, favorites)
    local selectedCategoryItem = self.categoriesList.items[self.categoriesList.selected];
    local selectedCategoryName = self.buildingMenuUI:stripCategoryPrefix(selectedCategoryItem.text);

    local selectedCategoryTabName = self.buildingMenuUI:stripTabPrefix(selectedCategoryItem.item and
        selectedCategoryItem.item.tabName or self.tab);

    local subcategoryName = self.buildingMenuUI:stripSubCategoryPrefix(selectedItem.text);

    favorites[selectedCategoryTabName] = favorites[selectedCategoryTabName] or {};
    favorites[selectedCategoryTabName][selectedCategoryName] = favorites[selectedCategoryTabName][selectedCategoryName] or
        {};

    local subcategories = favorites[selectedCategoryTabName][selectedCategoryName];

    subcategories[subcategoryName] = not subcategories[subcategoryName];

    if subcategories[subcategoryName] then
        favorites[selectedCategoryTabName][selectedCategoryName].favorite = true;
    end
end

--- Constructor for ISBuildingMenuTabUI
---@param x number
---@param y number
---@param width number
---@param height number
---@param buildingMenuUI ISBuildingMenuUI
---@return ISBuildingMenuTabUI
function ISBuildingMenuTabUI:new(x, y, width, height, buildingMenuUI)
    local o = ISPanelJoypad:new(x, y, width, height);
    setmetatable(o, self);
    self.__index       = self;
    o.buildingMenuUI   = buildingMenuUI;
    o.character        = buildingMenuUI.character;
    o.tab              = nil;
    o.categories       = {};
    o.favoriteStar     = getTexture("media/ui/FavoriteStar.png");
    o.favCheckedTex    = getTexture("media/ui/FavoriteStarChecked.png");
    o.favNotCheckedTex = getTexture("media/ui/FavoriteStarUnchecked.png");
    o.favPadX          = 10;
    o.favWidth         = o.favoriteStar and o.favoriteStar:getWidth() or 13;
    o.textCache        = {};
    o:noBackground();
    return o;
end
