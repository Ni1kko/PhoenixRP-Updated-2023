/*
	@File: fn_respawned.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Resetting player before respawn....
*/
#include "..\..\script_macros.hpp"
params [["_spawn", false, [true]]];

// Rest Variables...
life_action_inUse = false;
life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
if (CASH > 0) then {
    [CASH, 1, 0, "Died"] call PHX_fnc_HandleMoney;
};

life_respawned = true;

player playMove "AmovPercMstpSnonWnonDnon";

call PHX(getDefaultLoadout);

// JAIL THE CUNT
if (life_is_arrested) exitWith {
    if (_spawn) then { "RscBacking" cutFadeOut 0 };
    
    NOTIFY("Respawning in jail will reset your time!","red");
    life_is_arrested = false;
    [player,life_jail_time] spawn LIFE(jail);
    [] call DB(updateRequest);
};

// Wanted Removal...
if (life_removeWanted) then {
    [getPlayerUID player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);
    life_removeWanted = false;
};

// Show the HUD again...
PHX_hideHUD = false;
[] call PHX_fnc_hudUpdate;

[] spawn LIFE(spawnMenu);

if !([(PHX_deathPos)] call PHX_fnc_isRedZone && playerSide isEqualTo civilian) then {
	[] spawn PHX(newLifeRule);
};

[] call DB(updateRequest);