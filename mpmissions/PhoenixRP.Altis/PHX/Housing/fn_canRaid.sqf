/*
	@File: fn_canRaid.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks whether we're able to raid this building...
*/
#include "..\..\script_macros.hpp"
if !(params [["_building", objNull, [objNull]]]) exitWith {false};

(_building getVariable "house_owner") params ["_id", "_name", "_isGang"];

private _check = "getPlayerUID _x";
if (_isGang) then { _check = "(_x getVariable [""gang_uid"", -1])" };

(playableUnits findIf {
	side _x isEqualTo civilian && 
	{ !(_x getVariable ["isAdmin", false]) } &&
	{ (call compile _check) isEqualTo _id }
}) > -1