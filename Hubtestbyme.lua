-- Thurr's Script Hub GUI (with Minimize + 🐱 Floating Button)

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Hub Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 350, 0, 300)
frame.Position = UDim2.new(0.5, -175, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true
frame.Visible = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "🛠️ UnivThHub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = frame

-- Scrollable Area
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
scroll.Parent = frame

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Script list
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
	},
	{
		Name = "GhostHub",
		URL = "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"
	}
}

-- Create buttons
for _, scriptInfo in ipairs(scripts) do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Text = scriptInfo.Name
	button.Font = Enum.Font.Gotham
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextScaled = true
	button.Parent = scroll
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(function()
		pcall(function()
			loadstring(game:HttpGet(scriptInfo.URL))()
		end)
	end)
end

-- Update scroll size
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)

-- Close Button
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

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -70, 0, 5)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
minimizeBtn.TextScaled = true
minimizeBtn.Parent = frame
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

-- Floating 🐱 Button
local catBtn = Instance.new("TextButton")
catBtn.Size = UDim2.new(0, 50, 0, 50)
catBtn.Position = UDim2.new(0, 10, 0, 100)
catBtn.Text = "🐱"
catBtn.Font = Enum.Font.GothamBold
catBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
catBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
catBtn.TextScaled = true
catBtn.Visible = false
catBtn.Parent = gui
Instance.new("UICorner", catBtn).CornerRadius = UDim.new(1, 0)

-- Minimize Logic
minimizeBtn.MouseButton1Click:Connect(function()
	frame.Visible = false
	catBtn.Visible = true
end)

catBtn.MouseButton1Click:Connect(function()
	frame.Visible = true
	catBtn.Visible = false
end)
