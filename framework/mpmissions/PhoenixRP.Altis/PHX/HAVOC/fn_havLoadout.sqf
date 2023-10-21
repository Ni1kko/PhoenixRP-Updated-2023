/*
	@File: fn_havLoadout.sqf

	@Author: Jack "Scarso" Farhall

	@Description: Loads default gear for the HAVOC faction...
*/
#include "..\..\script_macros.hpp"

call life_fnc_stripDownPlayer;

player forceAddUniform "U_I_E_Uniform_01_tanktop_F";
player addVest "V_PlateCarrier1_wdl";
player addWeapon "Rangefinder";
player linkItem "ItemGPS";
player linkItem "ItemMap";
player linkItem "ItemRadio";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player addHeadgear "H_HelmetSpecB_wdl";

if (HAS_PERK("mindfulPlanner")) then {
    player addGoggles "G_Tactical_Clear";
};

[] call PHX(playerSkins);
[] call life_fnc_saveGear;
