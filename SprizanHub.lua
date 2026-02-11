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

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 420)
main.Position = UDim2.new(0.5, -210, 0.5, -210)
main.BackgroundColor3 = Color3.fromRGB(18,18,25)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

-- GLOW
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(120,170,255)

-- GRADIENT
local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(90,120,255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(180,80,255))
}

TweenService:Create(
	grad,
	TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
	{Rotation = 360}
):Play()

-- DRAG SUPPORT (PC + MOBILE)
local dragging, dragStart, startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement 
	or input.UserInputType == Enum.UserInputType.Touch) then
		
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
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

-- TITLE
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "Sprizan Hub"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(170,200,255)

-- CLOSE BUTTON
local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-45,0,10)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.TextColor3 = Color3.new(1,1,1)
close.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

close.MouseButton1Click:Connect(function()
	main.Visible = false
end)

-- OPEN BUTTON
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,150,0,45)
open.Position = UDim2.new(0,20,0.5,0)
open.Text = "Sprizan Hub"
open.Font = Enum.Font.GothamBold
open.TextScaled = true
open.TextColor3 = Color3.new(1,1,1)
open.BackgroundColor3 = Color3.fromRGB(80,120,255)
Instance.new("UICorner", open).CornerRadius = UDim.new(0,15)

open.MouseButton1Click:Connect(function()
	main.Visible = true
end)

-- BUTTON CONTAINER
local container = Instance.new("Frame", main)
container.Position = UDim2.new(0,0,0,60)
container.Size = UDim2.new(1,0,1,-70)
container.BackgroundTransparency = 1

local layout = Instance.new("UIGridLayout", container)
layout.CellSize = UDim2.new(0.45,0,0,45)
layout.CellPadding = UDim2.new(0,10,0,10)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.VerticalAlignment = Enum.VerticalAlignment.Top

-- BUTTON CREATOR FUNCTION
local function createButton(name, url)
	local button = Instance.new("TextButton", container)
	button.Text = name
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.TextColor3 = Color3.new(1,1,1)
	button.BackgroundColor3 = Color3.fromRGB(40,40,55)
	Instance.new("UICorner", button).CornerRadius = UDim.new(0,12)

	button.MouseButton1Click:Connect(function()
		if url and url ~= "" then
			loadstring(game:HttpGet(url))()
		end
	end)
end

-- YOUR MODULE BUTTONS (PASTE YOUR LINKS IN "")
createButton("Sprizan Booster", "https://raw.githubusercontent.com/sprizan/Sprizan-Speed/main/SprizanSpeed.lua")
createButton("AP Spammer", "https://raw.githubusercontent.com/sprizan/Sprizan-ApSpammer/main/Adminspammer.lua")
createButton("Instant Leave", "https://pastebin.com/raw/yWZSqK7X")
createButton("Base Spy", "https://pastefy.app/NyT6tOKv/raw")
createButton("Paintball Spammer", "https://api.luarmor.net/files/v4/loaders/663968f4a83777ba7cb16e2d5984f812.lua")
createButton("TP And Block", "https://raw.githubusercontent.com/Tokinu/TP-BLOCK/refs/heads/main/GOATED")
createButton("Auto Duell", "https://pastefy.app/owJIETY3/raw")
createButton("Allow Friends", "https://pastefy.app/oYbSASyd/raw")
