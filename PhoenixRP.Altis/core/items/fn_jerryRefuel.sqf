#include "..\..\script_macros.hpp"
/*
    File: fn_jerryRefuel.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Refuels the vehicle if the player has a fuel can.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

life_interrupted = false;

if (isNull _vehicle) exitWith {NOTIFY("You need to look at the vehicle you want to refuel!","red")};
if !(_vehicle isKindOf "AllVehicles" || {life_action_inUse}) exitWith {};
if (player distance _vehicle > 7.5) exitWith {NOTIFY("You need to be closer to the vehicle!","red")};

life_action_inUse = true;

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

if !(
    [
        format ["Refuelling %1",_displayName],
        20
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

if (!local _vehicle) then {
    [_vehicle,(fuel _vehicle) + 0.2] remoteExecCall ["life_fnc_setFuel",_vehicle];
} else {
    _vehicle setFuel ((fuel _vehicle) + 0.2);
};

[format ["You have refuelled that %1",_displayName],"green"] call PHX_fnc_notify;
[false,"fuelFull",1] call life_fnc_handleInv;
[true,"fuelEmpty",1] call life_fnc_handleInv;