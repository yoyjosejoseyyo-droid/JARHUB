-- 🇪🇨 JARHUB UNIVERSAL v3.0 🇪🇨
-- Funciona en: Assassins VS Sheriff, Blind Fire, Steal Brainrots

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

print("[JARHUB] Iniciando...")

pcall(function()
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")

    -- ════════════════════════════════════════════════════════════
    -- FUNCIONES UNIVERSALES
    -- ════════════════════════════════════════════════════════════

    local function ESP_FUNC()
        pcall(function()
            Players.PlayerAdded:Connect(function(plr)
                if plr ~= LocalPlayer and plr.Character then
                    local head = plr.Character:FindFirstChild("Head")
                    if head then
                        local bill = Instance.new("BillboardGui")
                        bill.Size = UDim2.new(4,0,3,0)
                        bill.MaxDistance = 500
                        bill.Parent = head
                        local txt = Instance.new("TextLabel")
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.BackgroundTransparency = 0.3
                        txt.BackgroundColor3 = Color3.new(1,0,0)
                        txt.TextColor3 = Color3.new(1,1,1)
                        txt.TextSize = 14
                        txt.Font = Enum.Font.GothamBold
                        txt.Text = plr.Name
                        txt.Parent = bill
                    end
                end
            end)

            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local head = plr.Character:FindFirstChild("Head")
                    if head and not head:FindFirstChild("BillboardGui") then
                        local bill = Instance.new("BillboardGui")
                        bill.Size = UDim2.new(4,0,3,0)
                        bill.MaxDistance = 500
                        bill.Parent = head
                        local txt = Instance.new("TextLabel")
                        txt.Size = UDim2.new(1,0,1,0)
                        txt.BackgroundTransparency = 0.3
                        txt.BackgroundColor3 = Color3.new(1,0,0)
                        txt.TextColor3 = Color3.new(1,1,1)
                        txt.TextSize = 14
                        txt.Font = Enum.Font.GothamBold
                        txt.Text = plr.Name
                        txt.Parent = bill
                    end
                end
            end
            print("[JARHUB] ESP activado")
        end)
    end

    local function INVISIBLE_FUNC()
        pcall(function()
            for _, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                end
            end
            print("[JARHUB] Invisible activado")
        end)
    end

    local function SPEED_FUNC()
        pcall(function()
            Humanoid.WalkSpeed = 200
            print("[JARHUB] Speed activado")
        end)
    end

    local function GODMODE_FUNC()
        pcall(function()
            Humanoid.MaxHealth = math.huge
            Humanoid.Health = math.huge
            
            RunService.Heartbeat:Connect(function()
                if Humanoid then
                    Humanoid.Health = math.huge
                end
            end)
            print("[JARHUB] God Mode activado")
        end)
    end

    local function AIMBOT_FUNC()
        pcall(function()
            RunService.RenderStepped:Connect(function()
                local closest = nil
                local closestdist = math.huge
                
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local head = plr.Character:FindFirstChild("Head")
                        if head then
                            local dist = (head.Position - HumanoidRootPart.Position).Magnitude
                            if dist < closestdist then
                                closestdist = dist
                                closest = head
                            end
                        end
                    end
                end
                
                if closest then
                    Mouse.Target = closest
                end
            end)
            print("[JARHUB] Aimbot activado")
        end)
    end

    local function NOCLIP_FUNC()
        pcall(function()
            for _, v in pairs(Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
            print("[JARHUB] No Clip activado")
        end)
    end

    local function INFINITEJUMP_FUNC()
        pcall(function()
            UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.KeyCode == Enum.KeyCode.Space then
                    Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
            print("[JARHUB] Infinite Jump activado")
        end)
    end

    local function DESYNC_FUNC()
        pcall(function()
            local clone = Character:Clone()
            clone.Parent = workspace
            clone:MoveTo(HumanoidRootPart.Position + Vector3.new(300,0,300))
            print("[JARHUB] Desync activado")
        end)
    end

    local function KILLALL_FUNC()
        pcall(function()
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local humanoid = plr.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.Health = 0
                    end
                end
            end
            print("[JARHUB] Kill All ejecutado")
        end)
    end

    local function ANTIRAGDOLL_FUNC()
        pcall(function()
            for _, v in pairs(Character:GetDescendants()) do
                if v:IsA("BodyVelocity") or v:IsA("BodyAngularVelocity") or v:IsA("BodyGyro") then
                    v:Destroy()
                end
            end
            Humanoid.PlatformStand = false
            print("[JARHUB] Anti Ragdoll activado")
        end)
    end

    local function SILENTIA_FUNC()
        pcall(function()
            RunService.RenderStepped:Connect(function()
                local closest = nil
                local closestdist = math.huge
                
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr ~= LocalPlayer and plr.Character then
                        local head = plr.Character:FindFirstChild("Head")
                        if head then
                            local dist = (head.Position - HumanoidRootPart.Position).Magnitude
                            if dist < closestdist then
                                closestdist = dist
                                closest = head
                            end
                        end
                    end
                end
                
                if closest then
                    Mouse.Target = closest
                end
            end)
            print("[JARHUB] Silentia activado")
        end)
    end

    local function AUTOSHOT_FUNC()
        pcall(function()
            RunService.Heartbeat:Connect(function()
                local tool = Character:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end)
            print("[JARHUB] Auto Shot activado")
        end)
    end

    local function FLING_FUNC()
        pcall(function()
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    local root = plr.Character:FindFirstChild("HumanoidRootPart")
                    if root then
                        root.CFrame = CFrame.new(-5000, -5000, -5000)
                    end
                end
            end
            print("[JARHUB] Fling All ejecutado")
        end)
    end

    -- ════════════════════════════════════════════════════════════
    -- CREAR MENU
    -- ════════════════════════════════════════════════════════════

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "JARHubGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 300, 0, 600)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -300)
    MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.15)
    MainFrame.BorderColor3 = Color3.new(1, 0.84, 0)
    MainFrame.BorderSizePixel = 3
    MainFrame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundColor3 = Color3.new(1, 0.84, 0)
    Title.TextColor3 = Color3.new(0, 0, 0)
    Title.TextSize = 24
    Title.Font = Enum.Font.GothamBold
    Title.Text = "🇪🇨 JARHUB 🇪🇨"
    Title.BorderSizePixel = 0
    Title.Parent = MainFrame

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Name = "ScrollingFrame"
    ScrollingFrame.Size = UDim2.new(1, -10, 1, -110)
    ScrollingFrame.Position = UDim2.new(0, 5, 0, 55)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.BorderSizePixel = 0
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 900)
    ScrollingFrame.ScrollBarThickness = 6
    ScrollingFrame.Parent = MainFrame

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollingFrame
    UIListLayout.Padding = UDim.new(0, 5)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local function CreateButton(text, color, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(1, -10, 0, 40)
        Button.BackgroundColor3 = color
        Button.TextColor3 = Color3.new(1, 1, 1)
        Button.TextSize = 13
        Button.Font = Enum.Font.Gotham
        Button.Text = text
        Button.BorderSizePixel = 0
        Button.Parent = ScrollingFrame
        
        Button.MouseButton1Click:Connect(callback)
        
        Button.MouseEnter:Connect(function()
            Button.BackgroundColor3 = Color3.new(color.R * 1.2, color.G * 1.2, color.B * 1.2)
        end)
        
        Button.MouseLeave:Connect(function()
            Button.BackgroundColor3 = color
        end)
    end

    -- ASSASSINS VS SHERIFF
    CreateButton("🔫 ASSASSINS VS SHERIFF", Color3.new(0.7, 0.1, 0.1), function() end)
    CreateButton("ESP", Color3.new(1, 0.3, 0.3), ESP_FUNC)
    CreateButton("INVISIBLE", Color3.new(1, 0.3, 0.3), INVISIBLE_FUNC)
    CreateButton("SILENTIA", Color3.new(1, 0.3, 0.3), SILENTIA_FUNC)
    CreateButton("AUTO SHOT", Color3.new(1, 0.3, 0.3), AUTOSHOT_FUNC)
    CreateButton("KILL ALL", Color3.new(1, 0.3, 0.3), KILLALL_FUNC)
    CreateButton("NO CLIP", Color3.new(1, 0.3, 0.3), NOCLIP_FUNC)
    CreateButton("SPEED", Color3.new(1, 0.3, 0.3), SPEED_FUNC)
    CreateButton("INFINITE JUMP", Color3.new(1, 0.3, 0.3), INFINITEJUMP_FUNC)
    CreateButton("FLING ALL", Color3.new(1, 0.3, 0.3), FLING_FUNC)
    CreateButton("GOD MODE", Color3.new(1, 0.3, 0.3), GODMODE_FUNC)
    CreateButton("ANTI RAGDOLL", Color3.new(1, 0.3, 0.3), ANTIRAGDOLL_FUNC)

    -- BLIND FIRE
    CreateButton("🎯 BLIND FIRE", Color3.new(0.1, 0.4, 0.7), function() end)
    CreateButton("AIMBOT", Color3.new(0.3, 0.6, 1), AIMBOT_FUNC)
    CreateButton("ANTI RAGDOLL", Color3.new(0.3, 0.6, 1), ANTIRAGDOLL_FUNC)

    -- STEAL BRAINROTS
    CreateButton("👻 STEAL BRAINROTS", Color3.new(0.1, 0.6, 0.1), function() end)
    CreateButton("DESYNC", Color3.new(0.3, 1, 0.3), DESYNC_FUNC)
    CreateButton("INVISIBLE", Color3.new(0.3, 1, 0.3), INVISIBLE_FUNC)

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Size = UDim2.new(1, -10, 0, 40)
    CloseButton.Position = UDim2.new(0, 5, 1, -50)
    CloseButton.BackgroundColor3 = Color3.new(1, 0.2, 0.2)
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.TextSize = 13
    CloseButton.Font = Enum.Font.Gotham
    CloseButton.Text = "❌ CERRAR"
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = MainFrame

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    print("[JARHUB] ✅ Menú creado exitosamente")
    print("[JARHUB] 🇪🇨 JARHUB UNIVERSAL v3.0 CARGADO 🇪🇨")

end)
