/*
	@File: fn_setLegislation.sqf
	@Author: Jack "Scarso" Farhall
	@Description: 
*/
if !(params [["_legislation", "", [""]],["_val", 0, [0]]]) exitWith {};

private _owner = remoteExecutedOwner;
if (_owner isEqualTo 0) exitWith {};

// Check if we've already changed it this restart...
private _result = [format["SELECT restart FROM serversettings WHERE name = '%1'", _legislation], 2] call DB_fnc_asyncCall;
_changed = [_result param [0, 0, [0]], 1] call DB_fnc_bool;

if(_changed) exitWith {
	["You've already changed this legislation this restart!"] remoteExec ["PHX_fnc_notify", _owner];
};

[format ["UPDATE serversettings SET value = '%1', restart = '1' WHERE name='%2'", ([_val] call DB_fnc_numberSafe), _legislation], 1] call DB_fnc_asyncCall; // Update setting...

missionNamespace setVariable [format["PHX_%1Rate", _legislation], _val];

[_legislation, _val] remoteExecCall ["PHX_fnc_notifyLegislation", -2];