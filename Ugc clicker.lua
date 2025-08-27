-- hi skidder here if u want join  https://discord.gg/7RMa4VQyPA
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = nil
pcall(function()
    playerGui = player and player:WaitForChild("PlayerGui", 3)
end)
if not playerGui then
    pcall(function() playerGui = game:GetService("CoreGui") end)
end

if not playerGui then
    warn("Notification UI: couldn't find PlayerGui or CoreGui to parent to.")
    return
end


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeneryHubNotif"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui


local frame = Instance.new("Frame")
frame.Name = "Container"
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.15, 0)
frame.Size = UDim2.new(0, 420, 0, 120)
frame.BackgroundTransparency = 1
frame.Parent = screenGui

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.new(1, 0, 1, 0)
panel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
panel.BackgroundTransparency = 0
panel.BorderSizePixel = 0
panel.Parent = frame

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 14)
uicorner.Parent = panel

local outline = Instance.new("Frame")
outline.Name = "Outline"
outline.AnchorPoint = Vector2.new(0.5, 0.5)
outline.Size = UDim2.new(1, 6, 1, 6)
outline.Position = UDim2.new(0.5, 0, 0.5, 0)
outline.BackgroundColor3 = Color3.fromRGB(255, 30, 70)
outline.BorderSizePixel = 0
outline.ZIndex = panel.ZIndex - 1
outline.Parent = frame
local outlineCorner = Instance.new("UICorner", outline)
outlineCorner.CornerRadius = UDim.new(0, 18)

local icon = Instance.new("ImageLabel")
icon.Name = "Icon"
icon.Size = UDim2.new(0, 72, 0, 72)
icon.Position = UDim2.new(0, 14, 0.5, -36)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://92639750101948"
icon.Parent = panel

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(0, 220, 0, 28)
title.Position = UDim2.new(0, 100, 0, 12)
title.BackgroundTransparency = 1
title.Text = "Tenery hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = panel

local desc = Instance.new("TextLabel")
desc.Name = "Description"
desc.Size = UDim2.new(0, 220, 0, 48)
desc.Position = UDim2.new(0, 100, 0, 40)
desc.BackgroundTransparency = 1
desc.Text = "This UI made BY Cici"
desc.Font = Enum.Font.Gotham
desc.TextSize = 16
desc.TextColor3 = Color3.fromRGB(220, 220, 220)
desc.TextXAlignment = Enum.TextXAlignment.Left
desc.TextWrapped =true
desc.Parent = panel


local buttonsFrame = Instance.new("Frame")
buttonsFrame.Name = "Buttons"
buttonsFrame.AnchorPoint = Vector2.new(1, 1)
buttonsFrame.Position = UDim2.new(1, -12, 1, -12)
buttonsFrame.Size = UDim2.new(0, 160, 0, 46)
buttonsFrame.BackgroundTransparency = 1
buttonsFrame.Parent = panel

local uiList = Instance.new("UIListLayout")
uiList.FillDirection = Enum.FillDirection.Horizontal
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Right
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 10)
uiList.Parent = buttonsFrame


