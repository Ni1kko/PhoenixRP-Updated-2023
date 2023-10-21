/*
    File: fn_doorAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Animates a door?
*/
#include "..\..\script_macros.hpp"

params [["_object", objNull, [objNull]], ["_sel", "rot", [""]], ["_door", -1, [0]]];

if (isNull _object) exitWith {};

// -- If no door is specified, find the nearest door,
// -- relative to player position
if (_door < 1) then {
  _door = [_object] call PHX(nearestDoor);
};

// -- Check again to make sure that a door was found nearby
if (_door isEqualTo 0) exitWith {};

private _format = format ["Door_%1_%2", _door, _sel];

_object animate [_format, [0, 1] select ((_object animationPhase _format) isEqualTo 0)];