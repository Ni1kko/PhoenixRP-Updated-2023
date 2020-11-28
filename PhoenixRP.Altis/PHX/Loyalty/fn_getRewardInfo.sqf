/*
	@File: fn_getRewardInfo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns an array with information relating to the reward we've received...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgLoyalty"
if !(params [["_index", -1, [0]]]) exitWith {};

PHX_loyalty params ["_loyDays", "_loyRewards"];

private _thisReward = _loyRewards select _index;

_thisReward params ["_type", "_value"];

if !(isClass (CFG >> "Rewards" >> _type)) exitWith {[_type, "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa", _value, ""]}; // Fallback...

private _name = _value;
private _picture = (call compile (getText (CFG >> "Rewards" >> _type >> "picture")));

switch (true) do {
	case (_type isEqualTo "Virtual"): {
		if (isClass (missionConfigFile >> "CfgItems" >> _value)) then {
			_name = getText(missionConfigFile >> "CfgItems" >> _value >> "displayName");
			_picture = ICON(getText(missionConfigFile >> "CfgItems" >> _value >> "icon"));
		};
	};
	case (_type in ["Physical", "Vehicle"]): {
		private _itemInfo = [_value] call life_fnc_fetchCfgDetails;

		if !((_itemInfo) isEqualTo []) then {
			_name = _itemInfo select 1;
			_picture = _itemInfo select 2;
		};
	};
};

private _format = (getText (CFG >> "Rewards" >> _type >> "valFormat"));
_value = format[_format, _name];

[
	(getText (CFG >> "Rewards" >> _type >> "title")),
	_picture,
	_value,
	(getText (CFG >> "Rewards" >> _type >> "onClaim")),
	_format
]