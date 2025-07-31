wait(0.5)
local MenuPanel = game.CoreGui:FindFirstChild("SB team")
local playerCount = game.Players:GetPlayers()

pcall(function()
    if MenuPanel then
        return  
    end

    if playerCount > 3 then
        pcall(function()
            if MenuPanel then
                MenuPanel:Destroy()
            end
        end)
        wait(0.5)
        pcall(function()
            game:Shutdown()
        end)
        return  
    end

    if playerCount > 1 then
        pcall(function()
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
        end)
    end
end)


local success, fail = pcall(function()
    local player = game.Players.LocalPlayer
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local HttpService = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")
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
    local Stats = game:GetService("Stats")
    local RunService = game:GetService("RunService")
    local pingTextLabel = Instance.new("TextLabel")
    local fpsTextLabel = Instance.new("TextLabel")
    local missionTextLabel = Instance.new("TextLabel")
    local timeTextLabel = Instance.new("TextLabel")
    local button = Instance.new("TextButton", screenGui)
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
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "CustomGui"
gui.ResetOnSpawn = false

-- Main frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 180, 0, 300)
main.Position = UDim2.new(0, 50, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(15, 20, 40)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.AnchorPoint = Vector2.new(0, 0)
main.BackgroundTransparency = 0.1
main.Name = "MainFrame"

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- Rainbow outline
local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Color = Color3.fromRGB(255, 0, 0)

-- Arc-en-ciel anim
task.spawn(function()
    local hue = 0
    while true do
        hue = (hue + 0.01) % 1
        stroke.Color = Color3.fromHSV(hue, 1, 1)
        task.wait(0.05)
    end
end)

-- Drag and drop setup
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

-- En-tête avec SB Team et V3
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 40)
header.BackgroundColor3 = Color3.fromRGB(15, 20, 40)
header.BorderSizePixel = 0

Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

-- SB Team label
local sbTeamLabel = Instance.new("TextLabel", header)
sbTeamLabel.Parent = header
sbTeamLabel.BackgroundColor3 = Color3.fromRGB(15, 20, 40)
sbTeamLabel.BorderSizePixel = 0
sbTeamLabel.Position = UDim2.new(0, 10, 0, 0)
sbTeamLabel.Size = UDim2.new(0.5, 0, 1, 0)
sbTeamLabel.Font = Enum.Font.GothamBold
sbTeamLabel.Text = "SB Team"
sbTeamLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
sbTeamLabel.TextSize = 18
sbTeamLabel.TextScaled = true
sbTeamLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
sbTeamLabel.TextStrokeTransparency = 0.5
sbTeamLabel.Active = true
sbTeamLabel.Draggable = true

-- V3 label
local v3Label = Instance.new("TextLabel", header)
v3Label.Parent = header
v3Label.BackgroundColor3 = Color3.fromRGB(15, 20, 40)
v3Label.BorderSizePixel = 0
v3Label.Position = UDim2.new(0.5, 0, 0, 0)
v3Label.Size = UDim2.new(0.5, 0, 1, 0)
v3Label.Font = Enum.Font.GothamBold
v3Label.Text = "V3"
v3Label.TextColor3 = Color3.fromRGB(255, 255, 255)
v3Label.TextSize = 18
v3Label.TextScaled = true
v3Label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
v3Label.TextStrokeTransparency = 0.5
v3Label.Active = true
v3Label.Draggable = true

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Scrolling frame
local scrollingFrame = Instance.new("ScrollingFrame", main)
scrollingFrame.Size = UDim2.new(1, -20, 1, -40)  -- 40px réservé pour l'en-tête
scrollingFrame.Position = UDim2.new(0, 10, 0, 40)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 8

-- Ajouter une barre d'indicateur de défilement sur le côté
local scrollbarIndicator = Instance.new("Frame", main)
scrollbarIndicator.Size = UDim2.new(0, 8, 1, -40)  -- Barre sur le côté droit, en prenant la hauteur de l'écran
scrollbarIndicator.Position = UDim2.new(1, -18, 0, 40)
scrollbarIndicator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
scrollbarIndicator.BorderSizePixel = 0

local UIListLayout = Instance.new("UIListLayout", scrollingFrame)
UIListLayout.Padding = UDim.new(0, 10)

-- Options
local options = {
    "Auto\nFarm",
    "Auto\nForm",
    "Form|Vip",
    "Tp|Planet",
    "Reb|Stats",
    "Reset\nServer",
    "Oozaru/GB"
}

local toggles = {}

