-- LocalScript - Executor + Developer Options + Explorer

local Players = game:GetService("Players")
local LogService = game:GetService("LogService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ====================== CRIAR GUI PRINCIPAL ======================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExecutorGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 420, 0, 310) -- tamanho normal (sem opções)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -155)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(200, 30, 30)
mainStroke.Thickness = 2
mainStroke.Parent = mainFrame

-- Barra de título
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 10)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 12)
titleFix.Position = UDim2.new(0, 0, 1, -12)
titleFix.BackgroundColor3 = Color3.fromRGB(150, 20, 20)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Executor"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Minimizar
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 30, 0, 25)
minimizeBtn.Position = UDim2.new(1, -70, 0.5, -12.5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Text = "─"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 16
minimizeBtn.Parent = titleBar

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0, 4)
minCorner.Parent = minimizeBtn

-- Fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 25)
closeBtn.Position = UDim2.new(1, -35, 0.5, -12.5)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 4)
closeCorner.Parent = closeBtn

-- Conteúdo
local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, 0, 1, -35)
content.Position = UDim2.new(0, 0, 0, 35)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- TextBox
local textBox = Instance.new("TextBox")
textBox.Name = "CodeBox"
textBox.Size = UDim2.new(1, -20, 0, 180)
textBox.Position = UDim2.new(0, 10, 0, 10)
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
textBox.BorderSizePixel = 0
textBox.Text = "-- Cole seu código aqui"
textBox.TextColor3 = Color3.fromRGB(220, 220, 220)
textBox.PlaceholderText = "Digite ou cole o código Lua aqui..."
textBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
textBox.Font = Enum.Font.Code
textBox.TextSize = 14
textBox.TextXAlignment = Enum.TextXAlignment.Left
textBox.TextYAlignment = Enum.TextYAlignment.Top
textBox.ClearTextOnFocus = false
textBox.MultiLine = true
textBox.TextWrapped = true
textBox.Parent = content

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 6)
boxCorner.Parent = textBox

local boxStroke = Instance.new("UIStroke")
boxStroke.Color = Color3.fromRGB(80, 80, 80)
boxStroke.Thickness = 1
boxStroke.Parent = textBox

-- Botões principais
local executeBtn = Instance.new("TextButton")
executeBtn.Size = UDim2.new(0, 125, 0, 36)
executeBtn.Position = UDim2.new(0, 10, 0, 200)
executeBtn.BackgroundColor3 = Color3.fromRGB(180, 30, 30)
executeBtn.BorderSizePixel = 0
executeBtn.Text = "EXECUTE"
executeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
executeBtn.Font = Enum.Font.GothamBold
executeBtn.TextSize = 14
executeBtn.Parent = content

local execCorner = Instance.new("UICorner")
execCorner.CornerRadius = UDim.new(0, 6)
execCorner.Parent = executeBtn

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 125, 0, 36)
clearBtn.Position = UDim2.new(0, 145, 0, 200)
clearBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
clearBtn.BorderSizePixel = 0
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 14
clearBtn.Parent = content

local clearCorner = Instance.new("UICorner")
clearCorner.CornerRadius = UDim.new(0, 6)
clearCorner.Parent = clearBtn

-- Botão Opções do Desenvolvedor (alternador)
local devOptionsBtn = Instance.new("TextButton")
devOptionsBtn.Size = UDim2.new(0, 125, 0, 36)
devOptionsBtn.Position = UDim2.new(0, 280, 0, 200)
devOptionsBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
devOptionsBtn.BorderSizePixel = 0
devOptionsBtn.Text = "Opções do desenvolvedor"
devOptionsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
devOptionsBtn.Font = Enum.Font.GothamBold
devOptionsBtn.TextSize = 11
devOptionsBtn.Parent = content

local devCorner = Instance.new("UICorner")
devCorner.CornerRadius = UDim.new(0, 6)
devCorner.Parent = devOptionsBtn

-- Frame das opções (escondido por padrão)
local optionsFrame = Instance.new("Frame")
optionsFrame.Name = "OptionsFrame"
optionsFrame.Size = UDim2.new(1, -20, 0, 50)
optionsFrame.Position = UDim2.new(0, 10, 0, 245)
optionsFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false
optionsFrame.Parent = content

local optionsCorner = Instance.new("UICorner")
optionsCorner.CornerRadius = UDim.new(0, 6)
optionsCorner.Parent = optionsFrame

-- Botão Output (dentro das opções)
local outputBtn = Instance.new("TextButton")
outputBtn.Size = UDim2.new(0, 185, 0, 34)
outputBtn.Position = UDim2.new(0, 8, 0, 8)
outputBtn.BackgroundColor3 = Color3.fromRGB(40, 80, 140)
outputBtn.BorderSizePixel = 0
outputBtn.Text = "Output"
outputBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
outputBtn.Font = Enum.Font.GothamBold
outputBtn.TextSize = 14
outputBtn.Parent = optionsFrame

