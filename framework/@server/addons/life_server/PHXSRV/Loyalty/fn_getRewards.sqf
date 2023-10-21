/*
	@File: fn_getRewards.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes a vehicles owner...
*/
if !(params [["_uid", "", [""]], ["_loyalty", [], [[]]]]) exitWith {};

private _ret = [1, []]; // Total Days in a row, Rewards for this "term"...

if (_loyalty isEqualTo []) exitWith {_ret};

_loyalty params ["_loyDays", "_loyRewards", "_loyLast"];

if (_loyDays isEqualTo 0) then { _loyDays = 1 }; // Fix...

if (_loyLast isEqualTo ([1, 2] call PHXSRV_fnc_getDate)) then {
	if (_loyDays % 8 isEqualTo 0) then { [_uid, []] call PHXSRV_fnc_saveRewards; _loyRewards = [] }; // Wipe our rewards, it's a new term!
	_loyDays = _loyDays + 1;
} else {
	if (_loyLast isEqualTo ([] call PHXSRV_fnc_getDate)) exitWith {}; // Stop it resetting if the dates match...
	_loyDays = 1; // Reset their days...

	// Rest their rewards...
	[_uid, []] call PHXSRV_fnc_saveRewards; 
	_loyRewards = [];
};

_ret set[0, _loyDays];
_ret set[1, _loyRewards];

[
	format["UPDATE phxclients SET loy_days = '%1', loy_last = CURDATE() WHERE playerid = '%2'", _loyDays, _uid], 1
] call DB_fnc_asyncCall;

_ret