/*
	@File: fn_invisibility.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Toggles the admin's invisibile setting...
*/
#include "..\..\..\script_macros.hpp"
params [["_msg", "", [""]]];

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };

private _isInvisibile = (player getVariable ["isInvisibile", false]);

[player, (!_isInvisibile)] remoteExecCall ["PHX_fnc_changeVisibility", RCLIENT];

format[_msg, player getVariable ["realname", name player],["On","Off"] select (_isInvisibile)];

[player, format ["%1 (%2) %3 admin invisibility",profileName,(getPlayerUID player),["enabled","disabled"] select (_isInvisibile)], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

if !(isNil "PHX_fnc_invisiblityLoop") then { terminate PHX_fnc_invisiblityLoop; };

if (_isInvisibile) then {
	PHX_fnc_invisiblityLoop = [] spawn { 
		for "_i" from 0 to 1 step 0 do {
			if !(player getVariable ["isInvisibile", false]) exitWith {};
			[player, true] remoteExecCall ["PHX_fnc_changeVisibility", RCLIENT];
			sleep 60;
		};
	};
};