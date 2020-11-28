/*
	@File: fn_setupShop.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: addAction for physical shops...

	@Usage Examples:
		- [this, ["ALL", "General Store"], "general_store", ""] call PHX_fnc_setupShop;
		- [this, ["CIV", "Go-Karting Store"], "go_karting_store", "playerSide isEqualTo civilian && license_civ_go_karting"] call PHX_fnc_setupShop;
		- [this, ["APC", "Equipment Locker"], "tpc_general_Store", "playerSide isEqualTo west"] call PHX_fnc_setupShop;
		- [this, ["TAS", "General Equipment"], "nhs_general_store", "playerSide isEqualTo independent"] call PHX_fnc_setupShop;
*/
#include "..\..\script_macros.hpp"
params [
	["_object", objNull, [objNull]],
	["_title", [], [[]]],
	["_shop", "", [""]],
	["_conditions", "", [""]]
];

if (isNull _object || {_shop isEqualTo ""} || {(count _title) != 2}) exitWith {
	diag_log format["[Shop Setup] Failed %1 %2", _shop, _title];
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

_object addAction[
	format[
		"<t color='%3'>[%2]</t> %1", 
		_title select 1, 
		_title select 0,
		_colour
	], LIFE(weaponShopMenu), _shop, 1.5, true, true, "", _conditions,
	5
];