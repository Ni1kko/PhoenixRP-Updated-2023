/*
	@File: fn_changeOwner.sqf
	@Author: Jack "Scarso" Farhall
	
	@Description: Changes a vehicles owner...
*/
params [
	["_curOwner", "", [""]],
	["_newOwner", "", [""]],
	["_vehID", -1, [0, ""]]
];

if (_curOwner isEqualTo "" || {_newOwner isEqualTo ""} || {_vehID isEqualTo -1}) exitWith {};

if (_vehID isEqualType 0) then { _vehID = [_vehID] call DB_fnc_numberSafe };

[format["UPDATE phxcars SET pid='%3' WHERE pid='%1' AND id='%2'", _curOwner, _vehID, _newOwner],1] call DB_fnc_asyncCall;