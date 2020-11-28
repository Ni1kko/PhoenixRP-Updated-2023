/*
	@File: fn_getDate.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns a date...
*/
params [
	["_day", 0, [0]],
	["_mode", 0, [0]],
	["_startdate", [], [[]]]
];

if (_startdate isEqualTo []) then {
	_startdate = "CURDATE()";
} else {
	_startdate params ["_year", "_month", "_day2"];
	_startdate = format["'%1-%2-%3'", _year, _month, _day2];
};

private _date = _startdate;

if (_mode > 0 && { _day > 0 }) then {
	private _sql_fnc = "SUBDATE";
	if (_mode isEqualTo 1) then { _sql_fnc = "ADDDATE" };

	_date = format["%1(DATE(%3), INTERVAL %2 DAY)", _sql_fnc, _day, _startdate];
};

_date = [format["SELECT %1", _date], 2] call DB_fnc_asyncCall;
if (_date isEqualType "" || { _date isEqualTo [] }) exitWith {false};

if ((_date select 0) isEqualType []) then { _date = _date select 0 };

_date