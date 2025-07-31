local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local RebhookUrl = "https://discord.com/api/webhooks/..."

local function formatNumber(number)
    local suffixes = {"", "K", "M", "B", "T", "QD", "QN", "Sx", "Sp"}
    local suffixIndex = 1
    while math.abs(number) >= 1000 and suffixIndex < #suffixes do
        number = number / 1000
        suffixIndex = suffixIndex + 1
    end
    return string.format("%.2f%s", number, suffixes[suffixIndex])
end

local function sendWebhook(content)
    local data = {
        ["username"] = "SB Team",
        ["avatar_url"] = "https://cdn.discordapp.com/attachments/...",
        ["content"] = content
    }

    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["Content-Type"] = "application/json" }

    local success, response = pcall(function()
        if syn and syn.request then
            return syn.request({ Url = RebhookUrl, Body = jsonData, Method = "POST", Headers = headers })
        elseif request then
            return request({ Url = RebhookUrl, Body = jsonData, Method = "POST", Headers = headers })
        elseif http_request then
            return http_request({ Url = RebhookUrl, Body = jsonData, Method = "POST", Headers = headers })
        end
    end)

    if not success then
        warn("Erreur d’envoi Webhook :", response)
    end
end

local function logStats()
    local player = Players.LocalPlayer
    local data = ReplicatedStorage:FindFirstChild("Datas") and ReplicatedStorage.Datas:FindFirstChild(player.UserId)
    if not data then return end

    local rebirths = data:FindFirstChild("Rebirth") and data.Rebirth.Value or 0
    local energy = data:FindFirstChild("Energy") and data.Energy.Value or 0

    local currentTime = os.date("%I:%M:%S %p")
    local formattedEnergy = formatNumber(energy)

    local message = string.format("%s | %s (@%s) Rebirths: %d | Stats: %s", currentTime, player.DisplayName, player.Name, rebirths, formattedEnergy)
    sendWebhook(message)
end

logStats()

task.wait(0.5)
game.Workspace.Gravity = 1

local player = Players.LocalPlayer

-- Attendre PlayerGui
while not player:FindFirstChild("PlayerGui") do task.wait() end

-- Création GUI
local ba = Instance.new("ScreenGui")
ba.Name = "AntiAfkGui"
ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ba.Parent = player:WaitForChild("PlayerGui")

local ca = Instance.new("TextLabel")
ca.Parent = ba
ca.Active = true
ca.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ca.Transparency = 1
ca.Draggable = true
ca.Position = UDim2.new(0.698, 0, 0.098, 0)
ca.Size = UDim2.new(0, 370, 0, 52)
ca.Font = Enum.Font.SourceSansSemibold
ca.Text = "Anti Afk"
ca.TextColor3 = Color3.new(0, 1, 1)
ca.TextSize = 22

local da = Instance.new("Frame")
da.Parent = ca
da.Transparency = 1
da.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
da.Position = UDim2.new(0, 0, 1.02, 0)
da.Size = UDim2.new(0, 370, 0, 107)

local _b = Instance.new("TextLabel")
_b.Parent = da
_b.Transparency = 1
_b.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_b.Position = UDim2.new(0, 0, 0.80, 0)
_b.Size = UDim2.new(0, 370, 0, 21)
_b.Font = Enum.Font.Arial
_b.Text = "Made by SbTeam"
_b.TextColor3 = Color3.new(0, 1, 1)
_b.TextSize = 20

local ab = Instance.new("TextLabel")
ab.Parent = da
ab.Transparency = 1
ab.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ab.Position = UDim2.new(0, 0, 0.158, 0)
ab.Size = UDim2.new(0, 370, 0, 44)
ab.Font = Enum.Font.ArialBold
ab.Text = "Status: Active"
ab.TextColor3 = Color3.new(0, 1, 1)
ab.TextSize = 20

-- Anti-AFK
local vu = game:GetService("VirtualUser")
player.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
    ab.Text = "Roblox tried kicking you but I didn't let them!"
    task.wait(2)
    ab.Text = "Status: Active"
end)





local MenuPanel = player.PlayerGui:FindFirstChild("SB team")
local playerCount = game.Players:GetPlayers()
-- Initialisation des services
local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

-- Création des éléments UI
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")
local farmLabel = Instance.new("TextLabel")
local formsLabel = Instance.new("TextLabel")
local meleeLabel = Instance.new("TextLabel")
local tpLabel = Instance.new("TextLabel")
local Reb = Instance.new("TextLabel")
local destroyLabel = Instance.new("TextLabel")
local farmButton = Instance.new("TextButton")
local formsButton = Instance.new("TextButton")
local playersButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local MainButton = Instance.new("TextButton")
local billsButton = Instance.new("TextButton")
local earthButton = Instance.new("TextButton")
local leftLine = Instance.new("Frame")
local rightLine = Instance.new("Frame")
local topLine = Instance.new("Frame")
local bottomLine = Instance.new("Frame")
local centerLine = Instance.new("Frame")
local upperLine = Instance.new("Frame")
local middleLine = Instance.new("Frame")
local frontSwitchLine = Instance.new("Frame")
local MenuPanel = Instance.new("Frame")
local ButtonCorner = Instance.new("UICorner")
local Panel = Instance.new("ImageLabel")
local panelExpanded = false
local sound = Instance.new("Sound", game.Workspace)
local imageLabel = Instance.new("ImageLabel")
local billsImageLabel = Instance.new("ImageLabel")
local earthImageLabel = Instance.new("ImageLabel")
local hbtcButton = Instance.new("TextButton")
local hbtcImageLabel = Instance.new("ImageLabel")
local hbtgvButton = Instance.new("TextButton")
local hbtgvImageLabel = Instance.new("ImageLabel")
local mle_extLabel = Instance.new("TextLabel")
local Transformation = Instance.new("TextLabel")
local REBHOOK = Instance.new("TextLabel")
local pingTextLabel = Instance.new("TextLabel")
local fpsTextLabel = Instance.new("TextLabel")
local missionTextLabel = Instance.new("TextLabel")
local timeTextLabel = Instance.new("TextLabel")
local button = Instance.new("TextButton", ScreenGui)
local bestId
local background = Instance.new("Frame")
local playerListContainer = Instance.new("ScrollingFrame")
local containerCorner = Instance.new("UICorner") 
local corner = Instance.new("UICorner")
local ballFrame = Instance.new("Frame")
local userId = player.UserId
local thumbnailType = Enum.ThumbnailType.HeadShot
local thumbnailSize = Enum.ThumbnailSize.Size48x48
local thumbnailUrl = Players:GetUserThumbnailAsync(userId, thumbnailType, thumbnailSize)
local UICorner = Instance.new("UICorner")
local player = game.Players.LocalPlayer

