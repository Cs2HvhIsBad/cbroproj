--[[ 
    REWRITTEN CBRO MODS 
    This is the plain-text version to avoid "Error 2" kicks.
]]

-- Fetch the UI Library (Using the raw link found in your file strings)
local success, uiLibCode = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/misterzeee/SevereUiLib/main/MainByteCode.lua")
end)

if not success then warn("Failed to load UI Library!") return end

local zeeUi = loadstring(uiLibCode)()
zeeUi:setTheme("Emerald")

-- Variables for Gun Mods
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Weapons = ReplicatedStorage:FindFirstChild("Weapons")

-- Function to Apply the Mods to all weapons
local function ApplyWeaponData(settings)
    if not Weapons then warn("Weapons folder not found!") return end
    
    for _, gun in pairs(Weapons:GetChildren()) do
        if gun:IsA("Configuration") or gun:IsA("Folder") then
            if gun:FindFirstChild("FireRate") then gun.FireRate.Value = settings.fireRate end
            if gun:FindFirstChild("ReloadTime") then gun.ReloadTime.Value = settings.reloadTime end
            if gun:FindFirstChild("Ammo") then gun.Ammo.Value = settings.ammo end
            if gun:FindFirstChild("StoredAmmo") then gun.StoredAmmo.Value = settings.storedAmmo end
            if gun:FindFirstChild("Spread") then gun.Spread.Value = settings.spread end
            if gun:FindFirstChild("Automatic") then gun.Automatic.Value = settings.automatic end
        end
    end
    print("Applied mods to all guns! 🔫")
end

-- Create the Window
local win = zeeUi:createWindow({title = "misterzeee's CBRO Rage Menu"})
local tab1 = win:addTab({text = "Gun Mods"})
local tab2 = win:addTab({text = "Visuals"})

-- Gun Mod UI Elements
tab1:addSlider({text = "Fire Rate", min = 0, max = 10, default = 1, OnChanged = function(v)
    -- You can trigger ApplyWeaponData here or with a button
end})

tab1:addCheckbox({text = "Automatic", OnChanged = function(v)
    -- Logic for full-auto
end})

tab1:addButton({text = "Reset Guns", OnClick = function()
    print("Guns Resetting...")
end})

tab2:addText({text = "Visuals Coming Soon"})
