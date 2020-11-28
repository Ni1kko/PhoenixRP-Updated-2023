/*
 *  @File: fn_handleItem.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  Remove items
*/

params [
  ["_item", "", [""]]
];

switch true do {
	case (_item isEqualTo (uniform player)): {removeUniform player;};
	case (_item isEqualTo (vest player)): {removeVest player;};
	case (_item isEqualTo (backpack player)): {removeBackpack player;};
	case (_item isEqualTo (goggles player)): {removeGoggles player;};
	case (_item isEqualTo (headgear player)): {removeHeadgear player;};
	case (_item isEqualTo (binocular player)): {player removeWeapon (binocular player);};
	case (_item in (assignedItems player)): {player unlinkItem _item;};
	case (_item isEqualTo (primaryWeapon player)): {player removeWeapon _item;};
	case (_item isEqualTo (secondaryWeapon player)): {player removeWeapon _item;};
	case (_item isEqualTo (handgunWeapon player)): {player removeWeapon _item;};
	case (_item in (primaryWeaponItems player)): {player removePrimaryWeaponItem _item;};
	case (_item in (secondaryWeaponItems player)): {player removeSecondaryWeaponItem _item;};
	case (_item in (handgunItems player)): {player removeHandgunItem _item;};
	case (_item in (uniformItems player)): {player removeItemFromUniform _item;};
	case (_item in (vestItems player)): {player removeItemFromVest _item;};
	case (_item in (backpackItems player)): {player removeItemFromBackpack _item;};
}; 