local outBtnCorner = Instance.new("UICorner")
outBtnCorner.CornerRadius = UDim.new(0, 6)
outBtnCorner.Parent = outputBtn

-- Botão Explorer (dentro das opções)
local explorerBtn = Instance.new("TextButton")
explorerBtn.Size = UDim2.new(0, 185, 0, 34)
explorerBtn.Position = UDim2.new(0, 205, 0, 8)
explorerBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
explorerBtn.BorderSizePixel = 0
explorerBtn.Text = "Explorer"
explorerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
explorerBtn.Font = Enum.Font.GothamBold
explorerBtn.TextSize = 14
explorerBtn.Parent = optionsFrame

local expBtnCorner = Instance.new("UICorner")
expBtnCorner.CornerRadius = UDim.new(0, 6)
expBtnCorner.Parent = explorerBtn

-- ====================== JANELA DE OUTPUT ======================
local outputFrame = Instance.new("Frame")
outputFrame.Name = "OutputFrame"
outputFrame.Size = UDim2.new(0, 380, 0, 280)
outputFrame.Position = UDim2.new(0.5, 50, 0.5, -50)
outputFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
outputFrame.BorderSizePixel = 0
outputFrame.Visible = false
outputFrame.ClipsDescendants = true
outputFrame.Parent = screenGui

local outMainCorner = Instance.new("UICorner")
outMainCorner.CornerRadius = UDim.new(0, 10)
outMainCorner.Parent = outputFrame

local outStroke = Instance.new("UIStroke")
outStroke.Color = Color3.fromRGB(60, 120, 200)
outStroke.Thickness = 2
outStroke.Parent = outputFrame

local outTitleBar = Instance.new("Frame")
outTitleBar.Size = UDim2.new(1, 0, 0, 32)
outTitleBar.BackgroundColor3 = Color3.fromRGB(40, 80, 140)
outTitleBar.BorderSizePixel = 0
outTitleBar.Parent = outputFrame

local outTitleCorner = Instance.new("UICorner")
outTitleCorner.CornerRadius = UDim.new(0, 10)
outTitleCorner.Parent = outTitleBar

local outTitleFix = Instance.new("Frame")
outTitleFix.Size = UDim2.new(1, 0, 0, 10)
outTitleFix.Position = UDim2.new(0, 0, 1, -10)
outTitleFix.BackgroundColor3 = Color3.fromRGB(40, 80, 140)
outTitleFix.BorderSizePixel = 0
outTitleFix.Parent = outTitleBar

local outTitle = Instance.new("TextLabel")
outTitle.Size = UDim2.new(1, -80, 1, 0)
outTitle.Position = UDim2.new(0, 10, 0, 0)
outTitle.BackgroundTransparency = 1
outTitle.Text = "Output"
outTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
outTitle.Font = Enum.Font.GothamBold
outTitle.TextSize = 16
outTitle.TextXAlignment = Enum.TextXAlignment.Left
outTitle.Parent = outTitleBar

local outMinimize = Instance.new("TextButton")
outMinimize.Size = UDim2.new(0, 28, 0, 22)
outMinimize.Position = UDim2.new(1, -65, 0.5, -11)
outMinimize.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
outMinimize.BorderSizePixel = 0
outMinimize.Text = "─"
outMinimize.TextColor3 = Color3.fromRGB(255, 255, 255)
outMinimize.Font = Enum.Font.GothamBold
outMinimize.TextSize = 14
outMinimize.Parent = outTitleBar

local outMinCorner = Instance.new("UICorner")
outMinCorner.CornerRadius = UDim.new(0, 4)
outMinCorner.Parent = outMinimize

local outClose = Instance.new("TextButton")
outClose.Size = UDim2.new(0, 28, 0, 22)
outClose.Position = UDim2.new(1, -32, 0.5, -11)
outClose.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
outClose.BorderSizePixel = 0
outClose.Text = "X"
outClose.TextColor3 = Color3.fromRGB(255, 255, 255)
outClose.Font = Enum.Font.GothamBold
outClose.TextSize = 13
outClose.Parent = outTitleBar

local outCloseCorner = Instance.new("UICorner")
outCloseCorner.CornerRadius = UDim.new(0, 4)
outCloseCorner.Parent = outClose

local outContent = Instance.new("Frame")
outContent.Name = "Content"
outContent.Size = UDim2.new(1, 0, 1, -32)
outContent.Position = UDim2.new(0, 0, 0, 32)
outContent.BackgroundTransparency = 1
outContent.Parent = outputFrame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -12, 1, -12)
scroll.Position = UDim2.new(0, 6, 0, 6)
scroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 6
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = outContent

