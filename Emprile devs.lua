local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local UIS = game:GetService("UserInputService")

local partsFolder = workspace:WaitForChild("BuildAVehicleParts")

-- GUI setup
local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
gui.Name = "PartTeleporter"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 230, 0, 40)
main.Position = UDim2.new(0, 100, 0, 200)
main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Header Label
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "▼ Teleport To Part made by Tenery hub"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16

-- Dropdown Holder
local dropdown = Instance.new("Frame", main)
dropdown.Position = UDim2.new(0, 0, 0, 40)
dropdown.Size = UDim2.new(1, 0, 0, 150)
dropdown.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
dropdown.Visible = false
dropdown.ClipsDescendants = true

local scroll = Instance.new("ScrollingFrame", dropdown)
scroll.Size = UDim2.new(1, 0, 1, 0)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 4
scroll.BackgroundTransparency = 1

-- Create UIListLayout after scroll is created
local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = scroll

-- Toggle dropdown
local open = false
title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		open = not open
		dropdown.Visible = open
		main:TweenSize(
			UDim2.new(0, 230, 0, open and 190 or 40),
			Enum.EasingDirection.Out,
			Enum.EasingStyle.Quad,
			0.25,
			true
		)
	end
end)

-- Calculate center position of all BaseParts inside folder/model
local function getFolderCenter(folder)
	local total = Vector3.new()
	local count = 0
	for _, obj in ipairs(folder:GetDescendants()) do
		if obj:IsA("BasePart") then
			total += obj.Position
			count += 1
		end
	end
	if count > 0 then
		return total / count
	end
	return nil
end

-- Tween teleport function for single part
local function tweenToPart(part)
	if not part:IsA("BasePart") then return end

	local goal = { CFrame = part.CFrame + Vector3.new(0, 5, 0) }
	local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(HumanoidRootPart, tweenInfo, goal)
	tween:Play()
end

-- Tween teleport function for folder/model center
local function tweenToFolder(folder)
	local target = getFolderCenter(folder)
	if not target then return end

	local goal = { CFrame = CFrame.new(target + Vector3.new(0, 5, 0)) }
	local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(HumanoidRootPart, tweenInfo, goal)
	tween:Play()
end

-- Clear previous buttons and recreate UIListLayout to avoid nil error
scroll:ClearAllChildren()

listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 4)
listLayout.Parent = scroll

-- Create buttons for parts and folders/models
for _, obj in ipairs(partsFolder:GetChildren()) do
	if obj:IsA("BasePart") then
		local btn = Instance.new("TextButton", scroll)
		btn.Size = UDim2.new(1, -10, 0, 28)
		btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 14
		btn.Text = obj.Name
		btn.AutoButtonColor = true

		btn.MouseButton1Click:Connect(function()
			tweenToPart(obj)
			open = false
			dropdown.Visible = false
			main:TweenSize(UDim2.new(0, 230, 0, 40), "Out", "Quad", 0.25, true)
		end)
	elseif obj:IsA("Folder") or obj:IsA("Model") then
		local btn = Instance.new("TextButton", scroll)
		btn.Size = UDim2.new(1, -10, 0, 28)
		btn.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
		btn.TextColor3 = Color3.fromRGB(255, 255, 255)
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 14
		btn.Text = obj.Name
		btn.AutoButtonColor = true

		btn.MouseButton1Click:Connect(function()
			tweenToFolder(obj)
			open = false
			dropdown.Visible = false
			main:TweenSize(UDim2.new(0, 230, 0, 40), "Out", "Quad", 0.25, true)
		end)
	end
end

-- Adjust canvas size after adding buttons
task.wait(0.1)
scroll.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
