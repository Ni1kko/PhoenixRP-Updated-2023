/*
	@File: fn_handleGear.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles giving our gear....
*/
#include "..\..\..\script_macros.hpp"
scopeName "handleGear";

if !(params [
	["_item", "", [""]],
	["_override", false, [false]]
]) exitWith {false};

(_item call BIS_fnc_itemType) params ["_itemType", "_itemCategory"];

if ([_item, _itemType, _itemCategory, _override] call PHX(hasSpace)) then {
	([_item, _itemType, _itemCategory] call PHX(addGear)) breakOut "handleGear";
};

if (player canAddItemToUniform _item) then {
	([uniformContainer player, _item, _itemType, _itemCategory] call PHX(containerAdd)) breakOut "handleGear";
};

if (player canAddItemToVest _item) then {
	([vestContainer player, _item, _itemType, _itemCategory] call PHX(containerAdd)) breakOut "handleGear";
};

if (player canAddItemToBackpack _item) then {
	([backpackContainer player, _item, _itemType, _itemCategory] call PHX(containerAdd)) breakOut "handleGear";
};

false