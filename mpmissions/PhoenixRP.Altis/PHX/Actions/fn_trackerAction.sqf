#include "..\..\script_macros.hpp"
/*
    File: fn_trackerAction.sqf
    Author: Zyn
    Description: Allows players to track their vehicle
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (life_action_inUse || {isNull _curTarget} || {player distance _vehicle > 5} || {!(_curTarget isKindOf "LandVehicle")}) exitWith {};
if (call PHX_fnc_isSafeZone) exitWith {["You can't attach a GPS Tracker in a greenzone!", "red"] call PHX_fnc_notify};

life_action_inUse = true;

if !(
	[
		format["Attaching tracker to %1", (FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName"))],
		120,
		[
			"player distance (_this select 0) < 5", 
			[_vehicle], true, 
			"[""You must remain within 5m of the vehicle at all times"",""red""] call PHX_fnc_notify;"
		]
	] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

[false,"gpstracker",1] call life_fnc_handleInv;
life_action_inUse = false;

["GPS Tracker added to the vehicle. It will update every 30 seconds", "green"] call PHX_fnc_notify;

[_vehicle] spawn PHX_fnc_tracker;