-- Initialisation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SB team"
ScreenGui.Parent = player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Fonctions utilitaires
local function roundify(gui, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = gui
end

-- Titre principal avec fond bleu
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.fromRGB(30, 40, 80) -- Fond bleu clair
TextLabel.BackgroundTransparency = 0.05
TextLabel.Position = UDim2.new(0.5, -225, 0.2, 0)
TextLabel.Size = UDim2.new(0, 450, 0, 40)
TextLabel.Font = Enum.Font.GothamBlack
TextLabel.Text = "⚡ SB team V4 "
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextStrokeTransparency = 0.7 -- Ombre légère
TextLabel.TextScaled = true
TextLabel.Active = true
TextLabel.Draggable = true
roundify(TextLabel, 4)

-- Dégradé bleu ciel avec des teintes plus lumineuses
local rgbTween = Instance.new("UIGradient")
rgbTween.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 206, 250)), -- Bleu ciel clair
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(176, 224, 230)), -- Light Steel Blue
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 130, 180)) -- Steel Blue (plus léger)
}
rgbTween.Rotation = 0
rgbTween.Parent = TextLabel

-- Animation fluide du dégradé
task.spawn(function()
    local step = 0
    while true do
        -- Progression du dégradé avec une légère oscillation
        step = step + 1
        if step > 360 then
            step = 0
        end
        rgbTween.Rotation = step
        task.wait(0.02) -- Animation fluide mais subtile
    end
end)


-- Contour lumineux pour le style
local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.4
stroke.Color = Color3.fromRGB(135, 206, 250) -- bleu ciel lumineux
stroke.Transparency = 0.2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = TextLabel


local MenuPanel = Instance.new("Frame")
MenuPanel.Parent = TextLabel
MenuPanel.BackgroundColor3 = Color3.fromRGB(135, 206, 250) -- Fond bleu ciel clair
MenuPanel.BackgroundTransparency = 0.1 -- Légèrement transparent pour un effet plus doux
MenuPanel.Position = UDim2.new(0, 0, 1, 5)
MenuPanel.Size = UDim2.new(0, 450, 0, 350)
MenuPanel.Visible = true
roundify(MenuPanel, 12)

-- Dégradé lumineux avec des tons de bleu clair et bleu normal
local panelGradient = Instance.new("UIGradient")
panelGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(135, 206, 250)), -- Light Sky Blue
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(70, 130, 180)), -- Steel Blue
    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 149, 237)) -- Cornflower Blue
}
panelGradient.Rotation = 0 -- Pas de rotation
panelGradient.Parent = MenuPanel

-- Animation pour un effet lumineux progressif
task.spawn(function()
    while true do
        for i = 0, 1, 0.01 do
            -- Modifie la transparence du dégradé pour un effet lumineux dynamique
            panelGradient.Transparency = UDim2.new(0, i)
            task.wait(0.05) -- Durée pour que l'animation soit fluide
        end
        for i = 1, 0, -0.01 do
            -- Modifie la transparence dans l'autre sens pour un effet d'oscillation
            panelGradient.Transparency = UDim2.new(0, i)
            task.wait(0.05)
        end
    end
end)


-- Ajout d'un léger contour lumineux
local stroke = Instance.new("UIStroke")
stroke.Thickness = 1.4
stroke.Color = Color3.fromRGB(135, 206, 250) -- même ton que le dégradé clair
stroke.Transparency = 0.25
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = MenuPanel


-- Fonction pour créer des labels après MenuPanel
local function createLabel(text, position)
	local label = Instance.new("TextLabel")
	label.Name = text
	label.Text = text
	label.Position = position
	label.Size = UDim2.new(0.4, 0, 0, 28) -- bonne taille visible
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.TextScaled = false
	label.TextSize = 16
	label.Font = Enum.Font.GothamSemibold
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = MenuPanel
	return label
end

-- Minimize
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TextLabel
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
MinimizeButton.Position = UDim2.new(1, -38, 0.5, -13)
MinimizeButton.Size = UDim2.new(0, 28, 0, 26)
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB()
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextScaled = false
roundify(MinimizeButton, 6)

-- Ligne décorative
local bottomLine = Instance.new("Frame")
bottomLine.Parent = MenuPanel
bottomLine.Size = UDim2.new(1, 0, 0, 4)
bottomLine.Position = UDim2.new(0, 0, 1, -4)
bottomLine.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
bottomLine.BackgroundTransparency = 0.2
roundify(bottomLine, 2)

