dofile_once( "mods/gold_decay/files/scripts/helpers.lua" )


-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
function IsGoldNuggetDecayTracked( entity )
    return EntityGetFirstComponent( entity, "LuaComponent", "decaying_gold" ) ~= nil;
end

local dust_trails = ModSettingGet("gold_decay.dust_trails")
local dust_trail_interval = ModSettingGet("gold_decay.dust_trail_interval")


local gold_nuggets = EntityGetWithTag( "gold_nugget" );
for _,gold_nugget in pairs( gold_nuggets ) do
    if IsGoldNuggetDecayTracked( gold_nugget ) == false then
        if dust_trails == true then
            EntityAddComponent( gold_nugget, "LuaComponent", {
                _tags = "dust_trails",
                execute_every_n_frame = dust_trail_interval,
                remove_after_executed = "0",
                script_item_picked_up = "mods/Gold_decay/files/scripts/gold_trail.lua",
            });
            EntityAddComponent( gold_nugget, "LuaComponent", {
                _tags = "original_value",
                value_int = getInternalVariableValue( gold_nugget, "gold_value", "value_int" ),
            });
        end
        EntityAddComponent( gold_nugget, "LuaComponent", {
            execute_every_n_frame = "-1", -- on add/remove event only
            remove_after_executed = "1",
            script_item_picked_up = "mods/Gold_decay/files/scripts/gold_picked_up.lua",
        });
        EntityAddComponent( gold_nugget, "LuaComponent", {
            _tags="decaying_gold",
            execute_on_removed="1",
            -- execute_every_n_frame="-1", -- potentially redundant
            script_source_file = "mods/Gold_Decay/files/scripts/gold_decay.lua",
        });
    end
    
end