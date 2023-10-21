#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_handleVehicleUpgrade.sqf
	@Author: Zyn
	@Description: Handles the upgrades
*/

params [
	["_vehicle", objNull, [objNull]],
	["_type", "", [""]],
	["_value", 0, [0, ""]]
];

if (_type isEqualTo "" || {isNull _vehicle}) exitWith {};

(_vehicle getVariable ["vehicle_upgrades", []]) params ["_trunk", "_locks", "_chop", "_nitrous", "_upgrades"];

switch _type do {
	case "trunk": {
		_trunk = round(([(typeOf _vehicle)] call life_fnc_vehicleWeightCfg) * (_value / 100));
	};
	case "locks": {
		_locks = _value;
	};
	case "chop": {
		_chop = _value;
	};
	case "nitrous": {
		_nitrous = _value;
	};
	case "upgrade": {
		_upgrades pushBack _value;
	};
};

_vehicle setVariable ["vehicle_upgrades", [_trunk, _locks, _chop, _nitrous, _upgrades], true];
[_vehicle,4] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];

NOTIFY("Upgraded successfully","green");
["onLoad"] call PHX_fnc_openVehicleUpgrades;