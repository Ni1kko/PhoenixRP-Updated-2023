/*
*   @File: fn_getAllDoors.sqf
*   @Author: Sig
*
*   Description: Returns all doors of the house, that being the position,
*   the number of the door and the distance of the door
*
*   Arguments
*     0 <TYPE: OBJECT> - House where we are finding the doors on
*
*   Return
*     <TYPE: ARRAY> - Consists of position, door number, distance between player and door
*/

#include "..\..\script_macros.hpp"

if (!params [["_house", objNull, [objNull]]]) exitWith {[]};

private _doors = getNumber(configFile >> "CfgVehicles" >> typeOf _house >> "numberOfDoors");
if (_doors < 1) exitWith {[]};

// -- Apply all the required elements to the array, and find the doors using numbers in range function
([1, _doors] call PHX(numbersInRange)) apply {

  private _pos = _house modelToWorld (_house selectionPosition format ["Door_%1_trigger", _x]);
  [_pos, _x, player distance _pos]

}