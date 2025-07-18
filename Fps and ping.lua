local cloneref = cloneref or function(...) return ... end
local g = game
local rs = cloneref(g:GetService("RunService")) 
local kys = cloneref(g:GetService("Stats")) 
local whyugay = cloneref(g:GetService("Players")) 
local imgaynooo = cloneref(g:GetService("TweenService")) 
local iloveu = cloneref(g:GetService("UserInputService")) 
local whyugay = whyugay.LocalPlayer

local function playNotificationSound()
    local soundService = cloneref(game:GetService("SoundService")) 
    local notificationSound = Instance.new("Sound")
    
    notificationSound.SoundId = "rbxassetid://8745692251"
    notificationSound.Volume = 0.5
    notificationSound.Parent = soundService

    notificationSound:Play()
end

local function sendNotification(title, text)
    cloneref(game:GetService('StarterGui')):SetCore('SendNotification', {
        Title = title,
        Text = text,
        Icon = 'http://www.roblox.com/asset/?id=8904334671',
        Duration = 5,
    })
end



local screenGui = whyugay:WaitForChild("PlayerGui"):FindFirstChild("DisplayFrame")

if screenGui then
    sendNotification("Alwi Hub Notice", "You are already running nill this script!")
    playNotificationSound()
    screenGui:Destroy()
end

screenGui = cloneref(Instance.new("ScreenGui")) 
screenGui.Name = "DisplayFrame"
screenGui.Parent = whyugay:WaitForChild("PlayerGui")

local displayFrame = cloneref(Instance.new("Frame")) 
displayFrame.Name = "DisplayFrame"
displayFrame.Size = UDim2.new(0, 200, 0, 100)
displayFrame.Position = UDim2.new(1, -210, 0, 10)
displayFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
displayFrame.BackgroundTransparency = 0.4
displayFrame.BorderSizePixel = 0
displayFrame.Active = true
displayFrame.Parent = screenGui

local uiCorner = cloneref(Instance.new("UICorner")) 
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = displayFrame

local uiStroke = cloneref(Instance.new("UIStroke")) 
uiStroke.Thickness = 2
uiStroke.Parent = displayFrame

local shadowFrame = cloneref(Instance.new("Frame")) 
shadowFrame.Name = "Shadow"
shadowFrame.Size = displayFrame.Size + UDim2.new(0, 20, 0, 20)
shadowFrame.Position = displayFrame.Position + UDim2.new(0, -10, 0, -10)
shadowFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
shadowFrame.BackgroundTransparency = 0.5
shadowFrame.ZIndex = -1
shadowFrame.Parent = screenGui

local shadowCorner = cloneref(Instance.new("UICorner")) 
shadowCorner.CornerRadius = UDim.new(0, 10)
shadowCorner.Parent = shadowFrame

local fpsLabel = cloneref(Instance.new("TextLabel")) 
fpsLabel.Name = "FPSLabel"
fpsLabel.Size = UDim2.new(1, 0, 0, 50)
fpsLabel.Position = UDim2.new(0, 0, 0, 0)
fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextScaled = true
fpsLabel.Text = "FPS: Calculating..."
fpsLabel.Parent = displayFrame

local pingLabel = cloneref(Instance.new("TextLabel")) 
pingLabel.Name = "PingLabel"
pingLabel.Size = UDim2.new(1, 0, 0, 50)
pingLabel.Position = UDim2.new(0, 0, 0, 50)
pingLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
pingLabel.BackgroundTransparency = 1
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.TextScaled = true
pingLabel.Text = "Ping: Calculating..."
pingLabel.Parent = displayFrame

local lastUpdateTime = 0
local frameCount = 0
local fps = 0

rs.RenderStepped:Connect(function(deltaTime)
    frameCount = frameCount + 1
    if os.clock() - lastUpdateTime >= 1 then
        fps = frameCount
        frameCount = 0
        lastUpdateTime = os.clock()
    end
    fpsLabel.Text = "FPS: " .. tostring(fps)

    local networkStats = kys.Network
    local ping = math.floor(networkStats.ServerStatsItem["Data Ping"]:GetValue())
    pingLabel.Text = "Ping: " .. tostring(ping) .. " ms"
end)

local function tweenToPosition(frame, newPosition)
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = imgaynooo:Create(frame, tweenInfo, {Position = newPosition})
    tween:Play()
end

local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local newPosition = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    tweenToPosition(displayFrame, newPosition)
    tweenToPosition(shadowFrame, newPosition + UDim2.new(0, -10, 0, -10))
end

local function startDragging(input)
    dragging = true
    dragStart = input.Position
    startPos = displayFrame.Position

    input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
            dragging = false
        end
    end)
end

displayFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        startDragging(input)
    end
end)

displayFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

iloveu.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local hue = 0
rs.Heartbeat:Connect(function()
    hue = hue + 0.01
    if hue >= 1 then hue = 0 end
    local color = Color3.fromHSV(hue, 1, 1)
    uiStroke.Color = color
end)
