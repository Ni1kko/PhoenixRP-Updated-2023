/*
*   @File: fn_repack.sqf
*   @Author: Sig
*	@Editor: Conner Merlin
*
*   Description: Repacks the players magazines into
*   full mags, meaning taking 20 mags with 10 mags in each
*   and turning them into ten full 20Rnd mags
*
*   Return
*     <TYPE: BOOLEAN> Whether or not the repack was succesful or not
*/

#include "..\..\script_macros.hpp"

if (count magazinesAmmoFull player isEqualTo 0) exitWith {};
private _magazines = [];

{
  _x params ["_className", "_ammoCount", "", "_magType"];
  if (_magType isEqualTo -1) then {
    private _add = true;

    // -- Look through the magazines array and see if we can iterate the bullet count
    {
      if (_className in _x) then {
        _x set [1, (_x select 1) + _ammoCount];
        _add = false;
      }
    } forEach _magazines;

      // -- If we can't iterate we have to add a new element to the array
    if (_add) then {
      _magazines pushBack [_className, _ammoCount];
    };
  };
} forEach (magazinesAmmoFull player);

if ((count _magazines) isEqualTo 0) exitWith {false};
{player removeMagazine _x} count (magazines player);

{
  _x params ["_className", "_count"];
  private _maxCapacity = getNumber (configFile >> "CfgMagazines" >> _className >> "count");

  // -- Add magazines if there are any to add
  private _magazinesToAdd = floor (_count / _maxCapacity);
    if (_magazinesToAdd > 0) then {
      player addMagazines [_className, _magazinesToAdd]
    };

  // -- Add spare rounds if there are any to add
  private _spareRounds = _count mod _maxCapacity;
    if (_spareRounds > 0) then {
      player addMagazine [_className, _spareRounds]
    };
} count _magazines;

true
