#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_forceFeed.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks stuff then remote execs useItem.
	@Usage: 
		- [OUR_TARGET] call PHX_fnc_forceFeed; // Replaces the "OUR_TARGET" with the object of the target player.

	@Returns:
		- Nothing
*/
disableSerialization;
private _mode = _this select 0;

private _display = findDisplay 2900;
private _inv = "";

switch (_mode) do {
	// Loads the UI so we can select what item we'd like to force the hostage to use.
	case "loadUI": { 
		_inv = (_display displayCtrl 2902);
		lbClear _inv;
		
		{
			if (ITEM_VALUE(configName _x) > 0) then {
				_inv lbAdd format ["%2 [x%1]", ITEM_VALUE(configName _x),(getText (_x >> "displayName"))];
				_inv lbSetData [(lbSize _inv) - 1, configName _x];
				_icon = M_CONFIG(getText,"CfgItems",configName _x,"icon");
				if (!(_icon isEqualTo "")) then {
					_inv lbSetPicture [(lbSize _inv)-1,ICON(_icon)];
				};
			};
		} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

		lbSort _inv;
	};
	// Will do some checks and then force them to eat or drink the item
	case "forceFeed": {
		private _unit = _this select 1;
		private _item = _this select 2;

		// Can we actually eat this item.
		if (!(getNumber(missionConfigFile >> "CfgItems" >> _item >> "edibility" >> "value") isEqualTo -1)) then {
			if ([false,_item,1] call life_fnc_handleInv) then {
				["remoteFeed", _item] remoteExecCall ["PHX_fnc_forceFeed", _unit]; 
			};
		} else {
			["You can't force them to consume something that can't be consumed!", "red"] call PHX_fnc_notify;
		};
	};
	case "remoteFeed": {
		private _item = _this select 1;
		_itemName = M_CONFIG(getText,"CfgItems",_item,"displayName");

		[format ["You've been force to consume an %1", _itemName], "cyan"] call PHX(notify);
		_val = (getNumber(missionConfigFile >> "CfgItems" >> _item >> "edibility" >> "value"));

		if (_item in ["tea","waterBottle","coffee","moonshine","beer","mre"]) then {
			_sum = life_thirst + _val;
			switch (true) do {
				case (_val < 0 && _sum < 1): {life_thirst = 5;}; 
				case (_sum > 100): {life_thirst = 100;};
				default {life_thirst = _sum;};
			};
		} else {
			_sum = life_hunger + _val;
			switch (true) do {
				case (_val < 0 && _sum < 1): {life_hunger = 5;}; 
				case (_sum > 100): {life_hunger = 100;};
				default {life_hunger = _sum;};
			};
		};

		[] call PHX(hudUpdate);
	};
};