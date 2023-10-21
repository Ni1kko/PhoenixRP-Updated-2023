/*
	@File: fn_getResults.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the results for a given poll...
*/
if !(params[["_id", -1, [0]]]) exitWith {false};

[
	format["SELECT * FROM phxresults WHERE pollID = '%1' AND `delete` = '0'", _id],
	2
] call DB_fnc_asyncCall;