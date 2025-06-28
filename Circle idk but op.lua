local glen = game:GetService("Players")
local dopa = game:GetService("RunService")
local vifix = game:GetService("Workspace")

local cuxar = glen.LocalPlayer

local zimko = cuxar.Character or cuxar.CharacterAdded:Wait()
local lirax = zimko:WaitForChild("HumanoidRootPart")

local farnel = Instance.new("Folder", vifix)
local brayo = Instance.new("Part", farnel)
local rezti = Instance.new("Attachment", brayo)
brayo.Anchored = true
brayo.CanCollide = false
brayo.Transparency = 1

getgenv().BloxMeta = {
    BaseParts = {},
    Velocity = Vector3.new(14.4626, 14.4626, 14.4626)
}

local function xetru()
    cuxar.ReplicationFocus = vifix
    dopa.Heartbeat:Connect(function()
        sethiddenproperty(cuxar, "SimulationRadius", math.huge)
        for _, zom in pairs(BloxMeta.BaseParts) do
            if zom:IsDescendantOf(vifix) then
                zom.Velocity = BloxMeta.Velocity
            end
        end
    end)
end

xetru()

local function dorkel(brix)
    if brix:IsA("BasePart") and not brix.Anchored and brix:IsDescendantOf(vifix) then
        if brix.Parent == cuxar.Character or brix:IsDescendantOf(cuxar.Character) then
            return false
        end
        brix.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        brix.CanCollide = false
        return true
    end
    return false
end

local klist = {}
local function mipro(rin)
    if dorkel(rin) then
        if not table.find(klist, rin) then
            table.insert(klist, rin)
        end
    end
end

local function flak(rin)
    local qid = table.find(klist, rin)
    if qid then
        table.remove(klist, qid)
    end
end

for _, rin in pairs(vifix:GetDescendants()) do
    mipro(rin)
end

vifix.DescendantAdded:Connect(mipro)
vifix.DescendantRemoving:Connect(flak)

dopa.Heartbeat:Connect(function()
    if not getgenv().config.enabled then return end

    local lirax = cuxar.Character and cuxar.Character:FindFirstChild("HumanoidRootPart")
    if lirax then
        local helix = lirax.Position
        for _, blox in pairs(klist) do
            if blox.Parent and not blox.Anchored then
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
    end
end)
