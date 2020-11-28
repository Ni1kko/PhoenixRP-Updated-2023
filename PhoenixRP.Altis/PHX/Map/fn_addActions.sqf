/*
	@File: fn_addActions.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used to add based on a config...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgActions"
params [
	["_cfg", "", [""]],
	["_store", objNull, [objNull]]
];

if !(isClass (CFG >> _cfg)) exitWith {diag_log format["Failed to create actions with cfg %1", _cfg]};
if (isNull _store) exitWith {diag_log format["Failed to create actions with cfg %1 due to null store", _cfg]};

{
	_x params [
		"_title",
		"_function",
		"_params",
		"_conditions",
		"_distance"
	];

	_store addAction [
		_title, 
		(call compile _function), 
		_params, 
		7, true, true, "", 
		_conditions, 
		_distance
	];
} forEach (getArray (CFG >> _cfg >> "actions"));