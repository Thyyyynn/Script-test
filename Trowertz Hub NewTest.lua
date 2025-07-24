local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local pos2 = nil -- This will be set using the button

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "TowerTrollerGui"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 280, 0, 160)
frame.Position = UDim2.new(0.5, -140, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Tower Troller"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Troll Button
local trollBtn = Instance.new("TextButton", frame)
trollBtn.Size = UDim2.new(0.8, 0, 0, 40)
trollBtn.Position = UDim2.new(0.1, 0, 0, 40)
trollBtn.Text = "Troll"
trollBtn.Font = Enum.Font.GothamBold
trollBtn.TextColor3 = Color3.new(1, 1, 1)
trollBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
trollBtn.TextScaled = true
Instance.new("UICorner", trollBtn).CornerRadius = UDim.new(0, 8)

-- Set Pos 2 Button
local setBtn = Instance.new("TextButton", frame)
setBtn.Size = UDim2.new(0.8, 0, 0, 40)
setBtn.Position = UDim2.new(0.1, 0, 0, 90)
setBtn.Text = "Set Pos 2"
setBtn.Font = Enum.Font.Gotham
setBtn.TextColor3 = Color3.new(1, 1, 1)
setBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
setBtn.TextScaled = true
Instance.new("UICorner", setBtn).CornerRadius = UDim.new(0, 8)

-- Button Logic
trollBtn.MouseButton1Click:Connect(function()
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not pos2 then
		trollBtn.Text = "Set Pos 2 First!"
		task.wait(1)
		trollBtn.Text = "Troll"
		return
	end

	if hrp then
		local currentCFrame = hrp.CFrame
		hrp.CFrame = pos2
		task.wait(0.001)
		hrp.CFrame = currentCFrame
	end
end)

setBtn.MouseButton1Click:Connect(function()
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		pos2 = hrp.CFrame
		setBtn.Text = "Saved!"
		task.wait(1)
		setBtn.Text = "Set Pos 2"
	end
end)
