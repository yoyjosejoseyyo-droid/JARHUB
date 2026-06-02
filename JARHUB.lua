-- 🇪🇨 JARHUB - SCRIPT COMPLETO 🇪🇨
-- Assassins VS Sheriff + Blind Fire + Universal

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")

print("🇪🇨 JARHUB INICIANDO... 🇪🇨")

-- ═══════════════════════════════════════════════════════════════════════
-- ASSASSINS VS SHERIFF
-- ═══════════════════════════════════════════════════════════════════════

local function ActivateESP()
    local function AddESP(Player)
        if Player == LocalPlayer then return end
        if not Player.Character then return end
        
        local Head = Player.Character:FindFirstChild("Head")
        if Head and not Head:FindFirstChild("ESPBillboard") then
            local Billboard = Instance.new("BillboardGui")
            Billboard.Name = "ESPBillboard"
            Billboard.Size = UDim2.new(4, 0, 4, 0)
            Billboard.MaxDistance = 5000
            Billboard.Parent = Head
            
            local Text = Instance.new("TextLabel")
            Text.BackgroundTransparency = 0.2
            Text.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Text.Size = UDim2.new(1, 0, 1, 0)
            Text.TextColor3 = Color3.fromRGB(255, 255, 255)
            Text.TextSize = 18
            Text.Font = Enum.Font.GothamBold
            Text.Text = Player.Name
            Text.Parent = Billboard
        end
    end
    
    Players.PlayerAdded:Connect(AddESP)
    for _, Player in pairs(Players:GetPlayers()) do
        AddESP(Player)
    end
    
    print("✅ ESP ACTIVADO")
end

