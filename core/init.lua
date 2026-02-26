-- ==== FRAME INITIALIZATION ==== 
-- Use a distinct global name for the options frame so it doesn't collide with the
-- SavedVariables table `aDF_Options`. UISpecialFrames expects a Frame, not a table.
-- Now the aDF.lua in savedvariables only contains the configuration data.

aDF = CreateFrame('Button', "aDF", UIParent) -- Main event frame
aDF.Options = CreateFrame("Frame","aDF_OptionsFrame",UIParent) -- Options frame (global name for UISpecialFrames ESC handling)

-- Register events

aDF:RegisterEvent("ADDON_LOADED")
aDF:RegisterEvent("UNIT_AURA")
aDF:RegisterEvent("PLAYER_TARGET_CHANGED")