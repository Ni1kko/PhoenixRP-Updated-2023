/*
	@File: fn_onRespawn.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Processes all the stuff that needs handling when we respawn...

	@Parameters:
		0 - TYPE: OBJECT - DES: The object respawning...
		1 - TYPE: OBJECT - DES: Our corpse...
*/
#include "..\..\script_macros.hpp"
params [
	["_unit", objNull, [objNull]],
	["_corpse", objNull, [objNull]]
];

// Force Drop Items...
[
	_unit,
	(getPos _corpse)
] call life_fnc_dropItems;

// Corpse Removal...
if !(isNull _corpse) then {
	{deleteVehicle _x;} forEach (nearestObjects [_corpse, ["WeaponHolderSimulated"], 5]);
	deleteVehicle _corpse;
};

// Variable Reset...
_unit setVariable ["restrained",sideUnknown,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["Blindfolded",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
_unit setVariable ["isTazed", false, true];
_unit setVariable ["isKnockedOut", false, true];
_unit setVariable ["Reviving",nil,true];
PHX_bleedFaster = false;

[_unit,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC", RSERV]; // Reset Channels...

switch (playerSide) do {
	case west: {
		[player, "apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
	};
	case independent: {
		[player, "apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
		[player, "havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
	};
	case east: {
		[player, "havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
	};
};

if (FETCH_CONST(life_adminlevel) > 0) then { [player, "staff"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV] };

if (LIFE_SETTINGS(getNumber,"enable_fatigue") isEqualTo 0) then { player enableFatigue false }; // Reset Fatigue...

[] call PHX(setupActions);
[] spawn PHX(respawned);