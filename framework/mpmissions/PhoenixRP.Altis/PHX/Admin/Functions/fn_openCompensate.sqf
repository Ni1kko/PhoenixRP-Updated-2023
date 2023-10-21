/*
	@File: fn_openCompensate.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens the compensate UI...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };

private _value = ["Enter the amount you would like to compensate","Confirm","Cancel"] call PHX_fnc_editBox;
if !([_value] call LIFE_fnc_isNumber) exitWith {};
_value = parseNumber _value;

[_msg, _value] call PHX(compensate);