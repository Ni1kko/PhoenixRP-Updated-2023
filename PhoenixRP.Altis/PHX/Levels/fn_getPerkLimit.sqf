/*
	@File: fn_getPerkLimit.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the max number of perks we're able to have...
*/
private _levelSlots = switch true do {
	case (PHX_Level >= 50): {7};
	case (PHX_Level >= 40): {6};
	case (PHX_Level >= 30): {5};
	case (PHX_Level >= 20): {4};
	case (PHX_Level >= 10): {3};
	default {2};
};

_levelSlots + PHX_PrestigeLevel