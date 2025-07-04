getgenv().h = true
while h and task.wait() do
local args = {}

game:GetService("ReplicatedStorage"):WaitForChild("SpinWheelFunc", 9e9):InvokeServer(unpack(args))
local args = {}

game:GetService("ReplicatedStorage"):WaitForChild("FinishedSpinWheelFunc", 9e9):InvokeServer(unpack(args))
end
