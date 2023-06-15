-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
local decay_mode = ModSettingGet("gold_decay.mode")

if decay_mode == "always" then
    dofile_once("data/scripts/perks/perk.lua")
    local x, y = EntityGetTransform(player_entity)
    local perk = perk_spawn(x, y, "GOLD_DECAY") -- spawn gold decay perk at player position
    perk_pickup(perk, player_entity, EntityGetName(perk), false, false) -- pick up the perk immediately
end    