#include "\life_server\script_macros.hpp"
/*
    File: fn_vehicleStore.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Stores the vehicle in the 'Garage'
*/
params [
    ["_vehicle", objNull, [objNull]],
    ["_impound", false, [true]],
    ["_unit", objNull, [objNull]],
    ["_storetext", "", [""]]
];

if (isNull _vehicle || isNull _unit) exitWith {life_impound_inuse = false; remoteExecutedOwner publicVariableClient "life_impound_inuse";life_garage_store = false;remoteExecutedOwner publicVariableClient "life_garage_store";}; //Bad data passed.
private _query = "";

private _damage = [];

// save damage.
if (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) then {
    _damage = getAllHitPointsDamage _vehicle;
    _damage = _damage select 2;
};
_damage = [_damage] call DB_fnc_mresArray;

private _fuel = 1;
private _ammo = 0;

// because fuel price!
if ((LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1)) then {
    _fuel = (fuel _vehicle);
};

if (typeof(_vehicle) in (getArray (missionConfigFile >> "CfgSettings" >> "rearmableVehicles"))) then {
    _ammo = [_vehicle] call PHX_fnc_getVehicleAmmo;
};

private _vInfo = _vehicle getVariable ["dbInfo",[]];

if (_vInfo isEqualTo []) exitWith {
    if (_impound) then {
        life_impound_inuse = false;
        remoteExecutedOwner publicVariableClient "life_impound_inuse";

        if (!isNil "_vehicle" && {!isNull _vehicle}) then {
            deleteVehicle _vehicle;
        };
    };

    [1,"That vehicle is a rental and cannot be stored in your garage.",true] remoteExecCall ["life_fnc_broadcast",remoteExecutedOwner];
    life_garage_store = false;
    remoteExecutedOwner publicVariableClient "life_garage_store";
};

_vInfo params ["_uid", "_plate", "_id"];

if (_impound) exitWith {
    _query = format ["UPDATE phxcars SET active='0', fuel='%2', damage='%3', ammo='%4' WHERE id='%1'",[_id] call DB_fnc_numberSafe, _fuel, _damage, _ammo];
    [_query,1] call DB_fnc_asyncCall;

    if (!isNil "_vehicle" && {!isNull _vehicle}) then {
        deleteVehicle _vehicle;
    };

    life_impound_inuse = false;
    remoteExecutedOwner publicVariableClient "life_impound_inuse";
};

if !(_uid isEqualTo (getPlayerUID _unit)) exitWith {
    [1,"That vehicle doesn't belong to you therefor you cannot store it in your garage.",true] remoteExecCall ["life_fnc_broadcast",remoteExecutedOwner];
    life_garage_store = false;
    remoteExecutedOwner publicVariableClient "life_garage_store";
};

// sort out whitelisted items!
private _trunk = _vehicle getVariable ["Trunk", [[], 0]];
private _itemList = _trunk select 0;
private _totalweight = 0;
private _weight = -1;
private _items = [];

if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    {
        if ((getNumber(missionConfigFile >> "CfgItems" >> (_x select 0) >> "save")) isEqualTo 1) then {
            _items pushBack[(_x select 0),(_x select 1)];
            _weight = (ITEM_WEIGHT(_x select 0)) * (_x select 1);
            _totalweight = _weight + _totalweight;
        };
    } forEach (_itemList select {
        isClass (missionConfigFile >> "CfgItems" >> (_x select 0))
    });

    _trunk = [_items, _totalweight];
} else {
    _trunk = [[], 0];
};

private _cargo = [];

if (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1) then {
    private _vehItems = getItemCargo _vehicle;
    private _vehMags = getMagazineCargo _vehicle;
    private _vehWeapons = getWeaponCargo _vehicle;
    private _vehBackpacks = getBackpackCargo _vehicle;
    _cargo = [_vehItems,_vehMags,_vehWeapons,_vehBackpacks];
    // no items? clean the array so the database looks pretty
    if ((count (_vehItems select 0) isEqualTo 0) && (count (_vehMags select 0) isEqualTo 0) && (count (_vehWeapons select 0) isEqualTo 0) && (count (_vehBackpacks select 0) isEqualTo 0)) then {_cargo = [];};
    } else {
    _cargo = [];
};
// prepare
_trunk = [_trunk] call DB_fnc_mresArray;
_cargo = [_cargo] call DB_fnc_mresArray;

// update
_query = format ["UPDATE phxcars SET active='0', inventory='%2', gear='%3', fuel='%4', damage='%5', ammo='%6' WHERE id='%1'", [_id] call DB_fnc_numberSafe, _trunk, _cargo, _fuel, _damage, _ammo];
[_query,1] call DB_fnc_asyncCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
    deleteVehicle _vehicle;
};

life_garage_store = false;
remoteExecutedOwner publicVariableClient "life_garage_store";
["Your vehicle has been stored"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];