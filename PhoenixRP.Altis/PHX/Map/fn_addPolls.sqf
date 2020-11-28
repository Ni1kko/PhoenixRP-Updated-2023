/*
	@File: fn_addPolls.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Add scroll actions for voting in active polls.
*/
if (isServer) exitWith {};

if !(canSuspend) exitWith {_this spawn PHX_fnc_addPolls};

waitUntil { !(isNil "PHX_isGovernmentSetup") };
waitUntil { PHX_isGovernmentSetup };

if !(params [
	["_station", objNull, [objNull]]
]) exitWith {diag_log format["Failed to add polls to station %1", _station]};

if (PHX_activePolls isEqualTo []) exitWith {};

{
	_x params ["_title"];

	_station addAction [
		format["Vote in the %1 poll", _title], 
		PHX_fnc_openVoting, 
		_x,
		7, true, true, "", 
		"playerSide isEqualTo civilian", 
		5
	];
} forEach PHX_activePolls;