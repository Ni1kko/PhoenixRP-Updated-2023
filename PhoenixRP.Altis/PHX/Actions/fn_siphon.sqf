#include "..\..\script_macros.hpp"
/*
    File: fn_siphon.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Zyn
    Description: Allows players with a perk to steal fuel from vehicles
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (life_action_inUse) exitWith {};
if (isNull _vehicle || {!(_vehicle isKindOf "AllVehicles")}) exitWith {["You need to look at a vehicle to siphon!", "red"] call PHX_fnc_notify;};
if (player distance _vehicle > 3) exitWith {["You need to be closer to the vehicle to siphon!", "red"] call PHX_fnc_notify;};
if ((fuel _vehicle) <= 0.3) exitWith {["There is not enough fuel to siphon!", "red"] call PHX_fnc_notify;};
if (life_inv_fuelEmpty isEqualTo 0) exitWith {["You need an empty fuel can to do this!", "red"] call PHX_fnc_notify;};

life_action_inUse = true;

if !(
	[
		format["Siphoning %1",(typeOf(_vehicle))],
		120,
		[
			"player distance (_this select 0) < 10", 
			[_vehicle], true, 
			"[""You must remain within 10m of the vehicle at all times"",""red""] call PHX_fnc_notify;"
		]
	] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

life_action_inUse = false;

[([_vehicle,(fuel _vehicle) - 0.3] remoteExecCall ["life_fnc_setFuel",_vehicle]),(_vehicle setFuel ((fuel _vehicle) - 0.3))] select (local _vehicle);

[format ["You stole fuel from that %1",(typeOf(_vehicle))], "red"] call PHX_fnc_notify;
[false,"fuelEmpty",1] call life_fnc_handleInv;
[true,"fuelFull",1] call life_fnc_handleInv;