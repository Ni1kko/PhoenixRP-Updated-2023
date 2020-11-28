/*
	@File: fn_setFuel.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used to set vehicle fuel...
*/
params [["_target", objNull, [objNull]], ["_refuel", false, [true]]];

if (isNull _target) exitWith {};

_target setFuel ([0, 1] select (_refuel));