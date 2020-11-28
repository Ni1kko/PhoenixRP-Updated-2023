/*
	@File: fn_hint.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Custom hint file for remote executing...
*/
params [
	["_message", "", [""]],
	["_condition", "true", [""]]
];

private _condition = call compile _condition;

// Checks...
if (_message isEqualTo "") exitWith {}; //  Must actually have a message...
if !(_condition) exitWith {}; // Must be true...

// hint parseText format["%1", _message];
[format["%1", _message]] spawn PHX_fnc_notify;