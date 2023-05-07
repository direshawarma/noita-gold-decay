-- Thanks go Goki for the original work - https://github.com/gokiburikin/gkbrkn_noita
function item_pickup( entity_item, entity_pickupper, item_name )
    EntityRemoveComponent( entity_item, EntityGetFirstComponent( entity_item, "LuaComponent", "decaying_gold"));
end 