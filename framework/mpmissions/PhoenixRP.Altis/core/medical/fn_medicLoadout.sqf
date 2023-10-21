/*
	@File: fn_medicLoadout.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Loads default gear for the NHS faction...
*/
#include "..\..\script_macros.hpp"

call life_fnc_stripDownPlayer;

player forceAddUniform "U_B_CombatUniform_mcam";
player addBackpack "B_Carryall_cbr";
player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player addWeapon "binocular";

if (HAS_PERK("mindfulPlanner")) then { 
    player addGoggles "G_Tactical_Clear";
	player addWeapon "Rangefinder";
} else {
	player addWeapon "binocular";
};

// Adds lockpicks and food to medics
[true,"waterBottle",5] call life_fnc_handleInv;
[true,"tbacon",5] call life_fnc_handleInv;
[true,"fuelFull",2] call life_fnc_handleInv;
[true,"lollipop",10] call life_fnc_handleInv;
[true,"medikit_virtual",1] call life_fnc_handleInv;

[] call PHX(playerSkins);
[] call life_fnc_saveGear;