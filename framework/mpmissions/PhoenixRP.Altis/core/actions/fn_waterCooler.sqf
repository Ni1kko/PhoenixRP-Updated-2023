#include "..\..\script_macros.hpp"
/*
	@File: fn_waterCooler.sqf
	@Author: Lewis Mackinnon
	@Description: Handles the system behind the water coolers
*/

if (life_action_inUse) exitWith {};
if (isRestrained(player) || player getVariable ["playerSurrender", false]) exitWith { NOTIFY("You cannot do this while you are unable to move.","red") };
if (ITEM_VALUE("waterCup") > 0) exitWith {["You cannot fill another cup before emptying your current one!", "red"] spawn PHX(notify) };

life_action_inUse = true;

if !([true, "waterCup", 1] call life_fnc_handleInv) exitWith {
    NOTIFY("Your inventory space is full.","red");
    life_action_inUse = false;
};

[format ["You have collected a cup of water from the water cooler."],"green"] call PHX_fnc_notify;

sleep 1;
life_action_inUse = false;