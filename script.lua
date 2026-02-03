-- CBRO Project: misterzeee's Rage Menu
-- Using plain text to prevent Bytecode Version Mismatch (Error 2)

-- 1. Load the UI Library (Extracted from your source)
local success, uiLibCode = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/misterzeee/SevereUiLib/main/MainByteCode.lua")
end)

if not success then warn("Failed to load SevereUiLib!") return end

local zeeUi = loadstring(uiLibCode)()
zeeUi:setTheme("Emerald") -- Set from your original theme choice

-- 2. Variables & Setup
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Weapons = ReplicatedStorage:FindFirstChild("Weapons")

local currentSettings = {
    fireRate = 1,
    reloadTime = 1,
    ammo = 30,
    storedAmmo = 90,
    spread = 1,
    automatic = true
}

-- 3. The Function to Apply Changes
local function ApplyWeaponData()
    if not Weapons then warn("No Weapons folder found!") return end
    
    for _, gun in pairs(Weapons:GetChildren()) do
        -- These value names are pulled directly from your bytecode
        if gun:FindFirstChild("FireRate") then gun.FireRate.Value = currentSettings.fireRate end
        if gun:FindFirstChild("ReloadTime") then gun.ReloadTime.Value = currentSettings.reloadTime end
        if gun:FindFirstChild("Ammo") then gun.Ammo.Value = currentSettings.ammo end
        if gun:FindFirstChild("StoredAmmo") then gun.StoredAmmo.Value = currentSettings.storedAmmo end
        if gun:FindFirstChild("Spread") then gun.Spread.Value = currentSettings.spread end
        if gun:FindFirstChild("Automatic") then gun.Automatic.Value = currentSettings.automatic end
    end
    print("Stats Applied! 🔫")
end

-- 4. Create UI (Based on your labels)
local win = zeeUi:createWindow({title = "misterzeee's CBRO Rage Menu"})
local tab1 = win:addTab({text = "Gun Mods"})
local tab2 = win:addTab({text = "Visuals"})

tab1:addSlider({text = "Fire Rate", min = 0, max = 10, default = 1, OnChanged = function(v)
    currentSettings.fireRate = v
    ApplyWeaponData()
end})

tab1:addSlider({text = "Reload Time", min = 0, max = 10, default = 1, OnChanged = function(v)
    currentSettings.reloadTime = v
    ApplyWeaponData()
end})

tab1:addCheckbox({text = "Automatic", default = true, OnChanged = function(v)
    currentSettings.automatic = v
    ApplyWeaponData()
end})

tab1:addButton({text = "Reset Guns", OnClick = function()
    -- Reset to standard values
    currentSettings = {fireRate = 1, reloadTime = 1, ammo = 30, storedAmmo = 90, spread = 1, automatic = true}
    ApplyWeaponData()
end})

tab2:addText({text = "Visuals Coming Soon"})
