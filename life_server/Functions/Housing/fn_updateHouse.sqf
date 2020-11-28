/*
	@File: fn_updateHouse.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Rename house in the database...
*/
params [
    ["_mode",0,[0]],
    ["_house", objNull, [objNull]]
];

if (isNull _house || { isNil { _house getVariable "house_owner" } }) exitWith {};

private _query = "";

switch (_mode) do {
	case 0: {
		_query = format["UPDATE phxhouses SET name = '%1' WHERE id = '%2'", ([_house getVariable ["house_name", ""]] call DB_fnc_mresString), (_house getVariable ["house_id", -1])];
	};
	case 1: {
		_query = format["UPDATE phxhouses SET upgrades = '%1' WHERE id = '%2'", ([_house getVariable ["house_upgrades", [0,0,[]]]] call DB_fnc_mresArray), (_house getVariable ["house_id", -1])];
	};
};

if !(_query isEqualTo "") then {
    [_query,1] call DB_fnc_asyncCall;
};
