/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description:
    Loads the civs out with the default gear, with randomized clothing.
*/
#include "..\..\script_macros.hpp"

call life_fnc_stripDownPlayer;

player addUniform (selectRandom ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"]);
player addHeadgear (selectRandom ["H_StrawHat","H_Hat_Safari_sand_F","H_Helmet_Skate","H_Bandanna_sand","H_Hat_brown","H_Booniehat_tan","H_Watchcap_camo"]);

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

if (HAS_PERK("mindfulPlanner")) then { 
    player linkItem "ItemGPS";
    player addGoggles "G_Tactical_Clear";
    player addWeapon "Rangefinder";
}; 

[] call PHX(playerSkins);
[] call life_fnc_saveGear; 
