/*
	@File: fn_forceEntry.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows the police to force the door down...
*/
#include "..\..\script_macros.hpp"
if !(params [["_building", objNull, [objNull]]]) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(notify) };

// Checks...
if (isNil {(_building getVariable "house_owner")}) exitWith { ["This house doesn't belong to anyone"] spawn PHX(notify) };
if !([_building] call PHX(canRaid)) exitWith { ["This person is not online and so this house can't be raided"] spawn PHX(notify) };

(_building getVariable "house_owner") params ["_id", "_name", "_isGang"];

private _door = [_building] call life_fnc_nearestDoor;
if (_door isEqualTo 0) exitWith { ["You're not looking at a door"] spawn PHX(notify) };
if ((_building getVariable [format ["bis_disabled_Door_%1", _door],0]) isEqualTo 0) exitWith { ["This door is already unlocked"] spawn PHX(notify)};

life_action_inUse = true;

//Setup the progress bar
if !(
    [
        "Breaking lock on door",
        26,
        0.0092
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

if (!alive player || isDowned(player)) exitWith { life_action_inUse = false };
if (life_interrupted) exitWith { life_interrupted = false; NOTIFY("Action cancelled.","red"); life_action_inUse = false };

life_action_inUse = false;

_building setVariable ["robbed",true,true];
_building animate [format["door_%1_rot", _door], 1];
_building setVariable [format ["bis_disabled_Door_%1",_door],0,true];

[player, format ["%1 (%2) broke down %3 house door.",name player,getPlayerUID player, (_building getVariable "house_owner") select 1], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);