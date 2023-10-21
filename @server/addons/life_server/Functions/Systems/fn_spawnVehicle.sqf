#include "\life_server\script_macros.hpp"
/*
    File: fn_spawnVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends the query request to the database, if an array is returned then it creates
    the vehicle if it's not in use or dead.
*/
params [
    ["_vid", -1, [0]],
    ["_pid", "", [""]],
    ["_sp", "", ["", []]],
    ["_unit", objNull, [objNull]],
    ["_price", 0, [0]],
    ["_spawntext", "", [""]],
    ["_perks",[false, false],[]],
    ["_garageSpawn",false,[false]]
];

_perks params [["_scrambler", false, [false]], ["_refueler", false, [false]], ["_repaired", false, [false]]];

private _name = name _unit;
private _side = side _unit;

if (_vid isEqualTo -1 || {_pid isEqualTo ""}) exitWith {};
if (_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

private _servIndex = serv_sv_use find _vid;

private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, gear, fuel, damage, blacklist, RGB, ammo, upgrades FROM phxcars WHERE id='%1' AND pid='%2'",_vid,_pid];

private _tickTime = diag_tickTime;
private _queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {};

private _vInfo = _queryResult;
if (isNil "_vInfo") exitWith {serv_sv_use deleteAt _servIndex;};
if (_vInfo isEqualTo []) exitWith {serv_sv_use deleteAt _servIndex;};

if ((_vInfo select 5) isEqualTo 0) exitWith {
    serv_sv_use deleteAt _servIndex;
    [format["%1 was classified as a destroyed vehicle and was sent to the scrap yard.", _vInfo select 2],"red"] remoteExecCall ["PHX_fnc_notify", _unit];
};

if ((_vInfo select 6) isEqualTo 1) exitWith {
    serv_sv_use deleteAt _servIndex;
    [format["%1 is already active somewhere in the world and cannot be spawned.",_vInfo select 2],"red"] remoteExecCall ["PHX_fnc_notify", _unit];
};

private _found = false;
private _dir = 0;
if !(_garageSpawn) then {
    {
        _pos = getMarkerPos _x;
        _dir = (markerDir _x);
        if ((nearestObjects[_pos,["Car","Air","Ship"],10]) isEqualTo []) exitWith { _sp = _pos; _found = true };
    } forEach _sp;
} else {
    _pos = _sp select 0;
    _dir = (_sp select 1);
    if ((nearestObjects[_pos,["Car","Air","Ship"],10]) isEqualTo []) exitWith { _sp = _pos; _found = true };
};

if !(_found) exitWith {
    serv_sv_use deleteAt _servIndex;
    [_price,_unit] remoteExecCall ["life_fnc_garageRefund",_unit];
    ["There is already a vehicle on the spawn point. You have been refunded.","red"] remoteExecCall ["PHX_fnc_notify", _unit];
};

_query = format ["UPDATE phxcars SET active='1', damage='""[]""' WHERE id='%1'", [_vid] call DB_fnc_numberSafe];

private _trunk = [(_vInfo select 9)] call DB_fnc_mresToArray;
private _gear = [(_vInfo select 10)] call DB_fnc_mresToArray;
private _damage = [call compile (_vInfo select 12)] call DB_fnc_mresToArray;
private _wasIllegal = _vInfo select 13;
_wasIllegal = if (_wasIllegal isEqualTo 1) then { true } else { false };

[_query,1] call DB_fnc_asyncCall;

private _vehicle = objNull;

_vehicle = createVehicle [(_vInfo select 2),(getMarkerPos _sp),[],0,"NONE"];
_vehicle allowDamage false;
_vehicle setPos _sp;
_vehicle setVectorUp (surfaceNormal _sp);
_vehicle setDir _dir;

_vehicle allowDamage true;
_vehicle setAmmoCargo 0;
_vehicle setRepairCargo 0;
_vehicle lock 2;

[_vehicle] remoteExecCall ["life_fnc_addVehicle2Chain",_unit];
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;

private _ownersList = [[_pid,_name]];

// Reskin the vehicle
private _colour = _vInfo select 8;
private _RGBColour = [_vInfo select 14] call DB_fnc_mresToArray;
if (_RGBColour isEqualType "") then {_RGBColour = parseSimpleArray _RGBColour;};

_RGBColour = [
    false,
    _RGBColour
] select !(_RGBColour isEqualTo []);
[_vehicle, _colour, _RGBColour] remoteExecCall ["life_fnc_colorVehicle",_unit];


private _upgrades = _vInfo select 16;
if !(_upgrades isEqualTo "") then {
    _upgrades = [_upgrades] call DB_fnc_mresToArray;

    _vehicle setVariable ["vehicle_upgrades", _upgrades, true];
    private _trank = (_vehicle getVariable "vehicle_upgrades") select 1;

    if (_trank > 15) then {
        switch _trank do {
            case 30: { [_vehicle, "trunk", 5] call PHX_fnc_handleVehicleUpgrade };
            case 60: { [_vehicle, "trunk", 10] call PHX_fnc_handleVehicleUpgrade };
            case 90: { [_vehicle, "trunk", 15] call PHX_fnc_handleVehicleUpgrade };
        };
    };
} else {
    _vehicle setVariable ["vehicle_upgrades", [0,0,0,0,[]], true];
    [_vehicle,4] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];
};

