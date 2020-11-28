/*
	@File: fn_getDefaultLoadout.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets and calls for our correct default loadout to be set...
*/

#include "..\..\script_macros.hpp"
#define SIDEIS(side) playerSide isEqualTo side

switch (true) do {
	/* FACTION LOADOUTS */
	case (SIDEIS(west)): {call life_fnc_copLoadout};
	case (SIDEIS(independent)): {call life_fnc_medicLoadout};
	case (SIDEIS(east)): {call PHX(havLoadout)};
	/* JOB LOADOUTS */
	case (SIDEIS(civilian) && { (isNEW(player)) }): {["News"] call PHX(jobLoadout)};
	case (SIDEIS(civilian) && { (isLAW(player)) }): {["Lawyer"] call PHX(jobLoadout)};
	case (SIDEIS(civilian) && { (isTAX(player)) }): {["Taxi"] call PHX(jobLoadout)};
	case (SIDEIS(civilian) && { (isSER(player)) }): {["Mechanic"] call PHX(jobLoadout)};
	case (SIDEIS(civilian) && { (isSO1(player)) }): {["SO1"] call PHX(jobLoadout)};
	case (SIDEIS(civilian) && { (isJUDGE(player)) }): {["Judge"] call PHX(jobLoadout)};
	/* DEFAULT LOADOUT */
	default {call life_fnc_civLoadout};
};