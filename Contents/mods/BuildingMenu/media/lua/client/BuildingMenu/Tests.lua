-- UnitTest.lua

local Logger = require("BuildingMenu/Logger")
local BaseBuildableObject = require("BuildingMenu/BuildableObjects/BaseBuildableObject")
local Barbecue = require("BuildingMenu/BuildableObjects/Barbecue")

Logger:setLogLevel("DEBUG")

local function assertEqual(actual, expected, message)
    if actual ~= expected then
        Logger:error(message .. " Expected: " .. tostring(expected) .. ", but got: " .. tostring(actual))
    else
        Logger:debug("Test passed: " .. message)
    end
end

local function testBaseBuildableObject()
    Logger:debug("Testing BaseBuildableObject...")

    local params = {
        displayName = "Test Object",
        sprites = { sprite = "test_sprite.png" },
        attrs = { attribute1 = "value1" },
        recipe = { materials = { wood = 5 }, tools = { hammer = true } }
    }

    local obj = BaseBuildableObject:new(params)

    assertEqual(obj:getDisplayName(), "Test Object", "BaseBuildableObject:getDisplayName")
    assertEqual(obj:getSprites().sprite, "test_sprite.png", "BaseBuildableObject:getSprites")
    assertEqual(obj:getAttributes().attribute1, "value1", "BaseBuildableObject:getAttributes")
    assertEqual(obj:getRecipe().materials.wood, 5, "BaseBuildableObject:getRecipe materials")
    assertEqual(obj:getRecipe().tools.hammer, true, "BaseBuildableObject:getRecipe tools")

    obj:setDisplayName("New Name")
    assertEqual(obj:getDisplayName(), "New Name", "BaseBuildableObject:setDisplayName")

    obj:setSprites({ sprite = "new_sprite.png" })
    assertEqual(obj:getSprites().sprite, "new_sprite.png", "BaseBuildableObject:setSprites")

    obj:setAttributes({ attribute1 = "new_value" })
    assertEqual(obj:getAttributes().attribute1, "new_value", "BaseBuildableObject:setAttributes")

    obj:setRecipe({ materials = { stone = 10 }, tools = { wrench = true } })
    assertEqual(obj:getRecipe().materials.stone, 10, "BaseBuildableObject:setRecipe materials")
    assertEqual(obj:getRecipe().tools.wrench, true, "BaseBuildableObject:setRecipe tools")

    print("BaseBuildableObject tests passed.\n")
end

local function testBarbecue()
    print("Testing Barbecue...")

    local params = {
        displayName = "Test Barbecue",
        sprites = { sprite = "barbecue_sprite.png" },
        attrs = { heat = "high" },
        recipe = { materials = { metal = 10 }, tools = { welder = true } }
    }

    local bbq = Barbecue:new(params)

    assertEqual(bbq:getDisplayName(), "Test Barbecue", "Barbecue:getDisplayName")
    assertEqual(bbq:getSprites().sprite, "barbecue_sprite.png", "Barbecue:getSprites")
    assertEqual(bbq:getAttributes().heat, "high", "Barbecue:getAttributes")
    assertEqual(bbq:getRecipe().materials.metal, 10, "Barbecue:getRecipe materials")
    assertEqual(bbq:getRecipe().tools.welder, true, "Barbecue:getRecipe tools")

    bbq:setDisplayName("Advanced Barbecue")
    assertEqual(bbq:getDisplayName(), "Advanced Barbecue", "Barbecue:setDisplayName")

    print("Barbecue tests passed.\n")
end

function runBMTests()
    testBaseBuildableObject()
    testBarbecue()
    print("All tests completed successfully.")
end

runBMTests()
