/*
	@File: fn_wipeID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Deletes all our current Fake ID Cards...
*/
if !(params [
	["_uid", "", [""]]
]) exitWith {};

[format["UPDATE phxids SET active='0' WHERE playerid ='%1' AND isFake = '1'",
	_uid
],1] call DB_fnc_asyncCall;