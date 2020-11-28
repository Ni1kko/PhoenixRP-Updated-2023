#include "..\..\script_macros.hpp"
/*
    File: fn_unimpound.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Yeah... Gets the vehicle from the garage.
*/

disableSerialization;
if ((lbCurSel 2802) isEqualTo -1) exitWith {NOTIFY("You did not select anything.","red")};
private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
private _vehicleLife = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;
private _unit = player;
private _spawntext = "Your vehicle is ready!";
if (isNil "_vehicle") exitWith {NOTIFY("The selection had an error...","red")};
if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then {
    _vehicleLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_vehicle];
};

private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
private _storageFee = LIFE_SETTINGS(getNumber,"vehicle_store_multiplier");

_price = _price * _storageFee;

if (!(_price isEqualType 0) || _price < 1) then {_price = 500;};
if (HAS_PERK("matesRate")) then { _price = _price * 0.5 };
if (BANK < _price) exitWith {[format [("You don't have £%1 in your bank account."),[_price] call life_fnc_numberText],"red"] call PHX_fnc_notify;};

[_vid,_pid,life_garage_sp,_unit,_price,_spawntext,[(HAS_PERK("Scrambler")), (HAS_PERK("fuelStorer")), (HAS_PERK("reliablyRepaired"))],life_garage_spawn] remoteExecCall (["fnc_spawnVehicle","TON"] call SOCK_fnc_getRemoteDestination);

[_price, 1, 1, "Garage Fee"] call PHX(handleMoney);
[player, format ["%1 (%2) retrieved their vehicle for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
closeDialog 0;