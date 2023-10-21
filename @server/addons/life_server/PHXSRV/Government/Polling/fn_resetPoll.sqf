/*
	@File: fn_resetPoll.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Resets a given polls related data... (Results, Votes, Options / Candidates)
*/
if !(params[
	["_id", -1, [0]]
]) exitWith {};

{
	[format["UPDATE %2 SET `delete` = '1' WHERE pollID = '%1'", _id, _x],1] call DB_fnc_asyncCall;
} forEach ["PHXOptions", "PHXVotes", "PHXResults"];