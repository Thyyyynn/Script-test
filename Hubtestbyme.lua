-- UnivThHub GUI

local gui = Instance.new("ScreenGui")
gui.Name = "UnivThHub"
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
title.Text = "🛠️ UnivThHub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Parent = frame

-- Scrollable script area
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -60)
scroll.Position = UDim2.new(0, 10, 0, 50)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 6
scroll.BackgroundTransparency = 1
scroll.Parent = frame

-- Layout for scroll
local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 10)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = scroll

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
	},
	{
		Name = "Old Animations (Noob Fino)",
		URL = "https://rawscripts.net/raw/Universal-Script-Old-animation-Noob-fino-23081"
	}
}

-- Add buttons
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
scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
end)

-- Close button
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
