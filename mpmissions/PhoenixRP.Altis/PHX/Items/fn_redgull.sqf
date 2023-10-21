/*
  File: fn_redgull.sqf
  Author: Sig
  Description: Redgull action
*/

#include "..\..\script_macros.hpp"

if ((time - life_action_delay) < 5) exitWith {};
life_action_delay = time;

if ([false, "redgull", 1] call life_fnc_handleInv) then {

  ["You have drunk a redgull, your aim sway has been reduced by 50%", "cyan"] call PHX(notify);
  player setCustomAimCoef .5;

  private _effTime = time;
  waitUntil {!alive player || !(isDowned(player)) || (time - _effTime) > ([(3 * 60),(6 * 60)] select (HAS_PERK("wildWiing")))};
  player setCustomAimCoef 1;

};
