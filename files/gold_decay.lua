dofile_once( "mods/gold_decay/files/helpers.lua" )

-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
local entity = GetUpdatedEntityID();
local x, y = EntityGetTransform( entity );
local goldValue = getInternalVariableValue( entity, "gold_value", "value_int" )
GameCreateParticle( "gold", x, y, goldValue, 0, 0, true );