/*
    File: fn_vehicleWeight.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Calculates Vehicle Weight.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {};

private _weight = -1;
private _used = (_vehicle getVariable "Trunk") select 1;
_weight = ([(typeOf _vehicle)] call life_fnc_vehicleWeightCfg) + ((_vehicle getVariable ["vehicle_upgrades",[0]]) select 0);

if (isNil "_used") then {_used = 0};
[_weight,_used];
