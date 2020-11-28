/*
	@File: fn_saveRewards.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Saves our loyalty rewards...
*/
if !(params[["_uid", "", [""]], ["_rewards", [], [[]]]]) exitWith {};

[format ["UPDATE phxclients SET loy_rewards = '%1' WHERE playerid = '%2'", ([_rewards] call DB_fnc_mresArray), _uid], 1] call DB_fnc_asyncCall;