-- Tous les labels
local labels = {
	{ name = "AUTO-FARM", position = UDim2.new(0.05, 0, 0.05, 20) },
	{ name = "SKIP LOADING", position = UDim2.new(0.05, 0, 0.25, 20) },
	{ name = "REBIRTH", position = UDim2.new(0.05, 0, 0.45, 20) },
	{ name = "SKILLS", position = UDim2.new(0.05, 0, 0.65, 20) },
	{ name = "FreeForm", position = UDim2.new(0.55, 0, 0.04, 20) },
	{ name = "GamePass/From", position = UDim2.new(0.55, 0, 0.25, 20) },
	{ name = "TP PLANET", position = UDim2.new(0.55, 0, 0.45, 20) },
}


for _, data in ipairs(labels) do
	createLabel(data.name, data.position)
end

-- Mission text
local missionTextLabel = Instance.new("TextLabel")
missionTextLabel.Name = "MissionTextLabel"
missionTextLabel.Parent = TextLabel
missionTextLabel.Position = UDim2.new(0.5, 0, 1, 5)
missionTextLabel.Size = UDim2.new(0, 90, 0, 10)
missionTextLabel.AnchorPoint = Vector2.new(0.5, 0)
missionTextLabel.BackgroundTransparency = 1
missionTextLabel.Font = Enum.Font.GothamSemibold
missionTextLabel.TextSize = 1
missionTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
missionTextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
missionTextLabel.TextStrokeTransparency = 0.1
missionTextLabel.Text = ""

local ballFrame = Instance.new("Frame")
ballFrame.Size = UDim2.new(0, 37, 0, 17)
ballFrame.Position = UDim2.new(1, -22, 0, 42)
ballFrame.BackgroundTransparency = 1  -- Rendre le fond complètement transparent
ballFrame.Parent = TextLabel
roundify(ballFrame, 7)

-- Modifier la taille du texte de TextLabel
TextLabel.TextSize = 18  -- Par exemple, mets ici la taille que tu veux



-- Blur léger
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 3
blurEffect.Parent = game.Lighting




pcall(function()
    ButtonCorner.Parent = MinimizeButton
    sound.SoundId = "rbxassetid://1293432192"
end)
local menuExpanded = false
local expandTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local contractTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local expandSize = UDim2.new(0, 410, 0, 400)
local contractSize = UDim2.new(0, 410, 0, 0)

local expandTween = TweenService:Create(MenuPanel, expandTweenInfo, {Size = expandSize})
local contractTween = TweenService:Create(MenuPanel, contractTweenInfo, {Size = contractSize})

local function SaveMenuState(isExpanded)
    local success, err = pcall(function()
        local stateInfo = {
            IsExpanded = isExpanded,
            LastModified = os.time()
        }
        writefile("MenuState.json", HttpService:JSONEncode(stateInfo))
    end)

    if not success then
       
    end
end

local function SaveMenuState(isExpanded)
    local success, err = pcall(function()
        local stateInfo = {
            IsExpanded = isExpanded,
            LastModified = os.time()
        }
        writefile("MenuState.json", HttpService:JSONEncode(stateInfo))
    end)

    if not success then
        
    end
end

local function LoadMenuState()
    local success, result = pcall(function()
        if isfile("MenuState.json") then
            local fileContents = readfile("MenuState.json")
            local stateData = HttpService:JSONDecode(fileContents)
            if stateData and stateData.IsExpanded ~= nil then
                return stateData.IsExpanded
            end
        end
        return false
    end)

    if not success then
       
        return false
    end

    return result
end

menuExpanded = LoadMenuState()
MenuPanel.Visible = menuExpanded

local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

-- Valeurs d’état
local menuExpanded = false

-- Définir tailles
local expandSize = UDim2.new(0, 450, 0, 350)
local contractSize = UDim2.new(0, 450, 0, 0)

-- Tween config
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local expandTween = TweenService:Create(MenuPanel, tweenInfo, { Size = expandSize })
local contractTween = TweenService:Create(MenuPanel, tweenInfo, { Size = contractSize })

-- Son
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9118823104" -- 🔊 Clique stylé, tu peux changer
sound.Volume = 0.2
sound.Parent = SoundService

-- Animation avec sécurité
MinimizeButton.MouseButton1Click:Connect(function()
	local success, err = pcall(function()
		if menuExpanded then
			contractTween:Play()
			MinimizeButton.Text = "+"
			sound:Play()
			task.delay(0, function()
				if not menuExpanded then
					MenuPanel.Visible = false
				end
			end)
		else
			MenuPanel.Visible = true
			expandTween:Play()
			MinimizeButton.Text = "-"
			sound:Play()
		end
		menuExpanded = not menuExpanded
		SaveMenuState(menuExpanded) -- si t’as une fonction de save d'état
	end)

	if not success then
		
	end
end)


