if game.PlaceId == 3457390032 then
game:GetService("StarterGui"):SetCore("DevConsoleVisible",true)
print("Made By Tenery Hub.lua open source") 
setclipboard('https://discord.gg/dpdNYzUX') 
while wait() do
local args = {}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents", 9e9):WaitForChild("Venmo", 9e9):WaitForChild("remoteCollectCard", 9e9):FireServer(unpack(args))
local args = {
    [1] = 76773892471641;
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents", 9e9):WaitForChild("Venmo", 9e9):WaitForChild("remotePurchaseVenmoItem", 9e9):InvokeServer(unpack(args))
end
end
