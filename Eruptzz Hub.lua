local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "Eruptzz Hub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Roundify function
local function roundify(obj, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius or 8)
	corner.Parent = obj
end

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 300)
frame.Position = UDim2.new(0.5, -125, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true
frame.Parent = gui
roundify(frame, 10)

-- Tab Bar
local tabBar = Instance.new("Frame", frame)
tabBar.Size = UDim2.new(1, 0, 0, 30)
tabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
roundify(tabBar, 10)

local teleportTabBtn = Instance.new("TextButton", tabBar)
teleportTabBtn.Text = "Teleport"
teleportTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
teleportTabBtn.Font = Enum.Font.GothamBold
teleportTabBtn.TextScaled = true
teleportTabBtn.TextColor3 = Color3.new(1,1,1)
teleportTabBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
roundify(teleportTabBtn, 8)

local othersTabBtn = Instance.new("TextButton", tabBar)
othersTabBtn.Text = "Others"
othersTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
othersTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
othersTabBtn.Font = Enum.Font.GothamBold
othersTabBtn.TextScaled = true
othersTabBtn.TextColor3 = Color3.new(1,1,1)
othersTabBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
roundify(othersTabBtn, 8)

-- Content Area
local contentFrame = Instance.new("Frame", frame)
contentFrame.Size = UDim2.new(1, 0, 1, -30)
contentFrame.Position = UDim2.new(0, 0, 0, 30)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Teleport Frame
local teleportFrame = Instance.new("Frame", contentFrame)
teleportFrame.Size = UDim2.new(1, 0, 1, 0)
teleportFrame.BackgroundTransparency = 1
teleportFrame.Visible = true

-- Teleport locations
local locations = {
	Tower = CFrame.new(-279.117615, 179.810806, 342.269592),
	Island = CFrame.new(-114.305161, 47.7108459, 32.897583),
	["Secret Room"] = CFrame.new(-5056.77295, 263.223969, 6077.61816)
}

local yPos = 10
for name, cf in pairs(locations) do
	local btn = Instance.new("TextButton")
	btn.Parent = teleportFrame
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, yPos)
	btn.Text = "Teleport → " .. name
	btn.Font = Enum.Font.GothamBold
	btn.TextColor3 = Color3.new(1,1,1)
	btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	btn.TextScaled = true
	roundify(btn, 6)
	btn.MouseButton1Click:Connect(function()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if hrp then hrp.CFrame = cf end
	end)
	yPos += 45
end

-- Others Frame
local othersFrame = Instance.new("Frame", contentFrame)
othersFrame.Size = UDim2.new(1, 0, 1, 0)
othersFrame.BackgroundTransparency = 1
othersFrame.Visible = false

local placeholder = Instance.new("TextLabel", othersFrame)
placeholder.Size = UDim2.new(1, 0, 0, 60)
placeholder.Position = UDim2.new(0, 0, 0, 20)
placeholder.Text = "More features coming soon!"
placeholder.Font = Enum.Font.GothamBold
placeholder.TextColor3 = Color3.new(1,1,1)
placeholder.TextScaled = true
placeholder.BackgroundTransparency = 1
roundify(placeholder, 6)

-- Tab switching
teleportTabBtn.MouseButton1Click:Connect(function()
	teleportFrame.Visible = true
	othersFrame.Visible = false
	teleportTabBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	othersTabBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
end)
othersTabBtn.MouseButton1Click:Connect(function()
	teleportFrame.Visible = false
	othersFrame.Visible = true
	othersTabBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
	teleportTabBtn.BackgroundColor3 = Color3.fromRGB(35,35,35)
end)

-- Destroy Button
local destroyBtn = Instance.new("TextButton", frame)
destroyBtn.Size = UDim2.new(0, 30, 0, 30)
destroyBtn.Position = UDim2.new(1, -35, 0, 5)
destroyBtn.Text = "X"
destroyBtn.Font = Enum.Font.GothamBold
destroyBtn.TextColor3 = Color3.fromRGB(255, 77, 77)
destroyBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
destroyBtn.TextScaled = true
roundify(destroyBtn, 8)
destroyBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 130)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 0)
minimizeBtn.TextScaled = true
roundify(minimizeBtn, 8)

-- Volcano Emoji Button (Draggable)
local emojiBtn = Instance.new("TextButton", gui)
emojiBtn.Size = UDim2.new(0, 50, 0, 50)
emojiBtn.Position = UDim2.new(0, 10, 1, -60)
emojiBtn.Text = "🌋"
emojiBtn.Font = Enum.Font.GothamBold
emojiBtn.TextScaled = true
emojiBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
emojiBtn.Visible = false
emojiBtn.Active = true
roundify(emojiBtn, 12)

-- Minimize/Restore
minimizeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	emojiBtn.Visible = true
end)
emojiBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	emojiBtn.Visible = false
end)

-- Dragging logic for emojiBtn
local dragging = false
local dragInput, dragStart, startPos

emojiBtn.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = emojiBtn.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

emojiBtn.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		local delta = input.Position - dragStart
		emojiBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
