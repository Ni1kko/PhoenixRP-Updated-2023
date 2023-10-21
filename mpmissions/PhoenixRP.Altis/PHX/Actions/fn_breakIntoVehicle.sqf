/*
	@File: fn_breakIntoVehiclesqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
scopeName "breakIn";
#include "..\..\script_macros.hpp"
params [["_vehicle", cursorObject, [objNull]]];

if (isNull _vehicle || { !(alive _vehicle) } || { !([_vehicle, ["LandVehicle", "Air", "Ship", "B_Slingload_01_Cargo_F"]] call PHX(isKindOf)) }) exitWith {};
if (FETCH_CONST(life_coplevel) < 2 && {!(player getVariable "isAdmin")} && {!(playerSide isEqualTo independent)}) exitWith { ["You are not high enough police rank to use this option..."] spawn PHX(notify) };
if ((player distance _vehicle) > 10) exitWith { NOTIFY("You are not close enough to the vehicle","red") };
if (_vehicle in life_vehicles) exitWith { NOTIFY("You already have the keys to this car","red") };
if (dialog) then { closeDialog 0 };

private _data = _vehicle getVariable ["vehicle_info_owners", []];
if (_data isEqualTo []) exitWith {deleteVehicle _vehicle };

private _vehName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

if !(player getVariable ["isAdmin", false]) then {

	life_interrupted = false;
	life_action_inUse = true;

	private _sleep = [60, 80] select (_vehicle isKindOf "Air");
	//if (HAS_PERK("")) then { _sleep = _sleep * 0.1 };

	//Setup our progress bar.
	if !(
		[
			format ["Breaking into %1...", _vehName],
			_sleep,
			[
				"player distance (_this select 0) < 10", 
				[_vehicle], true, 
				"[""You must remain within 10m of the vehicle"",""red""] call PHX_fnc_notify;"
			]
		] call PHX(handleProgress)
	) exitWith { life_action_inUse = false; breakOut "breakIn"};

};

// [_vehicle, 0] call life_fnc_lockVehicle; // Hate this tbh...
life_vehicles pushBackUnique _vehicle;

["You have forced your way into the vehicle and now have the keys..."] spawn PHX(notify);

life_action_inUse = false;