dofile_once( "mods/gold_decay/files/scripts/helpers.lua" )

local e
for i = 1, #perk_list do
    if (perk_list[i][id] == "GOLD_IS_FOREVER") then
        e = i
        break
    end
end
if e then
    qprint("Removed perk : " .. perk_list[i][id])
    table.remove(heads, e) 
end





--table.remove(perk_list, perk_list[GOLD_IS_FOREVER])
table.insert(perk_list,
  {
    id = "GOLD_DECAY",
    ui_name = "Gold Decay",
    ui_description = "Gold Nuggets will decay into Gold Dust.",
    ui_icon = "mods/gold_decay/files/gfx/ui_icon.png",
    perk_icon = "mods/gold_decay/files/gfx/perk_icon.png",
    usable_by_enemies = false,
    not_in_default_perk_pool = false,
    stackable = STACKABLE_NO,
    func = function( entity_perk_item, entity_who_picked, item_name )
        function getPlayerEntity()
            local players = EntityGetWithTag("player_unit")
            if #players == 0 then return end
        
            return players[1]
        end
        player_entity = getPlayerEntity()
        if EntityGetFirstComponent( player_entity, "LuaComponent", "gold_decay" ) == nil then
            EntityAddComponent( player_entity, "LuaComponent", {
                _tags="gold_decay",
                script_source_file="mods/gold_decay/files/scripts/player_update.lua",
                execute_every_n_frame="1",
            });
            if EntityGetFirstComponent( player_entity, "LuaComponent", "gold_decay" ) == nil then
                qprint("Failed to hook into player entity to add gold decay property")
            end
        end
    end
  }
)