-- Fonction pour changer la couleur des boutons
local function toggleSwitch(status, isActive)
    status.BackgroundColor3 = isActive and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 50, 50)  -- Vert quand activé, Rouge quand désactivé
end

for i, name in ipairs(options) do
    local buttonFrame = Instance.new("TextButton", scrollingFrame)
    buttonFrame.Size = UDim2.new(1, -20, 0, 40)
    buttonFrame.Position = UDim2.new(0, 10, 0, (i - 1) * 42 + 10)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Text = ""
    buttonFrame.AutoButtonColor = false

    local label = Instance.new("TextLabel", buttonFrame)
    label.Size = UDim2.new(0.8, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.Font = Enum.Font.GothamBlack
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(255, 80, 100)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextWrapped = true

    local status = Instance.new("Frame", buttonFrame)
    status.Size = UDim2.new(0, 20, 0, 20)
    status.Position = UDim2.new(1, -25, 0.5, -10)
    status.BackgroundColor3 = Color3.fromRGB(255, 50, 50)  -- Rouge pour désactivé
    Instance.new("UICorner", status).CornerRadius = UDim.new(1, 0)

    -- Effet de survol
    local glow = Instance.new("UIStroke", label)
    glow.Thickness = 0
    glow.Color = Color3.fromRGB(255, 255, 255)

    buttonFrame.MouseEnter:Connect(function()
        glow.Thickness = 1
    end)

    buttonFrame.MouseLeave:Connect(function()
        glow.Thickness = 0
    end)

    -- Initialisation du bouton comme désactivé (donc rouge)
    toggles[name] = false

    buttonFrame.MouseButton1Click:Connect(function()
        toggles[name] = not toggles[name]
        toggleSwitch(status, toggles[name])

        if toggles[name] then
            startLoop(name)  -- Lance la boucle
        else
            stopLoop(name)  -- Arrête la boucle
        end
        print(name .. " toggle ->", toggles[name])
    end)
end

-- Met à jour l'indicateur de défilement en fonction du défilement
scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
    local scrollPosition = scrollingFrame.CanvasPosition.Y
    local canvasHeight = scrollingFrame.CanvasSize.Y.Offset
    local frameHeight = scrollingFrame.AbsoluteSize.Y
    local scrollIndicatorHeight = frameHeight / canvasHeight
    scrollbarIndicator.Size = UDim2.new(0, 8, 0, scrollIndicatorHeight * frameHeight)
    scrollbarIndicator.Position = UDim2.new(1, -18, 0, 40 + (scrollPosition / (canvasHeight - frameHeight)) * (frameHeight - scrollbarIndicator.Size.Y.Offset))
end)

-- Mise à jour dynamique de la CanvasSize pour permettre le défilement
game:GetService("RunService").Heartbeat:Connect(function()
    local totalHeight = #options * 42 + 10  -- Calcul de la hauteur totale des éléments
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end)




ballFrame.Size = UDim2.new(0.01592638372826266, 0, 0.22392638372826266, 0) -- Tamaño de la bola
ballFrame.Position = UDim2.new(0.9796319186413133, 0, 0.7796319186413133, 0) -- Centro de la pantalla
ballFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Amarillo brillante
ballFrame.BackgroundTransparency = 1 -- Totalmente opaco
ballFrame.Parent = TextLabel 

corner.CornerRadius = UDim.new(0.9, 0)
corner.Parent = ballFrame





local TweenService = game:GetService("TweenService")
local colorChangeTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 5
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
        warn("Error al guardar el estado del menú: " .. tostring(err))
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
        warn("Error al guardar el estado del menú: " .. tostring(err))
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
        warn("Error al cargar el estado del menú: " .. tostring(result))
        return false
    end

    return result
end

menuExpanded = LoadMenuState()
MenuPanel.Visible = menuExpanded

