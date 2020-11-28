/*
	@File: fn_openLegislation.sqf
	@Author: Jack "Scarso" Farhall
	@Description: 
*/
#include "..\..\script_macros.hpp"
_this # 3 params [
  ["_legislation", "", [""]]
];

// Checks...
if (_legislation isEqualTo "") exitWith {};
if !(PHX_isPM) exitWith {["You're not allowed to change any legislation","red"] spawn PHX(notify)};

private _newValue = [format["%1 Management", _legislation],"Update","Cancel"] call PHX_fnc_editBox;

if !(_newValue isEqualType "") exitWith {};
if !([_newValue] call LIFE_fnc_isNumber) exitWith { ["The value you're entering must only contain numbers","red"] spawn PHX(notify) };

_newValue = parseNumber _newValue;

private _limitVar = format["limit%1", _legislation];
private _limits = LIFE_SETTINGS(getArray,_limitVar);
_limits params ["_lowest", "_highest"];

if (_newValue < _lowest || { _newValue > _highest }) exitWith { [format["The new value must be between %1 and %2", _lowest, _highest],"red"] spawn PHX(notify) };

[_legislation, _newValue] remoteExecCall (["fnc_setLegislation", "PHXSRV"] call SOCK_fnc_getRemoteDestination);