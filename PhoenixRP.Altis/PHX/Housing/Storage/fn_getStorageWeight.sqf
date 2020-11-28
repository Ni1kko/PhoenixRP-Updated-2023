/*
	@File: fn_getStorageWeight.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets how much of the storage is filled...
*/
#include "..\..\..\script_macros.hpp"
if !(params[["_items", [], [[]]]]) exitWith {};

private _weight = 0;

{
	_x params ["_classname", "_count"];

	private _iWeight = [_classname] call LIFE(itemWeight);
	if (_iWeight < 1) then { _iWeight = 1 }; // Failsafe...

	_weight = _weight + (_iWeight * _count);
} forEach _items;

_weight