-- Thanks go Goki for the original work - https://github.com/gokiburikin/gkbrkn_noita
if EntityGetFirstComponent( player_entity, "LuaComponent", "gold_decay_influencer" ) == nil then
    EntityAddComponent( player_entity, "LuaComponent", {
        _tags="gold_decay_influencer",
        script_source_file="mods/gold_decay/files/player_update.lua",
        execute_every_n_frame="1",
    });
end