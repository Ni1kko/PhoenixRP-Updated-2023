/*
	@File: fn_notifyLegislation.sqf
	@Author: Jack "Scarso" Farhall
	@Description: 
*/
if !(params [["_legislation", "", [""]],["_val", 0, [0]]]) exitWith {};

missionNamespace setVariable [format["PHX_%1Rate", _legislation], _val];
[format["The Governor has changed the %1 rate to %2!", _legislation , [_val] call life_fnc_numberText],"cyan"] spawn PHX_fnc_notify;

if (_legislation isEqualTo "Paycheck") then { life_paycheck = [] call PHX_fnc_getPaycheck };