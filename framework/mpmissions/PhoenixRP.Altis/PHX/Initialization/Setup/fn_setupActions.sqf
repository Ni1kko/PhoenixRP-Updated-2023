/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/

life_actions = [];

switch (playerSide) do {

    // Civilian
    case civilian: {
        //Drop fishing net
        life_actions pushBack (player addAction["Drop Fishing Net",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);
    };
    
    // APC
    case west: { };
    
    // NHS
    case independent: { };

    // HAVOC
    case east: { };
};

life_actions pushBack (player addAction["<img image='\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa'/>Treat Yourself",PHX_fnc_firstAid,false,0,false,false,"",'((life_inv_firstaidkit_virtual > 0 && { ((damage player) >= 0.25) || {"firstAider" in PHX_Perks && !((damage player) isEqualTo 0) } }) || (life_inv_medikit_virtual > 0 && { !((damage player) isEqualTo 0) })) && {(vehicle player isEqualTo player)} && {!life_action_inUse}']);
life_actions pushBack (player addAction["<img image='\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa'/>Treat Person",PHX_fnc_firstAid,true,0,false,false,"",'((life_inv_firstaidkit_virtual > 0 && { ((damage cursorObject) >= 0.25) || {"firstAider" in PHX_Perks && !((damage cursorObject) isEqualTo 0)} }) || (life_inv_medikit_virtual > 0 && { !((damage cursorObject) isEqualTo 0) })) && {cursorObject isKindOf "Man"} && {cursorObject distance player < 5} && {(vehicle cursorTarget isEqualTo cursorTarget)} && {!life_action_inUse} && {!(cursorObject getVariable ["isIncapacitated",false])}']);

life_actions pushback (player addAction["Eject","player action [""getOut"", vehicle player];","",999,false,false,"",'(vehicle player isKindOf "helicopter" && (assignedVehicleRole player) select 0 in ["driver","Turret"] && locked vehicle player isEqualTo 0)']);