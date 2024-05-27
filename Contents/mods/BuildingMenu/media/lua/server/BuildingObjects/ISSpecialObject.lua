--- @class ISSpecialObject : ISBuildingObject
ISSpecialObject = ISBuildingObject:derive("ISSpecialObject")

--- Creates and places the special object on the game map if it's not already present
--- @param x number x coordinate of the object in the game world
--- @param y number y coordinate of the object in the game world
--- @param z number Z-level in the game world
--- @param north boolean Orientation of the object, true if facing north
--- @param sprite string Sprite identifier for the object to be created
function ISSpecialObject:create(x, y, z, north, sprite)
    local square = getCell():getGridSquare(x, y, z);
    local objs = square:getObjects();

    local tileAlreadyOnSquare = false;
    for i=0, objs:size() - 1 do
        if objs:get(i):getSprite() ~= nil and objs:get(i):getSprite():getName() == sprite then
            tileAlreadyOnSquare = true;
        end
    end
    if not tileAlreadyOnSquare then
        local props = ISMoveableSpriteProps.new(IsoObject.new(square, sprite):getSprite())
        props.rawWeight = 10;
        props:placeMoveableInternal(square, InventoryItemFactory.CreateItem("Base.Plank"), sprite);
    end

    buildUtil.consumeMaterial(self);
end

--- Render function for ISSpecialObject, typically called each frame to render the object
--- @param x number x coordinate where the object will be rendered
--- @param y number y coordinate where the object will be rendered
--- @param z number z coordinate where the object will be rendered
--- @param square IsoGridSquare Grid square where the object is located
function ISSpecialObject:render(x, y, z, square)
    ISBuildingObject.render(self, x, y, z, square);
end

--- Constructor for creating a new instance of ISSpecialObject
--- @param sprite string The default sprite for the object
--- @param northSprite string The sprite to use when the object is facing north
--- @param character IsoGameCharacter The character associated with this object
--- @return ISSpecialObject ISBuildingObject instance
function ISSpecialObject:new(sprite, northSprite, character)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o:init();
    o:setSprite(sprite);
    o:setNorthSprite(northSprite);
    o.character = character;
    o.player = character:getPlayerNum();
	o.dismantable = true;
    o.canBeAlwaysPlaced = false;
	o.maxTime = 150;
    return o
end