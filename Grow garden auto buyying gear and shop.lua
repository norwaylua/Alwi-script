
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Auto%20Reconnect.lua"))()
local rpst = game:GetService("ReplicatedStorage")
local gameEvents = rpst:WaitForChild("GameEvents")

local gearList = {
    "Basic Sprinkler",
    "Advanced Sprinkler",
    "Master Sprinkler",
    "Lightning Rod",
    "Godly Sprinkler",
    "Friendship Pot"
}

local itemList = {
    "Pepper",
    "Cacao",
    "Beanstalk",
    "Mushroom",
    "Grape",
    "Bamboo",
    "Ember Lily",
    "Sugar Apple" 
}

local nightItemList = {
    "Moon Mango",
    "Celestiberry",
    "Moon Cat",
    "Night Seed Pack",
    "Night Egg"
}

local eventShopItemList = {
    "Blood Owl",
    "Blood Banana",
    "Night Egg",
    "Moon Melon"
}

getgenv().autoBuy = true

spawn(function()
    while getgenv().autoBuy do
        for _, gear in ipairs(gearList) do
            pcall(function()
                gameEvents:WaitForChild("BuyGearStock"):FireServer(gear)
            end)
            wait() 
        end

        for _, item in ipairs(itemList) do
            pcall(function()
                gameEvents:WaitForChild("BuySeedStock"):FireServer(item)
            end)
            wait() 
        end

        for _, nightItem in ipairs(nightItemList) do
            pcall(function()
                gameEvents:WaitForChild("BuyNightEventShopStock"):FireServer(nightItem)
            end)
            wait() 
        end

        for _, eventItem in ipairs(eventShopItemList) do
            pcall(function()
                gameEvents:WaitForChild("BuyEventShopStock"):FireServer(eventItem)
            end)
            wait() 
        end

        wait()
    end
end)