pcall(function()
    if menuExpanded then
        MenuPanel.Size = expandSize
        MinimizeButton.Text = "-"
    else
        MenuPanel.Size = contractSize
        MinimizeButton.Text = "+"
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    local success, err = pcall(function()
        if menuExpanded then
            contractTween:Play()
            MinimizeButton.Text = "+"
            sound:Play()
            wait()
            MenuPanel.Visible = false
        else
            MenuPanel.Visible = true
            expandTween:Play()
            MinimizeButton.Text = "-"
            sound:Play()
        end
        menuExpanded = not menuExpanded
        SaveMenuState(menuExpanded)
    end)

    if not success then
        warn("Error al minimizar/expandir el menú: " .. tostring(err))
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
            switchBall.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
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

    local function loop1()
        pcall(function()                     
        local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events

local missions = {
    { name = "X Fighter Trainer", bossName = "X Fighter", requiredValue = 0, endRange = 20000 },
    { name = "Kid Nohag", bossName = "Kid Nohag", requiredValue = 20001, endRange = 100000 },
    { name = "Radish", bossName = "Radish", requiredValue = 100001, endRange = 3500000 },
    { name = "Perfect Atom", bossName = "Perfect Atom", requiredValue = 3500001, endRange = 10000000 },
    { name = "SSJB Wukong", bossName = "SSJB Wukong", requiredValue = 10000001, endRange = 56300000 },
    { name = "Broccoli", bossName = "Broccoli", requiredValue = 56300001, endRange = 400000000 },
    { name = "SSJG Kakata", bossName = "SSJG Kakata", requiredValue = 400000001, endRange = 2000000000 },
    { name = "Wukong (LBSSJ4)", bossName = "Wukong (LBSSJ4)", requiredValue = 2000000001, endRange = 4200000000 },
    { name = "Vekuta (LBSSJ4)", bossName = "Vekuta (LBSSJ4)", requiredValue = 3200000001, endRange = 4000000000 },
    { name = "Wukong Rose", bossName = "Wukong Rose", requiredValue = 4000000001, endRange = 4500000001 },
    { name = "Vekuta (SSJBUI)", bossName = "Vekuta (SSJBUI)", requiredValue = 4500000001, endRange = math.huge },
}

local SelectedQuest
local SelectedMob
local isDoingAlternateQuest = false

local function BossIsAlive(mobName)
    local boss = game.Workspace.Living:FindFirstChild(mobName)
    return boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0
end

local function getQuestByStat(stat)
    for i, mission in ipairs(missions) do
        if stat >= mission.requiredValue and stat <= mission.endRange then
            return mission.name, mission.bossName, i
        end
    end
    return nil, nil, nil
end

local function assignQuest()
    local lowestStat = math.min(data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value)

    local currentQuest, currentMob, questIndex = getQuestByStat(lowestStat)
    local previousQuest, previousMob = nil, nil

    if questIndex and questIndex > 1 then
        previousQuest = missions[questIndex - 1].name
        previousMob = missions[questIndex - 1].bossName
    end

    if not currentQuest then
        warn("[INFO] Aucune quête disponible pour cette stat.")
        return
    end

    if isDoingAlternateQuest and previousQuest and BossIsAlive(previousMob) then
        SelectedQuest = previousQuest
        SelectedMob = previousMob
        warn("[INFO] Passage à la quête précédente : " .. previousQuest)
    else
        SelectedQuest = currentQuest
        SelectedMob = currentMob
        isDoingAlternateQuest = not isDoingAlternateQuest
        warn("[INFO] Passage à la quête principale : " .. currentQuest)
    end
end

local isTakingQuest = false

local function startMission()
    if isTakingQuest then return end
    isTakingQuest = true

    pcall(function()
        local questValue = game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value

        if questValue == SelectedQuest then
            isTakingQuest = false
            return
        end

        local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuest)
        if npc and npc:FindFirstChild("HumanoidRootPart") and isLoop1Active then
            player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            task.wait()
            events.Qaction:InvokeServer(npc)
            warn("[INFO] Quête acceptée : " .. SelectedQuest)
        end
    end)

    task.wait()
    isTakingQuest = false
end

task.spawn(function()
    while true do
        task.wait()
        pcall(function()
            assignQuest()
            if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == "" then
                startMission()
            end
        end)
    end
end)


task.spawn(function()
    while true do
        task.wait(0.5)
        local success, fallo = pcall(function()
            -- Si la puissance est inférieure à 2 milliards, téléporter vers Earth
            if data.Strength.Value < 2000000000 and game.PlaceId ~= 3311165597 then
                local A_1 = "Earth"
                local Event = events.TP
                if game.PlaceId ~= 3311165597 then  -- Vérifier si on est déjà sur Earth
                    Event:InvokeServer(A_1)
                    print("Teleporting to Earth")
                end
                task.wait()  -- Attendre 8 secondes avant de réévaluer
            -- Si la puissance est supérieure ou égale à 2 milliards, téléporter vers Vills Planet
            elseif data.Strength.Value >= 200000000 and game.PlaceId ~= 5151400895 then
                local A_1 = "Vills Planet"
                local Event = events.TP
                if game.PlaceId ~= 5151400895 then  -- Vérifier si on est déjà sur Vills Planet
                    Event:InvokeServer(A_1)
                    print("Teleporting to Vills Planet")
                end
                task.wait()  -- Attendre 8 secondes avant de réévaluer
            end
        end)

        if not success then
            warn("Error executing teleportation: " .. fallo)
        end
    end
end)


task.spawn(function()
    while true do
        task.wait(1)
        if isLoop5Active then
            local success, fallo = pcall(function()
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end)

            if not success then
                warn("Error al invocar el evento rebirth: " .. fallo)
            end
        end
    end
end)


spawn(function()
    while wait() do
        pcall(function()
            if game.Workspace.Living:FindFirstChild(targetted) then
                repeat
                    events.cha:InvokeServer("Blacknwhite27")
                until false
            end
        end)
    end
end)


task.spawn(function()
    while true do
        task.wait()
        task.spawn(function()
            local player = game.Players.LocalPlayer
            local data = game.ReplicatedStorage.Datas[player.UserId]
            local mission = data.Quest.Value

            -- Vérifier que le joueur existe bien
            if not player or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
                warn("⚠️ ERREUR: Le joueur ou son HumanoidRootPart est introuvable !")
                return
            end

            -- Trouver le bon nom du boss à partir de la mission
            local bossName
            for _, quest in ipairs(missions) do
                if quest.name == mission then
                    bossName = quest.bossName
                    break
                end
            end

            if not bossName then
                warn("⚠️ Aucun boss correspondant trouvé pour la mission:", mission)
                return
            end

            -- Trouver tous les boss avec le bon nom
            local bossCount = 0
            for _, boss in ipairs(game.Workspace.Living:GetChildren()) do
                if boss.Name == bossName and boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    bossCount = bossCount + 1
                    player.Status.Blocking.Value = false  

                    -- Position fixe derrière le boss (0, 0, 4)
                    local enemyHRP = boss.HumanoidRootPart
                    local behindPosition = enemyHRP.CFrame * CFrame.new(0, 0, 4)

                    -- Téléporter le joueur et afficher les informations
                    player.Character.HumanoidRootPart.CFrame = behindPosition
                    warn("✅ Joueur téléporté derrière le boss:", boss.Name, " | Position:", behindPosition.Position)

                    task.wait() -- Attendre un peu avant de passer au suivant
                end
            end

            -- Vérifier si des boss ont été trouvés
            if bossCount == 0 then
                warn("⚠️ Aucun boss trouvé avec le nom:", bossName)
            else
                warn("✅ Nombre total de boss traités:", bossCount)
            end
        end)
    end
end)


local player = game.Players.LocalPlayer

local function enableZeroGravity(character)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local zeroGravity = Instance.new("BodyForce")
    zeroGravity.Force = Vector3.new(0, workspace.Gravity * humanoidRootPart.AssemblyMass, 0)
    zeroGravity.Parent = humanoidRootPart
end

local function onCharacterAdded(character)
    -- Attendre que le personnage respawn et se charger
    character:WaitForChild("Humanoid")
    
    -- Appliquer l'effet de gravité zéro
    enableZeroGravity(character)
    
    -- Réactiver l'effet de gravité zéro quand le personnage meurt
    character:WaitForChild("Humanoid").Died:Connect(function()
        enableZeroGravity(character)
    end)
end

-- Connecter l'événement CharacterAdded pour réagir au respawn
player.CharacterAdded:Connect(onCharacterAdded)

-- Si le joueur est déjà en jeu, on active immédiatement l'effet
if player.Character then
    onCharacterAdded(player.Character)
end



task.spawn(function()
    while true do
        local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(tostring(game.Players.LocalPlayer.UserId))

        if ldata.Quest.Value ~= "" then
        game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
            game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
            game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)           
        end

        task.wait(0.2)
    end
end)
            task.wait(0.2)
        end)
    end

   local function loop2()
        while true do
            if isLoop2Active then
    local lplr = game.Players.LocalPlayer
    local ldata = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

    local function format_number(number)
        local suffixes = {"", "K", "M", "B", "T", "QD"}
        local suffix_index = 1

        while math.abs(number) >= 1000 and suffix_index < #suffixes do
            number = number / 1000.0
            suffix_index = suffix_index + 1
        end

        return suffix_index > 1 and string.format("%.1f%s", number, suffixes[suffix_index]) or tostring(number)
    end