local function initSwitches(MenuPanel)
    local function createSwitchModel(parent, position, switchName)
        local switchButton = Instance.new("TextButton")
        switchButton.Parent = parent
        switchButton.BackgroundColor3 = Color3.fromRGB(230, 230, 250)
        switchButton.BorderSizePixel = 0
        switchButton.Position = position
        switchButton.Size = UDim2.new(0, 84, 0, 30)
        switchButton.Text = ""

        local switchButtonCorner = Instance.new("UICorner")
        switchButtonCorner.Parent = switchButton
        switchButtonCorner.CornerRadius = UDim.new(0.4, 0)

        local switchBall = Instance.new("Frame")
        switchBall.Parent = switchButton
        switchBall.BackgroundColor3 = Color3.fromRGB(230, 230, 250)
        switchBall.Size = UDim2.new(0, 30, 0, 30)
        switchBall.Position = UDim2.new(0, 5, 0.5, -15)
        switchBall.BorderSizePixel = 0

        local switchBallCorner = Instance.new("UICorner")
        switchBallCorner.Parent = switchBall
        switchBallCorner.CornerRadius = UDim.new(0.5, 0)

        return switchButton, switchBall
    end

    local function safeCreateSwitch(position, switchName)
    local success, button, ball = pcall(function() return createSwitchModel(MenuPanel, position, switchName) end)
    return success and button, ball or nil, nil
end

local switchButton1, switchBall1 = safeCreateSwitch(UDim2.new(0.3, 0, 0.1, 0), "Switch1")
local switchButton3, switchBall3 = safeCreateSwitch(UDim2.new(0.3, 0, 0.3, 0), "Switch3")
local switchButton5, switchBall5 = safeCreateSwitch(UDim2.new(0.3, 0, 0.5, 0), "Switch5")
local switchButton7, switchBall7 = safeCreateSwitch(UDim2.new(0.3, 0, 0.7, 0), "Switch7")
local switchButton8, switchBall8 = safeCreateSwitch(UDim2.new(0.77 , 0, 0.1, 0), "Switch8")
local switchButton9, switchBall9 = safeCreateSwitch(UDim2.new(0.77 , 0, 0.5, 0), "Switch9")
local switchButton10, switchBall10 = safeCreateSwitch(UDim2.new(0.77 , 0, 0.3, 0), "Switch10")


    local function SaveSwitchState(isActive, switchName)
    pcall(function()
        local SwitchInfo = {
            SwitchOn = isActive,
            LastModified = os.time()
        }
        writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode(SwitchInfo))
    end)
end

local function LoadSwitchState(switchName)
    local success, result = pcall(function()
        if isfile(switchName.."_SwitchState.json") then
            local fileContents = readfile(switchName.."_SwitchState.json")
            if fileContents then
                local switchData = game:GetService("HttpService"):JSONDecode(fileContents)
                if switchData and switchData.SwitchOn ~= nil then
                    return switchData.SwitchOn
                end
            end
        end
        return false
    end)

    if success then
        return result
    else
        return false
    end
end

local function toggleSwitch(isActive, switchBall)
    pcall(function()
        if isActive then
            switchBall.Position = UDim2.new(1, -35, 0.5, -15)
            switchBall.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            switchBall.Position = UDim2.new(0, 5, 0.5, -15)
            switchBall.BackgroundColor3 = Color3.fromRGB(255, 21, 0)
        end
    end)
end

    local function safeLoadSwitchState(switchName)
    local success, result = pcall(function() return LoadSwitchState(switchName) end)
    return success and result or false
end

local isLoop1Active = safeLoadSwitchState("Switch1")
local isLoop2Active = safeLoadSwitchState("Switch2")
local isLoop3Active = safeLoadSwitchState("Switch3")
local isLoop5Active = safeLoadSwitchState("Switch5")
local isLoop6Active = safeLoadSwitchState("Switch6")
local isLoop7Active = safeLoadSwitchState("Switch7")
local isLoop8Active = safeLoadSwitchState("Switch8")
local isLoop9Active = safeLoadSwitchState("Switch9")
local isloop10Active = safeLoadSwitchState("Switch10")


local player = game.Players.LocalPlayer

-- Attendre que tout soit prêt avant d'exécuter la suite
repeat task.wait() until player and player.Character and player.Character:FindFirstChild("HumanoidRootPart")
repeat task.wait() until game.ReplicatedStorage:FindFirstChild("Datas") and game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
repeat task.wait() until game.ReplicatedStorage:FindFirstChild("Package") and game.ReplicatedStorage.Package:FindFirstChild("Events")

local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events
local missions = {}

-- === LISTES DE MISSIONS === --

-- Missions par défaut (Rebirth >= 5000)
local default_missions_Earth = {
    { name = "X Fighter Trainer", bossName = "X Fighter", requiredValue = 0, endRange = 7200 },
    { name = "Kid Nohag", bossName = "Kid Nohag", requiredValue = 7201, endRange = 14000 },
    { name = "Radish", bossName = "Radish", requiredValue = 14001, endRange = 32000 },
    { name = "Mapa", bossName = "Mapa", requiredValue = 32000, endRange = 80000 },
    { name = "Vegetable(Saya Saga)", bossName = "Vegetable(Saya Saga)", requiredValue = 80000, endRange = 150000 },
    { name = "Lord Sloog", bossName = "Lord Sloog", requiredValue  = 150000  , endRange = 350000},
    { name = "Citizen", bossName = "Citizen", requiredValue = 350000 , endRange = 900000},
    { name = "Chilly", bossName = "Chilly", requiredValue = 900000, endRange = 2700000 },
    { name = "No. 17", bossName = "No. 17", requiredValue = 2700000, endRange = 5000000},
    { name = "Perfect Atom", bossName = "Perfect Atom", requiredValue = 5000000, endRange = 18000000},
    { name = "Z Broccoli", bossName = "Z Broccoli", requiredValue = 18000000, endRange = 45000000},
    { name = "Super Boo", bossName = "Super Boo", requiredValue = 45000000, endRange = 240000000},
    { name = "Kakata(SSJ)", bossName = "Kakata(SSJ)", requiredValue = 240000000, endRange = 600000000},
    { name = "Vills (1%)", bossName = "Vills (1%)", requiredValue = 600000000, endRange = 4000000000},
    { name = "Omega Shenlong", bossName = "Omega Shenlong", requiredValue = 4000000000, endRange = 14000000000},
    { name = "Gold Chilly", bossName = "Gold Chilly", requiredValue = 14000000000, endRange = 70000000000},
    { name = "Merged Zamas", bossName = "Merged Zamas", requiredValue = 70000000000, endRange = 450000000000},
    { name = "Broccoli", bossName = "Broccoli", requiredValue = 450000000000, endRange = math.huge},
    
}

