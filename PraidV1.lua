-- ==========================================
-- PRAIDSC HUB ULTIMATE EDITION (40 WORKING FUNCTIONS)
-- ==========================================

if _G.PraidSCHubV3 then return end

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local CORRECT_KEY = "vadereyownerpraidsc"
local TELEGRAM_LINK = "@PraidSC"

-- ------------------------------------------
-- 1. ОКНО АВТОРИЗАЦИИ (KEY SYSTEM)
-- ------------------------------------------
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "PraidSC_KeySystem"
KeyGui.Parent = CoreGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = KeyGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 12, 24)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
KeyFrame.Size = UDim2.new(0, 320, 0, 220)
KeyFrame.Active = true
KeyFrame.Draggable = true

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeyFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0, 0, 0, 15)
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "🔑 PraidSC KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(0, 132, 255)
KeyTitle.TextSize = 18

local SubTitle = Instance.new("TextLabel")
SubTitle.Parent = KeyFrame
SubTitle.BackgroundTransparency = 1
SubTitle.Position = UDim2.new(0, 10, 0, 45)
SubTitle.Size = UDim2.new(1, -20, 0, 20)
SubTitle.Font = Enum.Font.Gotham
SubTitle.Text = "Ключ в Telegram: " .. TELEGRAM_LINK
SubTitle.TextColor3 = Color3.fromRGB(150, 170, 220)
SubTitle.TextSize = 12

local KeyInput = Instance.new("TextBox")
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(18, 22, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.38, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Введи ключ..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 110, 140)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 13

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Parent = KeyFrame
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 110, 230)
SubmitBtn.Position = UDim2.new(0.1, 0, 0.60, 0)
SubmitBtn.Size = UDim2.new(0.8, 0, 0, 35)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "ВОЙТИ В СКРИПТ"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = SubmitBtn

local CopyTgBtn = Instance.new("TextButton")
CopyTgBtn.Parent = KeyFrame
CopyTgBtn.BackgroundTransparency = 1
CopyTgBtn.Position = UDim2.new(0.1, 0, 0.82, 0)
CopyTgBtn.Size = UDim2.new(0.8, 0, 0, 25)
CopyTgBtn.Font = Enum.Font.GothamMedium
CopyTgBtn.Text = "📋 Скопировать ТГ: " .. TELEGRAM_LINK
CopyTgBtn.TextColor3 = Color3.fromRGB(0, 180, 255)
CopyTgBtn.TextSize = 11

CopyTgBtn.MouseButton1Click:Connect(function()
    setclipboard(TELEGRAM_LINK)
    CopyTgBtn.Text = "✅ Скопировано в буфер!"
    task.wait(1.5)
    CopyTgBtn.Text = "📋 Скопировать ТГ: " .. TELEGRAM_LINK
end)

