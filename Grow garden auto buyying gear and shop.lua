-- Anti-AFK
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

-- Auto Reconnect + Auto Buy Egg GUI
local function pro()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/No-Lag%20Hub%20V1%20Grow%20A%20garden.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Auto%20Reconnect.lua"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Auto%20buy%20egg%20GUI.lua"))()
end
pro()

-- Stock Auto Buyer
local gameEvents = game:GetService("ReplicatedStorage"):WaitForChild("GameEvents")

local gearList = {
    "Basic Sprinkler", "Advanced Sprinkler", "Master Sprinkler",
    "Lightning Rod", "Godly Sprinkler", "Friendship Pot",
    "Tanning Mirror", "Watering Can"
}

local itemList = {
    "Pepper", "Cacao", "Beanstalk", "Mushroom",
    "Grape", "Bamboo", "Ember Lily", "Sugar Apple",
    "Feijoa", "Loquat", "Prickly Pear", "Bell Pepper",
    "Kiwi", "Pineapple", "Banana", "Avocado",
    "Green Apple", "Cauliflower", "Tomato"
}

local nightItemList = {
    "Moon Mango", "Celestiberry", "Moon Cat",
    "Night Seed Pack", "Night Egg"
}

local eventShopItemList = {
    "Blood Owl", "Blood Banana", "Night Egg", "Moon Melon"
}

getgenv().autoBuy = true

spawn(function()
    while getgenv().autoBuy do
        for _, name in ipairs(gearList) do
            pcall(function()
                gameEvents.BuyGearStock:FireServer(name)
            end)
            task.wait()
        end

        for _, name in ipairs(itemList) do
            pcall(function()
                gameEvents.BuySeedStock:FireServer(name)
            end)
            task.wait()
        end

        for _, name in ipairs(nightItemList) do
            pcall(function()
                gameEvents.BuyNightEventShopStock:FireServer(name)
            end)
            task.wait()
        end

        for _, name in ipairs(eventShopItemList) do
            pcall(function()
                gameEvents.BuyEventShopStock:FireServer(name)
            end)
            task.wait()
        end

        task.wait()
    end
end)
