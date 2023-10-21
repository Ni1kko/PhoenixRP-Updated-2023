/*
	@File: fn_onReived.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Called when a medic has revived me...
*/
#include "..\..\script_macros.hpp"
if !(params [["_medic", objNull, [objNull]]]) exitWith {};

if !(_medic getVariable ["isAdmin", false]) then {
	[format ["%1 has revived you and a fee of £%2 was taken from your bank account for their services",
		_medic getVariable ["realname", name _medic],
		[PHX_RevivalRate] call life_fnc_numberText
	],"cyan"] call PHX_fnc_notify;

	[PHX_RevivalRate, 1, 1, "Revival Fee"] call PHX_fnc_handleMoney;

	// Notify the server...
	[0, format ["%1 was revived by %2", 
		player getVariable ["realname", name player], 
		_medic getVariable ["realname", name _medic]
	]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

	[player, format ["%1 (%2) was revived by %3 for a fee of %4. Bank Balance: %5 On Hand Balance: %6",profileName,getPlayerUID player, _medic getVariable ["realname", name _medic], [PHX_RevivalRate] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	NOTIFY("You've been revived by an admin","green");
};

[player, format ["%1 (%2) was revived by %3",profileName,getPlayerUID player, _medic getVariable ["realname", name _medic]], "https://rcon.phoenixrp.co.uk/api/v1/log/medic"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

// Unset Incapacitated Varaibles...
player setUnconscious false;
unsetKiller(player);
unsetDowned(player);

player playMoveNow "amovppnemstpsraswrfldnon"; // Get out of the incapacitated animation...

["RscIncapacitated"] call PHXUI_fnc_destroyLayer; // Remove Incap UI...
{ppEffectDestroy _x} forEach PHX_effects; // Remove Effects...
player switchCamera "EXTERNAL"; // Switch camera view back
PHX_canRespawn = false; // Default it...
life_action_inUse = false; // Default it...
PHX_saveGear = true; // Default it...

// Show the HUD again...
PHX_hideHUD = false;
[] call PHX_fnc_hudUpdate;

[] call PHX(playerSkins);
[] call SOCK_fnc_updateRequest;