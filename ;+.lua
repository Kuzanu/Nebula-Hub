local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
 
local Window = Library:CreateWindow{
    Title = "Nebula Hub | Game: LOS | Version [v.0.3.1]",
    SubTitle = "by ttvkaiser",
    TabWidth = 160,
    Size = UDim2.fromOffset(1087, 690.5),
    Resize = true,
    MinSize = Vector2.new(470, 380),
    Acrylic = true,
    Theme = "Amethyst Dark",
    MinimizeKey = Enum.KeyCode.RightControl
}


local Tabs = {
  Home = Window:CreateTab{
    	Title = "Home",
    	Icon = "house"
    },
  Main = Window:CreateTab{
    	Title = "Main",
    	Icon = "align-justify"
    },
  Rebirth = Window:CreateTab{
    	Title = "Rebirths",
    	Icon = "loader-circle"
    },
  Teleport = Window:CreateTab{
    	Title = "Teleport",
    	Icon = "tree-palm"
    },
  Misc = Window:CreateTab{
    	Title = "Misc",
    	Icon = "command"
    },
  Credits = Window:CreateTab{
        Title = "Credits",
        Icon = "credit-card"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}
local Options = Library.Options

Library:Notify{
    Title = "Welcome to Nebula Hub",
    Content = "Nebula Hub supports 6 games!",
    SubContent = "This game is legends of speed and currently in beta!",
    Duration = 13 
}

Tabs.Home:AddSection("Discord Server Link")

Tabs.Home:CreateButton({
    Title = "Click to Copy Link",
    Description = "This allows you to join our Discord server and get update pings and more.",
    Callback = function()
        Window:Dialog({
            Title = "Join Our Discord",
            Content = "Would you like to copy the invite link to our Discord server?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        local link = "https://discord.gg/xbRqESfpD8"
                        setclipboard(link)
                        print("Copied Discord link to clipboard.")
                    end
                }
            }
        })
    end
})

Tabs.Main:AddSection("Auto Orbing (City)")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoROrbFarm = false

local CityOrb3Toggle = Tabs.Main:CreateToggle("AutoROrbFarm", {
    Title = "Auto Red Orb Farm",
    Default = false
})

