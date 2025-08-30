-- // Settings
--_G.BringEnabled = true   -- Toggle NPC bring
--_G.NoclipEnabled = true  -- Toggle noclip
--_G.MakeSafeBase = true   -- Toggle safe platform
--getgenv().firetools = true
--_G.Auto_Spins_AutoclaimGitf = true -- fixed laters due error
-- // Services
loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Skip%20timer.lua", true))()
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
-- main script 
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Player = Players.LocalPlayer

local LocalPlayer = Players.LocalPlayer
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-------------------------------------------------
-- Bring NPCs
-------------------------------------------------
RunService.RenderStepped:Connect(function()
    if _G.BringEnabled and hrp then
        for _, npc in ipairs(workspace.Enemys:GetChildren()) do
            local npcHRP = npc:FindFirstChild("HumanoidRootPart")
            if npcHRP then
                pcall(function()
                    npcHRP.CFrame = hrp.CFrame * CFrame.new(0, 0, -4) -- always in front
                end)
            end
        end
    end
end)

-------------------------------------------------
-- Noclip
-------------------------------------------------
RunService.Stepped:Connect(function()
    if _G.NoclipEnabled and LocalPlayer.Character then
        for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)
------
-- Anti afk
-------
local vu = game:GetService("VirtualUser")

game.Players.LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)

----
-- Niggerw auto swing
----
task.spawn(function()
    while task.wait() do
        if not getgenv().firetools then break end

        local char = Player.Character or Player.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then continue end

        local tool = Player.Backpack:FindFirstChildWhichIsA("Tool")
        
        -- Equip tool if not already equipped
        if tool and not char:FindFirstChildWhichIsA("Tool") then
            hum:EquipTool(tool)
        end

        -- Activate the tool if equipped
        local equippedTool = char:FindFirstChildWhichIsA("Tool")
        if equippedTool then
            equippedTool:Activate()
        end
    end
end)

------
-- auto spins and auto claim Gitfs -- kinda broken
------

task.spawn(function()
    while task.wait() do
        if not getgenv().Auto_Spins_AutoclaimGitf then
            break
        end

        local spinSignal = game:GetService("ReplicatedStorage"):WaitForChild("Signals"):WaitForChild("Spin")
        pcall(function()
            spinSignal:InvokeServer()
        end)

        for gift = 1, 12 do
            local args = {
                "Gift" .. gift
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Signals"):WaitForChild("ClaimGift"):FireServer(unpack(args))
            task.wait(0.2)
        end
    end
end)


-------------------------------------------------
-- Safe Platform
-------------------------------------------------
if _G.MakeSafeBase then
    local circle = Workspace:FindFirstChild("Circle")
    if not circle then
        circle = Instance.new("Part")
        circle.Size = Vector3.new(100, 0.1, 100)
        circle.Anchored = true
        circle.Transparency = 0.4
        circle.CFrame = CFrame.new(-0.727, 655.813, -3.282)
        circle.Name = "Circle"
        circle.Parent = Workspace
    end

    -- Teleport player onto the circle part
    if hrp then
        hrp.CFrame = circle.CFrame + Vector3.new(0, 5, 0) -- put player above platform
    end

    -- Optional pivot reposition
    if char then
        char:PivotTo(CFrame.new(-0.711, 662.58, -3.298))
    end
end
