/*
	@File: fn_getVotes.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the votes for a given poll and option...
*/
if !(params[["_id", -1, [0]], ["_optionID", -1, [0]]]) exitWith {false};

[
	format["SELECT * FROM phxvotes WHERE pollID = '%1' AND optionID = '%2' AND `delete` = '0'", _id, _optionID],
	2,
	true
] call DB_fnc_asyncCall;