local function ActivateInvisible()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    for _, Part in pairs(Character:GetDescendants()) do
        if Part:IsA("BasePart") or Part:IsA("Accessory") then
            Part.Transparency = 1
        end
    end
    
    LocalPlayer.Character.ChildAdded:Connect(function(Child)
        if Child:IsA("Tool") then
            for _, Part in pairs(Child:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.Transparency = 1
                end
            end
        end
    end)
    
    print("✅ INVISIBLE")
end

local function ActivateSilentia()
    local Target = nil
    
    local function GetClosestPlayer()
        local Dist = math.huge
        local ClosestPlayer = nil
        for _, Player in pairs(Players:GetPlayers()) do
            if Player ~= LocalPlayer and Player.Character then
                local Distance = (Player.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude
                if Distance < Dist then
                    Dist = Distance
                    ClosestPlayer = Player
                end
            end
        end
        return ClosestPlayer
    end
    
    RunService.RenderStepped:Connect(function()
        Target = GetClosestPlayer()
        if Target and Target.Character then
            Mouse.Target = Target.Character.Head
        end
    end)
    
    print("✅ SILENTIA ACTIVADO")
end

local function ActivateAutoShot()
    local function Fire()
        local Tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if Tool then
            Tool:Activate()
        end
    end
    
    RunService.Heartbeat:Connect(function()
        Fire()
    end)
    
    print("✅ AUTO SHOT ACTIVADO")
end

local function KillAllPlayers()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character then
            local Humanoid = Player.Character:FindFirstChild("Humanoid")
            if Humanoid then
                Humanoid.Health = 0
            end
        end
    end
    print("✅ KILL ALL")
end

local function ActivateNoClip()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    for _, Part in pairs(Character:GetDescendants()) do
        if Part:IsA("BasePart") then
            Part.CanCollide = false
        end
    end
    
    print("✅ NO CLIP")
end

local function ActivateSpeed()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.WalkSpeed = 150
    end
    
    print("✅ SPEED ACTIVADO")
end

local function ActivateInfiniteJump()
    UserInputService.InputBegan:Connect(function(Input, GameProcessed)
        if GameProcessed then return end
        if Input.KeyCode == Enum.KeyCode.Space then
            local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if Humanoid then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
    
    print("✅ INFINITE JUMP")
end

local function FlingAllPlayers()
    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character then
            local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart then
                HumanoidRootPart.CFrame = CFrame.new(-1000, -1000, -1000)
            end
        end
    end
    print("✅ FLING TODOS")
end

local function ActivateGodMode()
    local Humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
    if Humanoid then
        Humanoid.MaxHealth = math.huge
        Humanoid.Health = math.huge
        
        RunService.Heartbeat:Connect(function()
            if Humanoid then
                Humanoid.Health = math.huge
            end
        end)
    end
    
    print("✅ GOD MODE")
end

local function ActivateAntiRagdoll()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    for _, Part in pairs(Character:GetDescendants()) do
        if Part:IsA("BodyVelocity") or Part:IsA("BodyAngularVelocity") or Part:IsA("BodyGyro") then
            Part:Destroy()
        end
    end
    
    print("✅ ANTI RAGDOLL")
end

-- ═══════════════════════════════════════════════════════════════════════
-- TIRO A CIEGAS
-- ═══════════════════════════════════════════════════════════════════════

local function ActivateAimbotAdvanced()
    local AimbotActive = true
    local Target = nil
    
    local function GetClosestEnemy()
        local Dist = math.huge
        local ClosestPlayer = nil
        
        for _, Player in pairs(Players:GetPlayers()) do
            if Player ~= LocalPlayer and Player.Character then
                local Distance = (Player.Character.HumanoidRootPart.Position - RootPart.Position).Magnitude
                if Distance < Dist then
                    Dist = Distance
                    ClosestPlayer = Player
                end
            end
        end
        
        return ClosestPlayer
    end
    
    RunService.RenderStepped:Connect(function()
        if AimbotActive then
            Target = GetClosestEnemy()
            if Target and Target.Character then
                local Head = Target.Character:FindFirstChild("Head")
                if Head then
                    Mouse.Target = Head
                end
            end
        end
    end)
    
    print("✅ AIMBOT ACTIVADO")
end

-- ═══════════════════════════════════════════════════════════════════════
-- UNIVERSAL
-- ═══════════════════════════════════════════════════════════════════════

local function ActivateDesync()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local OriginalPosition = RootPart.Position
    local FakePosition = OriginalPosition + Vector3.new(200, 50, 200)
    
    local FakeCharacter = Character:Clone()
    FakeCharacter.Parent = workspace
    
    local FakeRoot = FakeCharacter:FindFirstChild("HumanoidRootPart")
    if FakeRoot then
        FakeRoot.CFrame = CFrame.new(FakePosition)
        
        for _, Part in pairs(FakeCharacter:GetDescendants()) do
            if Part:IsA("BasePart") then
                Part.CanCollide = false
            end
        end
    end
    
    print("✅ DESYNC ACTIVADO")
end

local function ActivateInvisibleUniversal()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    for _, Part in pairs(Character:GetDescendants()) do
        if Part:IsA("BasePart") then
            Part.Transparency = 1
        end
    end
    
    print("✅ INVISIBLE UNIVERSAL")
end

-- ═══════════════════════════════════════════════════════════════════════
-- MENÚ
-- ═══════════════════════════════════════════════════════════════════════

local function CreateMenu()
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "JARHubMenu"
    Gui.ResetOnSpawn = false
    Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 350, 0, 650)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -325)
    MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    MainFrame.BorderColor3 = Color3.fromRGB(255, 215, 0)
    MainFrame.BorderSizePixel = 3
    MainFrame.Parent = Gui
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    Title.TextColor3 = Color3.fromRGB(0, 0, 0)
    Title.TextSize = 26
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🇪🇨 JARHUB 🇪🇨"
    Title.BorderSizePixel = 0
    Title.Parent = MainFrame
    
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, -20, 1, -100)
    ScrollFrame.Position = UDim2.new(0, 10, 0, 60)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 1000)
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.Parent = MainFrame
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollFrame
    UIListLayout.Padding = UDim.new(0, 6)
    
    local function CreateButton(Name, Color, Func)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -15, 0, 38)
        Button.BackgroundColor3 = Color
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        Button.Font = Enum.Font.Gotham
        Button.Text = Name
        Button.BorderSizePixel = 0
        Button.Parent = ScrollFrame
        
        Button.MouseButton1Click:Connect(Func)
    end
    
    CreateButton("🔫 ASSASSINS VS SHERIFF", Color3.fromRGB(200, 50, 50), function() end)
    CreateButton("ESP", Color3.fromRGB(255, 100, 100), ActivateESP)
    CreateButton("INVISIBLE", Color3.fromRGB(255, 100, 100), ActivateInvisible)
    CreateButton("SILENTIA", Color3.fromRGB(255, 100, 100), ActivateSilentia)
    CreateButton("AUTO SHOT", Color3.fromRGB(255, 100, 100), ActivateAutoShot)
    CreateButton("KILL ALL", Color3.fromRGB(255, 100, 100), KillAllPlayers)
    CreateButton("NO CLIP", Color3.fromRGB(255, 100, 100), ActivateNoClip)
    CreateButton("SPEED", Color3.fromRGB(255, 100, 100), ActivateSpeed)
    CreateButton("INFINITE JUMP", Color3.fromRGB(255, 100, 100), ActivateInfiniteJump)
    CreateButton("FLING ALL", Color3.fromRGB(255, 100, 100), FlingAllPlayers)
    CreateButton("GOD MODE", Color3.fromRGB(255, 100, 100), ActivateGodMode)
    CreateButton("ANTI RAGDOLL", Color3.fromRGB(255, 100, 100), ActivateAntiRagdoll)
    
    CreateButton("🎯 TIRO A CIEGAS", Color3.fromRGB(50, 100, 200), function() end)
    CreateButton("AIMBOT", Color3.fromRGB(100, 200, 255), ActivateAimbotAdvanced)
    CreateButton("ANTI RAGDOLL", Color3.fromRGB(100, 200, 255), ActivateAntiRagdoll)
    
    CreateButton("👻 STEAL BRAINROTS", Color3.fromRGB(50, 150, 50), function() end)
    CreateButton("DESYNC", Color3.fromRGB(100, 255, 100), ActivateDesync)
    CreateButton("INVISIBLE", Color3.fromRGB(100, 255, 100), ActivateInvisibleUniversal)
    
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(1, -20, 0, 38)
    CloseBtn.Position = UDim2.new(0, 10, 1, -48)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.TextSize = 14
    CloseBtn.Font = Enum.Font.Gotham
    CloseBtn.Text = "❌ CERRAR"
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = MainFrame
    
    CloseBtn.MouseButton1Click:Connect(function()
        Gui:Destroy()
    end)
end

CreateMenu()

print("✅ JARHUB CARGADO")