#include "..\..\script_macros.hpp"

/*
    File: fn_fuelStatOpen.sqf
    Author : NiiRoZz

    Description:
    Open dialog Pump.
*/

disableSerialization;

if (life_action_inUse || {dialog}) exitWith {};

private _fuelStations = nearestObjects [player, ["Land_fs_feed_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_02_pump_F"], 10];
if (_fuelStations isEqualTo []) exitWith {life_action_inUse = false;};
private _vehicleList = nearestObjects [player, ["Car","Air"], 10];
if (count _vehicleList < 1) exitWith {NOTIFY("There isn't a vehicle nearby...","red"); life_action_inUse = false;};
if (!createDialog "Life_FuelStat") exitWith {};
private _fuelCost = PHX_FuelRate;

if (HAS_PERK("ecoDriver")) then {
    _fuelCost = _fuelCost / 2; // 50% off...
};

_control = ((findDisplay 20300) displayCtrl 20302);
lbClear _control;
life_vehicleFuelList = _vehicleList;

ctrlSetText [20305,"Total: £0"];

{
    _vehicle = typeOf (_x);
    _vehicleInfo = [_vehicle] call life_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    _control lbSetPicture [(lbSize _control) - 1, (_vehicleInfo select 2)];
    _control lbSetData [(lbSize _control) - 1, _vehicle];
    _control lbSetValue [(lbSize _control) - 1, _forEachIndex];
} forEach _vehicleList;
