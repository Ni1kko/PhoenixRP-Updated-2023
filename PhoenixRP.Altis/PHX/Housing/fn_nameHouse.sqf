/*
	@File: fn_nameHouse.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Rename house...
*/
#include "..\..\script_macros.hpp"

_this params [
	["_house", objNull, [objNull]]
];

if (isNull _house || { isNil { _house getVariable "house_owner" }  }) exitWith { NOTIFY("You don't own this house", "red") };

private _name = ["Enter new house name","Confirm","Cancel"] call PHX_fnc_editBox;

private _count = count (toArray(_name));
if (_count > 24) exitWith { NOTIFY("Your must be less than 24 characters long", "red") };

_house setVariable ["house_name", _name, true];
[_house, 2] call PHX(houseMarker);
[0, _house] remoteExecCall (["fnc_updateHouse", "TON"] call SOCK_fnc_getRemoteDestination);

[format["You've change this house's name to %1", _name],"green"] spawn PHX(notify);