/*
	@File: fn_getCategories.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the categories for our house...
*/
#define CFG missionConfigFile >> "CfgHousing" >> worldName
if !(params [["_house", objNull, [objNull]]]) exitWith {};

private _owner = remoteExecutedOwner;
if (_owner isEqualTo 0) exitWith {};

if (isNull _house || { _house getVariable ["isBlacklisted", false] } || { !(_house isKindOf "House_F") } || { isNil {_house getVariable "house_owner"} }) exitWith {};
if ((getNumber(CFG >> (typeOf _house) >> "isGarage")) isEqualTo 1) exitWith {}; // Does not have storage...

private _categories = [format["SELECT * FROM phxcategories WHERE houseid = '%1' AND active = '1'",
	([_house getVariable "house_id"] call DB_fnc_numberSafe)
], 2, true] call DB_fnc_asyncCall;

if !(_categories isEqualType []) then { _categories = [] };

// Convert string to array...
{
	_x params ["_id", "_houseid", "_categoryid", "_title", "_icon", "_storage"];

	_storage = [_storage] call DB_fnc_mresToArray;

	_x set [5, _storage];
	_categories set[_forEachIndex, _x];
} forEach _categories;

[_house, _categories] remoteExec ["PHX_fnc_openStorage", _owner];