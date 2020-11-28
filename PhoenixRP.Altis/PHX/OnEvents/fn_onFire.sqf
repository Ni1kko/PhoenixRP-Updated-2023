/*
*   @File: fn_fired.sqf
*   @Author: Sig
*
*   Description: Fired event handler
*
*   Arguments
*     0 <TYPE: OBJECT> - Unit that is firing the weapon
*     1 <TYPE: STRING> - Weapon that is being used
*     2 <TYPE: STRING> - Muzzle that is being used
*     3 <TYPE: STRING> - Weapon fire mode
*     4 <TYPE: STRING> - Ammo that was used
*     5 <TYPE: STRING> - Magazine that was used
*     6 <TYPE: OBJECT> - Projectile
*     7 <TYPE: OBJECT> - Gunner whose weapons are firing
*
*   Return
*     Nothing
*/

#include "..\..\script_macros.hpp"

params [
  ["_unit", objNull, [objNull]],
  ["_weapon", "", [""]],
  ["_muzzle", "", [""]],
  ["_fireMode", "", [""]],
  ["_ammo", "", [""]],
  ["_magazine", "", [""]],
  ["_projectile", objNull, [objNull]],
  ["_gunner", objNull, [objNull]]
];

if !(false call PHX_fnc_canFire) exitWith {deleteVehicle _projectile; true};

if (_ammo isEqualTo "GrenadeHand_stone") then {
  _projectile spawn {

    private _position = ASLtoATL (visiblePositionASL _this);
    while {!isNull _this} do {
      _position = ASLtoATL (visiblePositionASL _this);
      sleep 0.1;
    };

    [_position] remoteExec ["life_fnc_flashbang", RCLIENT];
  };
};


if (_weapon in ["hgun_Pistol_heavy_01_F"] || (playerSide isEqualTo west && _weapon in ["hgun_Rook40_F"])) then {
  [_unit, _muzzle] spawn {

    params ["_unit", "_muzzle"];
    private _time = diag_tickTime;

    while {diag_tickTime - _time < .5} do {
      _unit setWeaponReloadingTIme [_unit, _muzzle, 2]
    };
  };
};

if (playerSide isEqualTo WEST) then {    

  if (_magazine in [ "30Rnd_556x45_Stanag_Tracer_Green", "30Rnd_556x45_Stanag" ] && {_weapon in [ "arifle_Mk20_plain_F", "arifle_Mk20C_plain_F" ]}) then {
    [_unit, _muzzle] spawn {

      params ["_unit", "_muzzle"];
      private _time = diag_tickTime;

      while {diag_tickTime - _time < 0.07} do {
        _unit setWeaponReloadingTime [_unit, _muzzle, 2];
      };

    };
  };

};