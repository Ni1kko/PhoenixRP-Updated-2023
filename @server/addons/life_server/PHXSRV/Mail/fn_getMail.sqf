/*
	@File: fn_getMail.sqf
	@Author: Jack "Scarso" Farhall
	@Description: gets mail...
*/
_this params [["_steamid", "", [""]]];

private _me = remoteExecutedOwner;

if (_me isEqualTo 0 || { _steamid isEqualTo "" }) exitWith {};

private _query = [format["SELECT * FROM phxmail WHERE `to` = '%1' AND claimed = '0'", _steamid], 2, true] call DB_fnc_asyncCall;

if (_query isEqualType "" || { _query isEqualTo [] }) exitWith {
	["You have no mail to claim", "red"] remoteExec ["PHX_fnc_notify", _me];
};

[_query] remoteExec ["PHX_fnc_openMail", _me];