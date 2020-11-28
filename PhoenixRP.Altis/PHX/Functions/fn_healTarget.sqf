/*
	@File: fn_healTarget.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Heals & refills Food / Water for the given target... (RemoteExec)
*/
player setDamage 0;
life_thirst = 100;
life_hunger = 100;

[] call PHX_fnc_hudUpdate;