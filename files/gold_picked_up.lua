dofile_once( "mods/gold_decay/files/helpers.lua" )

-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita

function item_pickup( entity_item, entity_pickupper, item_name )
    EntityRemoveComponent( entity_item, EntityGetFirstComponent( entity_item, "LuaComponent", "decaying_gold"));
end 