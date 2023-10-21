/*
	@File: fn_hasSpace.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks if we can hold this item....
*/
#include "..\..\..\script_macros.hpp"
scopeName "hasSpace";

if !(params [
	["_item", "", [""]],
	["_itemType", "", [""]],
	["_itemCategory", "", [""]],
	["_override", false, [false]]
]) exitWith {false};

private _return = false;

try {
	private _itemLower = toLower _item;

	switch _itemType do {
		case "Weapon": {
			if _override throw true;
			private _space = switch (getNumber (configFile >> "CfgWeapons" >> _item >> "type")) do {
				case 1: {(primaryWeapon player) isEqualTo ""};
				case 2: {(handgunWeapon player) isEqualTo ""};
				case 4: {(secondaryWeapon player) isEqualTo ""};
				default {false};
			};
			_space breakOut "hasSpace";
		};
		case "Magazine": {
			{
				if (_itemLower in ([_x param [0], true] call PHX(getCompatibleItems))) throw true;
			} forEach ([
				[primaryWeapon player, primaryWeaponMagazine player],
				[secondaryWeapon player, secondaryWeaponMagazine player],
				[handgunWeapon player, handgunMagazine player]
			] select {!(_x param [0] isEqualTo "") && {_x param [1] isEqualTo []}});
		};
		case "Item": {
			switch _itemCategory do {
				case "AccessoryMuzzle";
				case "AccessoryPointer";
				case "AccessorySights";
				case "AccessoryBipod": {
					private _index = ["AccessoryMuzzle", "AccessoryPointer", "AccessorySights", "AccessoryBipod"] find _itemCategory;
					if (_index isEqualTo -1) throw false;

					{
						if (_itemLower in ([_x param [0], false] call PHX(getCompatibleItems))) throw true;
					} forEach ([
						[primaryWeapon player, primaryWeaponItems player],
						[secondaryWeapon player, secondaryWeaponItems player],
						[handgunWeapon player, handgunItems player]
					] select {!(_x param [0] isEqualTo "") && {((_x param [1]) param [_index]) isEqualTo ""}});
				};
				case "Watch";
				case "Map";
				case "Radio";
				case "NVGoggles";
				case "Glasses";
				case "Compass";
				case "GPS";
				case "UAVTerminal": {
					if _override throw true;
					if !(_itemLower in ((assignedItems player) apply {toLower _x})) throw true;
				};
				case "LaserDesignator";
				case "Binocular": {
					if _override throw true;
					if ((binocular player) isEqualTo "") throw true;
				};
			};
		};
		case "Equipment": {
			switch _itemCategory do {
				case "Backpack": {
					if (backpack player isEqualTo "") throw true;
				};
				case "Uniform": {
					if (uniform player isEqualTo "") throw true;
				};
				case "Vest": {
					if (vest player isEqualTo "") throw true;
				};
				case "Glasses": {
					if (goggles player isEqualTo "") throw true;
				};
				case "Headgear": {
					if (headgear player isEqualTo "") throw true;
				};
			};
		};
	};
} catch {
	_return = _exception;
};

_return