/*
*   @File: fn_repackAction.sqf
*   @Author: Sig
*	@Editor: Conner Merlin
*
*   Description: Repacks the players magazines into
*   full mags, meaning taking 20 mags with 10 mags in each
*   and turning them into ten full 20Rnd mags
*/
 
#include "..\..\script_macros.hpp"
#define THISFNC PHX(repackAction)

if (!canSuspend) exitWith {_this spawn THISFNC};
if ([true, true, false] call PHX(canUse)) exitWith {};
if ((count magazinesAmmoFull player) isEqualTo 0) exitWith {["You do not have any magazines to repack!", "red"] call PHX_fnc_notify;};

life_action_inUse = true;

private _time = 20;
if (HAS_PERK("slightOfHand")) then { _time = _time * 0.75 };

if !(
  [
    "Repacking Magazines",
    _time
  ] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

if (call PHX(repack)) then {
  ["You have succesfully repacked your magazines!", "green"] call PHX(notify);
} else {
  ["There was an error repacking your magazines.", "red"] call PHX(notify);
};

life_action_inUse = false;

