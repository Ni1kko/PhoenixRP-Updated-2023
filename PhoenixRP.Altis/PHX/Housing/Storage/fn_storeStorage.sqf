/*
	@File: fn_storeStorage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Stores an item into our house inventory...
*/
#include "..\..\..\script_macros.hpp"
scopeName "storeStorage";
if !(params[["_button", controNull, [controlNull]]]) exitWith {};

if !(house getVariable ["inStorage", objNull] isEqualTo player) exitWith { ["This storage is currently in use by someone else..."] spawn PHX(notify) };

_button ctrlEnable false; // Stop abuse...
#define BTN _button ctrlEnable true

// Get the category we're in...
private _categories = house_categories;
if (_categories isEqualTo []) exitWith { BTN; ["The storage appears to be empty..."] spawn PHX(notify) };

private _catIndex = house_current;
private _category = _categories select _catIndex;

#define UPDATE ([_catIndex] call PHX(switchCategory))

if (_category isEqualTo []) exitWith { BTN; UPDATE; ["The storage appears to be empty..."] spawn PHX(notify) };

private _curSel = lbCurSel 11001;
if (_curSel isEqualTo -1) exitWith { BTN; UPDATE; ["You did not select anything..."] spawn PHX(notify) };

private _item = lbData [11001, _curSel];
private _amount = lbValue [11001, _curSel];
if (_item isEqualTo "" || { _amount < 1 }) exitWith { BTN; UPDATE; ["This item appears to be bugged..."] spawn PHX(notify) };

private _val = ctrlText 11011;
if !([_val] call LIFE_fnc_isNumber) exitWith { BTN; UPDATE; ["The amount value must only contain numbers..."] spawn PHX(notify) };
_val = parseNumber _val;
if (_val < 1 || { _val > _amount }) exitWith { BTN; UPDATE; ["You don't have that many of this item..."] spawn PHX(notify) };

_category params ["_id", "_houseid", "_categoryid", "_title", "_icon", "_storage"];
private _myStorage = [] call PHX(getItems);

private _itemIndex = (_myStorage findIf { (_x select 0) isEqualTo _item });
if (_itemIndex < 0) exitWith { BTN; UPDATE; ["You don't appear to possess this item..."] spawn PHX(notify) };

private _itemWeight = (([_item] call LIFE(itemWeight)) * _val);
private _curWeight = ([_storage] call PHX(getStorageWeight));
if ((_curWeight + _itemWeight) > ((LIFE_SETTINGS(getNumber,"categoryStorage")) + ((cursorObject getVariable ["house_upgrades",[]]) select 1))) exitWith { BTN; UPDATE; ["This category is full..."] spawn PHX(notify) };

private _storageIndex = (_storage findIf { (_x select 0) isEqualTo _item });

if (isClass(missionConfigFile >> "CfgItems" >> _item)) then {
	if !([false, _item, _val] call life_fnc_handleInv) exitWith {
		BTN;
		["System was unable to remove this item from your inventory..."] spawn PHX(notify);
		breakOut "storeStorage";
	};
} else {
	// Checks (Zyn did them and I cba to do it differently...)
	if !((player weaponAccessories _item) isEqualTo ["","","",""]) exitWith { BTN; ["You must store or take all attachments off of weapons before storing it..."] spawn PHX(notify); breakOut "storeStorage" };
	if (_item isEqualTo (backpack player) && {!(backpackItems player isEqualTo [])}) exitWith { BTN; ["Your backpack must be empty before storing it..."] spawn PHX(notify); breakOut "storeStorage" };
	if (_item isEqualTo (vest player) && {!(vestItems player isEqualTo [])}) exitWith { BTN; ["Your vest must be empty before storing it..."] spawn PHX(notify); breakOut "storeStorage" };
	if (_item isEqualTo (uniform player) && {!(uniformItems player isEqualTo [])}) exitWith { BTN; ["Your uniform must be empty before storing it..."] spawn PHX(notify); breakOut "storeStorage" };
    
	for "_i" from 1 to _val do {
		[_item] call PHX_fnc_handleItem;
	};
};

if !(_storageIndex > -1) then {
	_storage pushBack [_item, _val];
} else {
	_storage set [_storageIndex, [_item, (((_storage select _storageIndex) select 1) + _val)]];
};

_category set[5, _storage];
_categories set[_catIndex, _category];

[3] call SOCK_fnc_updatePartial;
[_title, _icon, _categoryid, (house getVariable "house_id"), _storage] remoteExecCall (["fnc_saveCategory", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

private _itemInfo = [_item] call LIFE(fetchCfgDetails);
if !(_itemInfo isEqualTo []) then {
	_itemInfo params ["", "_name"];
	[format["%1 has been transfered to the house's inventory...", _name]] spawn PHX(notify);
};

UPDATE;
[] call PHX(updateInventory);
BTN;