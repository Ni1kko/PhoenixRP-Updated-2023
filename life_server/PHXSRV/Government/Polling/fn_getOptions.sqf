/*
	@File: fn_getOptions.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the voting options for our polls...
*/
params [
	["_pollID", -1, [0]],
	["_extra", "", [""]]
];

if (_pollID isEqualTo -1) exitWith {false};

[
	format["SELECT * FROM phxoptions WHERE pollID = '%1' AND `delete` = '0' %2", _pollID, _extra],
	2,
	true
] call DB_fnc_asyncCall;