local function updateStatsGui()
    local success, err = pcall(function()
        local MainFrame = lplr.PlayerGui:WaitForChild("Main"):WaitForChild("MainFrame")
        local StatsFrame = MainFrame:WaitForChild("Frames"):WaitForChild("Stats")
        local ZeniLabel = MainFrame.Indicator:FindFirstChild("Zeni")
        local Bars = MainFrame:WaitForChild("Bars")
        local HPText = Bars.Health:FindFirstChild("TextLabel")
        local EnergyText = Bars.Energy:FindFirstChild("TextLabel")

        local health = lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.Health or 0
        local maxHealth = lplr.Character and lplr.Character:FindFirstChild("Humanoid") and lplr.Character.Humanoid.MaxHealth or 0
        local ki = lplr.Character and lplr.Character:FindFirstChild("Stats") and lplr.Character.Stats.Ki.Value or 0
        local maxKi = lplr.Character and lplr.Character:FindFirstChild("Stats") and lplr.Character.Stats.Ki.MaxValue or 0

        pcall(function()
            HPText.Text = "HEALTH " .. format_number(health) .. " / " .. format_number(maxHealth)
        end)
        pcall(function()
            EnergyText.Text = "ENERGY: " .. format_number(ki) .. " / " .. format_number(maxKi)
        end)
        pcall(function()
            ZeniLabel.Text = format_number(ldata.Zeni.Value) .. " Zeni"
        end)

        for _, stat in pairs({"Strength", "Speed", "Defense", "Energy"}) do
            local statLabel = StatsFrame:FindFirstChild(stat)
            if statLabel then
                pcall(function()
                    statLabel.Text = stat .. ": " .. format_number(ldata[stat].Value)
                end)
            end
        end
    end)

    if not success then
        warn("Error al actualizar GUI de estadísticas:", err)
    end
