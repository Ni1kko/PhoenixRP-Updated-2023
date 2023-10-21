#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehStoreItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
    if the vehicle has room for the item.
*/

params [
    ["_mode", "Once", [""]]
];

disableSerialization;
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith { closeDialog 0; NOTIFY("This vehicle's trunk is in use, only one person can use it at a time.","red"); };

private _num = 0;
private _ctrl = ctrlSelData(3503);

private _totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
private _veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
private _inv = _veh_data select 0;
private _index = 0;
private _val = 0;

if(_mode isEqualTo "All") then {
    _num = floor(((_totalWeight select 0) - (_totalWeight select 1)) / ITEM_WEIGHT(_ctrl));

    if(_num > ITEM_VALUE(_ctrl)) then {
        _num = ITEM_VALUE(_ctrl)
    };
    
    if !(_num isEqualTo (ITEM_VALUE(_ctrl))) then {
        ["Not all items could be stored so some where returned to you", "red" ] call PHX_fnc_notify;
    };
} else {
    _num = ctrlText 3506;
    if (!([_num] call LIFE_fnc_isNumber)) exitWith { ["Invalid number format!", "red" ] call PHX_fnc_notify; };
    _num = parseNumber(_num);
};

if (_num < 1) exitWith {NOTIFY("You can't enter anything below 1!","red");};
private _itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;


if (_ctrl isEqualTo "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" || life_trunk_vehicle isKindOf "ship" || life_trunk_vehicle isKindOf "House_F")}) exitWith {NOTIFY("You cannot store that in anything but a land vehicle!","red");};

//----- Prevents anything but Oil from being stored in trunks (excluding fuel trucks)
if ((_ctrl isEqualTo "oil_unprocessed" || _ctrl isEqualTo "oil_processed") && {!(life_trunk_vehicle isKindOf "B_G_Van_01_fuel_F" || life_trunk_vehicle isKindOf "B_T_Truck_01_fuel_F" || life_trunk_vehicle isKindOf "O_Truck_03_fuel_F" || life_trunk_vehicle isKindOf "C_Truck_02_fuel_F")}) exitWith {["You cannot store Oil in this type of truck!", "red"] call PHX_fnc_notify;};


if (((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {NOTIFY("The vehicle is either full or cannot hold that much.","red");};

if (!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {NOTIFY("Couldn't remove the items from your inventory to put in the vehicle.","red");};
_index = [_ctrl,_inv] call LIFE_fnc_index;
if (_index isEqualTo -1) then {
    _inv pushBack [_ctrl,_num];
} else {
    _val = _inv select _index select 1;
    _inv set[_index,[_ctrl,_val + _num]];
};

life_trunk_vehicle setVariable ["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
[life_trunk_vehicle] call life_fnc_vehInventory;