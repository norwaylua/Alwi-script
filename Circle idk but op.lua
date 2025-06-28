if game.PlaceId == 8305160617 or game.PlaceId == 8305337434 then
local MessageBoxT = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/refs/heads/main/source.lua"))()

MessageBoxT.Show({
    Text = "Informations 🤓",
    Description = "Hey, this script was made by TENERY Hub.\nWant to join Discord for support?\n\n🕒 Last updated: June 28, 2025 at 11:45 AM",
    MessageBoxButtons = "YesNo",
    MessageBoxIcon = "Question",
    Result = function(answer)
        if answer == "Yes" then
            setclipboard("https://discord.gg/kBbdUqrXZY")
        else
	    game.Players.LocalPlayer:kick("YIPPE") 
	    task.wait(2) 
            game:Shutdown()
        end
    end
})

local glen = game:GetService("Players")
local dopa = game:GetService("RunService")
local vifix = game:GetService("Workspace")

local cuxar = glen.LocalPlayer
local zimko = cuxar.Character or cuxar.CharacterAdded:Wait()
local lirax = zimko:FindFirstChild("HumanoidRootPart") or zimko:FindFirstChild("Torso") or zimko:FindFirstChild("UpperTorso")
local hum = zimko:WaitForChild("Humanoid")


local function guinigga() 
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
end)
warn("Alwi Hub") 
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "SafePlaceCircleGui"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 220, 0, 120)
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -60)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

-- Dragging logic
local dragging = false
local dragInput, dragStart, startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Create buttons inside the frame
local function makeBtn(text, position, cb)
    local b = Instance.new("TextButton", mainFrame)
    b.Size = UDim2.new(0, 100, 0, 100)
    b.Position = position
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextScaled = true
    b.Font = Enum.Font.SourceSansBold
    b.BorderSizePixel = 0
    Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
    b.MouseButton1Click:Connect(cb)
end

makeBtn("Safe Place", UDim2.new(0, 110, 0, 10), function()
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp and Workspace:FindFirstChild("Circle") then
        hrp.CFrame = Workspace.Circle.CFrame
    end
end)

makeBtn("Create Safe", UDim2.new(0, 10, 0, 10), function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:PivotTo(CFrame.new(-0.711, 662.58, -3.298))
    end

    local part = Instance.new("Part")
    part.Size = Vector3.new(100, 0.1, 100)
    part.Anchored = true
    part.Transparency = 0.4
    part.CFrame = CFrame.new(-0.727, 655.813, -3.282)
    part.Name = "Circle"
    part.Parent = Workspace
end)
end
guinigga() 
-- Disable sit
hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
hum.Sit = false

-- No-collide character
dopa.Stepped:Connect(function()
	for _, part in ipairs(zimko:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
		end
	end
end)

-- Disable CanTouch nearby
local zox = vifix:GetPartBoundsInRadius(lirax.Position, 10)
for _, part in ipairs(zox) do
	if part:IsA("BasePart") then
		part.CanTouch = false
	end
end

-- Anchor Part
local farnel = Instance.new("Folder", vifix)
local brayo = Instance.new("Part", farnel)
local rezti = Instance.new("Attachment", brayo)
brayo.Anchored = true
brayo.CanCollide = false
brayo.Transparency = 1

-- Velocity Config
getgenv().BloxMeta = {
	BaseParts = {},
	Velocity = Vector3.new(14.4626, 14.4626, 14.4626)
}


-- Force Simulation Radius + Velocity Set
cuxar.ReplicationFocus = vifix
dopa.Heartbeat:Connect(function()
	sethiddenproperty(cuxar, "SimulationRadius", math.huge)
	for _, zom in pairs(BloxMeta.BaseParts) do
		if zom:IsDescendantOf(vifix) then
			zom.Velocity = BloxMeta.Velocity
		end
	end
end)

-- Detect & Filter Parts
local klist = {}

local function dorkel(brix)
	if brix:IsA("BasePart") and not brix.Anchored and brix:IsDescendantOf(vifix) then
		if brix:IsDescendantOf(cuxar.Character) then return false end
		brix.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
		brix.CanCollide = false
		return true
	end
	return false
end

local function mipro(rin)
	if dorkel(rin) and not table.find(klist, rin) then
		table.insert(klist, rin)
	end
end

local function flak(rin)
	local qid = table.find(klist, rin)
	if qid then table.remove(klist, qid) end
end

-- Scan Initial
for _, rin in pairs(vifix:GetDescendants()) do
	mipro(rin)
end

vifix.DescendantAdded:Connect(mipro)
vifix.DescendantRemoving:Connect(flak)

-- Orbit Update
local updateIndex = 1

dopa.Heartbeat:Connect(function()
	if not config.enabled then
		if config.autoClearCacheOnDisable then
			table.clear(klist)
		end
		return
	end

	local lirax = cuxar.Character and cuxar.Character:FindFirstChild("HumanoidRootPart")
	if not lirax then return end

	local helix = lirax.Position
	local partsThisFrame = config.maxPartsPerFrame or 100

	for i = updateIndex, math.min(updateIndex + partsThisFrame - 1, #klist) do
		local blox = klist[i]
		if blox and blox.Parent and not blox.Anchored then
			local zop = blox.Position
			local trix = (Vector3.new(zop.X, helix.Y, zop.Z) - helix).Magnitude
			local nurv = math.atan2(zop.Z - helix.Z, zop.X - helix.X)
			local flurn = nurv + math.rad(config.rotationSpeed)

			local gorma = Vector3.new(
				helix.X + math.cos(flurn) * math.min(config.radius, trix),
				helix.Y + (config.height * math.abs(math.sin((zop.Y - helix.Y) / config.height))),
				helix.Z + math.sin(flurn) * math.min(config.radius, trix)
			)

			local blen = (gorma - blox.Position).Unit
			blox.Velocity = blen * config.attractionStrength
		end
	end

	updateIndex = updateIndex + partsThisFrame
	if updateIndex > #klist then
		updateIndex = 1
	end
end)

end
