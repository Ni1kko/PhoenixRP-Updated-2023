/*
	@File: fn_saveStat.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Saves the give stat...
*/
if !(params [
	["_uid", "", [""]],
	["_side", civilian, [civilian]],
	["_stat", "", [""]],
	["_value", 0, [0]]
]) exitWith {};

_side = switch (_side) do {
	case west: {"WEST"};
	case east: {"EAST"};
	case independent: {"INDEP"};
	default {"CIVILIAN"}
};

private _stats = [
	format["SELECT %3 FROM phxstats_users WHERE uid = '%1' AND side = '%2' LIMIT 1", 
		_uid, _side, _stat
	], 2, true
] call DB_fnc_asyncCall;

if !(_stats isEqualType []) exitWith {};

private _query = format ["UPDATE phxstats_users SET %3='%4' WHERE uid = '%1' AND side = '%2'", _uid, _side, _stat, _value];

if (_stats isEqualTo [] || _stats isEqualType "") then {
	_query = format ["INSERT INTO phxstats_users (uid, side, %3) VALUES ('%1', '%2', '%4')", _uid, _side, _stat, _value];
};

[_query, 1] call DB_fnc_asyncCall;