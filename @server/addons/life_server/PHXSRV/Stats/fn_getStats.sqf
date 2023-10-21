/*
	@File: fn_getStats.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns an array of statistics...
*/
params [
	["_uid", -1, ["", 0]],
	["_side", civilian, [civilian]]
];

if (_uid in ["", -1]) exitWith { [] };

_side = switch (_side) do {
	case west: {"WEST"};
	case east: {"EAST"};
	case independent: {"INDEP"};
	default {"CIVILIAN"}
};

private _statCols = getArray(missionConfigFile >> "CfgSettings" >> "statistics");
if (_statCols isEqualTo []) exitWith { [] };

private _statColsString = "";

{
	_statColsString = _statColsString + _x;

	if !(_forEachIndex isEqualTo ((count _statCols) - 1)) then {
		_statColsString = _statColsString + ", ";
	};
} forEach _statCols;

if (_statColsString isEqualTo "") exitWith { [] };

private _stats = [format["SELECT %3 FROM phxstats_users WHERE uid = '%1' AND side = '%2' LIMIT 1", _uid, _side, _statColsString], 2] call DB_fnc_asyncCall;
if !(_stats isEqualType []) then { _stats = [] };

private _ret = [];

if !(_stats isEqualTo []) then {
	{
		_ret pushBack [_x, (_stats select _forEachIndex)];
	} forEach _statCols;
} else {
	[format ["INSERT INTO phxstats_users (uid, side) VALUES ('%1', '%2')", _uid, _side], 1] call DB_fnc_asyncCall;
};

_ret