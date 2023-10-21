/*
	@File: fn_onKilled.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Processes all the stuff that needs handling when we are killed...

	@Parameters:
		0 - TYPE: OBJECT - DES: The object being killed...
		1 - TYPE: OBJECT - DES: The object that killed the object...
*/
#include "..\..\script_macros.hpp"
params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

if !(canSuspend) exitWith { _this spawn PHX(onKilled) };

if (isNull _unit) exitWith {}; // What??
if !(isPlayer _unit) exitWith {}; // Only players can be killed...

if !(isNull objectParent _unit) then { moveOut _unit }; // Get them out the vehicle...

// Weapon Removal...
_unit removeWeapon (primaryWeapon _unit);
_unit removeWeapon (handgunWeapon _unit);
_unit removeWeapon (secondaryWeapon _unit);
{deleteVehicle _x;} forEach (nearestObjects [_unit, ["WeaponHolderSimulated"], 5]);

// Notify the server...
if (!isNull _killer && { isPlayer _killer } && { !(_killer isEqualTo _unit) }) then {
	[0, format ["%1 was executed by %2", 
		_unit getVariable ["realname", name _unit], 
		_killer getVariable ["realname", name _killer]
	]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

	if !((side _killer) isEqualTo east) then {
		[getPlayerUID _killer,_killer getVariable ["realname",name _killer],"187"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination); // Add Killer...
	};
} else {
	[0, format ["%1 bled out...", 
		_unit getVariable ["realname", name _unit]
	]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
};

// Variable Rest Time...
PHX_deathPos = position player;
_unit setUnconscious false;
_unit setVariable ["restrained",sideUnknown,true];
_unit setVariable ["Escorting",false,true];
_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["showBadge", nil, true];
unsetKiller(_unit);
unsetDowned(_unit);
PHX_Trackers = [];

if !([(PHX_deathPos)] call PHX_fnc_isRedZone && playerSide isEqualTo civilian) then {
	[true] call PHX_fnc_newLifeRule;
};

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC", RSERV];  // Rest Channels...

[] spawn {
	["RscIncapacitated"] call PHXUI_fnc_destroyLayer; // Remove Incap UI...
	{ppEffectDestroy _x} forEach PHX_effects; // Remove Effects...
	PHX_canRespawn = false; // Default it...
	
	"WaitToRespawn" cutText ["<t color='#ffffff' font='PuristaLight' size='2px'>YOU HAVE DIED</t>", "BLACK", -1, false, true];

	life_respawned = false;

	waitUntil {life_respawned};
	"WaitToRespawn" cutText ["", "PLAIN"];
};