_vehicle setVariable ["vehicle_info_owners",_ownersList,true];
_vehicle setVariable ["dbInfo",[(_vInfo select 4),(_vInfo select 7),(_vInfo select 0)],true];

_vehicle setPlateNumber (_vInfo select 7);
[_vehicle] call life_fnc_clearVehicleAmmo;

if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {

    _vehicle setVariable ["Trunk",_trunk,true];
    
    if (_wasIllegal) then {
        private _refPoint = if (_sp isEqualType "") then {getMarkerPos _sp;} else {_sp;};
        
        private _distance = 100000;
        private "_location";

        {
            private _tempLocation = nearestLocation [_refPoint, _x];
            private _tempDistance = _refPoint distance _tempLocation;
    
            if (_tempDistance < _distance) then {
                _location = _tempLocation;
                _distance = _tempDistance;
            };
            false
    
        } count ["NameCityCapital", "NameCity", "NameVillage"];
 
        _location = text _location;
        [1,"%2 got back a blacklisted vehicle near %1.",true,[_location,_name]] remoteExecCall ["life_fnc_broadcast",west];

        _query = format ["UPDATE phxcars SET blacklist='0' WHERE id='%1'", [_vid] call DB_fnc_numberSafe];
        [_query,1] call DB_fnc_asyncCall;
    };
} else {
    _vehicle setVariable ["Trunk",[[],0],true];
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_fuel") isEqualTo 1) then {
    _vehicle setFuel (_vInfo select 11);
} else {
    _vehicle setFuel 1;
};

_vehicle setVariable ["Scrambler",_scrambler,true];


if (typeof(_vehicle) in (getArray (missionConfigFile >> "CfgSettings" >> "rearmableVehicles"))) then {
    _vehicle setVehicleAmmo (_vInfo select 15);
};

if (_refueler) then { _vehicle setFuel 1 };

if (count _gear > 0 && (LIFE_SETTINGS(getNumber,"save_vehicle_inventory") isEqualTo 1)) then {
    _items = _gear select 0;
    _mags = _gear select 1;
    _weapons = _gear select 2;
    _backpacks = _gear select 3;

    for "_i" from 0 to ((count (_items select 0)) - 1) do {
        _vehicle addItemCargoGlobal [((_items select 0) select _i), ((_items select 1) select _i)];
    };
    for "_i" from 0 to ((count (_mags select 0)) - 1) do {
        _vehicle addMagazineCargoGlobal [((_mags select 0) select _i), ((_mags select 1) select _i)];
    };
    for "_i" from 0 to ((count (_weapons select 0)) - 1) do {
        _vehicle addWeaponCargoGlobal [((_weapons select 0) select _i), ((_weapons select 1) select _i)];
    };
    for "_i" from 0 to ((count (_backpacks select 0)) - 1) do {
        _vehicle addBackpackCargoGlobal [((_backpacks select 0) select _i), ((_backpacks select 1) select _i)];
    };
};

if (count _damage > 0 && (LIFE_SETTINGS(getNumber,"save_vehicle_damage") isEqualTo 1) && !(_repaired)) then {
    _parts = getAllHitPointsDamage _vehicle;

    for "_i" from 0 to ((count _damage) - 1) do {
        _vehicle setHitPointDamage [format ["%1",((_parts select 0) select _i)],_damage select _i];
    };
};

//Sets of animations
if ((_vInfo select 1) isEqualTo "cop" && ((_vInfo select 2)) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
    [_vehicle,"cop_offroad",true] remoteExecCall ["life_fnc_vehicleAnimate",_unit];
};

if ((_vInfo select 1) isEqualTo "med" && (_vInfo select 2) isEqualTo "C_Offroad_01_F") then {
    [_vehicle,"med_offroad",true] remoteExecCall ["life_fnc_vehicleAnimate",_unit];
};

switch (_side) do {
    case west: {
        _vehicle addItemCargoGlobal ["Toolkit",1];
        _vehicle setVariable ["isAPC",true,true];
    };
    case civilian: {
        _vehicle addItemCargoGlobal ["Toolkit",1];
        if ("Tracker" in ((_vehicle getVariable ["vehicle_upgrades",[]]) select 4)) then {
            [_vehicle] remoteExec ["PHX_fnc_tracker",_unit];
        };
    };
    case independent: {
        _vehicle addItemCargoGlobal ["Toolkit",1];
        _vehicle setVariable ["isNHS",true,true];
    };
    case east: {
        _vehicle setVariable ["isHAV",true,true];
        _vehicle addItemCargoGlobal ["Toolkit",1];
    };
};

[_spawntext,"green"] remoteExec ["PHX_fnc_notify",_unit];
serv_sv_use deleteAt _servIndex;
