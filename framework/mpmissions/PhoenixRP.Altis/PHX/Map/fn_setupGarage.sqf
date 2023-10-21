/*
	@File: fn_setupGarage.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: addAction for garages...
*/
#include "..\..\script_macros.hpp"
params [
	["_object", objNull, [objNull]],
	["_title", [], [[]]],
	["_type", "", [""]],
	["_spawmpoint", "", [""]],
	["_conditions", "", [""]]
];

if (isNull _object || {_type isEqualTo ""} || {_spawmpoint isEqualTo ""} || {(count _title) != 2}) exitWith {
	diag_log format["[Garage Setup] Failed %1 %2 %3", _type, _title, _spawmpoint];
};

_object enableSimulation false;
_object allowDamage false;

private _colour = switch true do {
	case (_title select 0 isEqualTo "CIV"): {"#b4a7d6"};
	case (_title select 0 isEqualTo "APC"): {"#073763"};
	case (_title select 0 isEqualTo "HAVOC"): {"#274e13"};
	case (_title select 0 isEqualTo "NHS"): {"#007ac3"};
	default {"#ffe599"};
};

private _houseGarage = true;

_object addAction[
	format[
		"<t color='%3'>[%2]</t> %1", 
		_title select 1, 
		_title select 0,
		_colour
	], PHX(getGarage), [_spawmpoint, _type, _houseGarage], 1.5, true, true, "", _conditions,
	5
];