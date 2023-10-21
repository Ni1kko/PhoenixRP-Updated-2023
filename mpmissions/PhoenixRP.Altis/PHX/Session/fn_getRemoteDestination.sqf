/*
	@File: fn_getRemoteDestination.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns where our request should go...
*/

_this params [
	["_fnc", "", [""]],
	["_serverPrefix", "TON", [""]], // The server has multiple different tags used for functions so we need to define that here...
	["_forceHC", false, [true]]
];

if (isNil "HC_Client" && { !_forceHC }) exitWith {[format["%2_%1", _fnc, _serverPrefix], 2]};

[format["HL_%1", _fnc], (HC_Client select 1)]