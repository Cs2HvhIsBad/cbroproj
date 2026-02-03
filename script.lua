-- CBRO Project: Fixed Loader
print("Attempting to load script...")

-- 1. Get the UI Library
-- I changed this to use the cleaner raw link to avoid redirects
local uiUrl = "https://raw.githubusercontent.com/misterzeee/SevereUiLib/main/MainByteCode.lua"
local uiSuccess, uiContent = pcall(function() return game:HttpGet(uiUrl) end)

if not uiSuccess then 
    warn("Failed to fetch UI Lib from GitHub! ❌")
    return 
end

-- 2. Try to load the UI
local uiLoadSuccess, zeeUi = pcall(function()
    local f = loadstring(uiContent)
    return f()
end)

if not uiLoadSuccess or type(zeeUi) ~= "table" then
    warn("UI Library is broken or version mismatched (Error 2). ⚠️")
    -- We can't continue without the UI, so we stop here.
    return
end

-- 3. If UI loaded, build the menu
print("UI Loaded! Building Menu... ✨")
zeeUi:setTheme("Emerald")

local win = zeeUi:createWindow({title = "misterzeee's CBRO Rage Menu"})
local tab1 = win:addTab({text = "Gun Mods"})

-- Example Button to test if it's working
tab1:addButton({text = "Test Mod", OnClick = function()
    print("Mod button clicked!")
end})
