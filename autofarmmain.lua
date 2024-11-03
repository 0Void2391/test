repeat task.wait() until game:IsLoaded()
local ts = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(5)
local RunService = game:GetService("RunService")
local t = ts:Create(game:GetService("Players").LocalPlayer.Character.PrimaryPart, tweeninfo,{CFrame =  workspace.DungeonRooms["2"].MobSpawns["Pumpkin King"].Spawns.Spawn.CFrame})
t:Play()
task.wait(5)
workspace.Mobs:WaitForChild("Pumpkin King")
local function NoclipLoop()
		for _, child in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
			end
		end
	end
Noclipping = RunService.Stepped:Connect(NoclipLoop)
workspace.Gravity = 0
task.spawn(function()
while workspace.Mobs:FindFirstChild("Pumpkin King") do
task.wait()
if workspace.Mobs["Pumpkin King"] == nil then break end
local plr = game:GetService("Players").LocalPlayer
local tweeninfo = TweenInfo.new(
    (workspace.Mobs["Pumpkin King"].HumanoidRootPart.Position-plr.Character:WaitForChild("HumanoidRootPart").Position).magnitude/100,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.In,
    0,
    false,
    0
)
local tween = ts:Create(plr.Character.HumanoidRootPart, tweeninfo, {CFrame = workspace.Mobs["Pumpkin King"].HumanoidRootPart.CFrame*CFrame.new(0,-60,0)})
tween:Play()
end
end)
while task.wait(0.3) do
if not workspace.Mobs:FindFirstChild("Pumpkin King") then break end
local plr = game:GetService("Players").LocalPlayer
local distance = (workspace.Mobs["Pumpkin King"].HumanoidRootPart.Position-plr.Character:WaitForChild("HumanoidRootPart").Position).magnitude
if distance < 100 then
local args = {
    {
        workspace.Mobs["Pumpkin King"]
    }
}
game:GetService("ReplicatedStorage").Systems.Combat.PlayerAttack:FireServer(unpack(args))
local args = {
    "BladeSlam"
}
game:GetService("ReplicatedStorage").Systems.Skills.UseSkill:FireServer(unpack(args))
end
end
repeat task.wait(0.2) until #game:GetService("ReplicatedStorage").Drops:GetChildren()~=0
for i,v in pairs(game:GetService("ReplicatedStorage").Drops:GetChildren()) do
local args = {
    v --[[Instance.new("Folder")]]
}
game:GetService("ReplicatedStorage").Systems.Drops.Pickup:FireServer(unpack(args))
end
task.wait(2)--just to make sure everything is collected
warn("finished boss")
queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/0Void2391/test/refs/heads/main/lobby.lua'))()")
game:GetService("ReplicatedStorage").Systems.DungeonRaids.ExitDungeon:FireServer()--teleport on finish
