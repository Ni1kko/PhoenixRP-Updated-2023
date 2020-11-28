/*
	@File: fn_getBid.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Get the last & highest bid...
*/
if !(params[["_base", "", [""]]]) exitWith {};

if !(PHX_isWaring) exitWith {};

private _owner = remoteExecutedOwner;
if (_owner isEqualTo 0) exitWith {};

private _results = [format["SELECT gangID, bid FROM phxbasebids WHERE base = '%1' AND active = '1' ORDER BY bid DESC LIMIT 1", _base], 2] call  DB_fnc_asyncCall;
if (_results isEqualType "") exitWith { ["An error occured while getting this bases bid"] remoteExec ["PHX_fnc_notify", _owner] };

[_results, _base] remoteExecCall ["PHX_fnc_openBase", _owner];