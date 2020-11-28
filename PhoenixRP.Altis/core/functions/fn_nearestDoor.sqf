/*
    File: fn_nearestDoor.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Fetches the nearest door of the building the player is looking
    at.
*/
#include "..\..\script_macros.hpp"

params [
  ["_house", objNull, [objNull]],
  ["_returnFull", false, [false]]
];

if (isNull _house) exitWith {[[], 0] select !_returnFull};

private _allDoors = [_house] call PHX(getAllDoors);

private _return = [_allDoors, 2] call PHX(minByIndex);
if (_return isEqualTo []) exitWith {[[], 0] select !_returnFull};

if (_return param [2] >= 2.4 || {count _allDoors isEqualTo 0}) exitWith { 0 };


if !(_returnFull) then {
  _return = _return param [1];
};

_return