local default_missions_Vills = {
    { name = "Jiran The Gray", bossName = "Jiran The Gray", requiredValue = 1200000000001, endRange = 6000000000000 },
    { name = "Vegetable (Ultra Ego)", bossName = "Vegetable (Ultra Ego)", requiredValue = 6000000000001 , endRange = 50000000000000},
    { name = "Black Chilly", bossName = "Black Chilly", requiredValue = 50000000000001 , endRange = 500000000000000 },
    { name = "Vills (True God of Destruction)", bossName = "Vills (True God of Destruction)", requiredValue = 10000000000000, endRange = 60000000000000 },
    { name = "Vis (Ultra Instinct)", bossName = "Vis (Ultra Instinct)", requiredValue = 500000000000001 , endRange = 1800000000000000 },
    { name = "Xicor", bossName = "Xicor", requiredValue = 1800000000000001 , endRange = 12000000000000000 },
    { name = "Wukong (SSJB3)", bossName = "Wukong (SSJB3)", requiredValue = 400000000000000001 , endRange = 1200000000000000000 },
    { name = "Kakata (Ego Instinct)", bossName = "Kakata (Ego Instinct)", requiredValue = 1200000000000000001 , endRange = math.huge }
}

-- Missions pour joueurs avec peu de Rebirths (Rebirth < 5000)
local low_rebirth_missions_Earth = {
    { name = "X Fighter Trainer", bossName = "X Fighter", requiredValue = 0, endRange = 7200 },
    { name = "Kid Nohag", bossName = "Kid Nohag", requiredValue = 7201, endRange = 14000 },
    { name = "Radish", bossName = "Radish", requiredValue = 14001, endRange = 32000 },
    { name = "Mapa", bossName = "Mapa", requiredValue = 32000, endRange = 80000 },
    { name = "Vegetable(Saya Saga)", bossName = "Vegetable(Saya Saga)", requiredValue = 80000, endRange = 150000 },
    { name = "Lord Sloog", bossName = "Lord Sloog", requiredValue  = 150000  , endRange = 350000},
    { name = "Citizen", bossName = "Citizen", requiredValue = 350000 , endRange = 900000},
    { name = "Chilly", bossName = "Chilly", requiredValue = 900000, endRange = 2700000 },
    { name = "No. 17", bossName = "No. 17", requiredValue = 2700000, endRange = 5000000},
    { name = "Perfect Atom", bossName = "Perfect Atom", requiredValue = 5000000, endRange = 18000000},
    { name = "Z Broccoli", bossName = "Z Broccoli", requiredValue = 18000000, endRange = 45000000},
    { name = "Super Boo", bossName = "Super Boo", requiredValue = 45000000, endRange = 240000000},
    { name = "Kakata(SSJ)", bossName = "Kakata(SSJ)", requiredValue = 240000000, endRange = 600000000},
    { name = "Vills (1%)", bossName = "Vills (1%)", requiredValue = 600000000, endRange = 4000000000},
    { name = "Omega Shenlong", bossName = "Omega Shenlong", requiredValue = 4000000000, endRange = 14000000000},
    { name = "Gold Chilly", bossName = "Gold Chilly", requiredValue = 14000000000, endRange = 70000000000},
    { name = "Merged Zamas", bossName = "Merged Zamas", requiredValue = 70000000000, endRange = 450000000000},
    { name = "Broccoli", bossName = "Broccoli", requiredValue = 450000000000, endRange = math.huge},
}

local default_missions_Vills = {
    { name = "Jiran The Gray", bossName = "Jiran The Gray", requiredValue = 1200000000000, endRange = 6000000000000 },
    { name = "Vegetable (Ultra Ego)", bossName = "Vegetable (Ultra Ego)", requiredValue = 6000000000000 , endRange = 50000000000000},
    { name = "Black Chilly", bossName = "Black Chilly", requiredValue = 50000000000000 , endRange = 500000000000000 },
    { name = "Vills (True God of Destruction)", bossName = "Vills (True God of Destruction)", requiredValue = 10000000000000, endRange = 60000000000000 },
    { name = "Vis (Ultra Instinct)", bossName = "Vis (Ultra Instinct)", requiredValue = 500000000000000 , endRange = 1800000000000000 },
    { name = "Xicor", bossName = "Xicor", requiredValue = 1800000000000000 , endRange = 12000000000000000 },
    { name = "Wukong (SSJB3)", bossName = "Wukong (SSJB3)", requiredValue = 400000000000000000 , endRange = 1200000000000000000 },
    { name = "Kakata (Ego Instinct)", bossName = "Kakata (Ego Instinct)", requiredValue = 1200000000000000000 , endRange = math.huge }
}

-- === LOGIQUE DE SÉLECTION DES MISSIONS === --

local rebirths = data:FindFirstChild("Rebirth") and data.Rebirth.Value or 0
local useLowRebirthMissions = rebirths < 5000

if game.PlaceId == 3311165597 then
    missions = useLowRebirthMissions and low_rebirth_missions_Earth or default_missions_Earth
