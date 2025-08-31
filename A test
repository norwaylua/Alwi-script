--[[
getgenv().AutoFarmV2 = true
getgenv().FireTools = true
getgenv().KillAura = true
getgenv().Range = 1000000 -- dont edit this code frfr
getgenv().AutoSpinGift = false -- most anyoning 
]]--

if game.PlaceId == 79704652105017 then
    local StarterGui = game:GetService("StarterGui")
    local function notify(props)
        pcall(function()
            StarterGui:SetCore("SendNotification", props)
        end)
    end

    task.spawn(function()
        notify({Title = "Tenery hub", Text = "Initializing…", Duration = 2})
        for p = 0, 100, 10 do
            notify({
                Title = "Tenery hub",
                Text  = ("Loading… %d%%"):format(p),
                Duration = 0.3
            })
            task.wait(0.15)
        end
    end)
    
loadstring(game:HttpGet("https://raw.githubusercontent.com/norwaylua/Alwi-script/refs/heads/main/Auto%20Reconnect.lua"))()
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
desc.Text = "This UI made By cici"
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
hint.Text = "This script open source | A tips put auto exc!"
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
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

task.spawn(function()
    while task.wait() do
        if not getgenv().AutoFarmV2 then break end

        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChild("Humanoid")

        if not character then
            repeat
                task.wait()
                character = LocalPlayer.Character
            until character or not getgenv().AutoFarmV2
        end

        if not humanoid then
            repeat
                task.wait()
                humanoid = character and character:FindFirstChild("Humanoid")
            until humanoid or not getgenv().AutoFarmV2
        end

        if humanoid and humanoid.Health <= 0 then
            repeat
                task.wait()
                character = LocalPlayer.Character
                humanoid = character and character:FindFirstChild("Humanoid")
            until (humanoid and humanoid.Health > 0) or not getgenv().AutoFarmV2
        end

        if not getgenv().AutoFarmV2 then break end

        if character and character:FindFirstChild("HumanoidRootPart") then
            local closestEnemy = nil
            local shortestDistance = math.huge

            for _, v in pairs(workspace.Enemys:GetChildren()) do
                if v:IsA("Model") then
                    local hum = v:FindFirstChild("Humanoid")
                    local hrp = v:FindFirstChild("HumanoidRootPart")
                    if hum and hrp and hum.Health > 0 then
                        local distance = (character.HumanoidRootPart.Position - hrp.Position).Magnitude
                        if distance < shortestDistance then
                            closestEnemy = v
                            shortestDistance = distance
                        end
                    end
                end
            end

            if closestEnemy then
                local enemyHRP = closestEnemy:FindFirstChild("HumanoidRootPart")
                if enemyHRP then
                    pcall(function()
                        character.HumanoidRootPart.CFrame = enemyHRP.CFrame + Vector3.new(0, -6.1, 0)
                        local bv = Instance.new("BodyVelocity")
                        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                        bv.Velocity = Vector3.new(0, 0, 0)
                        bv.Parent = character.HumanoidRootPart
                        task.wait()
                        bv:Destroy()
                    end)
                end
            else
                pcall(function()
                    character.HumanoidRootPart.CFrame = CFrame.new(-17.3815, 4.6, 95.7877)
                    local bv = Instance.new("BodyVelocity")
                    bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    bv.Velocity = Vector3.new(0, 0, 0)
                    bv.Parent = character.HumanoidRootPart
                    task.wait()
                    bv:Destroy()
                end)
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not getgenv().FireTools then break end

        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")

        if hum then
            local tool = LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
            if tool and not char:FindFirstChildWhichIsA("Tool") then
                hum:EquipTool(tool)
            end

            local equipped = char:FindFirstChildWhichIsA("Tool")
            if equipped then
                equipped:Activate()
            end
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if not getgenv().KillAura then return end
    local char = LocalPlayer.Character
    if not char then return end

    local tool = char:FindFirstChildOfClass("Tool")
    if not tool or not tool:FindFirstChild("Handle") then return end

    for _, v in pairs(workspace.Enemys:GetChildren()) do
        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer:DistanceFromCharacter(v.HumanoidRootPart.Position) <= getgenv().Range then
                tool:Activate()
                for _, part in ipairs(v:GetChildren()) do
                    if part:IsA("BasePart") then
                        firetouchinterest(tool.Handle, part, 0)
                        firetouchinterest(tool.Handle, part, 1)
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(2) do
        if not getgenv().AutoSpinGift then break end
        pcall(function()
            local spinSignal = game:GetService("ReplicatedStorage"):WaitForChild("Signals"):WaitForChild("Spin")
            spinSignal:InvokeServer()
        end)
        for gift = 1, 12 do
            pcall(function()
                local args = { "Gift" .. gift }
                game:GetService("ReplicatedStorage"):WaitForChild("Signals"):WaitForChild("ClaimGift"):FireServer(unpack(args))
            end)
            task.wait(0.2)
        end
    end
end)

local vu = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
    task.delay(2, function()
        notify({Title = "Tenery hub", Text = "Loaded successfully!", Duration = 4})
    end)
end
