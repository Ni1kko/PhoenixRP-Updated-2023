#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleUpdate.sqf
    Author : NiiRoZz

    Description:
    Tells the database that this vehicle need update inventory.
*/
params [
    ["_vehicle", objNull, [objNull]],
    ["_mode", 1, [0]]
];

if (isNull _vehicle) exitWith {}; //NULL

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if (_dbInfo isEqualTo []) exitWith {};

_dbInfo params ["_uid", "_plate", "_id"];
private _query = "";

switch (_mode) do {
    case 1: {
        _vehItems = getItemCargo _vehicle;
        _vehMags = getMagazineCargo _vehicle;
        _vehWeapons = getWeaponCargo _vehicle;
        _vehBackpacks = getBackpackCargo _vehicle;
        private _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];

        // Keep it clean!
        if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {
            _cargo = [];
        };

        _cargo = [_cargo] call DB_fnc_mresArray;

        _query = format ["UPDATE phxcars SET gear='%2' WHERE id='%1'",[_id] call DB_fnc_numberSafe,_cargo];
        [_query,1] call DB_fnc_asyncCall;
    };

    case 2: {
        private _trunk = _vehicle getVariable ["Trunk",[[],0]];
        private _itemList = _trunk select 0;
        private _totalweight = 0;
        _items = [];

        {
            if ((getNumber(missionConfigFile >> "CfgItems" >> (_x select 0) >> "save")) isEqualTo 1) then {
                _items pushBack [_x select 0,_x select 1];
                private _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
                _totalweight = _weight + _totalweight;
            };
        } forEach (_itemList select {
            isClass (missionConfigFile >> "CfgItems" >> (_x select 0))
        });

        _trunk = [_items, _totalweight];
        _trunk = [_trunk] call DB_fnc_mresArray;

        _query = format ["UPDATE phxcars SET inventory='%2' WHERE id='%1'",[_id] call DB_fnc_numberSafe,_trunk];
        [_query,1] call DB_fnc_asyncCall;
    };

    case 3: {
        private _color = param[2, -1, [0, []]];

        if (_color isEqualTo -1) exitWith {};
        
        if (_color isEqualType []) then {
            _query = format["UPDATE phxcars SET RGB='%3' WHERE pid='%1' AND id='%2'",_uid, [_id] call DB_fnc_numberSafe, [_color] call DB_fnc_mresArray];
        } else {
            _query = format["UPDATE phxcars SET color='%3', RGB='""[]""' WHERE pid='%1' AND id='%2'",_uid, [_id] call DB_fnc_numberSafe, _color];
        };

        [_query,1] call DB_fnc_asyncCall;
    };

    case 4: {
        _query = format["UPDATE phxcars SET upgrades='%3' WHERE pid='%1' AND id='%2'",_uid, [_id] call DB_fnc_numberSafe, [(_vehicle getVariable "vehicle_upgrades")] call DB_fnc_mresArray];

        [_query,1] call DB_fnc_asyncCall;
    };
};