elseif game.PlaceId == 5151400895 then
    missions = useLowRebirthMissions and low_rebirth_missions_Vills or default_missions_Vills
else
    missions = {}
end



-- Le reste de ton code où tu utilises la liste `missions`
local SelectedQuest
local SelectedMob
local isDoingAlternateQuest = false

local function BossIsAlive(mobName)
    local boss = game.Workspace.Living:FindFirstChild(mobName)
    return boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0
end

local function getQuestByStat(stat)
    if not isLoop1Active then 
        return nil, nil, nil -- Arrête la fonction si isLoop1Active est false
    end
    
    local bestIndex = nil
    local closestRequiredValue = -math.huge

    for i, mission in ipairs(missions) do
        if mission.requiredValue <= stat and mission.requiredValue > closestRequiredValue then
            bestIndex = i
            closestRequiredValue = mission.requiredValue
        end
    end

    if bestIndex then
        local mission = missions[bestIndex]
        return mission.name, mission.bossName, bestIndex
    end

    return nil, nil, nil
end


local function assignQuest()
    if isLoop1Active then
        local lowestStat = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)

        local currentQuest, currentMob, questIndex = getQuestByStat(lowestStat)
        local previousQuest, previousMob = nil, nil

        -- Vérifie si une quête précédente existe
        if questIndex and questIndex > 1 then
            previousQuest = missions[questIndex - 1].name
            previousMob = missions[questIndex - 1].bossName
        end

        -- Si aucune quête n'est trouvée, avertir et quitter la fonction
        if not currentQuest then
            
            return
        end

        -- Si une quête alternative est activée et que le boss précédent est toujours vivant, on passe à la quête précédente
        if isDoingAlternateQuest and previousQuest and BossIsAlive(previousMob) then
            SelectedQuest = previousQuest
            SelectedMob = previousMob
            
        else
            -- Sinon, on passe à la quête principale
            SelectedQuest = currentQuest
            SelectedMob = currentMob
            isDoingAlternateQuest = not isDoingAlternateQuest
            
        end
    else
        
    end
end

local isTakingQuest = false

local function startMission()
    if not isLoop1Active or isTakingQuest then
        return
    end

    isTakingQuest = true

    pcall(function()
        local questValue = game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value

        -- Vérifie si la quête sélectionnée est déjà active
        if questValue == SelectedQuest then
            return
        end

        -- Recherche du NPC correspondant à la quête
        local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuest)
        if npc and npc:FindFirstChild("HumanoidRootPart") then
            task.wait(3)
            -- Téléporte le joueur devant le NPC
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            task.wait(0.1)
            
            -- Tente d'accepter la quête
            events.Qaction:InvokeServer(npc)
        else
            warn("NPC non trouvé pour la quête :", SelectedQuest)
        end
    end)

    -- Réinitialise le flag après un délai pour éviter les doubles prises
    task.wait(0.1)
    isTakingQuest = false
end


task.spawn(function()
    while true do
        task.wait()
        pcall(function()
            
            assignQuest()
            local questData = game:GetService("ReplicatedStorage").Datas:FindFirstChild(player.UserId)
            if questData and questData:FindFirstChild("Quest") and questData.Quest.Value == ""  then
                startMission()
            end
        end)
    end
end)


task.spawn(function()
    while true do
        task.wait()
        local success, err = pcall(function()
            if data.Strength.Value < 120000001 and game.PlaceId ~= 3311165597 and isLoop9Active then
                local A_1 = "Earth"
                local Event = events.TP
                if game.PlaceId ~= 3311165597 then
                    Event:InvokeServer(A_1)
                    
                    task.wait(8)
                end
            elseif data.Strength.Value >= 120000001  and game.PlaceId ~= 5151400895 and isLoop9Active then
                local A_1 = "Vills Planet"
                local Event = events.TP
                if game.PlaceId ~= 5151400895 then
                    Event:InvokeServer(A_1)
                    
                    task.wait(8)
                end
            end
        end)

        if not success then
            
        end
    end
end)



local function getObj(path)
    local current = game
    for _, name in ipairs(path) do
        current = current:FindFirstChild(name)
        if not current then
            warn("Missing:", name)
            return nil
        end
    end
    return current
end

local targets = {
    {"ReplicatedStorage", "Remote", "DetectAntiCheat"},
}

for _, path in ipairs(targets) do
    local obj = getObj(path)
    if obj then
        obj:Destroy()
    end
end







local events = game:GetService("ReplicatedStorage").Package.Events
task.spawn(function()
    while true do
        task.wait(51) -- Attente aléatoire entre 0 et 0.1 seconde
        if isLoop5Active then
            local success, err = pcall(function()
                game:GetService("ReplicatedStorage").Package.Events.d:InvokeServer(true)
            end)
            if not success then
                
            end
        end
    end
end)





local player = game:GetService("Players").LocalPlayer
local targetted = player.Name
local events = game:GetService("ReplicatedStorage").Package.Events
local datas = game:GetService("ReplicatedStorage").Datas

task.spawn(function()
	while true do
		pcall(function()
			local targetPlayer = game.Workspace.Living:FindFirstChild(targetted)
			local questData = datas:FindFirstChild(player.UserId)

			if targetPlayer and questData and questData:FindFirstChild("Quest") then
				-- Tant que le joueur est vivant
				while game.Workspace.Living:FindFirstChild(targetted) do
					local isQuestEmpty = (questData.Quest.Value == "")
					pcall(function()
						events.cha:InvokeServer(isQuestEmpty, "Blacknwhite27")
					end)
					task.wait(0.1)
				end
			end
		end)
		task.wait(0.5)
	end
end)






