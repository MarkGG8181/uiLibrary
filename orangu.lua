local library = {}

local toggled = false

function library:CreateWindow(text)
    local OranguLibrary = Instance.new("ScreenGui")
	local Drag = Instance.new("Frame")
	local Drag2 = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local Container = Instance.new("Frame")
	local Close = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	
	local FrameRound = Instance.new("UICorner")
	local DragRound = Instance.new("UICorner")
	local CloseRound = Instance.new("UICorner")
	local UIGridLayout = Instance.new("UIGridLayout")

    OranguLibrary.Name = "OranguLibrary"
	OranguLibrary.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	OranguLibrary.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	OranguLibrary.ResetOnSpawn = false

	Drag.Name = "Drag"
	Drag.Parent = OranguLibrary
	Drag.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Drag.BorderSizePixel = 0
	Drag.Position = UDim2.new(0.0964320153, 0, 0.119460501, 0)
	Drag.Size = UDim2.new(0, 147, 0, 25)
	Drag.ZIndex = 2
	Drag.Active = true
	Drag.Draggable = true
	
	Container.Name = "Container"
	Container.Parent = Frame
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 1.000
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 0, 0.0614035092, 0)
	Container.Size = UDim2.new(0, 147, 0, 214)

	UIGridLayout.Parent = Container
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellSize = UDim2.new(0, 140, 0, 25)

	Frame.Parent = Drag
	Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0, 0, 0.680000007, 0)
	Frame.Size = UDim2.new(0, 147, 0, 228)
	Frame.ClipsDescendants = true

	FrameRound.Name = "FrameRound"
	FrameRound.Parent = Frame

	DragRound.Name = "DragRound"
	DragRound.Parent = Drag

	Drag2.Name = "Drag2"
	Drag2.Parent = Drag
	Drag2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Drag2.BorderSizePixel = 0
	Drag2.Position = UDim2.new(0, 0, 0.360000014, 0)
	Drag2.Size = UDim2.new(0, 147, 0, 16)

	Title.Name = "Title"
	Title.Parent = Drag
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0816326514, 0, 0, 0)
	Title.Size = UDim2.new(0, 88, 0, 25)
	Title.ZIndex = 2
	Title.Font = Enum.Font.SourceSansSemibold
	Title.Text = text or "Orangu Library"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Close.Name = "Close"
	Close.Parent = Drag
	Close.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.84353739, 0, 0.160000011, 0)
	Close.Size = UDim2.new(0, 16, 0, 16)
	Close.ZIndex = 2
	Close.Font = Enum.Font.SourceSans
	Close.Text = ""
	Close.TextColor3 = Color3.fromRGB(255, 170, 0)
	Close.TextSize = 14.000

	CloseRound.CornerRadius = UDim.new(0, 3)
	CloseRound.Name = "CloseRound"
	CloseRound.Parent = Close
	
    Close.MouseButton1Down:Connect(function()
		function doToggle()
			if Close.BackgroundColor3 == Color3.fromRGB(255, 170, 0) then
				Frame:TweenSize(UDim2.new(0, 147,0, 3), "In", "Linear", 0.3)
				Close.BackgroundColor3 = Color3.fromRGB(41, 255, 41)
				Wait(0.3)
				Drag2.Visible = false
				Frame.Visible = false
			else
				Frame.Visible = true
				Frame:TweenSize(UDim2.new(0, 147,0, 228), "Out", "Linear", 0.3)
				Close.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
				Drag2.Visible = true
			end
		end
		
		doToggle()
    end)

    local OranguLib = {}
    function OranguLib:AddButton(text, callback)
        local callback = callback or function() end
        local Button = Instance.new("TextButton")
		local ButtonRound = Instance.new("UICorner")

        Button.Name = "Button"
		Button.Parent = Container
		Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		Button.BorderSizePixel = 0
		Button.Size = UDim2.new(0, 200, 0, 50)
		Button.Font = Enum.Font.SourceSans
		Button.TextColor3 = Color3.fromRGB(255, 255, 255)
		Button.TextSize = 14.000
		Button.Text = text or "Button"
		
		ButtonRound.CornerRadius = UDim.new(0, 5)
		ButtonRound.Name = "ButtonRound"
		ButtonRound.Parent = Button

        Button.MouseButton1Down:Connect(function()
            pcall(callback)
        end)    
    end
	
	function OranguLib:AddLabel(text)
        local Label = Instance.new("TextLabel")
		local LabelRound = Instance.new("UICorner")

		Label.Name = "Label"
		Label.Parent = Container
		Label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		Label.BorderColor3 = Color3.fromRGB(255, 170, 0)
		Label.BorderSizePixel = 0
		Label.Size = UDim2.new(0, 200, 0, 50)
		Label.Font = Enum.Font.SourceSans
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000
		Label.TextWrapped = true
		Label.Text = text or "Orangu Library"

		LabelRound.CornerRadius = UDim.new(0, 5)
		LabelRound.Name = "LabelRound"
		LabelRound.Parent = Label
    end
	
	function OranguLib:AddTextBox(text)
        local TextBox = Instance.new("TextBox")
		local TextRound = Instance.new("UICorner")
		local TextLine = Instance.new("UIStroke")
		local callback = callback or function() end
		
        TextBox.Parent = Container
		TextBox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		TextBox.Size = UDim2.new(0, 200, 0, 50)
		TextBox.Font = Enum.Font.SourceSans
		TextBox.PlaceholderColor3 = Color3.fromRGB(117, 117, 117)
		TextBox.PlaceholderText = text or "Textbox"
		TextBox.Text = ""
		TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextBox.TextSize = 14.000
		
		TextRound.CornerRadius = UDim.new(0, 5)
		TextRound.Name = "TextRound"
		TextRound.Parent = TextBox

		TextLine.LineJoinMode = Enum.LineJoinMode.Round
		TextLine.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		TextLine.Thickness = 1
		TextLine.Transparency = 0
		TextLine.Color = Color3.fromRGB(255, 170, 0)
		TextLine.Name = "TextLine"
		TextLine.Parent = TextBox

		TextBox.Focused:Connect(function()
			TextLine.Color = Color3.fromRGB(41, 255, 41)
		end)
		
		TextBox.FocusLost:Connect(function()
			TextLine.Color = Color3.fromRGB(255, 170, 0)
			pcall(callback, TextBox.Text)()
		end)
    end
	
    function OranguLib:AddToggle(text, callback)
        local actions = {}
        local enabled = false

        local callback = callback or function() end

        local Toggle = Instance.new("TextLabel")
		local ToggleText = Instance.new("TextLabel")
		local ToggleCheck = Instance.new("TextButton")
		local ToggleRound = Instance.new("UICorner")
		
		local CheckRound = Instance.new("UICorner")
		local CheckLine = Instance.new("UIStroke")

        Toggle.Name = "Toggle"
		Toggle.Parent = Container
		Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		Toggle.BorderSizePixel = 0
		Toggle.Size = UDim2.new(0, 200, 0, 50)
		Toggle.Font = Enum.Font.SourceSans
		Toggle.Text = ""
		Toggle.TextColor3 = Color3.fromRGB(34, 34, 34)
		Toggle.TextSize = 14.000

		ToggleText.Name = "ToggleText"
		ToggleText.Parent = Toggle
		ToggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ToggleText.BackgroundTransparency = 1.000
		ToggleText.Position = UDim2.new(0.0571428575, 0, 0, 0)
		ToggleText.Size = UDim2.new(0, 88, 0, 25)
		ToggleText.Font = Enum.Font.SourceSans
		ToggleText.Text = text or "New Toggle"
		ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleText.TextSize = 14.000
		ToggleText.TextXAlignment = Enum.TextXAlignment.Left

		ToggleCheck.Name = "ToggleCheck"
		ToggleCheck.Parent = Toggle
		ToggleCheck.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		ToggleCheck.BorderColor3 = Color3.fromRGB(255, 170, 0)
		ToggleCheck.Position = UDim2.new(0.828571379, 0, 0.0799999982, 0)
		ToggleCheck.Size = UDim2.new(0, 20, 0, 20)
		ToggleCheck.Font = Enum.Font.SourceSans
		ToggleCheck.BorderMode = Enum.BorderMode.Inset
		ToggleCheck.Text = ""
		ToggleCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
		ToggleCheck.TextSize = 14.000

		ToggleRound.CornerRadius = UDim.new(0, 5)
		ToggleRound.Name = "ToggleRound"
		ToggleRound.Parent = Toggle
		
		CheckRound.CornerRadius = UDim.new(0, 5)
		CheckRound.Name = "CheckRound"
		CheckRound.Parent = ToggleCheck

		CheckLine.LineJoinMode = Enum.LineJoinMode.Round
		CheckLine.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		CheckLine.Thickness = 1
		CheckLine.Transparency = 0
		CheckLine.Color = Color3.fromRGB(255, 170, 0)
		CheckLine.Name = "CheckLine"
		CheckLine.Parent = ToggleCheck

        local function Fire()
           enabled = not enabled 
		   CheckLine.Color = enabled and Color3.fromRGB(41, 255, 41) or Color3.fromRGB(255, 170, 0)
           ToggleCheck.Text = enabled and utf8.char(10003) or ""
           pcall(callback, enabled)
        end

        ToggleCheck.MouseButton1Click:Connect(Fire)

        function actions:Set(arg)
			CheckLine.Color = enabled and Color3.fromRGB(41, 255, 41) or Color3.fromRGB(255, 170, 0)
			ToggleCheck.Text = enabled and utf8.char(10003) or ""
            pcall(callback, arg)
        end
    end
    return OranguLib
end
return library
