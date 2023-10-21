/*
* @File: fn_getOut.sqf
* @Author: ArrogantBread
*
* Copyright (C) Nathan "ArrogantBread" Wright  - All Rights Reserved - PhoenixRP
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Nathan "ArrogantBread" Wright
*/
#include "..\..\script_macros.hpp"
params [
	["_ignoreGZ", false, [false]]
];

!(
	isRestrained(player) || //restrained?
	{player getVariable ["escorting",false]} || //escorted?
	{animationState player isEqualTo "incapacitated"} || //knocked out?
	{life_istazed} ||
	{life_action_inUse} ||
	{eyePos player select 2 < 1 && surfaceIsWater (getPos player) && !(underwater player)} || //prevent sharking
	((call PHX_fnc_isSafeZone) && !(playerSide isEqualTo west) && !(player getVariable["isSO1", false]) && !_ignoreGZ)
)