local function safeBossHandler()
    local success, err = pcall(function()
        -- Vérification des prérequis
        if not missions or #missions == 0 then return end
        if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
        if not data or not data:FindFirstChild("Quest") then return end

        local mission = data.Quest.Value
        local bossName

        -- Détermination du boss à partir de la mission
        for _, quest in ipairs(missions) do
            if quest.name == mission then
                bossName = quest.bossName
                break
            end
        end

        if not bossName then return end

        local bossCount = 0

        -- Recherche des boss vivants correspondants
        for _, boss in ipairs(game.Workspace.Living:GetChildren()) do
            if boss.Name == bossName and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                bossCount += 1

                -- Active le blocage
                if player:FindFirstChild("Status") and player.Status:FindFirstChild("Blocking") then
                    player.Status.Blocking.Value = true
                end

                -- Positionnement derrière le boss
                local behindPosition = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                player.Character.HumanoidRootPart.CFrame = behindPosition
            end
        end

        -- Traitements si besoin selon bossCount
        if bossCount == 0 then
            -- Aucun boss en vie, possibilité d'attendre ou passer à autre chose
        else
            -- Boss trouvé, actions possibles ici
        end
    end)

    if not success then
        warn("Erreur dans safeBossHandler:", err)
    end
end

-- Boucle sécurisée sans récursion directe
task.spawn(function()
    while true do
        safeBossHandler()
        task.wait(0.4)
    end
end)



task.spawn(function()
	while true do
		task.wait(0.3)

		if isLoop10Active then
			pcall(function()
				local PaidForms = {
                'True SSJG','Blanco','CSSJB3','SSJ6','SSJB4','SSJR4','LSSJ5','True God of Creation','True God of Destruction','CSSJB2','CSSJB','Super Broly',
                'LSSJB','False God of Destruction','False God of Creation','SSJG4','LSSJ4','LSSJ3','Mystic Kaioken','LSSJ2','LSSJ Kaioken','SSJ2 Kaioken'


				}

				local player = game:GetService("Players").LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()
                local rs = game:GetService("ReplicatedStorage").Package.Events

				-- Si on meurt, on attend le respawn du perso
				if not character:FindFirstChild("Stats") then
					character = player.CharacterAdded:Wait()
					character:WaitForChild("Stats")
				end

				local stats = character:FindFirstChild("Stats")
				local status = player:WaitForChild("Status")

				if stats and stats:FindFirstChild("Strength") and stats.Strength.Value > 5000
					and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value > 5000 then

					local current = status.Transformation.Value
					local best

					for _, form in ipairs(PaidForms) do
						if rs.equipskill:InvokeServer(form) then
							best = form
							break
						end
					end

					if best and best ~= current then
						if current ~= "" then
							rs.Higoobera:InvokeServer()
							task.wait()
						end
						rs.equipskill:InvokeServer(best)
						task.wait()
						if status.Transformation.Value == best then
							rs.Higoober:InvokeServer()
						end
					elseif best == current and not status.Transforming.Value then
						rs.Higoober:InvokeServer()
					end
				end
			end)
		end
	end
end)



task.spawn(function()
	while true do
		task.wait(0.6)
		if isLoop8Active then
			pcall(function()
				local Forms = {
                    'Ego Instinct','SSJR3','SSJB3','SSJ5','Divine Rose Prominence','Divine Blue','God of Destruction','God of Creation',
                    'Beast','Ultra Ego','Mastered Ultra Instinct','SSJR2','SSJB2','Ultra Instinct Omen','Evil SSJ','Blue Evolution',
					'Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose','SSJB Kaioken','SSJ Rose','SSJ Blue','Corrupt SSJ',
					'SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'
				}

				local rs = game:GetService("ReplicatedStorage").Package.Events
				local player = game:GetService("Players").LocalPlayer
				local character = player.Character or player.CharacterAdded:Wait()

				-- Si on meurt, on attend le respawn du perso
				if not character:FindFirstChild("Stats") then
					character = player.CharacterAdded:Wait()
					character:WaitForChild("Stats")
				end

				local stats = character:FindFirstChild("Stats")
				local status = player:WaitForChild("Status")

				if stats and stats:FindFirstChild("Strength") and stats.Strength.Value > 5000
					and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value > 5000 then

					local current = status.Transformation.Value
					local best

					for _, form in ipairs(Forms) do
						if rs.equipskill:InvokeServer(form) then
							best = form
							break
						end
					end

					if best and best ~= current then
						if current ~= "" then
							rs.Higoober:InvokeServer()
							task.wait()
						end
						rs.equipskill:InvokeServer(best)
						task.wait()
						if status.Transformation.Value == best then
							rs.Higoober:InvokeServer()
						end
					elseif best == current and not status.Transforming.Value then
						rs.Higoober:InvokeServer()
					end
				end
			end)
		end
	end
end)




pcall(function()
    if isloop3Active then
    if lplr.PlayerGui:FindFirstChild("Start") then
        ReplicatedStorage.Package.Events.Start:InvokeServer()

        if Workspace.Others:FindFirstChild("Title") then
            Workspace.Others.Title:Destroy()
        end

        local cam = Workspace.CurrentCamera
        cam.CameraType = Enum.CameraType.Custom
        cam.CameraSubject = lplr.Character.Humanoid

        _G.Ready = true
        game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)

        lplr.PlayerGui.Main.Enabled = true

        if lplr.PlayerGui:FindFirstChild("Start") then
            lplr.PlayerGui.Start:Destroy()
        end

        pcall(function()
            lplr.PlayerGui.Main.bruh.Enabled = false
        end)
        pcall(function()
            lplr.PlayerGui.Main.bruh.Enabled = true
        end)
    end
