#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_houseUpgrade.sqf
	@Author: Zyn
	@Description: Handles the upgrades
*/

params [
	["_house", objNull, [objNull]],
	["_type", "", [""]],
	["_value", 0, [0, ""]]
];

if (_type isEqualTo "" || {isNull _house}) exitWith {};

(_house getVariable ["house_upgrades", []]) params ["_locks", "_category", "_upgrades"];

switch _type do {
	case "locks": {
		_locks = _value;
	};
	case "category": {
		_category = _value;
	};
	case "upgrade": {
		_upgrades pushBack _value;
	};
};

_house setVariable ["house_upgrades", [_locks, _category, _upgrades], true];
[1, _house] remoteExecCall (["fnc_updateHouse", "TON"] call SOCK_fnc_getRemoteDestination);

NOTIFY("Upgraded successfully","green");
["onLoad"] call PHX_fnc_openUpgrades;