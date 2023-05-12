-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
if EntityGetFirstComponent( player_entity, "LuaComponent", "gold_decay" ) == nil then
    EntityAddComponent( player_entity, "LuaComponent", {
        _tags="gold_decay",
        script_source_file="mods/gold_decay/files/player_update.lua",
        execute_every_n_frame="15", -- it's fine every half second
    });
end