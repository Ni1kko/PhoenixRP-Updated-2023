#include "..\..\script_macros.hpp"
/*
    File: fn_serviceVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Services a vehicle
*/
scopeName "serviceVehicle";
params [
  ["_stand", cursorObject, [objNull]],
  ["_caller", player, [objNull]],
  ["_actionID", -1, [0]],
  ["_params", [], []]
];

if (life_action_inUse) exitWith {NOTIFY("You are already doing an action","red")};

_params params [["_point", "", [""]], ["_isAmmoRearm", "false", [""]]];

_isAmmoRearm = call compile _isAmmoRearm; // Convert string to bool

private _serviceCost = [(LIFE_SETTINGS(getNumber,"service_aircraft")),0] select (playerSide in [independent,west]);
_point = getMarkerPos _point;

if (HAS_PERK("partsCarrier")) then {_serviceCost  = _serviceCost * 0.75};
private _search = nearestObjects[_point, ["AllVehicles"],10];

if (_search isEqualTo []) exitWith {NOTIFY("There isn't a vehicle on the helipad!","red")};
_vehicle = _search param [0, objNull];

private _time = 30;

if (_isAmmoRearm) then {
    _time = _time * 1.5;
    _serviceCost = _serviceCost * 2.5;

    if !(typeOf(_vehicle) in (LIFE_SETTINGS(getArray,"rearmableVehicles"))) exitWith {
        NOTIFY("This vehicle can't be rearmed","red");
        breakOut "serviceVehicle";
    };
};

if (CASH < _serviceCost) exitWith {[format ["You need £%1 to service your vehicle", [_serviceCost] call life_fnc_numberText],"red"] call PHX(notify)};

life_action_inUse = true;

if !(
    [
        "Servicing Vehicle",
        _time,
        [
            "alive (_this select 0) || (_this select 0) distance (_this select 1) < 15", 
            [_vehicle, _point], true, 
            "[""The vehicle is no longer stable enough or on the helipad!"",""red""] call PHX_fnc_notify;"
        ]
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

if (!alive _vehicle || _vehicle distance _point > 15) exitWith {life_action_inUse = false; NOTIFY("The vehicle is no longer stable enough or on the helipad!","red")};

if !(playerSide in [independent,west]) then {
    [_serviceCost, 1, 0, "Serviced Vehicle"] call PHX(handleMoney);
    [player, format ["%1 (%2) serviced their vehicle for %3",profileName,getPlayerUID player,[_serviceCost] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

if (_isAmmoRearm) then {
    _vehicle setVehicleAmmoDef 1;
    NOTIFY("The vehicle is now rearmed","green");
} else {
    if (local _vehicle) then {
        _vehicle setFuel 1;
    } else {
        [_vehicle,1] remoteExecCall ["life_fnc_setFuel",_vehicle];
    };

    _vehicle setDamage 0;

    NOTIFY("The vehicle is now repaired and refuelled","green");
};

life_action_inUse = false;