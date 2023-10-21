/*
	@File: fn_takeStorage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Take an item out of our house inventory...
*/
#include "..\..\..\script_macros.hpp"
scopeName "takeStorage";
if !(params[["_button", controNull, [controlNull]]]) exitWith {};

if (!(house getVariable ["inStorage", objNull] isEqualTo player) && {!(player getVariable ["isAdmin",false])}) exitWith { ["This storage is currently in use by someone else..."] spawn PHX(notify) };

_button ctrlEnable false; // Stop abuse...
#define BTN _button ctrlEnable true

// Get the category we're in...
private _categories = house_categories;
if (_categories isEqualTo []) exitWith { BTN; ["The storage appears to be empty..."] spawn PHX(notify) };

private _catIndex = house_current;
private _category = _categories select _catIndex;

#define UPDATE ([_catIndex] call PHX(switchCategory))

if (_category isEqualTo []) exitWith { BTN; UPDATE; ["The storage appears to be empty..."] spawn PHX(notify) };

private _curSel = lbCurSel 11002;
if (_curSel isEqualTo -1) exitWith { BTN; UPDATE; ["You did not select anything..."] spawn PHX(notify) };

private _item = lbData [11002, _curSel];
private _amount = lbValue [11002, _curSel];
if (_item isEqualTo "" || { _amount < 1 }) exitWith { BTN; UPDATE; ["This item appears to be bugged..."] spawn PHX(notify) };

private _val = ctrlText 11010;
if !([_val] call LIFE_fnc_isNumber) exitWith { BTN; UPDATE; ["The amount value must only contain numbers..."] spawn PHX(notify) };
_val = parseNumber _val;
if (_val < 1 || { _val > _amount }) exitWith { BTN; UPDATE; ["You don't have that many of this item..."] spawn PHX(notify) };

_category params ["_id", "_houseid", "_categoryid", "_title", "_icon", "_storage"];

private _itemIndex = (_storage findIf { (_x select 0) isEqualTo _item });
if (_itemIndex < 0) exitWith { BTN; UPDATE; ["This item does not exist in this category..."] spawn PHX(notify) };

if (isClass(missionConfigFile >> "CfgItems" >> _item)) then {
	private _num = [_item, _val, life_carryWeight, life_maxWeight] call LIFE(calWeightDiff);
	private _weight = ([_item] call LIFE(itemWeight)) * _num;

	if (_num isEqualTo 0) exitWith { BTN; ["Your inventory space is full..."] spawn PHX(notify); breakOut "takeStorage" };

	if ([true,_item,_num] call life_fnc_handleInv) then {
		if (_num isEqualTo _amount) then {
			_storage deleteAt _itemIndex;
		} else {
			_storage set [_itemIndex, [_item, (_amount - _num)]];
		};
	};
} else {
	if (_val > 1) exitWith {
		BTN;
		["You can't take more than one physical item at a time..."] spawn PHX(notify);
		breakOut "takeStorage";
	};

	if !([_item, false] call PHX(handleGear)) exitWith {
		BTN;
		["Your inventory space is full..."] spawn PHX(notify);
		breakOut "takeStorage";
	};

	if (_val isEqualTo _amount) then {
		_storage deleteAt _itemIndex;
	} else {
		_storage set [_itemIndex, [_item, (_amount - _val)]];
	};
};

_category set[5, _storage];
_categories set[_catIndex, _category];

[3] call SOCK_fnc_updatePartial;
[_title, _icon, _categoryid, (house getVariable "house_id"), _storage] remoteExecCall (["fnc_saveCategory", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

private _itemInfo = [_item] call LIFE(fetchCfgDetails);
if !(_itemInfo isEqualTo []) then {
	_itemInfo params ["", "_name"];
	[format["%1 has been transfered to your inventory...", _name]] spawn PHX(notify);
};

UPDATE;
[] call PHX(updateInventory);
BTN;