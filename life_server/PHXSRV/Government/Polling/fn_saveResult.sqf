/*
	@File: fn_saveResult.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Saves the results from the election...
*/
if !(params[
	["_id", -1, [0]],
	["_result", [], [[]]]
]) exitWith {};

[format["INSERT INTO phxresults (pollID, results, insert_time) VALUES ('%1', '%2', CURDATE())",
	_id,
	[_result] call DB_fnc_mresArray
],1] call DB_fnc_asyncCall;