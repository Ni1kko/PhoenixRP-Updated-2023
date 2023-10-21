/*
	@File: fn_addVote.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for adding votes...
*/
if !(params [
	["_vote", [], [[]]],
	["_player", objNull, [objNull]]
]) exitWith {["An error occured while processing your vote...", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner]};

if !(_vote params [
	["_optionID", -1, [0]],
	["_pollID", -1, [0]]
]) exitWith {["An error occured while processing your vote...", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner]};

private _playerID = (getPlayerUID _player);

private _result = [format["SELECT id FROM phxvotes WHERE uid = '%1' AND pollID = '%2' AND pollID = '%2'", _playerID, _pollID], 2] call DB_fnc_asyncCall;

if (_result isEqualType "" || { !(_result isEqualTo []) }) exitWith {
	["You've already voted in this poll...", "red"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];
};

[format["INSERT INTO phxvotes (pollID, optionID, uid) VALUES ('%1', '%2', '%3')",
	_pollID,
	_optionID,
	_playerID
], 1] call DB_fnc_asyncCall;

["Your vote has been cast for this poll!"] remoteExecCall ["PHX_fnc_notify", remoteExecutedOwner];