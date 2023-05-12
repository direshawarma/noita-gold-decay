-- Thanks to Goki for the original code and concept - https://github.com/gokiburikin/gkbrkn_noita

function DoFileEnvironment( filepath, environment )
    if environment == nil then environment = {} end
    local f = loadfile( filepath );
    local set_f = setfenv( f, setmetatable( environment, { __index = _G } ) );
    local status,result = pcall( set_f );
    if status == false then print_error( "do file environment for "..filepath..": "..result ); end
    return environment;
end


function OnModPreInit() 

end

function OnModInit() 
    
end

function OnModPostInit() 

end

function OnPlayerSpawned( player_entity )
    DoFileEnvironment( "mods/Gold_Decay/files/player_spawned.lua", { player_entity = player_entity } );

end

function OnPlayerDied( player_entity ) 

end

function OnWorldInitialized() 

end

function OnWorldPreUpdate() 

end

function OnWorldPostUpdate() 

end

function OnBiomeConfigLoaded() 

end

function OnMagicNumbersAndWorldSeedInitialized() 

end

function OnPausedChanged( is_paused, is_inventory_pause ) 

end

function OnModSettingsChanged() 

end

function OnPausePreUpdate() 

end