end

pcall(function()
    updateStatsGui()
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if lplr.Character and lplr.Character:FindFirstChild("Humanoid") and isLoop2Active then
        pcall(function()
            updateStatsGui()
        end)
    end
end)
            end
            task.wait(.5)
        end
    end

    local function loop3()
        pcall(function()
            task.spawn(function()
                while true do
                    task.wait()
    
                    local success, fallo = pcall(function()
                        local Forms = {'Ego Instinct','Divine Blue','Divine Rose Prominence','Astral Instinct','Ultra Ego','SSJB4','True God of Creation','True God of Destruction','Super Broly', 
                                       'LSSJG','LSSJ4','SSJG4','LSSJ3','Mystic Kaioken','LSSJ Kaioken','SSJR3','SSJB3','God Of Destruction','God Of Creation',
                                       'Jiren Ultra Instinct', 'Mastered Ultra Instinct','Godly SSJ2', 'Ultra Instinct Omen', 'Evil SSJ','Blue Evolution',
                                       'Dark Rose','Kefla SSJ2','SSJ Berserker','True Rose', 'SSJB Kaioken','SSJ Rose', 'SSJ Blue','Corrupt SSJ',
                                       'SSJ Rage','SSJG','SSJ4','Mystic','LSSJ','SSJ3','Spirit SSJ','SSJ2 Majin','SSJ2','SSJ Kaioken','SSJ','FSSJ','Kaioken'}
    
                        local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
                        local taRemote = game:GetService("ReplicatedStorage").Package.Events.ta
                        local player = game:GetService("Players").LocalPlayer
                        local stats = player.Character:WaitForChild("Stats")
    
                        -- Vérification des stats pour autoriser la transformation
                        if stats.Strength.Value > 5000 and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value > 5000 then
                            local currentTransfo = player.Status.Transformation.Value
                            local bestTransfo = nil
    
                            -- Trouver la meilleure transformation disponible selon les stats
                            for _, v in ipairs(Forms) do
                                if equipRemote:InvokeServer(v) then
                                    bestTransfo = v
                                    break
                                end
                            end
    
                            -- Vérifier si une meilleure transformation est disponible
                            if bestTransfo and bestTransfo ~= currentTransfo then
                                -- Vérifie si le joueur est déjà transformé avant de se détransformer
                                if currentTransfo ~= "" then
                                    taRemote:InvokeServer() -- Se détransformer
                                    task.wait()
                                end
    
                                -- Équiper la nouvelle transformation
                                equipRemote:InvokeServer(bestTransfo)
                                task.wait()
    
                                -- Vérifier si l'équipement a fonctionné avant de tenter de se transformer
                                if player.Status.Transformation.Value == bestTransfo then
                                    taRemote:InvokeServer() -- Se transformer avec la nouvelle transformation
                                else
                                    warn("Échec de l'équipement de la transformation : " .. tostring(bestTransfo))
                                end
                            end
                        end
                    end)
    
                    if not success then
                        warn(fallo)
                    end
                end
            end)
        end)
    end
    
    
    


    local function loop5()
        while true do
            pcall(function()
                if isLoop3Active then
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local lplr = Players.LocalPlayer

pcall(function()
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
end)
                    local s = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Quest
s.Visible = false
s.Position = UDim2.new(0.01, 0, 0.4, 0)

spawn(function()
    while true do
        local success, err = pcall(function()
            s.Position = UDim2.new(2, 0, 0, 0)
            task.wait(0.4)
        end)

        if not success then
            warn("Error en loop5: " .. err)
        end
        task.wait()
    end
end)
                end
            end)
            task.wait(1)
        end
    end

    local function loop6()
        pcall(function()
firstquest = true
autostack = false

local Settings = {Tables = {Forms = {}}; Variables = {Farm = false}}
setmetatable(Settings, {__index = function() warn('Dumbass') end})

local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events
local rs = game:GetService("RunService")

local quests = {
    { name = "X Fighter Trainer", bossName = "X Fighter", requiredValue = 0, endRange = 25000 },
    { name = "Oozaru", bossName = "Oozaru", requiredValue = 25000, endRange = math.huge },
}

function target()
    local success, fallo = pcall(function()
        targetted = game:GetService("Players").LocalPlayer.Name
    end)

    if not success then
        warn("Error en target: " .. fallo)
    end
end

target()

local function autoquest()
    local success, fallo = pcall(function()
        repeat
            task.wait(0.1)  -- Pequeño retraso para evitar la sobrecarga
        until game.workspace.Living[targetted]

        local a, b, c, d = data.Strength.Value, data.Energy.Value, data.Defense.Value, data.Speed.Value
        local smallest = math.min(a, b, c, d)

        for _, quest in ipairs(quests) do
            if smallest >= quest.requiredValue and smallest <= quest.endRange then
                SelectedQuests = quest.name
                SelectedMobs = quest.bossName
                break
            end
        end

        if firstquest then
            lastquest = SelectedQuests
            firstquest = false
        end

        if autostack and smallest > 8000 then
            if lastquest ~= SelectedQuests and isLoop6Active then
                game.workspace.Living[targetted].UpperTorso:Destroy()
                getgenv().stacked = false
                repeat
                    task.wait(0.5)  -- Pausa entre cada ciclo
                until player.Character.Humanoid.Health > 0
            end
            lastquest = SelectedQuests
        end
    end)

    if not success then
        warn("Error en autoquest: " .. fallo)
    end
end


getgenv().stacked = false

local function quest()
    local success, fallo = pcall(function()
        local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuests)

        if game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value ~= SelectedQuests and isLoop6Active then
            if npc and npc:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                local args = {npc} -- Se pasa el NPC encontrado como argumento
                game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args))
            end
        end
    end)

    if not success then
        warn("Error en quest: " .. fallo)
    end