-- ------------------------------------------
-- 2. ОСНОВНОЙ ИНТЕРФЕЙС И ФУНКЦИОНАЛ
-- ------------------------------------------
local function LoadMainScript()
    _G.PraidSCHubV3 = true
    KeyGui:Destroy()

    local State = {}

    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "PraidSC_Hub_V3"
    MainGui.Parent = CoreGui

    -- КНОПКА СВОРУЧИВАНИЯ / ОТКРЫТИЯ (Плавающая)
    local ToggleIcon = Instance.new("TextButton")
    ToggleIcon.Name = "ToggleIcon"
    ToggleIcon.Parent = MainGui
    ToggleIcon.BackgroundColor3 = Color3.fromRGB(10, 15, 35)
    ToggleIcon.Position = UDim2.new(0, 15, 0.3, 0)
    ToggleIcon.Size = UDim2.new(0, 85, 0, 35)
    ToggleIcon.Font = Enum.Font.GothamBold
    ToggleIcon.Text = "⚡ PraidSC"
    ToggleIcon.TextColor3 = Color3.fromRGB(0, 150, 255)
    ToggleIcon.TextSize = 12
    ToggleIcon.Active = true
    ToggleIcon.Draggable = true

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 8)
    IconCorner.Parent = ToggleIcon

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = MainGui
    Main.BackgroundColor3 = Color3.fromRGB(10, 12, 24)
    Main.Position = UDim2.new(0.2, 0, 0.15, 0)
    Main.Size = UDim2.new(0, 520, 0, 350)
    Main.Active = true
    Main.Draggable = true
    Main.ClipsDescendants = true

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = Main

    -- ФОНОВЫЕ ПЛАВАЮЩИЕ ЧАСТИЦЫ
    local ParticleContainer = Instance.new("Frame")
    ParticleContainer.Name = "ParticleContainer"
    ParticleContainer.Parent = Main
    ParticleContainer.BackgroundTransparency = 1
    ParticleContainer.Size = UDim2.new(1, 0, 1, 0)
    ParticleContainer.ZIndex = 1

    for i = 1, 15 do
        local p = Instance.new("Frame")
        p.Parent = ParticleContainer
        p.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        p.BackgroundTransparency = math.random(4, 8) / 10
        p.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
        p.Position = UDim2.new(math.random(), 0, math.random(), 0)

        local pCorner = Instance.new("UICorner")
        pCorner.CornerRadius = UDim.new(1, 0)
        pCorner.Parent = p

        task.spawn(function()
            while task.wait(0.03) do
                local curY = p.Position.Y.Scale
                if curY <= -0.05 then
                    p.Position = UDim2.new(math.random(), 0, 1.05, 0)
                else
                    p.Position = UDim2.new(p.Position.X.Scale, 0, curY - 0.003, 0)
                end
            end
        end)
    end

    -- ШАПКА КОРПУСА
    local Header = Instance.new("Frame")
    Header.Parent = Main
    Header.BackgroundColor3 = Color3.fromRGB(15, 18, 38)
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.ZIndex = 2

    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 12)
    HeaderCorner.Parent = Header

    local Title = Instance.new("TextLabel")
    Title.Parent = Header
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.Size = UDim2.new(0, 300, 1, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "PraidSC HUB V3 | TG: " .. TELEGRAM_LINK
    Title.TextColor3 = Color3.fromRGB(0, 140, 255)
    Title.TextSize = 13
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- КНОПКА ЗАКРЫТИЯ ("X")
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = Header
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -35, 0, 5)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.Text = "✕"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
    CloseBtn.TextSize = 16

    CloseBtn.MouseButton1Click:Connect(function()
        Main.Visible = false
    end)

    ToggleIcon.MouseButton1Click:Connect(function()
        Main.Visible = not Main.Visible
    end)

    -- ВКЛАДКИ
    local TabBar = Instance.new("Frame")
    TabBar.Parent = Main
    TabBar.BackgroundColor3 = Color3.fromRGB(12, 15, 30)
    TabBar.Position = UDim2.new(0, 0, 0, 40)
    TabBar.Size = UDim2.new(0, 140, 1, -40)
    TabBar.ZIndex = 2

    local TabList = Instance.new("UIListLayout")
    TabList.Parent = TabBar
    TabList.Padding = UDim.new(0, 4)

    local Container = Instance.new("Frame")
    Container.Parent = Main
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0, 145, 0, 45)
    Container.Size = UDim2.new(1, -150, 1, -50)
    Container.ZIndex = 2

    local CategoryFrames = {}
    local categories = {"🏎️ Гонки", "🏃 Движение", "🎨 Графика", "🛠️ Утилиты"}

    for i, catName in ipairs(categories) do
        local TabBtn = Instance.new("TextButton")
        TabBtn.Parent = TabBar
        TabBtn.Size = UDim2.new(1, 0, 0, 38)
        TabBtn.BackgroundColor3 = Color3.fromRGB(18, 22, 45)
        TabBtn.Font = Enum.Font.GothamMedium
        TabBtn.Text = catName
        TabBtn.TextColor3 = Color3.fromRGB(180, 200, 255)
        TabBtn.TextSize = 12

        local CatFrame = Instance.new("ScrollingFrame")
        CatFrame.Parent = Container
        CatFrame.Size = UDim2.new(1, 0, 1, 0)
        CatFrame.BackgroundTransparency = 1
        CatFrame.Visible = (i == 1)
        CatFrame.ScrollBarThickness = 3
        CatFrame.CanvasSize = UDim2.new(0, 0, 0, 420)
        CategoryFrames[catName] = CatFrame

        local Layout = Instance.new("UIListLayout")
        Layout.Parent = CatFrame
        Layout.Padding = UDim.new(0, 5)

        TabBtn.MouseButton1Click:Connect(function()
            for _, frame in pairs(CategoryFrames) do frame.Visible = false end
            CatFrame.Visible = true
        end)
    end

    local function AddToggle(category, name, key, callback)
        local ParentFrame = CategoryFrames[category]
        local Button = Instance.new("TextButton")
        Button.Parent = ParentFrame
        Button.Size = UDim2.new(1, -8, 0, 36)
        Button.BackgroundColor3 = Color3.fromRGB(20, 25, 50)
        Button.Font = Enum.Font.Gotham
        Button.Text = "  " .. name
        Button.TextColor3 = Color3.fromRGB(220, 220, 255)
        Button.TextSize = 12
        Button.TextXAlignment = Enum.TextXAlignment.Left

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 6)
        Corner.Parent = Button

        local Status = Instance.new("Frame")
        Status.Parent = Button
        Status.Position = UDim2.new(1, -28, 0.25, 0)
        Status.Size = UDim2.new(0, 18, 0, 18)
        Status.BackgroundColor3 = Color3.fromRGB(200, 40, 40)

        local StatusCorner = Instance.new("UICorner")
        StatusCorner.CornerRadius = UDim.new(0, 4)
        StatusCorner.Parent = Status

        State[key] = false

        Button.MouseButton1Click:Connect(function()
            State[key] = not State[key]
            Status.BackgroundColor3 = State[key] and Color3.fromRGB(0, 200, 100) or Color3.fromRGB(200, 40, 40)
            callback(State[key])
        end)
    end

    -- ==========================================
    -- 40 РАБОЧИХ ФУНКЦИЙ (ПО 10 В КАЖДОЙ КАТЕГОРИИ)
    -- ==========================================

    --- 🏎️ 1. ГОНКИ И АВТОМАТИЗАЦИЯ
    AddToggle("🏎️ Гонки", "1. Авто-Кликер (Max CPS)", "AutoClicker", function() end)
    AddToggle("🏎️ Гонки", "2. Авто-Зажатие Мыши", "HoldClick", function() end)
    AddToggle("🏎️ Гонки", "3. Авто-Прыжки", "AutoJump", function() end)
    AddToggle("🏎️ Гонки", "4. Ходьба Вперед", "AutoWalk", function() end)
    AddToggle("🏎️ Гонки", "5. Anti-AFK (Защита 24/7)", "AntiAFK", function() end)
    AddToggle("🏎️ Гонки", "6. Авто-Сброс Спавна", "AutoReset", function()
        if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
    end)
    AddToggle("🏎️ Гонки", "7. Авто-Разворот Камеры", "CamFlip", function(st)
        if st then Workspace.CurrentCamera.CFrame = Workspace.CurrentCamera.CFrame * CFrame.Angles(0, math.rad(180), 0) end
    end)
    AddToggle("🏎️ Гонки", "8. Импульсный Авто-Клик", "PulseClick", function() end)
    AddToggle("🏎️ Гонки", "9. Зафиксировать Позу", "FreezeChar", function(st)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character.HumanoidRootPart.Anchored = st
        end
    end)
    AddToggle("🏎️ Гонки", "10. Авто-Переподключение", "AutoReconnect", function() end)

    --- 🏃 2. ДВИЖЕНИЕ И ИГРОК
    AddToggle("🏃 Движение", "1. Ускорение Ходьбы (Speed)", "WalkSpeed", function(st)
        if not st and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
    end)
    AddToggle("🏃 Движение", "2. Высокий Прыжок (JumpPower)", "JumpPower", function(st)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = st and 120 or 50
        end
    end)
    AddToggle("🏃 Движение", "3. Бесконечный Прыжок", "InfJump", function() end)
    AddToggle("🏃 Движение", "4. Низкая Гравитация", "LowGrav", function(st)
        Workspace.Gravity = st and 30 or 196.2
    end)
    AddToggle("🏃 Движение", "5. Высокая Гравитация", "HighGrav", function(st)
        Workspace.Gravity = st and 500 or 196.2
    end)
    AddToggle("🏃 Движение", "6. Noclip (Свозь стены)", "Noclip", function() end)
    AddToggle("🏃 Движение", "7. Отключить Спотыкания", "NoSit", function(st)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, not st)
        end
    end)
    AddToggle("🏃 Движение", "8. Принудительный ShiftLock", "ShiftLock", function(st)
        LocalPlayer.DevEnableMouseLock = st
    end)
    AddToggle("🏃 Движение", "9. Режим Парения (AirWalk)", "AirWalk", function(st)
        local plat = Workspace:FindFirstChild("PraidSCPlatform")
        if st then
            if not plat then
                plat = Instance.new("Part")
                plat.Name = "PraidSCPlatform"
                plat.Size = Vector3.new(10, 1, 10)
                plat.Anchored = true
                plat.Parent = Workspace
            end
        elseif plat then
            plat:Destroy()
        end
    end)
    AddToggle("🏃 Движение", "10. Сохранить / ТП Точку", "SavePos", function(st)
        if st and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            _G.SavedCFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
        elseif not st and _G.SavedCFrame and LocalPlayer.Character then
            LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SavedCFrame
        end
    end)

    --- 🎨 3. ГРАФИКА И ОПТИМИЗАЦИЯ
    AddToggle("🎨 Графика", "1. FPS Booster (Низкое качество)", "FPSBoost", function(st)
        if st then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end
    end)
    AddToggle("🎨 Графика", "2. Очистка Текстур", "NoTextures", function(st)
        if st then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
            end
        end
    end)
    AddToggle("🎨 Графика", "3. Удалить Декали", "NoDecals", function(st)
        if st then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
            end
        end
    end)
    AddToggle("🎨 Графика", "4. Отключить Тени", "NoShadows", function(st)
        Lighting.GlobalShadows = not st
    end)
    AddToggle("🎨 Графика", "5. Отключить Частицы", "NoParticles", function(st)
        if st then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then v.Enabled = false end
            end
        end
    end)
    AddToggle("🎨 Графика", "6. Ночной Режим", "NightMode", function(st)
        Lighting.TimeOfDay = st and "00:00:00" or "12:00:00"
    end)
    AddToggle("🎨 Графика", "7. Дневной Режим", "DayMode", function(st)
        Lighting.TimeOfDay = st and "12:00:00" or "12:00:00"
    end)
    AddToggle("🎨 Графика", "8. Яркий Свет (Fullbright)", "Fullbright", function(st)
        Lighting.Ambient = st and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(128, 128, 128)
    end)
    AddToggle("🎨 Графика", "9. Удалить Туман", "NoFog", function(st)
        Lighting.FogEnd = st and 9e9 or 1000
    end)
    AddToggle("🎨 Графика", "10. Скрыть Эффекты Камеры", "NoBlur", function(st)
        if st then
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BlurEffect") then v.Enabled = false end
            end
        end
    end)

    --- 🛠️ 4. УТИЛИТЫ И ВИЗУАЛ
    AddToggle("🛠️ Утилиты", "1. Угол Обзора FOV 90", "FOV90", function(st)
        Workspace.CurrentCamera.FieldOfView = st and 90 or 70
    end)
    AddToggle("🛠️ Утилиты", "2. Широкий Обзор FOV 120", "FOV120", function(st)
        Workspace.CurrentCamera.FieldOfView = st and 120 or 70
    end)
    AddToggle("🛠️ Утилиты", "3. Дальняя Камера (Zoom)", "MaxZoom", function(st)
        LocalPlayer.CameraMaxZoomDistance = st and 500 or 128
    end)
    AddToggle("🛠️ Утилиты", "4. Вид от 1-го Лица", "FirstPerson", function(st)
        LocalPlayer.CameraMinZoomDistance = st and 0.5 or 0.5
        LocalPlayer.CameraMaxZoomDistance = st and 0.5 or 128
    end)
    AddToggle("🛠️ Утилиты", "5. Подсветка Игроков (ESP)", "PlayerESP", function(st)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hl = p.Character:FindFirstChild("PraidSC_ESP")
                if st then
                    if not hl then
                        hl = Instance.new("Highlight")
                        hl.Name = "PraidSC_ESP"
                        hl.FillColor = Color3.fromRGB(0, 150, 255)
                        hl.Parent = p.Character
                    end
                elseif hl then
                    hl:Destroy()
                end
            end
        end
    end)
    AddToggle("🛠️ Утилиты", "6. Показать Никнеймы", "NameESP", function(st)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Humanoid") then
                p.Character.Humanoid.DisplayDistanceType = st and Enum.HumanoidDisplayDistanceType.Always or Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
    end)
    AddToggle("🛠️ Утилиты", "7. Перезайти (Rejoin)", "Rejoin", function(st)
        if st then TeleportService:Teleport(game.PlaceId, LocalPlayer) end
    end)
    AddToggle("🛠️ Утилиты", "8. Скопировать Координаты", "CopyCF", function(st)
        if st and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            setclipboard(tostring(LocalPlayer.Character.HumanoidRootPart.CFrame))
        end
    end)
    AddToggle("🛠️ Утилиты", "9. Скрыть GUI Игры", "HideGameUI", function(st)
        local pGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if pGui then
            for _, gui in pairs(pGui:GetChildren()) do
                if gui:IsA("ScreenGui") and gui.Name ~= "PraidSC_Hub_V3" then
                    gui.Enabled = not st
                end
            end
        end
    end)
    AddToggle("🛠️ Утилиты", "10. Авто-Экипировка", "AutoEquipTool", function(st)
        if st then
            for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
                if item:IsA("Tool") then item.Parent = LocalPlayer.Character end
            end
        end
    end)

    -- ==========================================
    -- РЕАЛЬНЫЕ ЦИКЛЫ ОБРАБОТКИ
    -- ==========================================

    -- Anti-AFK
    LocalPlayer.Idled:Connect(function()
        if State.AntiAFK then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)

    -- Inf Jump
    UserInputService.JumpRequest:Connect(function()
        if State.InfJump and LocalPlayer.
