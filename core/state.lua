-- ===== VARIABLES RUNTIME ===== subsection
-- this variables don't savedvariables between sessions

-- Containers for frames

aDF_frames = {}       -- Container for all debuff frame elements

-- Shared runtime state across modules

aDF_State = {
    target = nil,
    armorPrev = 30000,
    lastResUpdate = 0
}

-- Global frames for external access

aDF_ArmorFrame = nil
aDF_DebuffFrame = nil
aDF_ResFrame = nil
