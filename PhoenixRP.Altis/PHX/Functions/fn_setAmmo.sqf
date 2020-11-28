/*
	@File: fn_setAmmo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used to set vehicle ammo...
*/
params [["_target", objNull, [objNull]], ["_values", [], [[]]]];

if (isNull _target || { !((count _values) isEqualTo 2) }) exitWith {};

_target setAmmo _values;