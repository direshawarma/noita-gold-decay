-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
function IsGoldNuggetDecayTracked( entity )
    return EntityGetFirstComponent( entity, "LuaComponent", "decaying_gold" ) ~= nil;
end

local gold_nuggets = EntityGetWithTag( "gold_nugget" );
for _,gold_nugget in pairs( gold_nuggets ) do
    if IsGoldNuggetDecayTracked( gold_nugget ) == false then
        EntityAddComponent( gold_nugget, "LuaComponent", {
            execute_every_n_frame = "-1", -- on add/remove event only
            remove_after_executed = "1",
            script_item_picked_up = "mods/Gold_decay/files/gold_picked_up.lua",
        });
        EntityAddComponent( gold_nugget, "LuaComponent", {
            _tags="decaying_gold",
            execute_on_removed="1",
            execute_every_n_frame="-1",
            script_source_file = "mods/Gold_Decay/files/gold_decay.lua",
        });
    end
    
end