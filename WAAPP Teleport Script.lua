local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "TeleportButtons"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 300)
frame.Position = UDim2.new(0, 20, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local teleportList = {
	["Cashier"] = CFrame.new(49.4975739, 3.80013323, 83.7760162, -0.166450307, 0, -0.986049831, 0, 1, 0, 0.986049831, 0, -0.166450307),
	["Cook"] = CFrame.new(36.1526451, 3.91580534, 53.1274109, 0.772864163, 0, -0.634571493, 0, 1, 0, 0.634571493, 0, 0.772864163),
	["Pizza Boxer"] = CFrame.new(58.5939636, 3.79999971, 12.8852043, -0.931739211, 0, -0.363128096, 0, 1, 0, 0.363128096, 0, -0.931739211),
	["Delivery"] = CFrame.new(58.5939636, 3.79999971, 12.8852043, -0.931739211, 0, -0.363128096, 0, 1, 0, 0.363128096, 0, -0.931739211),
	["Supplier"] = CFrame.new(6.45380878, 12.999999, -1023.24902, -0.90108186, 0, -0.433649004, 0, 1, 0, 0.433649004, 0, -0.90108186),
	["Manager (If Available)"] = CFrame.new(23.8842564, 3.79999971, 6.27706242, -0.463275492, 0, -0.886214316, 0, 1, 0, 0.886214316, 0, -0.463275492)
}

local yOffset = 10

for name, cf in pairs(teleportList) do
	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(1, -20, 0, 30)
	button.Position = UDim2.new(0, 10, 0, yOffset)
	button.Text = "🚀 " .. name
	button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	Instance.new("UICorner", button).CornerRadius = UDim.new(0, 6)

	button.MouseButton1Click:Connect(function()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			hrp.CFrame = cf
		end
	end)

	yOffset = yOffset + 40
end
