-- SERVICES
local UIS = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- CLEANUP
if PlayerGui:FindFirstChild("HentaiHubUILibrarySelector") then
	PlayerGui.HentaiHubUILibrarySelector:Destroy()
end

-- GUI
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "HentaiHubUILibrarySelector"
gui.ResetOnSpawn = false

-- MAIN FRAME
local frame = Instance.new("Frame", gui)
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 350, 0, 230)
frame.Position = UDim2.new(0.5, -175, 0.5, -115)
frame.BackgroundColor3 = Color3.fromRGB(255, 202, 212)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- 👈 THIS makes it drag easily
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 16)

-- TITLE
local title = Instance.new("TextLabel", frame)
title.Text = "💗 Choose Your UI Library 💗"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 10)

-- FUNCTION: Button Creator
local function createButton(text, yPos, callback)
	local button = Instance.new("TextButton", frame)
	button.Text = text
	button.Font = Enum.Font.GothamSemibold
	button.TextSize = 18
	button.TextColor3 = Color3.new(1, 1, 1)
	button.BackgroundColor3 = Color3.fromRGB(255, 153, 180)
	button.Size = UDim2.new(0.7, 0, 0, 40)
	button.Position = UDim2.new(0.15, 0, yPos, 0)
	button.BorderSizePixel = 0

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 10)

	button.MouseButton1Click:Connect(function()
		gui:Destroy()
		callback()
	end)
end

