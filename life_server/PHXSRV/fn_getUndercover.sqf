 /*
	@File: fn_getUndercover.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns our CID & HSS levels.
*/
params [
	["_uid", "", [""]]
];

if (_uid isEqualTo "") exitWith { [false] remoteExec ["PHX_fnc_chooseSide", remoteExecutedOwner] };

private _player = [format["SELECT mi5level, hsslevel FROM phxclients WHERE playerid = '%1' AND (mi5level > '0' OR hsslevel > '0')", _uid],2] call DB_fnc_asyncCall;
if (_player isEqualType "" || { _player isEqualTo [] }) exitWith { [false] remoteExec ["PHX_fnc_chooseSide", remoteExecutedOwner] };

[true, [_player select 0, _player select 1]] remoteExec ["PHX_fnc_chooseSide", remoteExecutedOwner];