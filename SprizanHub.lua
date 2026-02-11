--// SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SprizanHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

--// MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 430, 0, 420)
main.Position = UDim2.new(0.5, -215, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
main.BorderSizePixel = 0
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 20)

-- Glow
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(170, 0, 255)

local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(110,0,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(200,0,255))
}

TweenService:Create(
	grad,
	TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
	{Rotation = 360}
):Play()

--// DRAG FUNCTION
local function makeDraggable(object)
	local dragging, dragStart, startPos

	object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = object.Position
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement 
		or input.UserInputType == Enum.UserInputType.Touch) then
			
			local delta = input.Position - dragStart
			object.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 
		or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
end

makeDraggable(main)

--// TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "Sprizan Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(210,170,255)

-- Discord Text
local discord = Instance.new("TextLabel", main)
discord.Position = UDim2.new(0,0,0,45)
discord.Size = UDim2.new(1,0,0,20)
discord.BackgroundTransparency = 1
discord.Text = "discord.gg/DAA3d7BcPU"
discord.Font = Enum.Font.Gotham
discord.TextScaled = true
discord.TextColor3 = Color3.fromRGB(140,140,140)

--// BUTTON CONTAINER
local container = Instance.new("Frame", main)
container.Position = UDim2.new(0,0,0,70)
container.Size = UDim2.new(1,0,1,-80)
container.BackgroundTransparency = 1

local layout = Instance.new("UIGridLayout", container)
layout.CellSize = UDim2.new(0.45,0,0,50)
layout.CellPadding = UDim2.new(0,12,0,12)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top

--// BUTTON CREATOR
local function createButton(name, url)
	local button = Instance.new("TextButton", container)
	button.Text = name
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.TextColor3 = Color3.new(1,1,1)
	button.BackgroundColor3 = Color3.fromRGB(25,15,35)
	Instance.new("UICorner", button).CornerRadius = UDim.new(0,14)

	local glow = Instance.new("UIStroke", button)
	glow.Thickness = 1.5
	glow.Color = Color3.fromRGB(170,0,255)

	-- Pulse
	task.spawn(function()
		while button.Parent do
			TweenService:Create(glow, TweenInfo.new(1.5), {Transparency = 0.2}):Play()
			task.wait(1.5)
			TweenService:Create(glow, TweenInfo.new(1.5), {Transparency = 0.6}):Play()
			task.wait(1.5)
		end
	end)

	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(45,20,70)
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {
			BackgroundColor3 = Color3.fromRGB(25,15,35)
		}):Play()
	end)

	button.MouseButton1Click:Connect(function()
		if url and url ~= "" then
			loadstring(game:HttpGet(url))()
		end
	end)
end

-- MODULE BUTTONS
createButton("Sprizan Booster", "https://raw.githubusercontent.com/sprizan/Sprizan-Speed/main/SprizanSpeed.lua")
createButton("AP Spammer", "https://raw.githubusercontent.com/sprizan/Sprizan-ApSpammer/main/Adminspammer.lua")
createButton("Instant Leave", "https://pastebin.com/raw/yWZSqK7X")
createButton("Base Spy", "https://pastefy.app/NyT6tOKv/raw")
createButton("Paintball Spammer", "https://api.luarmor.net/files/v4/loaders/663968f4a83777ba7cb16e2d5984f812.lua")
createButton("TP And Block", "https://raw.githubusercontent.com/Tokinu/TP-BLOCK/main/GOATED")
createButton("Auto Duell", "https://pastefy.app/owJIETY3/raw")
createButton("Allow Friends", "https://pastefy.app/oYbSASyd/raw")
createButton("Instant Steal", "https://api.luarmor.net/files/v4/loaders/aadf0ff8561cd55df2e9557803c5f5ef.lua")
createButton("Base Protector", "https://raw.githubusercontent.com/Tokinu/Base-Protector/refs/heads/main/Admin-Panel")
createButton("Semi Instant Steal", "https://raw.githubusercontent.com/Solaratfr/SemiInstaSteal/refs/heads/main/Artfull")
createButton("Lagger", "https://api.getpolsec.com/scripts/hosted/3e2a772b58ebd7ed4835f8a468f9fd2fbe9b589452b75d692a172ae673bf291a.lua")

--// SH TOGGLE BUTTON
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,20,0.5,0)
open.Text = "SH"
open.Font = Enum.Font.GothamBlack
open.TextScaled = true
open.TextColor3 = Color3.new(1,1,1)
open.BackgroundColor3 = Color3.fromRGB(130,0,255)
Instance.new("UICorner", open).CornerRadius = UDim.new(0,14)

makeDraggable(open)

local opened = false

open.MouseButton1Click:Connect(function()

	if not opened then
		main.Visible = true
		main.Size = UDim2.new(0,0,0,0)

		TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
			Size = UDim2.new(0, 430, 0, 420)
		}):Play()

		opened = true
	else
		TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
			Size = UDim2.new(0,0,0,0)
		}):Play()

		task.wait(0.25)
		main.Visible = false
		main.Size = UDim2.new(0, 430, 0, 420)

		opened = false
	end

end)
