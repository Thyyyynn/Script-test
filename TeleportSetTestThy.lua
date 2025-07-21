-- Thurr's Teleport GUI (Dark UI, Smooth Corners)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Screen GUI
local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Teleport System"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = frame

-- Saved position
local savedPosition = nil

-- Get Position Button
local getBtn = Instance.new("TextButton")
getBtn.Size = UDim2.new(0.8, 0, 0, 40)
getBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
getBtn.Text = "Get Position"
getBtn.Font = Enum.Font.Gotham
getBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
getBtn.TextScaled = true
getBtn.Parent = frame
Instance.new("UICorner", getBtn).CornerRadius = UDim.new(0, 8)

getBtn.MouseButton1Click:Connect(function()
	character = player.Character or player.CharacterAdded:Wait()
	humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	savedPosition = humanoidRootPart.Position
	getBtn.Text = "✔ Position Saved!"
	wait(1.5)
	getBtn.Text = "Get Position"
end)

-- Teleport Button
local tpBtn = Instance.new("TextButton")
tpBtn.Size = UDim2.new(0.8, 0, 0, 40)
tpBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
tpBtn.Text = "Teleport to Position"
tpBtn.Font = Enum.Font.Gotham
tpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
tpBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
tpBtn.TextScaled = true
tpBtn.Parent = frame
Instance.new("UICorner", tpBtn).CornerRadius = UDim.new(0, 8)

tpBtn.MouseButton1Click:Connect(function()
	if savedPosition then
		character = player.Character or player.CharacterAdded:Wait()
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
		humanoidRootPart.CFrame = CFrame.new(savedPosition)
		tpBtn.Text = "Teleported!"
		wait(0.8)
		tpBtn.Text = "Teleport to Position"
	else
		tpBtn.Text = "⚠ No Position Saved!"
		wait(1.5)
		tpBtn.Text = "Teleport to Position"
	end
end)

-- Destroy Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.TextScaled = true
closeBtn.Parent = frame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