local scrollCorner = Instance.new("UICorner")
scrollCorner.CornerRadius = UDim.new(0, 6)
scrollCorner.Parent = scroll

local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 2)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scroll

-- ====================== JANELA EXPLORER ======================
local explorerFrame = Instance.new("Frame")
explorerFrame.Name = "ExplorerFrame"
explorerFrame.Size = UDim2.new(0, 340, 0, 420)
explorerFrame.Position = UDim2.new(0.5, -400, 0.5, -210)
explorerFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
explorerFrame.BorderSizePixel = 0
explorerFrame.Visible = false
explorerFrame.ClipsDescendants = true
explorerFrame.Parent = screenGui

local expMainCorner = Instance.new("UICorner")
expMainCorner.CornerRadius = UDim.new(0, 10)
expMainCorner.Parent = explorerFrame

local expStroke = Instance.new("UIStroke")
expStroke.Color = Color3.fromRGB(40, 140, 80)
expStroke.Thickness = 2
expStroke.Parent = explorerFrame

local expTitleBar = Instance.new("Frame")
expTitleBar.Size = UDim2.new(1, 0, 0, 32)
expTitleBar.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
expTitleBar.BorderSizePixel = 0
expTitleBar.Parent = explorerFrame

local expTitleCorner = Instance.new("UICorner")
expTitleCorner.CornerRadius = UDim.new(0, 10)
expTitleCorner.Parent = expTitleBar

local expTitleFix = Instance.new("Frame")
expTitleFix.Size = UDim2.new(1, 0, 0, 10)
expTitleFix.Position = UDim2.new(0, 0, 1, -10)
expTitleFix.BackgroundColor3 = Color3.fromRGB(40, 120, 70)
expTitleFix.BorderSizePixel = 0
expTitleFix.Parent = expTitleBar

local expTitle = Instance.new("TextLabel")
expTitle.Size = UDim2.new(1, -80, 1, 0)
expTitle.Position = UDim2.new(0, 10, 0, 0)
expTitle.BackgroundTransparency = 1
expTitle.Text = "Explorer"
expTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
expTitle.Font = Enum.Font.GothamBold
expTitle.TextSize = 16
expTitle.TextXAlignment = Enum.TextXAlignment.Left
expTitle.Parent = expTitleBar

local expMinimize = Instance.new("TextButton")
expMinimize.Size = UDim2.new(0, 28, 0, 22)
expMinimize.Position = UDim2.new(1, -65, 0.5, -11)
expMinimize.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
expMinimize.BorderSizePixel = 0
expMinimize.Text = "─"
expMinimize.TextColor3 = Color3.fromRGB(255, 255, 255)
expMinimize.Font = Enum.Font.GothamBold
expMinimize.TextSize = 14
expMinimize.Parent = expTitleBar

local expMinCorner = Instance.new("UICorner")
expMinCorner.CornerRadius = UDim.new(0, 4)
expMinCorner.Parent = expMinimize

local expClose = Instance.new("TextButton")
expClose.Size = UDim2.new(0, 28, 0, 22)
expClose.Position = UDim2.new(1, -32, 0.5, -11)
expClose.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
expClose.BorderSizePixel = 0
expClose.Text = "X"
expClose.TextColor3 = Color3.fromRGB(255, 255, 255)
expClose.Font = Enum.Font.GothamBold
expClose.TextSize = 13
expClose.Parent = expTitleBar

local expCloseCorner = Instance.new("UICorner")
expCloseCorner.CornerRadius = UDim.new(0, 4)
expCloseCorner.Parent = expClose

local expContent = Instance.new("Frame")
expContent.Name = "Content"
expContent.Size = UDim2.new(1, 0, 1, -32)
expContent.Position = UDim2.new(0, 0, 0, 32)
expContent.BackgroundTransparency = 1
expContent.Parent = explorerFrame

local expScroll = Instance.new("ScrollingFrame")
expScroll.Size = UDim2.new(1, -12, 1, -12)
expScroll.Position = UDim2.new(0, 6, 0, 6)
expScroll.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
expScroll.BorderSizePixel = 0
expScroll.ScrollBarThickness = 6
expScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
expScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
expScroll.Parent = expContent

local expScrollCorner = Instance.new("UICorner")
expScrollCorner.CornerRadius = UDim.new(0, 6)
expScrollCorner.Parent = expScroll

local expListLayout = Instance.new("UIListLayout")
expListLayout.Padding = UDim.new(0, 1)
expListLayout.SortOrder = Enum.SortOrder.LayoutOrder
expListLayout.Parent = expScroll

