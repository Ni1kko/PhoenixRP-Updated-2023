/*
	@File: fn_logDispute.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Logs our dispute...
*/
if !(params [
	["_dName", "", [""]],
	["_dUID", "", [""]],
	["_rName", "", [""]],
	["_rUID", "", [""]],
	["_reason", "", [""]]
]) exitWith {};

private _NameF = [_dName] call DB_fnc_mresString; 
private _NameRF = [_rName] call DB_fnc_mresString; 
private _ReasonF = [_reason] call DB_fnc_mresString; 

[
	format["INSERT INTO dispute (sendername, senderuid, receivername, receiveruid, reason) VALUES ('%1', '%2', '%3', '%4', '%5')",_NameF,_dUID,_NameRF,_rUID,_ReasonF],
	1
] call DB_fnc_asyncCall;