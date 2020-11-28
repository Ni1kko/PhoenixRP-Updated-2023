/*
	@File: fn_addOption.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for adding our candidate for the next general election...
*/
scopeName "addOption";
params [
	["_pollID", -1, [0]],
	["_name", "", [""]],
	["_description", "", [""]],
	["_uid", "", [""]]
];

if (_pollID isEqualTo -1 || { _name isEqualTo "" } || { _description isEqualTo "" }) exitWith {
	["An error occured while enlisting for the next General Election...", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];
};

if !(_uid isEqualTo "") then {
	private _lastGovernor = ([format ["SELECT value, restart FROM serversettings WHERE name='%1'", _name], 2] call DB_fnc_asyncCall) params [["_sUID", "_terms"]];
	if (_uid isEqualTo _sUID && { _terms isEqualTo 2 }) then {
		["You've already served your max of 2 consecative terms...", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];
		breakOut "addOption";
	};

	private _result = [format["SELECT * FROM phxoptions WHERE uid = '%1'", _uid], 2] call DB_fnc_asyncCall;

	if (_result isEqualType "" || { !(_result isEqualTo []) }) exitWith {
		["You're already enlisted for the next general election..", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];
		breakOut "addOption";
	};
};

_name = [_name] call DB_fnc_mresString;
_description = [_description] call DB_fnc_mresString;

[format["INSERT INTO phxoptions (pollID, name, uid, description) VALUES ('%1', '%2', '%3', '%4')",
	_pollID,
	_name,
	_uid,
	_description
],1] call DB_fnc_asyncCall;

["Your now enlisted in the next election!"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];