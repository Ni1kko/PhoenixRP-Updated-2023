/*
	@File: fn_craft.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Crafts our currently selected item...
*/
scopeName "craft";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgBlueprints"

if !(canSuspend) exitWith { _this spawn PHX(craft) };
if (isNil "PHX_Craftable") exitWith { ["You need to select a blueprint first"] spawn PHX(notify) };

private _cfgType = call {
	if (isClass (CFG >> "Physical" >> PHX_Craftable)) exitWith {"Physical"};
	if (isClass (CFG >> "Virtual" >> PHX_Craftable)) exitWith {"Virtual"};
	["This blueprint does not exist"] spawn PHX_fnc_notify;
	breakOut "craft";
};

private _cfg = CFG >> _cfgType >> PHX_Craftable;

private _itemName = getText(_cfg >> "fullName");
private _requiredItems = getArray(_cfg >> "ingredients");
private _item = getText(_cfg >> "product");
private _sleep = getNumber(_cfg >> "time");
private _lvl = getNumber(_cfg >> "level");
private _craftTotal = ctrlText 8005; // How many we want to craft of this item...

if (_lvl > PHX_Level) exitWith { [format["You need to be level %1 to craft this item...", _lvl]] spawn PHX(notify) };
if (!([_craftTotal] call LIFE_fnc_isNumber) && { (parseNumber _craftTotal) < 1 }) exitWith { ["You must enter a number for the amount you wish to craft..."] spawn PHX(notify) };

_craftTotal = parseNumber _craftTotal;

// Increase required items by the amount we want to craft...
_requiredItems = _requiredItems apply {[
	_x select 0,
	((_x select 1) * _craftTotal)
]};

// Resource Check...
private _totalConversions = _requiredItems select {
	!(ITEM_VALUE(_x # 0) isEqualTo 0) &&
	{ITEM_VALUE(_x # 0) >= _x # 1}
} apply { floor ( (ITEM_VALUE(_x # 0)) / (_x # 1) ) };

if ((count _totalConversions) < (count _requiredItems) || { _craftTotal > (_totalConversions call BIS_fnc_lowestNum) }) exitWith { 
	[
		format["You don't have the required materials to craft %1 x %2", _craftTotal, _itemName]
	] spawn PHX(notify);
};

// Weight / Confirmation Check...
private _weight = -1;

if (_cfgType isEqualTo "Virtual") then {
	_weight = ([PHX_Craftable] call life_fnc_itemWeight) * _craftTotal;

	if ((life_carryWeight + _weight) > life_maxWeight) exitWith { ["You don't have enough room for these items..."] spawn PHX(notify); breakOut "craft" };
} else {
	private _action = [
		"Are you sure you wish to craft this item? It could replace your current gear.",
		"Crafting Confirmation", "Yes", "No"
	] call PHX_fnc_confirmBox;

	if !(_action) exitWith { ["Crafting Cancelled..."] spawn PHX(notify); breakOut "craft" };
};

private _level = PROF_LVL("Prof_Crafting");

life_action_inUse = true;
life_is_processing = true;

closeDialog 0;

if !(
	[
		format["Crafting %1 x %2...", _craftTotal, _itemName],
		(_sleep * _craftTotal),
		[],
		([0.01,(0.01 + (_level / 2500))] select (_level > 0))
	] call PHX(handleProgress)
) exitWith { life_action_inUse = false; life_is_processing = false };

[format["You've successfully crafted %1 x %2...", _craftTotal, _itemName]] spawn PHX(notify);
[(10 * _craftTotal), format["Crafting %1 x %2", _craftTotal, _itemName]] spawn PHX(handleXP);
["Prof_Crafting",1,50] call PHX(increaseProfession);

// Handle Items...
{ [false, (_x # 0), (_x # 1)] call life_fnc_handleInv } count _requiredItems;
if (_cfgType isEqualTo "Virtual") then {
	[true,_item,_craftTotal] call life_fnc_handleInv;
} else {
	for "_i" from 1 to _craftTotal do {
		[_item, true] call life_fnc_handleItem;
	};
};

life_action_inUse = false;
life_is_processing = false;

[] spawn PHX_fnc_openCrafting;