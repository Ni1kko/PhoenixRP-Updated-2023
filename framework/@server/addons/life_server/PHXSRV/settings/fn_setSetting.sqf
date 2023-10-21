/*
	@File: fn_setSetting.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for updating the settings table...
*/
params [
	["_name", "", [""]],
	["_value", ""],
	["_col", "value"]
];

if (_name isEqualTo "" || { _value isEqualTo "" }) exitWith {diag_Log format["Exit Setting Set %1 %2 %3", _name, _value, _col]};

_value = call {
	if (_value isEqualType 0) exitWith {
		[_value] call DB_fnc_numberSafe;
	};
	if (_value isEqualType false) exitWith {
		[_value, 0] call DB_fnc_bool;
	};
	if (_value isEqualType []) exitWith {
		[_value] call DB_fnc_mresArray;
	};
	_value;
};

[format ["UPDATE serversettings SET `%3` = '%2' WHERE name='%1'", _name, _value, _col], 1] call DB_fnc_asyncCall;