-- // Settings
--_G.BringEnabled = true   -- Toggle NPC bring
--_G.NoclipEnabled = true  -- Toggle noclip
--_G.MakeSafeBase = true   -- Toggle safe platform

-- // Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

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
