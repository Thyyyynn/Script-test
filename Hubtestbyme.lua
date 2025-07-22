-- Thurr's Script Hub GUI

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 280)
frame.Position = UDim2.new(0.5, -175, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "🛠️ Script Hub by Thurr"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = frame

-- List of scripts (add more below!)
local scripts = {
	{
		Name = "Anti-CoolGUI V2",
		URL = "https://rawscripts.net/raw/Universal-Script-antic00lgui-v2-43345"
	},
	{
		Name = "Teleport GUI",
		URL = "https://raw.githubusercontent.com/Thyyyynn/Script-test/main/TeleportSetTestThy.lua"
	},
	{
		Name = "Infinite Yield",
		URL = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
	}
}

-- Create buttons for each script
for i, scriptInfo in ipairs(scripts) do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0.9, 0, 0, 40)
	button.Position = UDim2.new(0.05, 0, 0, 50 + ((i - 1) * 50))
	button.Text = scriptInfo.Name
	button.Font = Enum.Font.Gotham
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextScaled = true
	button.Parent = frame
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(scriptInfo.URL))()
		end)
	end)
end

-- 🐱 Floating Button (Initially hidden)
local floatBtn = Instance.new("TextButton")
floatBtn.Size = UDim2.new(0, 50, 0, 50)
floatBtn.Position = UDim2.new(0, 20, 0, 200)
floatBtn.Text = "🐱"
floatBtn.Font = Enum.Font.Gotham
floatBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
floatBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
floatBtn.TextScaled = true
floatBtn.Visible = false
floatBtn.Draggable = true
floatBtn.Parent = gui
Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(1, 0)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeBtn.TextScaled = true
minimizeBtn.Parent = frame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

-- Restore from Floating Button
floatBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	floatBtn.Visible = false
end)

-- Minimize Function
minimizeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	floatBtn.Visible = true
end)

-- ❌ Close Button
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
