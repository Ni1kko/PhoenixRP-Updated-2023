/*
	@File: fn_openWeaponStore.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgWeapons" >> worldName
if !(params [["_store", "", [""]]]) exitWith {};
if !(isClass (CFG >> _store)) exitWith {};

WSTORECFG = CFG >> _store;
PHX_CartTotal = 0;

if !([getText(WSTORECFG >> "conditions")] call life_fnc_levelCheck) exitWith { ["You are not allowed to use this shop!"] spawn PHX(notify) };
if !(createDialog "RscWeaponShop") exitWith {};

disableSerialization;

ctrlSetText[7401, getText(WSTORECFG >> "name")];

private _display = findDisplay 7400;

(_display displayCtrl 7404) ctrlAddEventHandler ["LBDblClick", {
	params [
		["_cartUI", controlNull, [controlNull]],
		["_index", -1, [0]]
	];

	private _price = _cartUI lbValue _index;

	_cartUI lbDelete _index;

	private _total = 0;

	for "_i" from 0 to ((lbSize _cartUI) - 1) do {
		_total = _total + (_cartUI lbValue _i);
	};

	PHX_CartTotal = _total;
	ctrlSetText[7405, format["Total: £%1", [_total] call LIFE(numberText)]];
}];

(_display displayCtrl 7402) ctrlAddEventHandler ["KeyUp", {
	private _control = (_display displayCtrl 7402);
	private _display = ctrlParent _control;
}];

[getText(WSTORECFG >> "defaultTab")] call PHX(changeWeaponSelection);