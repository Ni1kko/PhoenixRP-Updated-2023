/*
	@File: fn_changeVisibility.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to toggle an objects visibility...
*/
if (!params [["_object",objNull,[objNull]], ["_hide", false, [true]]]) exitWith {};

_object setVariable ["isInvisibile", _hide, true];
_object setVariable ["hideName", _hide, true];
_object hideObject _hide;