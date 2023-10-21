#include "..\..\script_macros.hpp"
/*
    File: fn_storeVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Stores the vehicle in the garage.
*/
params [
  ["_target", cursorObject, [objNull]],
  ["_player", player, [objNull]],
  "",
  ["_type", ["Car"], ["",[]]]
];

private _vehicle = [
  vehicle _player,
  ((nearestObjects [getPos _target, ["Car", "Air", "Ship","B_Slingload_01_Cargo_F"], 30]) select {

    ((_x getVariable ["vehicle_info_owners", []] param [0, []]) param [0, "-1"]) isEqualTo getPlayerUID _player
  }) param [0, objNull]
] select (isNull objectParent _player);

//--- Checks
if (isNull _vehicle) exitWith {["There isn't a vehicle near the sign that you own.", "red"] call PHX_fnc_notify;};
if !(alive _vehicle) exitWith {["Your vehicle was classified as a destroyed vehicle and was sent to the scrap yard."] call PHX_fnc_notify;};

//---- Check if vehicle is supposed to be stored there.
if !([_vehicle, _type] call PHX(isKindOf)) exitWith {["You may not store this kind of vehicle here.", "red"] call PHX_fnc_notify;};

//--- Progress bar
life_action_inUse = true;
if !(
    [
        "Storing Vehicle",
        10,
        [
            "player distance (_this select 0) < 10", 
            [_target], true, 
            "[""You must remain within 10m of the sign"",""red""] call PHX_fnc_notify;"
        ],
        0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

[_vehicle, false, _player] remoteExecCall (["fnc_vehicleStore","TON"] call SOCK_fnc_getRemoteDestination);

life_garage_store = true;