end

task.spawn(autoquest)
task.spawn(quest)

local function tpToBoss(boss)
    local success, fallo = pcall(function()
        if player.Character:FindFirstChild("HumanoidRootPart") and boss:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
        end
    end)

    if not success then
        warn("Error en tpToBoss: " .. fallo)
    end
end

task.spawn(function()
    while true do
        task.wait()
        pcall(function()
            while true do
                task.wait()
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
                        autoquest()
                        if v.Name:lower() == SelectedMobs:lower() and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isLoop6Active then
                            quest()
                            getgenv().farm = true
                            repeat
                                task.wait()
                                player.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 4)
                            until getgenv().farm == false or v == nil or v.Humanoid.Health <= 0 or player.Character.Humanoid.Health <= 0
                            if player.Character.Humanoid.Health <= 0 then
                                getgenv().farm = false
                                getgenv().stacked = false
                                repeat
                                    task.wait()
                                until player.Character.Humanoid.Health >= 0
                                task.wait()
                            end
                        end
                    end
                end
            end
        end)
    end
end)


task.spawn(function()
    while true do
        task.wait(0.4)
        local succes,fallo = pcall(function()
            if data.Strength.Value >= 25000 and game:GetService("ReplicatedStorage").Datas[player.UserId].Quest.Value == "" and isLoop6Active then
                local kidNohag = game:GetService("Workspace").Others.NPCs["Kid Nohag"]
                if kidNohag and kidNohag:FindFirstChild("HumanoidRootPart") and isLoop6Active then
                    player.Character.HumanoidRootPart.CFrame = kidNohag.HumanoidRootPart.CFrame
                    local args = { kidNohag }
                    game:GetService("ReplicatedStorage").Package.Events.Qaction:InvokeServer(unpack(args)) -- Inicia la misión
                end
            end
        end)
        if not succes then
            warn(fallo)
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.3)
        local succes, fallo = pcall(function()
            if isLoop6Active then
                local currentGameHour = math.floor(game.Lighting.ClockTime)
                local playerCount = #game.Players:GetPlayers()
                if currentGameHour >= 6 and currentGameHour < 12 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                elseif playerCount > 1 then
                    game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
                end                
            end
        end)
        if not succes then
            warn(fallo)
        end
    end
