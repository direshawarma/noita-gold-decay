dofile_once( "mods/gold_decay/files/scripts/helpers.lua" )

local dust_trails = ModSettingGet("gold_decay.dust_trails")
local dust_trail_interval = ModSettingGet("gold_decay.dust_trail_interval")
local multiplier = ModSettingGet("gold_decay.multiplier")
local entity = GetUpdatedEntityID();
local x, y = EntityGetTransform( entity );
local goldValue = getInternalVariableValue( entity, "gold_value", "value_int" ) * multiplier / 100

