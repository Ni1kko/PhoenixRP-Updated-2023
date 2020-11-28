#include "..\..\script_macros.hpp"
/*
    File: fn_lockpick.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for lock-picking.
*/

private _target = cursorObject;
life_interrupted = false;

if (life_action_inUse || {isNull _target} || {(player distance _target > 10)}) exitWith {};
if ([] call PHX_fnc_isSafeZone) exitWith {NOTIFY("You cannot lockpick in a greenzone!","red")};

private _isVehicle = (_target call PHX(isKindOf));

if (_isVehicle && {_target in life_vehicles}) exitWith {NOTIFY("This vehicle is already in your key-chain.","red")};
if (!_isVehicle && {isPlayer _target} && {!(isRestrained(_target))}) exitWith {};
if (_target getVariable "NPC") exitWith {NOTIFY("This vehicle is NPC protected","red")};

private _title = format ["Lock-picking %1",(["Handcuffs",(getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName"))] select _isVehicle)];
life_action_inUse = true;

if !(
    [
        _title,
        26,
        [
            "player distance (_this select 0) < (_this select 1)", 
            [_target, 10], true, 
            "['You went too far away from the target!','red'] call PHX_fnc_notify;"
        ]
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

if (!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if (!_isVehicle) then {
    _target setVariable ["restrained",sideUnknown,true];
    _target setVariable ["Escorting",false,true];
} else {
    private _chance = 50;
    _chance = _chance - ((_target getVariable ['vehicle_upgrades',[]]) select 1);

    if (HAS_PERK("pettyThief")) then { _chance = _chance * 1.3 };

    if ((floor (random 100)) <= _chance) then {
        NOTIFY("You now have keys to this vehicle.","green");
        life_vehicles pushBack _target;

        if !(playerSide isEqualTo east) then {
            [getPlayerUID player,profileName,"487"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
        };

        [_target,"carAlarm"] remoteExecCall ["life_fnc_say3D",RANY];
        [10,"Lockpicked a vehicle"] call PHX_fnc_handleXP;
    } else {

        if !(playerSide isEqualTo east) then {
            [getPlayerUID player,profileName,"215"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
        };

        [0,"%1 was seen trying to lockpick into a vehicle...",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
        NOTIFY("The lockpick broke.","red");
    };
};
