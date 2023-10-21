/*
    File: fn_openInventory.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initialization of vehicle virtual inventory menu.
*/
#include "..\..\script_macros.hpp"
if (dialog) exitWith {};

params [["_vehicle", objNull, [objNull]]];

private _isVault = ((vehicleVarName cursorObject) in ["fed_bank", "havoc_box", "evidence_locker"]);

if (isNull _vehicle || { !([_vehicle, ["Car","Air","Ship","Land_Bodybag_01_black_F","Box_IND_Grenades_F","B_supplyCrate_F","B_Slingload_01_Cargo_F","O_CargoNet_01_ammo_F"]] call PHX(isKindOf)) && !_isVault }) exitWith {};

if ((_vehicle getVariable ["trunk_in_use",false])) exitWith {NOTIFY("This vehicle's trunk is in use, only one person can use it at a time.","red")};

_vehicle setVariable ["trunk_in_use",true,true];
_vehicle setVariable ["trunk_in_use_by",player,true];

if !(createDialog "TrunkMenu") exitWith {NOTIFY("Failed Creating Dialog","red");}; //Couldn't create the menu?
disableSerialization;

private _veh_data = [_vehicle] call life_fnc_vehicleWeight;
ctrlSetText[3501,format["Trunk (%1/%2)",_veh_data select 1,_veh_data select 0]];

if (_veh_data select 0 isEqualTo -1) exitWith {closeDialog 0; _vehicle setVariable ["trunk_in_use",false,true]; NOTIFY("This vehicle isn't capable of storing items...","red");};

if(_vehicle isKindOf "Land_Bodybag_01_black_F" || _isVault) then {
    ctrlShow [3507, true];
    ctrlShow [3508, false];
    ctrlShow [3509, false];
} else {
    ctrlSetText[3504,format [("Weight:")+ " %1/%2",_veh_data select 1,_veh_data select 0]];
};

[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

[_vehicle, _isVault] spawn {
    params ["_vehicle", "_isVault"];

    waitUntil {isNull (findDisplay 3500)};

    _vehicle setVariable ["trunk_in_use", false, true];
    if (_vehicle isKindOf "Box_IND_Grenades_F" || _vehicle isKindOf "B_supplyCrate_F") then {
        [_vehicle] remoteExecCall ["TON_fnc_updateHouseTrunk",2];
    };

    if (_vehicle isKindOf "Land_Bodybag_01_black_F" || _isVault) then {
        if (count ((_vehicle getVariable["Trunk",[[],0]]) select 0) < 1) then {
            if (_isVault) exitWith { _vehicle setVariable ["Trunk", nil, true] };

            deleteVehicle _vehicle;
        };
    };
};

if (LIFE_SETTINGS(getNumber,"save_vehicle_virtualItems") isEqualTo 1) then {
    _vehicle spawn {
        waitUntil {isNull (findDisplay 3500)};
        _this setVariable ["trunk_in_use",false,true];
        if ((_this isKindOf "Car") || (_this isKindOf "Air") || (_this isKindOf "Ship")) then {
            [] call SOCK_fnc_updateRequest;
            [_this,2] remoteExecCall ["TON_fnc_vehicleUpdate",2];
        };
    };
};
