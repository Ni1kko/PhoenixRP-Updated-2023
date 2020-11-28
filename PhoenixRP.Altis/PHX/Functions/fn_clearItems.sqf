/*
	@File: fn_clearItems.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\script_macros.hpp"

{
	private _item = configName _x;
	private _val = ITEM_VALUE(_item);
	if(_val > 0) then {
		missionNameSpace setVariable [ITEM_VARNAME(_item), 0];
	};
} foreach ("true" configClasses (missionConfigFile >> "CfgItems"));

life_carryWeight = 0; // We're empty now...