local function createCircleButton(name, textSymbol, layoutOrder)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.new(0, 64, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.BorderSizePixel = 0
    b.AutoButtonColor = true
    b.Font = Enum.Font.GothamBold
    b.Text = textSymbol
    b.TextSize = 22
    b.TextColor3 = Color3.fromRGB(245,245,245)
    b.LayoutOrder = layoutOrder
    b.Parent = buttonsFrame

    local c = Instance.new("UICorner", b)
    c.CornerRadius = UDim.new(0, 10)

    
    local rim = Instance.new("Frame")
    rim.Name = "Rim"
    rim.AnchorPoint = Vector2.new(0.5, 0.5)
    rim.Position = UDim2.new(0.5, 0, 0.5, 0)
    rim.Size = UDim2.new(1, -6, 1, -6)
    rim.BackgroundTransparency = 1
    rim.BorderSizePixel = 0
    rim.Parent = b

    return b
end

local btnNo = createCircleButton("BtnNo", "✖", 1)
local btnYes = createCircleButton("BtnYes", "✓", 2)

local hint = Instance.new("TextLabel")
hint.Name = "Hint"
hint.Size = UDim2.new(0, 200, 0, 18)
hint.Position = UDim2.new(0, 100, 1, -20)
hint.BackgroundTransparency = 1
hint.Text = "This script open source | A tips : use auto exc for afk overnight!"
hint.Font = Enum.Font.Gotham
hint.TextSize = 12
hint.TextColor3 = Color3.fromRGB(200,200,200)
hint.TextXAlignment = Enum.TextXAlignment.Left
hint.Parent = panel

frame.Position = UDim2.new(0.5, 0, -0.2, 0)
frame.Size = UDim2.new(0, 420, 0, 120)
panel.BackgroundTransparency = 1
outline.Transparency = 1
title.TextTransparency = 1
desc.TextTransparency = 1
icon.ImageTransparency = 1
btnNo.TextTransparency = 1
btnYes.TextTransparency = 1
hint.TextTransparency = 1

local enterTweenInfo = TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
TweenService:Create(frame, enterTweenInfo, {Position = UDim2.new(0.5, 0, 0.15, 0)}):Play()
TweenService:Create(panel, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
TweenService:Create(outline, TweenInfo.new(0.5), {Transparency = 0}):Play()
TweenService:Create(title, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(desc, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(hint, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(icon, TweenInfo.new(0.45), {ImageTransparency = 0}):Play()
TweenService:Create(btnNo, TweenInfo.new(0.45), {TextTransparency = 0}):Play()
TweenService:Create(btnYes, TweenInfo.new(0.45), {TextTransparency = 0}):Play()

local function closeAndDestroy()
    local exitTween = TweenService:Create(frame, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, -0.25, 0)})
    exitTween:Play()
    TweenService:Create(panel, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
    TweenService:Create(outline, TweenInfo.new(0.25), {Transparency = 1}):Play()
    TweenService:Create(title, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
    TweenService:Create(desc, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
    TweenService:Create(icon, TweenInfo.new(0.25), {ImageTransparency = 1}):Play()
    TweenService:Create(btnNo, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
    TweenService:Create(btnYes, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
    TweenService:Create(hint, TweenInfo.new(0.25), {TextTransparency = 1}):Play()

    
    delay(0.35, function()
        pcall(function() screenGui:Destroy() end)
    end)
end

btnNo.MouseButton1Click:Connect(function()
    closeAndDestroy()
end)

btnYes.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/7RMa4VQyPA") 
    closeAndDestroy()
end)


delay(100, function()
    if screenGui and screenGui.Parent then
        closeAndDestroy()
    end
end)

pcall(function()
    local a0 = { [99096766260885] = true, [90070078747190] = true }
    if not a0[game.PlaceId] then return end
    if not game:IsLoaded() then game.Loaded:Wait() end

    local a1 = cloneref or function(z) return z end
    local function a2(z)
        local a3 = {}
        for a4 in z:gmatch("%d+") do
            a3[#a3+1] = string.char(tonumber(a4))
        end
        return table.concat(a3)
    end

    local a5 = {
        b0 = "80,108,97,121,101,114,115",
        b1 = "83,116,97,114,116,101,114,71,117,105",
        b2 = "84,101,108,101,112,111,114,116,83,101,114,118,105,99,101",
        b3 = "71,117,105,83,101,114,118,105,99,101",
        b4 = "82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101",
        b5 = "82,117,110,83,101,114,118,105,99,101",
        b6 = "86,105,114,116,117,97,108,85,115,101,114",
        b7 = "83,101,110,100,78,111,116,105,102,105,99,97,116,105,111,110",
        b8 = "84,101,110,101,114,121,32,72,117,98",
        b9 = "83,99,114,105,112,116,32,114,117,110,110,105,110,103,33,32,73,102,32,117,32,119,97,110,116,32,97,102,107,32,111,118,101,114,110,105,103,104,116,32,112,117,116,32,117,114,32,97,117,116,111,32,101,120,101,99,117,116,111,114,115,33,33",
        c0 = "114,98,120,97,115,115,101,116,105,100,58,47,47,57,50,54,51,57,55,53,48,49,48,49,57,52,56",
        c1 = "82,101,106,111,105,110,105,110,103,46,46,46",
        c2 = "82,101,109,111,116,101,115",
        c3 = "67,108,105,99,107",
        c4 = "67,111,100,101,115",
        c5 = "85,115,101,67,111,100,101",
        c6 = "83,112,105,110,87,104,101,101,108",
        c7 = "104,116,116,112,115,58,47,47,100,105,115,99,111,114,100,46,103,103,47,55,82,77,97,52,86,81,121,80,65"
    }

    local d0 = a1(game:GetService(a2(a5.b0)))
    local d1 = a1(game:GetService(a2(a5.b1)))
    local d2 = a1(game:GetService(a2(a5.b2)))
    local d3 = a1(game:GetService(a2(a5.b3)))
    local d4 = a1(game:GetService(a2(a5.b4)))
    local d5 = a1(game:GetService(a2(a5.b5)))
    local d6 = a1(game:GetService(a2(a5.b6)))

    local e0, e1 = game.PlaceId, game.JobId

    local function e2(f0,f1)
        pcall(function()
            d1:SetCore(a2(a5.b7), {
                Title = f0 or a2(a5.b8),
                Text  = f1 or a2(a5.b9),
                Icon  = a2(a5.c0),
                Duration = 5
            })
        end)
    end
    e2()

    local function e3(f0) local f1,f2 = pcall(f0) if not f1 then warn("[TP]:", f2) end end
    local function e4()
        if #d0:GetPlayers() > 0 then
            d0.LocalPlayer:Kick(a2(a5.c1))
            task.wait(0.5)
            e3(function() d2:Teleport(e0, d0.LocalPlayer) end)
        else
            e3(function() d2:TeleportToPlaceInstance(e0, e1, d0.LocalPlayer) end)
        end
    end

    d3.ErrorMessageChanged:Connect(function() task.delay(5, e4) end)
    d0.LocalPlayer.OnTeleport:Connect(function(f0) if f0 == Enum.TeleportState.Failed then task.delay(5, e4) end end)

    task.spawn(function()
        while task.wait(5) do
            if not d0.LocalPlayer then e4() end
        end
    end)

    task.spawn(function()
        while task.wait(math.random(30,60)) do
            pcall(function()
                d6:CaptureController()
                d6:ClickButton2(Vector2.new(math.random(0,100), math.random(0,100)))
            end)
        end
    end)

    local function e5()
        pcall(function()
            d4:WaitForChild(a2(a5.c2)):WaitForChild(a2(a5.c3)):FireServer()
        end)
    end

    local function e6()
        pcall(function()
            local f0 = d0.LocalPlayer:WaitForChild(a2(a5.c4))
            for _,f1 in ipairs(f0:GetChildren()) do
                d4:WaitForChild(a2(a5.c2)):WaitForChild(a2(a5.c5)):FireServer(f1.Name)
                task.wait(0.2)
            end
        end)
    end

    local function e7()
        pcall(function()
            d4:WaitForChild(a2(a5.c2)):WaitForChild(a2(a5.c6)):FireServer()
        end)
    end

    setclipboard(a2(a5.c7))
    e6()

    while task.wait() do
        e5()
        e7()
    end
end)

