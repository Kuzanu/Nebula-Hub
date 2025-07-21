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
