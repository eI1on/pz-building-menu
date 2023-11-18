require "ISUI/ISPanel"

local getTexture = getTexture

ISBuildingMenuTabUI = ISPanelJoypad:derive("ISBuildingMenuTabUI");
ISBuildingMenuTabUI.instance = nil;
ISBuildingMenuTabUI.largeFontHeight = getTextManager():getFontHeight(UIFont.Large)
ISBuildingMenuTabUI.mediumNewFontHeight = getTextManager():getFontHeight(UIFont.MediumNew)
ISBuildingMenuTabUI.smallFontHeight = getTextManager():getFontHeight(UIFont.Small)


function ISBuildingMenuTabUI:initialise()
    ISPanelJoypad.initialise(self);
    self:create();
end


function ISBuildingMenuTabUI:create()

    self.categoriesList = ISScrollingListBox:new(0, 0, self.width/4, self.height);
    self.categoriesList.anchorBottom = true;
    self.categoriesList:initialise();
    self.categoriesList:instantiate();
    self.categoriesList:setAnchorRight(false);
    self.categoriesList:setAnchorBottom(true);
    self.categoriesList.itemPadY = 10;
    self.categoriesList.backgroundColor.a = 0.25;
    self.categoriesList.itemheight = ISBuildingMenuTabUI.mediumNewFontHeight + 20;
    self.categoriesList.selected = 1;
    self.categoriesList.font = UIFont.MediumNew;
    self.categoriesList.doDrawItem = self.doDrawSubCategoriesListItem;
    self.categoriesList.drawBorder = true;
    self:addChild(self.categoriesList);

    self.subCategoriesList = ISScrollingListBox:new(self.categoriesList:getRight(), 0, self.width/4, self.height);
    self.subCategoriesList.anchorBottom = true;
    self.subCategoriesList:initialise();
    self.subCategoriesList:instantiate();
    self.subCategoriesList:setAnchorRight(false);
    self.subCategoriesList:setAnchorBottom(true);
    self.subCategoriesList.itemPadY = 10;
    self.subCategoriesList.backgroundColor.a = 0.25;
    self.subCategoriesList.itemheight = ISBuildingMenuTabUI.mediumNewFontHeight + 15;
    self.subCategoriesList.selected = 1;
    self.subCategoriesList.font = UIFont.NewSmall;
    self.subCategoriesList.doDrawItem = self.doDrawSubCategoriesListItem;
    self.subCategoriesList.drawBorder = true;
    self:addChild(self.subCategoriesList);

end


function ISBuildingMenuTabUI:doDrawSubCategoriesListItem(y, item, alt)
    self:drawRectBorder(0, (y), self:getWidth(), self.itemheight - 1, 0.9, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    if self.selected == item.index then
        self:drawRect(0, (y), self:getWidth(), self.itemheight - 1, 0.3, 0.7, 0.35, 0.15);
    end
    local texture = getTexture(item.item.icon);
    if texture then
        self:drawTextureScaledAspect(texture, 1, y, 25, self.itemheight, 1, 1, 1, 1);
    end

    self:drawText(item.text, 25, y + (self.itemheight - ISBuildingMenuTabUI.mediumNewFontHeight) / 2, 1, 1, 1, 0.9, self.font);
    return y + self.itemheight;
end


function ISBuildingMenuTabUI:update()
    if not self.parent:getIsVisible() then return; end

    self.categoriesList:setWidth(self.width/4);

    self.subCategoriesList:setWidth(self.width/4);
    self.subCategoriesList:setX(self.categoriesList:getRight())

end


function ISBuildingMenuTabUI:new(x, y, width, height, buildingMenuUI)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.buildingMenuUI = buildingMenuUI
    o.character = buildingMenuUI.character
    o.tab = nil
    o.categories = {}
    o:noBackground()
    return o
end