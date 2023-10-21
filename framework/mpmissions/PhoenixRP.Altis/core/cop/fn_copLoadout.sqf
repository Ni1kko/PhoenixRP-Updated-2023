/*
	@File: fn_copLoadout.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Loads default gear for the APC faction...
*/
#include "..\..\script_macros.hpp"

call life_fnc_stripDownPlayer;

player forceAddUniform (["U_BG_Guerrilla_6_1", "U_B_CombatUniform_mcam_worn"] select (call life_coplevel <= 2));
player addBackpack "B_Carryall_cbr";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
player linkItem "ItemRadio";

if (HAS_PERK("mindfulPlanner")) then { 
    player addGoggles "G_Tactical_Clear";
	player addWeapon "Rangefinder";
} else {
	player addWeapon "Binocular";
};

player addWeapon "hgun_Pistol_heavy_01_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

[] call PHX(playerSkins);
[] call life_fnc_saveGear;