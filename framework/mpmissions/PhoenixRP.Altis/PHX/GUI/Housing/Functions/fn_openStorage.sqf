/*
	@File: fn_openStorage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens our house storage...
*/
scopeName "openStorage";
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgHousing" >> worldName
if !(params[["_house", objNull, [objNull]], ["_categories", [], [[]]]]) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(openStorage) };

if (isNull _house || { _house getVariable ["isBlacklisted", false] } || { !(_house isKindOf "House_F") } || { isNil {_house getVariable "house_owner"} }) exitWith {};
if ((getNumber(CFG >> (typeOf _house) >> "isGarage")) isEqualTo 1) exitWith {}; // Does not have storage...

// Check if we should have access...
private _hOwner = _house getVariable 'house_owner';
_hOwner params ["_oID", "_oName", "_isGang"];
/*
if !(player getVariable ["isAdmin", false]) then {
	if !(_house in life_vehicles && { (_oID isEqualTo (getPlayerUID player) || (_isGang && { (_oID isEqualTo (player getVariable ["gang_uid", -1])) })) }) exitWith { 
		["You don't have access to this houses storage..."] spawn PHX(notify);
		breakOut "openStorage";
	};
};
*/

if (!(isNil {_house getVariable "inStorage"}) && {!(player getVariable ["isAdmin",false])}) then { 
	private _tar = (_house getVariable "inStorage");
	if (isNull _tar) exitWith {};

	// Wipe variables...
	house = nil;
	house_categories = nil;
	house_current = nil;

	[format["%1 is currently using this storage...", _tar getVariable ["realname", name _tar]]] spawn PHX(notify);
	breakOut "openStorage";
};

if !(player getVariable ["isAdmin",false]) then {
	_house setVariable ["inStorage", player, true];
};

disableSerialization;

createDialog "RscStorage";

waitUntil { !isNull (findDisplay 11000) };
private _display = findDisplay 11000;

_house spawn {
	waitUntil { isNull (findDisplay 11000) };
	_this setVariable ["inStorage", nil, true];
};

[] call PHX(updateInventory);

private _icoList = _display displayCtrl 11007;
lbClear _icoList;

{
	_x params ["_title", "_ico"];
	_icoList lbAdd _title;
	_icoList lbSetPicture [(lbSize _icoList)-1, _ico];
	_icoList lbSetData [(lbSize _icoList)-1, str (_forEachIndex + 1)];
} forEach ((LIFE_SETTINGS(getArray,"categories")) select { !((_x select 0) isEqualTo "add") });

_icoList lbSetCurSel 0;

house = _house;
house_categories = _categories;
house_current = 0;

[_categories] call PHX(updateCategories);
[0] call PHX(switchCategory);