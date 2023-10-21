/*
	@File: fn_insertCategory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Inserts new category for our house...
*/
if !(params [["_house", objNull, [objNull]], ["_categoryid", 0, [0]]]) exitWith {};

if (isNull _house || { _house getVariable ["isBlacklisted", false] } || { !(_house isKindOf "House_F") } || { isNil {_house getVariable "house_owner"} }) exitWith {};

[format["INSERT INTO phxcategories (houseid, categoryid, name, iconid, storage) VALUES ('%1', '%2', '%3', '1', '""[]""')",
	([_house getVariable "house_id"] call DB_fnc_numberSafe),
	_categoryid,
	([format["Category %1", _categoryid]] call DB_fnc_mresString)
], 1] call DB_fnc_asyncCall;