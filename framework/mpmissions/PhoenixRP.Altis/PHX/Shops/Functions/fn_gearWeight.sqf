/*
	@File: fn_gearWeight.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the weight of a given item...
*/
if !(params [["_item", "", [""]]]) exitWith {};

private _weight = getNumber(configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass");

if (_weight isEqualTo 0) then {
	_weight = getNumber(configFile >> "CfgWeapons" >> _item >> "ItemsInfo" >> "mass");
	if (_weight isEqualTo 0) then {
		_weight = 3;
	};
};

_weight