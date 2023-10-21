/*
	@File: fn_setGangTax.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sets gang tax...
*/
#include "..\..\script_macros.hpp"
params [["_remote", false, [true]]];

private _group = grpPlayer;

if (isNil {_group getVariable "gang_name"}) exitWith {}; // Wtf, Should never happen...

private _newTax = ["Enter Tax % (0 - 25)","Confirm","Cancel"] call PHX_fnc_editBox;

if !(_newTax isEqualType "") then { _newTax = format["%1", _newTax] };

if !([_newTax] call LIFE_fnc_isNumber) exitWith { ["The value you're entering must only contain numbers","red"] spawn PHX(notify) };

_newTax = parseNumber _newTax;

if (_newTax < 0 || { _newTax > 25 }) exitWith { ["You can only set a tax rate between 0 and 25%","red"] spawn PHX(notify) };

_group setVariable ["gang_tax", _newTax, true];

[12, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

[format["You've change the group tax rate to %1%2", _newTax, "%"],"green"] spawn PHX(notify);

[24000, "Group"] call PHX(switchApp);