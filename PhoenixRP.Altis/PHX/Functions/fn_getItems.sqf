/*
	@File: fn_getItems.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns an array of all the items we have in our inventory.
*/
#include "..\..\script_macros.hpp"
params [["_unit", player, [objNull]]];

private _invItemsRaw = [
	(uniform _unit), 
	(headgear _unit),
	(goggles _unit), 
	(vest _unit), 
	(backpack _unit), 
	(primaryWeapon _unit), 
	(secondaryWeapon _unit), 
	(handgunWeapon _unit)
];

private _invItems = [];

{
	_invItemsRaw append _x;
} forEach ([
	(primaryWeaponItems _unit),
	(secondaryWeaponItems _unit),
	(handgunItems _unit),
	(assignedItems _unit), 
	(uniformItems _unit),
	(vestItems _unit), 
	(backpackItems _unit)
] select { !(_x isEqualTo []) });

{
	private _cfg = configName _x;
	for "_i" from 1 to (ITEM_VALUE(_cfg)) do {
		_invItemsRaw pushBack _cfg;
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

((_invItemsRaw select { !(_x isEqualTo "") }) apply {
	if !(_x in _invItems) then {
		_invItems pushBack _x;
		private _y = _x;
		
		[
			_x,
			({ _x isEqualTo _y } count _invItemsRaw)
		]
	};
});