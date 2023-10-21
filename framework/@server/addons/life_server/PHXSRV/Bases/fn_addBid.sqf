/*
	@File: fn_addBid.sqf
	@Author: Jack "Scarso" Farhall
	@Description: BID BID BID
*/
if !(params[["_base", "", [""]], ["_bid", 0, [0]], ["_gID", -2, [0]]]) exitWith {};

if !(PHX_isWaring) exitWith {};

private _owner = remoteExecutedOwner;
if (_owner isEqualTo 0) exitWith {};

[format["INSERT INTO phxbasebids (gangID, bid, base) VALUES ('%1', '%2', '%3')",
	[_gID] call DB_fnc_numberSafe,
	[_bid] call DB_fnc_numberSafe,
	_base
], 1] call DB_fnc_asyncCall;

[format["Your bid of £%1 has been placed!", [_bid] call life_fnc_numberText]] remoteExec ["PHX_fnc_notify", _owner];