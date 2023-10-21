/*
	@File: fn_updateID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Force updates the database name for our real ids... (Stops issues with people changing names)
*/
if !(params [["_uid", "", [""]], ["_name", "", [""]]]) exitWith {};

[format["UPDATE phxids SET realname='%1' WHERE playerid ='%2' AND isFake = '0'",
	_name,
	_uid
],1] call DB_fnc_asyncCall;