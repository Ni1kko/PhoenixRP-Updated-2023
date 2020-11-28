/*
*   @File: fn_sideLockDoor.sqf
*   @Author: Sig
*
*   Description: Locks doors and makes them only accessible to members of the given side / faction
*
*   Arguments
*     0 <TYPE: OBJECT> - Object that will be having its doors locked
*     1 <TYPE: SIDE / GROUP> - Side that can open the door
*       - Use -1 to make it locked for everyone
*       - Use sidempty to open door for everyone
*     2 <TYPE: NUMBER / ARRAY> - Door numbers to be locked
*       - Put -1 to lock all doors
*       - Put door numbers in an array to lock certain doors ([1,2,3,4] etc.)
*     3 <TYPE: BOOLEAN> Whether to keep the door lock local (used when function is called from editor init)
*
*   Return
*     <TYPE: BOOLEAN> - Whether or not the door locked successfully
*/

#include "..\..\script_macros.hpp"
#define DOOR_ERROR(var) format ['Error sideLockDoor: %1', var]
#define QUOTE(var) #var
#define QTHIS QUOTE(PHX(sideLockDoor))

params [
  ["_object", objNull, [objNull]],
  ["_group", -1, [grpNull, sideEmpty, 0]],
  ["_number", -1, [0, []]],
  ["_local", false, [false]]
];

private _success = true;

try {

  if (isNull _object) throw "No object given!";
  if !(isClass (configFile >> "CfgVehicles" >> typeOf _object)) throw DOOR_ERROR("Object is not a CfgVehicles class!");
  private _doors = getNUmber (configFile >> "CfgVehicles" >> typeOf _object >> "numberOfDoors");

  if _local then {

    if (_number isEqualTo -1) then {

      _number = [1, _doors] call PHX(numbersInRange);

    };

    if (_number isEqualType 0 && {!(_number isEqualTo -1)}) then {

      if (_number > _doors || {_number < 1}) throw DOOR_ERROR("Given door does not exist!");

      private _doorLock = format ["BIS_disabled_door_%1", _number];
      private _lock = [parseNumber !(

        _group isEqualType sideEmpty && {playerSide isEqualTo _group || _group isEqualTo sideEmpty}
          ||
        {_group isEqualType grpNull && {!isNull _group} && {player in units _group}}

      ), 1] select (_group isEqualTo -1);

        _object setVariable [_doorLock, _lock];

    } else {

      {

        private _doorLock = format ["BIS_disabled_door_%1", _x];
        private _lock = [parseNumber !(

          _group isEqualType sideEmpty && {playerSide isEqualTo _group}
            ||
            {_group isEqualType grpNull && {!isNull _group} && {player in units _group}}

            ), 1] select (_group isEqualTo -1);

        _object setVariable [_doorLock, _lock];

      } count (_number select {_x <= _doors && {_x > 0}});

    };

  } else {

    [_object, _group, _number, true] remoteExecCall [QTHIS, -2, true];

  };

} catch {

  _success = false;

};

_success