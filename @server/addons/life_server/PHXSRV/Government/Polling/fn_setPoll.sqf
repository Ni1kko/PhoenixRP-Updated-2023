/*
	@File: fn_setPoll.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Updates the status of a given poll...
*/
if !(params [
	["_id", -1, [0]],
	["_name", "blank?"],
	["_value", "blank?"]
]) exitWith {false};

// Convert the data type...
_value = call {
	if (_name isEqualTo "date") exitWith { format["DATE('%1-%2-%3')", (_value select 0), (_value select 1), (_value select 2)] };
	if (_value isEqualType 0) exitWith { format["'%1'", [_value] call DB_fnc_numberSafe] };
	if (_value isEqualType false) exitWith { format["'%1'", [_value, 0] call DB_fnc_bool] };
	if (_value isEqualType []) exitWith { format["'%1'", [_value] call DB_fnc_mresArray] };
	_value
};

[format ["UPDATE phxpolls SET `%1` = %2 WHERE id = '%3'", _name, _value, _id], 1] call DB_fnc_asyncCall;

true