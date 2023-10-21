/*
	@File: fn_repairDoor.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Repair a broken door...
*/
#include "..\..\script_macros.hpp"
if !(params[["_building", objNull, [objNull]]]) exitWith {};

if (isNull _building || { !(_building isKindOf "House_F") }) exitWith {};

private _door = [_building] call LIFE(nearestDoor);
if (_door < 1) exitWith { ["You are not near a door!"] spawn PHX(notify) };
if !((_building getVariable [format ["bis_disabled_Door_%1", _door], 0]) isEqualTo 0) exitWith { ["The door is already locked and repaired!"] spawn PHX(notify) };

private _increase = 0.008;

life_action_inUse = true;

if !(
    [
        "Repairing Door",
        26,
        [],
        _increase
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

_building animateSource [format ["Door_%1_rot", _door], 0];
_building setVariable [format ["bis_disabled_Door_%1",_door],1,true];

["This door has been repaired, locked and closed."] spawn PHX(notify);