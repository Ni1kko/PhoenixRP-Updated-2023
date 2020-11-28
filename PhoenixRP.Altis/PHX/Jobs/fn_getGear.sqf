/*
	@File: fn_getGear.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Tells us what gear array to save to or use...
*/
#include "..\..\script_macros.hpp"

private _ret = switch (true) do {
	case (isCID(player) && { playerSide isEqualTo civilian }): {["PHX_CID_Gear", "mi5_gear"]};
	case (isHSS(player) && { playerSide isEqualTo civilian }): {["PHX_HSS_Gear", "hss_gear"]};
	case (isNEW(player) && { playerSide isEqualTo civilian }): {["PHX_NEW_Gear", "new_gear"]};
	case (isLAW(player) && { playerSide isEqualTo civilian }): {["PHX_LAW_Gear", "law_gear"]};
	case (isTAX(player) && { playerSide isEqualTo civilian }): {["PHX_TAX_Gear", "tax_gear"]};
	case (isSER(player) && { playerSide isEqualTo civilian }): {["PHX_SER_Gear", "ser_gear"]};
	case (isSO1(player) && { playerSide isEqualTo civilian }): {["PHX_SO1_Gear", "so1_gear"]};
	case (isJUDGE(player) && { playerSide isEqualTo civilian }): {["PHX_Judge_Gear", "judge_gear"]};
	default {["PHX_LIFE_GEAR", PHX_DEFAULT_GEAR]};
};

_ret