end
end)




task.spawn(function()
	while true do
		task.wait(0.7)

		if not isLoop7Active then
			continue
		end

		local lplr = game.Players.LocalPlayer
		local character = lplr.Character
		if not character then continue end

		local stats = character:FindFirstChild("Stats")
		local humanoid = character:FindFirstChild("Humanoid")
		if not stats or not humanoid then continue end
		if humanoid.Health <= 0 then continue end 

		local Ki = stats:FindFirstChild("Ki")
		if not Ki then continue end

		for _, player in ipairs(game.Players:GetPlayers()) do
			local ldata = game.ReplicatedStorage.Datas:FindFirstChild(player.UserId)
			if not ldata or not ldata:FindFirstChild("Quest") then continue end

			if ldata.Quest.Value ~= ""
				and ldata:FindFirstChild("Strength") and ldata.Strength.Value > 400000
				and ldata:FindFirstChild("Energy") and ldata.Energy.Value > 400000
				and ldata:FindFirstChild("Defense") and ldata.Defense.Value > 400000
				and ldata:FindFirstChild("Speed") and ldata.Speed.Value > 400000
			then
				local playerChar = player.Character
				local hrp = playerChar and playerChar:FindFirstChild("HumanoidRootPart")
				if not hrp then continue end

				local closestBoss, closestDistance = nil, math.huge
				for _, v in ipairs(game.Workspace.Living:GetChildren()) do
					if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
						local dist = (hrp.Position - v.HumanoidRootPart.Position).Magnitude
						if dist < closestDistance and v.Humanoid.Health > 0 and v.Name ~= playerChar.Name then
							closestDistance, closestBoss = dist, v
						end
					end
				end

				if closestBoss and closestDistance <= 5 and closestBoss.Humanoid.Health > 0 then
					local attacks = {
						"Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick",
						"Wolf Fang Fist", "High Power Rush", "Meteor Strike", "Meteor Charge",
						function()
							game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {
								FaceMouse = false,
								MouseHit = CFrame.new()
							}, "Blacknwhite27")
						end
					}

					for _, attack in ipairs(attacks) do
						task.spawn(function()
							if typeof(attack) == "string" then
								game.ReplicatedStorage.Package.Events.mel:InvokeServer(attack, "Blacknwhite27")
							elseif typeof(attack) == "function" then
								attack()
							end
						end)
					end
				end
			end
		end
	end
end)




local player = game.Players.LocalPlayer
local datas = game:GetService("ReplicatedStorage"):WaitForChild("Datas")
local events = game:GetService("ReplicatedStorage"):WaitForChild("Package"):WaitForChild("Events")

local function safePunchLoop()
    -- Lancer une boucle dans une tâche deferred
    task.defer(function()
        pcall(function()
            local ldata = datas:FindFirstChild(player.UserId)
            if ldata and ldata:FindFirstChild("Quest") and ldata.Quest.Value ~= "" then
                -- Effectuer des actions dans l'event FireServer
                events.p:FireServer("Blacknwhite27", 1)
                events.p:FireServer("Blacknwhite27", 2)
            end
        end)
        
        -- Attendre 0.6 secondes avant de relancer la boucle
        task.wait(0.6)
        -- Relancer la fonction après 0.6 secondes
        safePunchLoop()
    end)
end



switchButton1.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop1Active = not isLoop1Active
                toggleSwitch(isLoop1Active, switchBall1)
                SaveSwitchState(isLoop1Active, "Switch1")
            end)
        end)
        
        switchButton3.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop3Active = not isLoop3Active
                toggleSwitch(isLoop3Active, switchBall3)
                SaveSwitchState(isLoop3Active, "Switch3")
            end)
        end)
        
        switchButton5.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop5Active = not isLoop5Active
                toggleSwitch(isLoop5Active, switchBall5)
                SaveSwitchState(isLoop5Active, "Switch5")
            end)
        end)
        
        switchButton7.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop7Active = not isLoop7Active
                toggleSwitch(isLoop7Active, switchBall7)
                SaveSwitchState(isLoop7Active, "Switch7")
            end)
        end)
        
        switchButton8.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop8Active = not isLoop8Active
                toggleSwitch(isLoop8Active, switchBall8)
                SaveSwitchState(isLoop8Active, "Switch8")
            end)
        end)
        
        switchButton9.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop9Active = not isLoop9Active
                toggleSwitch(isLoop9Active, switchBall9)
                SaveSwitchState(isLoop9Active, "Switch9")
            end)
        end)

        switchButton10.MouseButton1Click:Connect(function()
            pcall(function()
                isLoop10Active = not isLoop10Active
                toggleSwitch(isLoop10Active, switchBall10)
                SaveSwitchState(isLoop10Active, "Switch10")
            end)
        end)
        
        -- Assure-toi que les valeurs initiales sont définies pour chaque variable
        toggleSwitch(isLoop1Active, switchBall1)
        toggleSwitch(isLoop3Active, switchBall3)
        toggleSwitch(isLoop5Active, switchBall5)
        toggleSwitch(isLoop7Active, switchBall7)
        toggleSwitch(isLoop8Active, switchBall8)
        toggleSwitch(isLoop9Active, switchBall9)
        toggleSwitch(isLoop10Active, switchBall10)
    
end
initSwitches(MenuPanel)
MainButton.MouseButton1Click:Connect(function()
    pcall(togglePanel)
end)
