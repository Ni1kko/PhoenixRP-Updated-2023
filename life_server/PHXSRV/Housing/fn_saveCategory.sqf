/*
	@File: fn_SaveCategory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Saves our currently selected category...
*/
if !(params [["_name", "", [""]],["_icon", 0, [0]],["_categoryID", -1, [0]],["_houseID", -1, [0]], ["_storage", [], [[]]]]) exitWith {};

[format ["UPDATE phxcategories SET name = '%1', iconid = '%2', storage = '%5' WHERE categoryid='%3' AND houseid='%4'", 
	([_name] call DB_fnc_mresString),
	([_icon] call DB_fnc_numberSafe),
	([_categoryID] call DB_fnc_numberSafe),
	([_houseID] call DB_fnc_numberSafe),
	([_storage] call DB_fnc_mresArray)
], 1] call DB_fnc_asyncCall;