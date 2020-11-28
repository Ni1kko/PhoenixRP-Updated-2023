/*
	@File: fn_setupMarket.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: addAction for virtual shops...

	@Usage Examples:
		- [this, ["ALL", "General Market"], "general_market", ""] call PHX_fnc_setupMarket;
		- [this, ["CIV", "Mineral Exports"], "mineral_exports", "playerSide isEqualTo civilian"] call PHX_fnc_setupMarket;
		- [this, ["APC", "Market"], "syndikat_outpost", "playerSide isEqualTo west"] call PHX_fnc_setupMarket;
		- [this, ["HAVOC", "Market"], "tpc_market", "playerSide isEqualTo east"] call PHX_fnc_setupMarket;
		- [this, ["NHS", "Market"], "nhs_market", "playerSide isEqualTo independent"] call PHX_fnc_setupMarket;
*/
#include "..\..\script_macros.hpp"
params [
	["_object", objNull, [objNull]],
	["_title", [], [[]]],
	["_shop", "", [""]],
	["_conditions", "", [""]]
];

if (isNull _object || {_shop isEqualTo ""} || {(count _title) != 2}) exitWith {
	diag_log format["[Market Setup] Failed %1 %2", _shop, _title];
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
	], LIFE(virt_menu), _shop, 1.5, true, true, "", _conditions,
	5
];