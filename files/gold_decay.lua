-- Thanks go Goki for the original work - https://github.com/gokiburikin/gkbrkn_noita
local entity = GetUpdatedEntityID();
local x, y = EntityGetTransform( entity );
SetRandomSeed( x, y );

local components = EntityGetComponent( entity, "VariableStorageComponent" )

if ( components ~= nil ) then
    for key,comp_id in pairs(components) do 
        local var_name = ComponentGetValue( comp_id, "name" )
        if( var_name == "gold_value") then
            value = ComponentGetValueInt( comp_id, "value_int" )
        else
            value = 10
            print("Failed to get value of nug, defaulting to 10 :()")
        end
    end
end
--todo: make gold generated equal to value of nuggies

for i=1,value do
    -- GameCreateParticle( material_name:string, x:number, y:number, how_many:int, xvel:number, yvel:number, just_visual:bool, draw_as_long:bool = false, randomize_velocity:bool = true )
    GameCreateParticle( "gold", x + Random( -2, 2 ), y + Random( -2, 2 ), 1, 0, 0, true );
end

-- todo: implement gold spraying effect.  Probably have to create a particle with physics, fire it off in a random direction, and once velocity = 0 or offscreen and a certain timeframe has passed, convert to gold powder

-- todo - currently spawns particles in a square around player, but would be nice to update it using imaginary numbers for a circular

