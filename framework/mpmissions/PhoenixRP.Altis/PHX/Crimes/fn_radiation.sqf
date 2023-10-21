/*
	@File: fn_radiation.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Handles radiation...
*/
#include "..\..\script_macros.hpp"

if !(canSuspend) exitWith { _this spawn PHX(radiation) };

["You entered a radioactive area!","red"] call PHX_fnc_notify;

if (player getVariable ["isAdmin",false]) exitWith {};

private _radMasks = getArray (missionConfigFile >> "CfgSettings" >> "radiation_masks");
private _radSuits = getArray (missionConfigFile >> "CfgSettings" >> "radiation_uniforms");

private _rad1 = ppEffectCreate ["ChromAberration",200];
private _rad2 = ppEffectCreate ["DynamicBlur",500];
private _rad3 = ppEffectCreate ["FilmGrain",2000];

_rad1 ppEffectAdjust [-0.02,0,true];
_rad2 ppEffectAdjust [0.03];
_rad3 ppEffectAdjust [0.12,1.52,3.54,2,2,true];

PHX_effects pushBack [_rad1, _rad2, _rad3];
{ _x ppEffectCommit 1 } forEach PHX_effects;

for "_i" from 0 to 1 step 0 do {
	if ((getPos player) distance (getMarkerPos "HAVOC_Destroyer") > 200) exitWith { 
		if (alive player && { !(isDowned(player)) }) then {
			{ ppEffectDestroy _x } forEach PHX_effects;
		}; 
	};

	player say2d "radiation";

	if (alive player && { !(isDowned(player)) }) then {
		if ((uniform player) in _radSuits && { (goggles player) in _radMasks }) then {
			{ _x ppEffectEnable false } forEach PHX_effects;
		} else {
			{ _x ppEffectEnable true } forEach PHX_effects;
			player setDamage ((damage player) + 0.05);
		};
	};

	sleep 5;
};