CityOrb3Toggle:OnChanged(function()
    autoROrbFarm = CityOrb3Toggle.Value
    task.spawn(function()
        while autoROrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Red Orb", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrb3Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoBOrbFarm = false

local CityOrb2Toggle = Tabs.Main:CreateToggle("AutoBOrbFarm", {
    Title = "Auto Blue Orb Farm",
    Default = false
})

CityOrb2Toggle:OnChanged(function()
    autoBOrbFarm = CityOrb2Toggle.Value
    task.spawn(function()
        while autoBOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Blue Orb", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrb2Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoOOrbFarm = false

local CityOrb4Toggle = Tabs.Main:CreateToggle("AutoOOrbFarm", {
    Title = "Auto Orange Orb Farm",
    Default = false
})

CityOrb4Toggle:OnChanged(function()
    autoOOrbFarm = CityOrb4Toggle.Value
    task.spawn(function()
        while autoOOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Orange Orb", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrb4Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoYOrbFarm = false

local CityOrb1Toggle = Tabs.Main:CreateToggle("AutoYOrbFarm", {
    Title = "Auto Yellow Orb Farm",
    Default = false
})

CityOrb1Toggle:OnChanged(function()
    autoYOrbFarm = CityOrb1Toggle.Value
    task.spawn(function()
        while autoYOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Yellow Orb", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrb1Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoEOrbFarm = false

local CityOrb5Toggle = Tabs.Main:CreateToggle("AutoEOrbFarm", {
    Title = "Auto Ethereal Orb Farm",
    Default = false
})

CityOrb5Toggle:OnChanged(function()
    autoEOrbFarm = CityOrb5Toggle.Value
    task.spawn(function()
        while autoEOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Ethereal Orb", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrb5Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoGemFarm = false

local CityOrbToggle = Tabs.Main:CreateToggle("AutoGemFarm", {
    Title = "Auto Gem Farm",
    Default = false
})

CityOrbToggle:OnChanged(function()
    autoGemFarm = CityOrbToggle.Value
    task.spawn(function()
        while autoGemFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Gem", "City")
            end)
            task.wait(0.001)
        end
    end)
end)

CityOrbToggle:SetValue(false)

Tabs.Main:AddSection("Auto Orbing (Snow City)")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoROrbFarm = false

local SCityOrb3Toggle = Tabs.Main:CreateToggle("AutoROrbFarm", {
    Title = "Auto Red Orb Farm",
    Default = false
})

SCityOrb3Toggle:OnChanged(function()
    autoROrbFarm = SCityOrb3Toggle.Value
    task.spawn(function()
        while autoROrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Red Orb", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrb3Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoBOrbFarm = false

local SCityOrb2Toggle = Tabs.Main:CreateToggle("AutoBOrbFarm", {
    Title = "Auto Blue Orb Farm",
    Default = false
})

SCityOrb2Toggle:OnChanged(function()
    autoBOrbFarm = SCityOrb2Toggle.Value
    task.spawn(function()
        while autoBOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Blue Orb", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrb2Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoOOrbFarm = false

local SCityOrb4Toggle = Tabs.Main:CreateToggle("AutoOOrbFarm", {
    Title = "Auto Orange Orb Farm",
    Default = false
})

SCityOrb4Toggle:OnChanged(function()
    autoOOrbFarm = SCityOrb4Toggle.Value
    task.spawn(function()
        while autoOOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Orange Orb", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrb4Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoYOrbFarm = false

local SCityOrb1Toggle = Tabs.Main:CreateToggle("AutoYOrbFarm", {
    Title = "Auto Yellow Orb Farm",
    Default = false
})

SCityOrb1Toggle:OnChanged(function()
    autoYOrbFarm = SCityOrb1Toggle.Value
    task.spawn(function()
        while autoYOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Yellow Orb", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrb1Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoEOrbFarm = false

local SCityOrb5Toggle = Tabs.Main:CreateToggle("AutoEOrbFarm", {
    Title = "Auto Ethereal Orb Farm",
    Default = false
})

SCityOrb5Toggle:OnChanged(function()
    autoEOrbFarm = SCityOrb5Toggle.Value
    task.spawn(function()
        while autoEOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Ethereal Orb", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrb5Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoGemFarm = false

local SCityOrbToggle = Tabs.Main:CreateToggle("AutoGemFarm", {
    Title = "Auto Gem Farm",
    Default = false
})

SCityOrbToggle:OnChanged(function()
    autoGemFarm = SCityOrbToggle.Value
    task.spawn(function()
        while autoGemFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Gem", "Snow City")
            end)
            task.wait(0.001)
        end
    end)
end)

SCityOrbToggle:SetValue(false)

Tabs.Main:AddSection("Auto Orbing (Magma City)")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoROrbFarm = false

local MCityOrb3Toggle = Tabs.Main:CreateToggle("AutoROrbFarm", {
    Title = "Auto Red Orb Farm",
    Default = false
})

MCityOrb3Toggle:OnChanged(function()
    autoROrbFarm = MCityOrb3Toggle.Value
    task.spawn(function()
        while autoROrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Red Orb", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrb3Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoBOrbFarm = false

local MCityOrb2Toggle = Tabs.Main:CreateToggle("AutoBOrbFarm", {
    Title = "Auto Blue Orb Farm",
    Default = false
})

MCityOrb2Toggle:OnChanged(function()
    autoBOrbFarm = MCityOrb2Toggle.Value
    task.spawn(function()
        while autoBOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Blue Orb", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrb2Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoOOrbFarm = false

local MCityOrb4Toggle = Tabs.Main:CreateToggle("AutoOOrbFarm", {
    Title = "Auto Orange Orb Farm",
    Default = false
})

MCityOrb4Toggle:OnChanged(function()
    autoOOrbFarm = MCityOrb4Toggle.Value
    task.spawn(function()
        while autoOOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Orange Orb", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrb4Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoYOrbFarm = false

local MCityOrb1Toggle = Tabs.Main:CreateToggle("AutoYOrbFarm", {
    Title = "Auto Yellow Orb Farm",
    Default = false
})

MCityOrb1Toggle:OnChanged(function()
    autoYOrbFarm = MCityOrb1Toggle.Value
    task.spawn(function()
        while autoYOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Yellow Orb", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrb1Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoEOrbFarm = false

local MCityOrb5Toggle = Tabs.Main:CreateToggle("AutoEOrbFarm", {
    Title = "Auto Ethereal Orb Farm",
    Default = false
})

MCityOrb5Toggle:OnChanged(function()
    autoEOrbFarm = MCityOrb5Toggle.Value
    task.spawn(function()
        while autoEOrbFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Ethereal Orb", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrb5Toggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("orbEvent")

local autoGemFarm = false

local MCityOrbToggle = Tabs.Main:CreateToggle("AutoGemFarm", {
    Title = "Auto Gem Farm",
    Default = false
})

MCityOrbToggle:OnChanged(function()
    autoGemFarm = MCityOrbToggle.Value
    task.spawn(function()
        while autoGemFarm do
            pcall(function()
                orbEvent:FireServer("collectOrb", "Gem", "Magma City")
            end)
            task.wait(0.001)
        end
    end)
end)

MCityOrbToggle:SetValue(false)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rebirthEvent = ReplicatedStorage:WaitForChild("rEvents"):WaitForChild("rebirthEvent")

local autoRebirth = false

local rToggle = Tabs.Rebirth:CreateToggle("AutoRebirth", {
    Title = "Auto Rebirth",
    Default = false
})

rToggle:OnChanged(function()
    autoRebirth = rToggle.Value
    task.spawn(function()
        while autoRebirth do
            pcall(function()
                rebirthEvent:FireServer("rebirthRequest")
            end)
            task.wait(0.04)
        end
    end)
end)

rToggle:SetValue(false)

Tabs.Rebirth:AddSection("Glitchable Rebirths")

Tabs.Rebirth:CreateParagraph("Aligned Paragraph", {
    Title = "Glitchable Rebirths",
    Content = "soon.",
    TitleAlignment = "Middle",
    ContentAlignment = Enum.TextXAlignment.Center
})

Tabs.Teleport:CreateButton{
    Title = "Teleport to City",
    Description = "",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

       
        local x, y, z = -607.5, 4.1, 416.6

        hrp.CFrame = CFrame.new(x, y, z)
    end
}

Tabs.Teleport:CreateButton{
    Title = "Teleport to Snow City",
    Description = "",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

       
        local x, y, z = -561.1, 4.1, 2446.6

        hrp.CFrame = CFrame.new(x, y, z)
    end
}

Tabs.Teleport:CreateButton{
    Title = "Teleport to Magma City",
    Description = "",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

       
        local x, y, z = 1616.8, 4.2, 4330.6

        hrp.CFrame = CFrame.new(x, y, z)
    end
}

Tabs.Misc:CreateButton({
    Title = "Permanent Shift Lock",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
    end
})

local Toggle = Tabs.Misc:CreateToggle("LockPosition", {
    Title = "Lock Position",
    Default = false
})

Toggle:OnChanged(function(Value)
    if Value then
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
    end
end)

-- Disable Trade Toggle
Tabs.Misc:CreateToggle("DisableTrade", {Title = "Disable Trade", Default = false}):OnChanged(function(state)
    local tradeEvent = game:GetService("ReplicatedStorage").rEvents.tradingEvent
    if state then
        tradeEvent:FireServer("disableTrading")
    else
        tradeEvent:FireServer("enableTrading")
    end
end)

-- Hide Pets Toggle
Tabs.Misc:CreateToggle("HidePets", {Title = "Hide Pets", Default = false}):OnChanged(function(state)
    local petEvent = game:GetService("ReplicatedStorage").rEvents.showPetsEvent
    if state then
        petEvent:FireServer("hidePets")
    else
        petEvent:FireServer("showPets")
    end
end)

Tabs.Misc:CreateSection("Game Enhancers")

-- Anti AFK Button
Tabs.Misc:CreateButton({
    Title = "Anti AFK",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/MAIN%20AINTI%20AFK%20.txt"))()
    end
})

Tabs.Misc:CreateButton{
    Title = "Instant FPS Boost",
    Description = "Clears effects and boosts performance immediately.",
    Callback = function()
        -- Disable laggy visual effects
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") then
                obj.Enabled = false
            elseif obj:IsA("Explosion") then
                obj:Destroy()
            end
        end

        -- Remove decals/textures
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            end
        end

        -- Lower graphics quality
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        -- Turn off terrain decorations if available
        if workspace:FindFirstChildOfClass("Terrain") then
            workspace.Terrain.Decorations = false
        end

        -- Force garbage collection
        collectgarbage("collect")

        print("[Nebula Hub] Performance Boost Applied ✔️")
    end
}

Tabs.Misc:CreateButton{
    Title = "No Lag",
    Description = "Instantly removes lag by cleaning visuals, effects, and more.",
    Callback = function()
        -- Disable visual effects
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
                obj.Enabled = false
            elseif obj:IsA("Explosion") then
                obj:Destroy()
            elseif obj:IsA("Decal") or obj:IsA("Texture") then
                obj:Destroy()
            elseif obj:IsA("Lighting") then
                obj:Destroy()
            end
        end

        -- Lower graphics quality
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

        -- Disable terrain decoration
        if workspace:FindFirstChildOfClass("Terrain") then
            workspace.Terrain.Decorations = false
        end

        -- Remove sounds
        for _, s in pairs(workspace:GetDescendants()) do
            if s:IsA("Sound") then
                s:Destroy()
            end
        end

        -- Remove accessories and clothing
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        for _, item in pairs(character:GetDescendants()) do
            if item:IsA("Accessory") or item:IsA("Clothing") or item:IsA("ShirtGraphic") then
                item:Destroy()
            end
        end

        -- Disable global shadows and blur
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.FogEnd = 100000
        lighting.Blur = nil

        -- Garbage collect memory
        collectgarbage("collect")

        print("[Nebula Hub] 🧹 No Lag Mode Activated")
    end
}

local creditsParagraph = Tabs.Credits:CreateParagraph("Paragraph", {
    Title = "Special Thanks to ttvkaiser",
    Content = "Massive appreciation to ttvkaiser, the emperor, mastermind, and original creator behind this powerful and feature-rich script. Without his dedication, creativity, and relentless work, none of this would have been possible. Every line of code reflects his vision for excellence."
})

SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes{}

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Nebula Hub",
    Content = "The script has been loaded.",
    Duration = 1
}


SaveManager:LoadAutoloadConfig()
