dofile_once( "mods/gold_decay/files/scripts/helpers.lua" )

-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita
local entity = GetUpdatedEntityID();
local x, y = EntityGetTransform( entity );
local multiplier = ModSettingGet("gold_decay.multiplier")
local goldValue = getInternalVariableValue( entity, "gold_value", "value_int" ) * multiplier / 100
GameCreateParticle( "gold", x, y, goldValue, 0, 0, true );