-- ====================== SISTEMA DE ARRASTAR ======================
local function makeDraggable(frame, handle)
	local dragging = false
	local dragStart = nil
	local startPos = nil

	handle.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
end

makeDraggable(mainFrame, titleBar)
makeDraggable(outputFrame, outTitleBar)
makeDraggable(explorerFrame, expTitleBar)

-- ====================== FUNÇÕES ======================
local isMinimized = false
local isOutMinimized = false
local isExpMinimized = false
local devOptionsOpen = false

local normalSize = UDim2.new(0, 420, 0, 310)
local expandedSize = UDim2.new(0, 420, 0, 370)
local originalOutSize = outputFrame.Size
local originalExpSize = explorerFrame.Size

-- Alternar Opções do Desenvolvedor
devOptionsBtn.MouseButton1Click:Connect(function()
	devOptionsOpen = not devOptionsOpen
	optionsFrame.Visible = devOptionsOpen

	if devOptionsOpen then
		mainFrame.Size = expandedSize
		devOptionsBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
		devOptionsBtn.Text = "Opções do desenvolvedor ✓"
	else
		mainFrame.Size = normalSize
		devOptionsBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		devOptionsBtn.Text = "Opções do desenvolvedor"
	end
end)

-- Minimizar / Restaurar principal
minimizeBtn.MouseButton1Click:Connect(function()
	isMinimized = not isMinimized
	if isMinimized then
		content.Visible = false
		mainFrame.Size = UDim2.new(0, 420, 0, 35)
		minimizeBtn.Text = "□"
	else
		content.Visible = true
		mainFrame.Size = devOptionsOpen and expandedSize or normalSize
		minimizeBtn.Text = "─"
	end
end)

closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Output minimize/close
outMinimize.MouseButton1Click:Connect(function()
	isOutMinimized = not isOutMinimized
	if isOutMinimized then
		outContent.Visible = false
		outputFrame.Size = UDim2.new(0, 380, 0, 32)
		outMinimize.Text = "□"
	else
		outContent.Visible = true
		outputFrame.Size = originalOutSize
		outMinimize.Text = "─"
	end
end)

outClose.MouseButton1Click:Connect(function()
	outputFrame.Visible = false
end)

outputBtn.MouseButton1Click:Connect(function()
	outputFrame.Visible = true
	if isOutMinimized then
		isOutMinimized = false
		outContent.Visible = true
		outputFrame.Size = originalOutSize
		outMinimize.Text = "─"
	end
end)

-- Explorer minimize/close
expMinimize.MouseButton1Click:Connect(function()
	isExpMinimized = not isExpMinimized
	if isExpMinimized then
		expContent.Visible = false
		explorerFrame.Size = UDim2.new(0, 340, 0, 32)
		expMinimize.Text = "□"
	else
		expContent.Visible = true
		explorerFrame.Size = originalExpSize
		expMinimize.Text = "─"
	end
end)

expClose.MouseButton1Click:Connect(function()
	explorerFrame.Visible = false
end)

-- ====================== EXPLORER (árvore) ======================
local function clearExplorer()
	for _, child in ipairs(expScroll:GetChildren()) do
		if child:IsA("TextLabel") or child:IsA("TextButton") then
			child:Destroy()
		end
	end
end

local function addExplorerItem(text, depth, isService)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -8, 0, 20)
	label.BackgroundTransparency = 1
	label.Text = string.rep("    ", depth) .. text
	label.TextColor3 = isService and Color3.fromRGB(100, 200, 255) or Color3.fromRGB(210, 210, 210)
	label.Font = Enum.Font.Code
	label.TextSize = 13
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextTruncate = Enum.TextTruncate.AtEnd
	label.Parent = expScroll
end

local function buildExplorer(instance, depth, maxDepth)
	if depth > maxDepth then return end

	local children = instance:GetChildren()
	table.sort(children, function(a, b)
		return a.Name:lower() < b.Name:lower()
	end)

	for _, child in ipairs(children) do
		local displayName = child.Name
		if child.Name == "" then
			displayName = child.ClassName
		end

		local isService = child:IsA("Service") or child.Parent == game
		addExplorerItem(displayName .. "  [" .. child.ClassName .. "]", depth, isService)

		-- Continua a árvore (limite de profundidade para não travar)
		if #child:GetChildren() > 0 and depth < maxDepth then
			buildExplorer(child, depth + 1, maxDepth)
		end
	end
end

local function refreshExplorer()
	clearExplorer()
	addExplorerItem("game", 0, true)
	buildExplorer(game, 1, 4) -- profundidade máxima 4 para não ficar pesado
end

explorerBtn.MouseButton1Click:Connect(function()
	explorerFrame.Visible = true
	if isExpMinimized then
		isExpMinimized = false
		e
