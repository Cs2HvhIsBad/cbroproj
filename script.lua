-- CBRO REWRITE
print("CBRO Script Starting...")

local function loadLib()
    -- Attempt to load the UI library
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/misterzeee/SevereUiLib/main/MainByteCode.lua"))()
    end)
    
    if success and result then
        return result
    else
        -- Fallback if the UI Lib is the thing causing Error 2
        warn("UI Library failed to load. It might still be bytecode!")
        return nil
    end
end

local zeeUi = loadLib()

if zeeUi then
    zeeUi:setTheme("Emerald")
    local win = zeeUi:createWindow({title = "misterzeee's CBRO Rage"})
    local tab1 = win:addTab({text = "Gun Mods"})

    tab1:addButton({text = "Click to Mod Guns", OnClick = function()
        local Weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
        if Weapons then
            for _, v in pairs(Weapons:GetChildren()) do
                if v:FindFirstChild("FireRate") then
                    v.FireRate.Value = 0.05 -- Super fast!
                    print("Modded: " .. v.Name)
                end
            end
        end
    end})
else
    -- This shows up in F9 if the UI lib is the problem
    print("FAILED: UI Lib is either down or needs to be plain text too.")
end
