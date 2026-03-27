-- Module: frame_visibility.lua
-- Purpose: manage visibility of main HUD frames based on combat state and target.
-- Exports: aDF:UpdateFrameVisibility(), aDF:hideFrames().
-- Depends on: aDF_State, frame globals (aDF_ArmorFrame, aDF_ResFrame, aDF_DebuffFrame).
-- Used by: ui/frames.lua at initialization, core/events.lua for dynamic updates.

local state = aDF_State
local config = aDF:GetDB()

function aDF:UpdateFrameVisibility()
                
                -- config.display.showArmorBackground
                -- config.display.showArmorText
                -- config.display.showResistanceBackground 
                -- config.display.showResistanceText
                -- config.display.showDebuffBackground
                
                

    DEFAULT_CHAT_FRAME:AddMessage(" -- UpdateFramVisibility --", 1, 1, 0)
    if state.target~=nil or config.framesVisible then
        DEFAULT_CHAT_FRAME:AddMessage("Target is not nil: " ..state.target, 1, 1, 0)
        if config.display.showArmorBackground then 
            aDF_ArmorFrame:Show() 
            DEFAULT_CHAT_FRAME:AddMessage("Armor show",1, 1, 0)
        end
        if config.display.showResistanceBackground then 
            aDF_ResFrame:Show() 
            DEFAULT_CHAT_FRAME:AddMessage("Resistance show", 1, 1, 0)
        end 
        if state.inCombat then
            DEFAULT_CHAT_FRAME:AddMessage("We in combat", 1, 1, 0)
            if state.targetHasTrackedDebuff then 
                --Shows even if debuff isnt TRACKED BY ME
                DEFAULT_CHAT_FRAME:AddMessage("We have tracked debuff", 1, 1, 0)
                aDF_DebuffFrame:Show()
            else
                DEFAULT_CHAT_FRAME:AddMessage("We dont have any tracked debuff", 1, 1, 0)
                aDF_DebuffFrame:Hide()
            end
        else
            DEFAULT_CHAT_FRAME:AddMessage("We arent in combat so we hide Debuffs", 1, 1, 0)
            aDF_DebuffFrame:Hide()
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("Hiding all frames", 1, 1, 0)
        aDF:hideFrames()
    end
end

function aDF:hideFrames()
    aDF_ArmorFrame:Hide()
    aDF_ResFrame:Hide()
    aDF_DebuffFrame:Hide()
end