-- CREATE UI LIBRARY BUTTONS
createButton("Elerium UI", 0.35, function()
	print("Elerium UI Selected")
	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()

local window = library:AddWindow("Hentai Hub | Paid & Private", {
main_color = Color3.fromRGB(255, 153, 204), -- Pastel Strawberry
	min_size = Vector2.new(600, 600),
	can_resize = false,
})

local main = window:AddTab("Main")
main:Show()

local autoOrbsfolder = main:AddFolder("    Auto Orbs")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage.rEvents.orbEvent

local selectedOrb = "Red Orb"
local selectedCity = "City"
local farming = false
local collectAll = false

local orbList = {
	"Red Orb",
	"Blue Orb",
	"Orange Orb",
	"Yellow Orb",
	"Ethereal Orb",
	"Gem"
}

local orbDropdown = autoOrbsfolder:AddDropdown("Select Orb", function(text)
	selectedOrb = text
end)
orbDropdown:Add("Red Orb")
orbDropdown:Add("Blue Orb")
orbDropdown:Add("Orange Orb")
orbDropdown:Add("Yellow Orb")
orbDropdown:Add("Ethereal Orb")
orbDropdown:Add("Gem")

local cityDropdown = autoOrbsfolder:AddDropdown("Select City", function(text)
	selectedCity = text
end)
cityDropdown:Add("City")
cityDropdown:Add("Snow City")
cityDropdown:Add("Magma City")

local orbSwitch = autoOrbsfolder:AddSwitch("Auto Orb", function(bool)
	farming = bool
end)
orbSwitch:Set(false)

local allSwitch = autoOrbsfolder:AddSwitch("Collect All Orbs & Gems", function(bool)
	collectAll = bool
end)
allSwitch:Set(false)

task.spawn(function()
	while true do
		if collectAll then
			for _, orb in ipairs(orbList) do
				pcall(function()
					orbEvent:FireServer("collectOrb", orb, selectedCity)
				end)
				task.wait(0.00001)
			end
		elseif farming then
			pcall(function()
				orbEvent:FireServer("collectOrb", selectedOrb, selectedCity)
			end)
			task.wait(0.00001)
		end
		task.wait(0.00001)
	end
end)

local autoHoopfolder = main:AddFolder("    Auto Hoop")

autoHoopfolder:AddLabel("🔞 Unlocking forbidden scripts... just a little longer.")

local autoOpenCrystalsfolder = main:AddFolder("    Auto Open Crystals")

local selectedCrystal = "Red Crystal"
local autoCrystalRunning = false
local crystalEvent = ReplicatedStorage.rEvents.openCrystalRemote

local cummingdropdown = autoOpenCrystalsfolder:AddDropdown("Select Crystal", function(text)
	selectedCrystal = text
end)

local crystalNames = {
	"Red Crystal", "Green Crystal", "Frozen Crystal", "Mythical Crystal",
	"Inferno Crystal", "Legends Crystal", "Muscle Elite Crystal",
	"Galaxy Oracle Crystal", "Sky Eclipse Crystal", "Jungle Crystal"
}

for _, name in ipairs(crystalNames) do
	cummingdropdown:Add(name)
end

local function autoOpenCrystal()
	while autoCrystalRunning do
		pcall(function()
			crystalEvent:FireServer("openCrystal", selectedCrystal)
		end)
		task.wait(0.1)
	end
end

local cumswitch = autoOpenCrystalsfolder:AddSwitch("Auto Crystal", function(state)
	autoCrystalRunning = state
	if autoCrystalRunning then
		task.spawn(autoOpenCrystal)
	end
end)

local autoRebirthfolder = main:AddFolder("    Auto Rebirth")

local rebirthing = false
local rebirthEvent = ReplicatedStorage.rEvents.rebirthEvent

local AutoRswitch = autoRebirthfolder:AddSwitch("Auto Rebirth (infinitely)", function(bool)
	rebirthing = bool
end)
AutoRswitch:Set(false)

task.spawn(function()
	while true do
		if rebirthing then
			pcall(function()
				rebirthEvent:FireServer("rebirthRequest")
			end)
		end
		task.wait(0.01)
	end
end)

local misc = window:AddTab("Miscellaneous")

local playerModfolder = misc:AddFolder("    Player Mod")

-- Auto Set Speed Button
playerModfolder:AddButton("Auto Set Speed", function()
    task.spawn(function()
        while true do
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 150 -- Change value as needed
            end
            task.wait(0.1)
        end
    end)
end)

-- Auto Set Jump Power Button
playerModfolder:AddButton("Auto Set Jump", function()
    task.spawn(function()
        while true do
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = 200 -- Change value as needed
            end
            task.wait(0.1)
        end
    end)
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local noclip = false

local ncpswitch = playerModfolder:AddSwitch("No Clip", function(bool)
	noclip = bool
end)
ncpswitch:Set(false)

-- Constantly disable collisions when noclip is on
RunService.Stepped:Connect(function()
	if noclip and localPlayer.Character then
		for _, part in ipairs(localPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

-- Also disable collisions if new parts are added to character
localPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	if noclip then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

local gameEnchancersfolder = misc:AddFolder("    Game Enchancers")

gameEnchancersfolder:AddButton("Anti AFK/lag/kick",function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/MAIN%20AINTI%20AFK%20.txt"))()
end)

gameEnchancersfolder:AddLabel("------------------------------------------------------------------------------------------------------------------------------------")

gameEnchancersfolder:AddButton("☀ Set Daytime", function()
	game:GetService("Lighting").ClockTime = 12 -- Daytime
end)

gameEnchancersfolder:AddButton("☾ Set Nighttime", function()
	game:GetService("Lighting").ClockTime = 0 -- Daytime
end)

gameEnchancersfolder:AddLabel("------------------------------------------------------------------------------------------------------------------------------------")

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScreenOverlay"
gui.ResetOnSpawn = false

local overlay = Instance.new("Frame", gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.ZIndex = 999

-- Black Screen Switch
local blackSwitch = gameEnchancersfolder:AddSwitch("Black Screen", function(state)
	if state then
		overlay.BackgroundColor3 = Color3.new(0, 0, 0)
		overlay.BackgroundTransparency = 0
	else
		overlay.BackgroundTransparency = 1
	end
end)
blackSwitch:Set(false)

-- White Screen Switch
local whiteSwitch = gameEnchancersfolder:AddSwitch("White Screen", function(state)
	if state then
		overlay.BackgroundColor3 = Color3.new(1, 1, 1)
		overlay.BackgroundTransparency = 0
	else
		overlay.BackgroundTransparency = 1
	end
end)
whiteSwitch:Set(false)

local credits = window:AddTab("Credits")

credits:AddLabel("Hentai Hub made by: GuyWhoLovesLewd&HentaiVids")

credits:AddLabel("I created this script just for fun and especially for y'all,")
credits:AddLabel("because many executors censor this kind of stuff and it might even get you banned.")
credits:AddLabel("That's why it's private — to keep things safe.")
credits:AddLabel("")
credits:AddLabel("If you share it, you *will* be banned from our Discord server lol, so don't hate!")
credits:AddLabel("Just a regular guy who likes to fap (⁠◠⁠‿⁠◕⁠) keeping it real and honest here.")
credits:AddLabel("")
credits:AddLabel("Enjoy Hentai Hub and stay spicy, fam!")

local questionMark = window:AddTab("?????")

local checkfolder = questionMark:AddFolder("    Check!")

checkfolder:AddLabel("I know you are a simp. in credits i say i am a boy well i am not. contact me on discord when you\nwanna see an picture of me, my pussy or anything daddy")
end)

createButton("Fluent UI", 0.55, function()
	print("Fluent UI Selected")
	local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
 
local Window = Library:CreateWindow{
    Title = "Hentai Hub | Paid & Private",
    SubTitle = "by GuyWhoLovesLewd&HentaiVids",
    TabWidth = 160,
    Size = UDim2.fromOffset(1087, 690.5),
    Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
    MinSize = Vector2.new(470, 380),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Rose",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
}

-- Fluent Renewed provides ALL 1544 Lucide 0.469.0 https://lucide.dev/icons/ Icons and ALL 9072 Phosphor 2.1.0 https://phosphoricons.com/ Icons for the tabs, icons are optional
local Tabs = {
    Main = Window:CreateTab{
        Title = "Main",
        Icon = "align-justify"
    },
  Misc = Window:CreateTab{
        Title = "Miscellaneous",
        Icon = "command"
    },
  Credits = Window:CreateTab{
        Title = "Credits",
        Icon = "credit-card"
    },
  Question = Window:CreateTab{
        Title = "?????",
        Icon = "file-question-mark"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}

local Options = Library.Options

Library:Notify{
    Title = "Notification",
    Content = "This is a notification",
    SubContent = "SubContent", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
}
    
Tabs.Main:AddSection("Auto Orb")

    
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage.rEvents.orbEvent

-- Variables
local selectedOrb = "Red Orb"
local selectedCity = "City"
local farming = false
local collectAll = false

local orbList = {
	"Red Orb",
	"Blue Orb",
	"Orange Orb",
	"Yellow Orb",
	"Ethereal Orb",
	"Gem"
}

local cityList = {
	"City",
	"Snow City",
	"Magma City"
}

-- UI Setup
local OrbDropdown = Tabs.Main:AddDropdown("SelectOrb", {
	Title = "Select Orb",
	Values = orbList,
	Multi = false,
	Default = 1,
})

OrbDropdown:OnChanged(function(value)
	selectedOrb = value
end)

local CityDropdown = Tabs.Main:AddDropdown("SelectCity", {
	Title = "Select City",
	Values = cityList,
	Multi = false,
	Default = 1,
})

CityDropdown:OnChanged(function(value)
	selectedCity = value
end)

local ToggleAutoOrb = Tabs.Main:AddToggle("AutoOrb", {
	Title = "Auto Orb",
	Default = false,
})

ToggleAutoOrb:OnChanged(function()
	farming = Options.AutoOrb.Value
end)

local ToggleCollectAll = Tabs.Main:AddToggle("CollectAll", {
	Title = "Collect All Orbs & Gems",
	Default = false,
})

ToggleCollectAll:OnChanged(function()
	collectAll = Options.CollectAll.Value
end)

-- Farming Logic
task.spawn(function()
	while true do
		if collectAll then
			for _, orb in ipairs(orbList) do
				pcall(function()
					orbEvent:FireServer("collectOrb", orb, selectedCity)
				end)
				task.wait(0.01) -- reasonable wait
			end
		elseif farming then
			pcall(function()
				orbEvent:FireServer("collectOrb", selectedOrb, selectedCity)
			end)
			task.wait(0.01)
		end
		task.wait(0.01)
	end
end)

Tabs.Main:AddSection("Auto Rebirth")

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rebirthEvent = ReplicatedStorage.rEvents.rebirthEvent

-- Variables
local rebirthing = false

-- UI Toggle
local ToggleAutoRebirth = Tabs.Main:AddToggle("AutoRebirth", {
	Title = "Auto Rebirth (infinitely)",
	Default = false,
})

ToggleAutoRebirth:OnChanged(function()
	rebirthing = Options.AutoRebirth.Value
end)

-- Logic
task.spawn(function()
	while true do
		if rebirthing then
			pcall(function()
				rebirthEvent:FireServer("rebirthRequest")
			end)
		end
		task.wait(0.01)
	end
end)

Tabs.Misc:AddSection("Player Mod")

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Player Reference
local localPlayer = Players.LocalPlayer
local noclip = false

-- 🏃‍♂️ Auto Set Speed Button
Tabs.Misc:CreateButton{
    Title = "Auto Set Speed",
    Description = "Sets your walk speed to 150",
    Callback = function()
        task.spawn(function()
            while true do
                if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    localPlayer.Character.Humanoid.WalkSpeed = 150
                end
                task.wait(0.1)
            end
        end)
    end
}

-- 🦘 Auto Set Jump Button
Tabs.Misc:CreateButton{
    Title = "Auto Set Jump",
    Description = "Sets your jump power to 200",
    Callback = function()
        task.spawn(function()
            while true do
                if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    localPlayer.Character.Humanoid.JumpPower = 200
                end
                task.wait(0.1)
            end
        end)
    end
}

-- 🚪 No Clip Toggle
local ToggleNoClip = Tabs.Misc:AddToggle("NoClip", {
    Title = "No Clip",
    Default = false,
})

ToggleNoClip:OnChanged(function()
    noclip = Options.NoClip.Value
end)

-- 🚷 Noclip Runtime Logic
RunService.Stepped:Connect(function()
    if noclip and localPlayer.Character then
        for _, part in ipairs(localPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 🔁 Apply Noclip on Respawn
localPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    if noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

Tabs.Misc:AddSection("Game Enchancers")

-- Services
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- GUI Setup for Overlays
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScreenOverlay"
gui.ResetOnSpawn = false

local overlay = Instance.new("Frame", gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.ZIndex = 999

-- 🚫 Anti AFK / Lag / Kick
Tabs.Misc:CreateButton{
    Title = "Anti AFK/Lag/Kick",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/MAIN%20AINTI%20AFK%20.txt"))()
    end
}

-- ─────── Divider Line ───────
Tabs.Misc:AddSection("----------------------------------------------------------------------------------------------------------")

-- ☀ Set Day Button
Tabs.Misc:CreateButton{
    Title = "☀ Set Daytime",
    Description = "Sets lighting to day (12:00)",
    Callback = function()
        Lighting.ClockTime = 12
    end
}

-- ☾ Set Night Button
Tabs.Misc:CreateButton{
    Title = "☾ Set Nighttime",
    Description = "Sets lighting to night (00:00)",
    Callback = function()
        Lighting.ClockTime = 0
    end
}

-- ─────── Divider Line ───────
Tabs.Misc:AddSection("----------------------------------------------------------------------------------------------------------")

-- 🕶 Black Screen Toggle
local ToggleBlackScreen = Tabs.Misc:AddToggle("BlackScreen", {
    Title = "Black Screen",
    Default = false,
})

ToggleBlackScreen:OnChanged(function()
    if Options.BlackScreen.Value then
        overlay.BackgroundColor3 = Color3.new(0, 0, 0)
        overlay.BackgroundTransparency = 0
    else
        overlay.BackgroundTransparency = 1
    end
end)

-- ☀ White Screen Toggle
local ToggleWhiteScreen = Tabs.Misc:AddToggle("WhiteScreen", {
    Title = "White Screen",
    Default = false,
})

ToggleWhiteScreen:OnChanged(function()
    if Options.WhiteScreen.Value then
        overlay.BackgroundColor3 = Color3.new(1, 1, 1)
        overlay.BackgroundTransparency = 0
    else
        overlay.BackgroundTransparency = 1
    end
end)

local Paragraph = Tabs.Credits:CreateParagraph("Paragraph", {
    Title = "Credits to GuyWhoLovesLewd&HentaiVids\nfor making this script!",
    Content = "\n\nI created this script just for fun and especially for y'all, because many executors censor this kind of stuff and it might even get you banned. That's why it's private — to keep things safe. If you share it, you *will* be banned from our Discord server lol, so don't hate! Just a regular guy who likes to fap (⁠◠⁠‿⁠◕⁠) keeping it real and honest here.\n\nEnjoy Hentai Hub and stay spicy, fam!"
})

Tabs.Question:CreateParagraph("Paragraph", {
    Title = "Read!",
    Content = "I know you are a simp. in credits i say i am a boy well i am not. contact me on discord when you\nwanna see an picture of me, my pussy or anything daddy"
})


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes{}

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
}

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
end)

createButton("Wind UI", 0.75, function()
	print("Wind UI Selected")
	local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

WindUI:SetFont("rbxassetid://12187367362")

WindUI:AddTheme({
	Name = "Mommy Milkers",
	Accent = "#ff8fab",       -- Vibrant pink (like strawberry syrup)
	Dialog = "#ffd1dc",       -- Light strawberry milk base
	Outline = "#ffb6c1",      -- Classic pastel pink
	Text = "#5e1f40",         -- Rich berry/cherry tone for contrast
	Placeholder = "#d179a6",  -- Muted berry pink
	Background = "#ffe4ec",   -- Creamy strawberry milk pink
	Button = "#5e1f40",       -- Sweet pink button
	Icon = "#5e1f40",         -- Soft icon tone
})

local Window = WindUI:CreateWindow({
    Title = "Hentai Hub | Private & Paid",
    Icon = "panda",
    Author = "by GuyWhoLovesLewd&HentaiVids",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(480, 360),
    Transparent = true,
    Theme = "Mommy Milkers",
    Resizable = true,
    SideBarWidth = 200,
    Background = "", -- rbxassetid only
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
})

Window:EditOpenButton({
    Title = "Hentai Hub Paid & Private",
    Icon = "panda",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 217, 234)), -- soft pastel pink
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 182, 193))  -- light pink
    }),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local main = Window:Tab({
    Title = "Main",
    Icon = "panda",
    Locked = false,
})

Window:SelectTab(1)

local Section = main:Section({ 
    Title = "Auto Orbs",
    TextXAlignment = "Left",
    TextSize = 24, -- Default Size
})

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local orbEvent = ReplicatedStorage.rEvents.orbEvent

-- Variables
local selectedOrb = "Red Orb"
local selectedCity = "City"
local farming = false
local collectAll = false

local orbList = {
	"Red Orb",
	"Blue Orb",
	"Orange Orb",
	"Yellow Orb",
	"Ethereal Orb",
	"Gem"
}

-- UI Setup (WindUI)
main:Dropdown({
	Title = "Select Orb",
	Values = orbList,
	Value = orbList[1],
	Callback = function(option)
		selectedOrb = option
	end
})

main:Dropdown({
	Title = "Select City",
	Values = { "City", "Snow City", "Magma City" },
	Value = "City",
	Callback = function(option)
		selectedCity = option
	end
})

main:Toggle({
	Title = "Auto Orb",
	Desc = "Farms the selected orb",
	Icon = "panda",
	Type = "Toggle",
	Default = false,
	Callback = function(state)
		farming = state
	end
})

main:Toggle({
	Title = "Collect All Orbs & Gems",
	Desc = "Farms all types at once",
	Icon = "panda",
	Type = "Toggle",
	Default = false,
	Callback = function(state)
		collectAll = state
	end
})

-- Farming Logic
task.spawn(function()
	while true do
		if collectAll then
			for _, orb in ipairs(orbList) do
				pcall(function()
					orbEvent:FireServer("collectOrb", orb, selectedCity)
				end)
				task.wait(0.00000000001) -- safer wait
			end
		elseif farming then
			pcall(function()
				orbEvent:FireServer("collectOrb", selectedOrb, selectedCity)
			end)
			task.wait(0.000000001)
		end
		task.wait(0.000000001)
	end
end)

local divider1Section = main:Section({ 
    Title = "----------------------------------------------------------------------------------------------------------",
    TextXAlignment = "Center",
    TextSize = 8, -- Default Size
})

local Section = main:Section({ 
    Title = "Auto Rebirth",
    TextXAlignment = "Left",
    TextSize = 24, -- Default Size
})

-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local rebirthEvent = ReplicatedStorage.rEvents.rebirthEvent

-- Variables
local rebirthing = false

-- UI Toggle
main:Toggle({
    Title = "Auto Rebirth (infinitely)",
    Desc = "Keeps rebirthing non-stop",
    Icon = "panda", -- You can change this to any icon you like
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        rebirthing = state
    end
})

-- Logic
task.spawn(function()
	while true do
		if rebirthing then
			pcall(function()
				rebirthEvent:FireServer("rebirthRequest")
			end)
		end
		task.wait(0.01)
	end
end)

local misc = Window:Tab({
    Title = "Miscellaneous",
    Icon = "panda",
    Locked = false,
})

local Section = misc:Section({
    Title = "Player Mod",
    TextXAlignment = "Left",
    TextSize = 24, -- Default Size
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local noclip = false

-- 🔘 Auto Set Speed Button
misc:Button({
    Title = "Auto Set Speed",
    Desc = "Sets your walk speed to 150",
    Locked = false,
    Callback = function()
        task.spawn(function()
            while true do
                if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    localPlayer.Character.Humanoid.WalkSpeed = 150
                end
                task.wait(0.1)
            end
        end)
    end
})

-- 🔘 Auto Set Jump Button
misc:Button({
    Title = "Auto Set Jump",
    Desc = "Sets your jump power to 200",
    Locked = false,
    Callback = function()
        task.spawn(function()
            while true do
                if localPlayer and localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
                    localPlayer.Character.Humanoid.JumpPower = 200
                end
                task.wait(0.1)
            end
        end)
    end
})

-- 🔁 No Clip Toggl
misc:Toggle({
    Title = "No Clip",
    Desc = "Walk through objects",
    Icon = "panda",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        noclip = state
    end
})

-- 👣 Noclip Handler (Stepped)
RunService.Stepped:Connect(function()
    if noclip and localPlayer.Character then
        for _, part in ipairs(localPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- 👤 Noclip on Respawn
localPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    if noclip then
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local Section = misc:Section({
    Title = "Game Enchancers",
    TextXAlignment = "Left",
    TextSize = 24, -- Default Size
})

misc:Button({
    Title = "Anti AFK/Lag/Kick",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Moha-space/SPACE-HUB-/refs/heads/main/MAIN%20AINTI%20AFK%20.txt"))()
    end
})

local divider2Section = misc:Section({ 
    Title = "----------------------------------------------------------------------------------------------------------",
    TextXAlignment = "Center",
    TextSize = 8, -- Default Size
})

-- ☀ Set Daytime Button
misc:Button({
    Title = "☀ Set Daytime",
    Desc = "Sets lighting to day (12:00)",
    Locked = false,
    Callback = function()
        game:GetService("Lighting").ClockTime = 12
    end
})

-- ☾ Set Nighttime Button
misc:Button({
    Title = "☾ Set Nighttime",
    Desc = "Sets lighting to night (00:00)",
    Locked = false,
    Callback = function()
        game:GetService("Lighting").ClockTime = 0
    end
})

local divider3Section = misc:Section({ 
    Title = "----------------------------------------------------------------------------------------------------------",
    TextXAlignment = "Center",
    TextSize = 8, -- Default Size
})

-- Setup GUI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "ScreenOverlay"
gui.ResetOnSpawn = false

local overlay = Instance.new("Frame", gui)
overlay.Size = UDim2.new(1, 0, 1, 0)
overlay.Position = UDim2.new(0, 0, 0, 0)
overlay.BackgroundTransparency = 1
overlay.ZIndex = 999

-- 🕶 Black Screen Toggle
misc:Toggle({
    Title = "Black Screen",
    Desc = "Overlays the screen in black",
    Icon = "panda", -- optional icon name
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            overlay.BackgroundColor3 = Color3.new(0, 0, 0)
            overlay.BackgroundTransparency = 0
        else
            overlay.BackgroundTransparency = 1
        end
    end
})

-- ☀ White Screen Toggle
misc:Toggle({
    Title = "White Screen",
    Desc = "Overlays the screen in white",
    Icon = "panda", -- optional icon name
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            overlay.BackgroundColor3 = Color3.new(1, 1, 1)
            overlay.BackgroundTransparency = 0
        else
            overlay.BackgroundTransparency = 1
        end
    end
})

local credits = Window:Tab({
    Title = "Credits",
    Icon = "panda",
    Locked = false,
})

local Paragraph = credits:Paragraph({
    Title = "Credits to GuyWhoLovesLewd&HentaiVids for making this script!",
    Desc = "I created this script just for fun and especially for y'all, because many executors censor this kind of stuff and it might even get you banned. That's why it's private — to keep things safe. If you share it, you *will* be banned from our Discord server lol, so don't hate! Just a regular guy who likes to fap (⁠◠⁠‿⁠◕⁠) keeping it real and honest here.\n\nEnjoy Hentai Hub and stay spicy, fam!",
    Color = "White",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})

local question = Window:Tab({
    Title = "?????",
    Icon = "file-question-mark",
    Locked = false,
})

question:Paragraph({
    Title = "Read!",
    Desc = "I know you are a simp. in credits i say i am a boy well i am not. contact me on discord when you\nwanna see an picture of me, my pussy or anything daddy",
    Color = "White",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
})
end)