end)

task.spawn(function()
    while true do
        if isLoop6Active then
            task.wait(0.1)


            local yo = game.Players.LocalPlayer
            local mission = ReplicatedStorage.Datas[yo.UserId].Quest


            if not mission or mission.Value == "" then
                task.wait(.05)  
                continue
            end

            local currentGameHour = math.floor(game.Lighting.ClockTime)

            if currentGameHour >= 20 or currentGameHour < 6 then
                continue  
            end

            local success, fallo = pcall(function()
                local maxDist = 50
                local bossName = "Halloween Boss"

                yo.Character:SetPrimaryPartCFrame(CFrame.new(-35233.1953125, 18.168001174926758, -28942.220703125))

                local boss = nil
                for _, v in ipairs(game.Workspace.Living:GetChildren()) do
                    if v:IsA("Model") and v.Name == bossName and v:FindFirstChild("HumanoidRootPart") then
                        if (yo.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude <= maxDist then
                            boss = v
                            break
                        end
                    end
                end

                yo.Character:SetPrimaryPartCFrame(boss and CFrame.new(boss.HumanoidRootPart.Position) or CFrame.new(-35233.1953125, 18.168001174926758, -28942.220703125))
            end)

            if not success then
                warn("Error al invocar el evento rebirth: " .. fallo)
            end
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    local tpCount = 0

    while true do
        local currentGameHour = math.floor(game.Lighting.ClockTime)

        if currentGameHour == 20 and tpCount < 2 then
            if tpCount == 0 then
                local success, errorMsg = pcall(function()
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-41388.765625, 92.34290313720703, -29013.48046875))
                end)
                if success then
                    tpCount = tpCount + 1
                    task.wait(5)
                    if tpCount == 1 then
                        local success2, errorMsg2 = pcall(function()
                            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-41388.765625, 92.34290313720703, -29013.48046875))
                        end)
                        if not success2 then
                            warn("Error al realizar el segundo teletransporte: " .. errorMsg2)
                        else
                            tpCount = tpCount + 1
                        end
                    end
                else
                    warn("Error al realizar el primer teletransporte: " .. errorMsg)
                end
            end
        end

        task.wait(0.1)
    end
end)

            task.wait(.1)
    end)
end

