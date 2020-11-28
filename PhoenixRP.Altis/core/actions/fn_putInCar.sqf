#include "..\..\script_macros.hpp"
/*
    File: fn_putInCar.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Finds the nearest vehicle and loads the target into the vehicle.
*/
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || {!isPlayer _unit}) exitWith {};

private _nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"], 10] select 0;

(nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"], 10]) params [["_nearestVehicle", objNull, [objNull]]];

if (isNull _nearestVehicle) exitWith {
    ["There isn't a vehicle nearby!", "red"] spawn PHX_fnc_notify;
};

detach _unit;
[_unit, _nearestVehicle] remoteExecCall ["PHX_fnc_moveIn",_unit];
_unit setVariable ["Escorting",false,true];