local function loop7()
pcall(function()
    task.spawn(function()
    -- Espera 12 segundos antes de comenzar
    task.wait()

    while true do
        task.wait()

        if isLoop7Active then  -- Verifica si el bucle está activo

            task.spawn(function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    local ldata = game.ReplicatedStorage.Datas[player.UserId]
                    local lplr = game.Players.LocalPlayer
                    local Ki = lplr.Character:WaitForChild("Stats"):WaitForChild("Ki")
                    local humanoid = lplr.Character:WaitForChild("Humanoid")


                    task.spawn(function()
                        if ldata.Quest.Value ~= "" and ldata.Strength.Value > 400000 and ldata.Energy.Value > 400000 and ldata.Defense.Value > 400000 and ldata.Speed.Value > 400000 then
                            local closestBoss, closestDistance = nil, math.huge
                            local playerPos = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position or nil

                            if playerPos then
                                task.spawn(function()
                                    for _, v in ipairs(game.Workspace.Living:GetChildren()) do
                                        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                            local distance = (playerPos - v.HumanoidRootPart.Position).magnitude
                                            if distance < closestDistance and v.Humanoid.Health > 0 and v.Name ~= player.Character.Name then
                                                closestDistance, closestBoss = distance, v
                                            end
                                        end
                                    end
                                end)

                                task.spawn(function()
                                    if closestBoss and closestDistance <= 5 and closestBoss.Humanoid.Health > 0 then
                                        local attacks = {
                                            
                                                "Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick",
                                                "Wolf Fang Fist", "High Power Rush", "Meteor Strike", "Meteor Charge", 
                                          
                                            function() 
                                                game.ReplicatedStorage.Package.Events.voleys:InvokeServer("Energy Volley", {FaceMouse = false, MouseHit = CFrame.new()}, "Blacknwhite27")
                                            end
                                        }

                                        for _, attackName in ipairs(attacks) do
                                            task.spawn(function() 
                                                if type(attackName) == "string" then
                                                    game.ReplicatedStorage.Package.Events.mel:InvokeServer(attackName, "Blacknwhite27")
                                                elseif type(attackName) == "function" then
                                                    attackName()
                                                end
                                            end)
                                        end
                                    end
                                end)
                            else
                                warn("Error: No se pudo encontrar la posición del jugador.")
                            end
                        end
                    end)
                end
            end)

            task.wait(0.05)
        end
    end
end)
        task.wait(.2) -- Aumentar la espera entre iteraciones principales para reducir la frecuencia de ejecuciÃ³n
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

    toggleSwitch(isLoop1Active, switchBall1)
    toggleSwitch(isLoop3Active, switchBall3)
    toggleSwitch(isLoop5Active, switchBall5)
    toggleSwitch(isLoop7Active, switchBall7)

    coroutine.wrap(loop1)()
    coroutine.wrap(loop3)()
    coroutine.wrap(loop5)()
    coroutine.wrap(loop7)()
end

initSwitches(MenuPanel)

MainButton.MouseButton1Click:Connect(function()
    pcall(togglePanel)
end)

earthButton.MouseButton1Click:Connect(function()
    pcall(function()
        local playerCount = #game.Players:GetPlayers()
        print("Número de jugadores: " .. playerCount)  -- Para depuración
        if playerCount > 3 then
            game:GetService("TeleportService"):Teleport(3311165597, game.Players.LocalPlayer)
        elseif playerCount < 3 then
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Earth")
        end
    end)
end)

billsButton.MouseButton1Click:Connect(function()
    pcall(function()
        local playerCount = #game.Players:GetPlayers()
        print("Número de jugadores: " .. playerCount)  -- Para depuración
        if playerCount > 3 then
            game:GetService("TeleportService"):Teleport(5151400895, game.Players.LocalPlayer)
        elseif playerCount < 3 then
            game.ReplicatedStorage.Package.Events.TP:InvokeServer("Vills Planet")
        end
    end)
end)

hbtcButton.MouseButton1Click:Connect(function()
    pcall(function() game.ReplicatedStorage.Package.Events.TP:InvokeServer("Hyperbolic Time Chamber") end)
end)

hbtgvButton.MouseButton1Click:Connect(function()
    pcall(function() game.ReplicatedStorage.Package.Events.TP:InvokeServer("Gravity Room") end)
end)

farmButton.MouseButton1Click:Connect(function()
    pcall(onFarmButtonClick)
end)

formsButton.MouseButton1Click:Connect(function()
    pcall(onFormsButtonClick)
end)

local function Cal()
    local function updateFPS()
        local count, lastUpdate = 0, tick()

        RunService.RenderStepped:Connect(function()
            count = count + 1
            if tick() - lastUpdate >= 1 then
                pcall(function() 
                    fpsTextLabel.Text = "FPS: " .. count
                end)
                count, lastUpdate = 0, tick()
            end
        end)
    end

    local function Serverping()
        local success, servers = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data
        end)
        if not success then return "Error" end

        local bestPing = math.huge
        for _, server in ipairs(servers) do
            local ping = math.min((function() 
                local start = tick() 
                RunService.Stepped:wait() 
                return (tick() - start) * 1000 
            end)(), 1500)
            if ping < bestPing then 
                bestPing, bestId = ping, server.id 
            end
        end
        return bestPing < math.huge and math.floor(bestPing) .. "/Srv.." or "N/A"
    end

    button.MouseButton1Click:Connect(function()
        pcall(function() 
            if bestId and #game.Players:GetPlayers() > 2 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, bestId) 
            end
        end)
    end)

    local function updateBallColor()
    local currentHour = math.floor(game.Lighting.ClockTime)
    local currentMinute = math.floor((game.Lighting.ClockTime % 1) * 60)

    pcall(function()
        if currentHour == 15 and currentMinute >= 40 then
            ballFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Morado brillante
        elseif currentHour == 15 and currentMinute >= 0 and currentMinute < 40 then
            if (tick() % 1) < 0.5 then
                ballFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Amarillo brillante
            else
                ballFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 255) -- Morado brillante
            end
        else
            ballFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Amarillo brillante
        end

        task.spawn(function()
            local bb = game:service 'VirtualUser'
            game:service 'Players'.LocalPlayer.Idled:connect(function()
                bb:CaptureController()
                bb:ClickButton2(Vector2.new())
            end)
        end)
    end)
end


end

pcall(Cal)
pcall(showPlayerThumbnail)

 end)

if not success then
    warn("Error en la inicialización: " .. tostring(fail))
end 
