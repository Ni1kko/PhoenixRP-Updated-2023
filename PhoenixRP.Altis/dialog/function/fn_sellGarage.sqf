#include "..\..\script_macros.hpp"
/*
    File: fn_sellGarage.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sells a vehicle from the garage.
*/

disableSerialization;
{ ctrlEnable [_x,false] } forEach [2804,2805,2809,2806];

if ((lbCurSel 2802) isEqualTo -1) exitWith {NOTIFY("You did not select anything.","red")};
private _vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format ["%1",_vehicle]) select 0;
private _vehicleLife = _vehicle;
private _vid = lbValue[2802,(lbCurSel 2802)];
private _pid = getPlayerUID player;

private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
private _displayName = ([_vehicleLife] call life_fnc_fetchVehInfo) select 3;
private _multiplier = LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier");
private _sellPrice = _price * _multiplier;

private _action = [
    format["Are you sure you want to sell this vehicle for £%1?",[_sellPrice] call life_fnc_numberText],
    "Selling vehicle",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

if (_action) then {
    closeDialog 0;

    if (isNil "_vehicle") exitWith {NOTIFY("The selection had an error...","red")};
    if ((time - life_action_delay) < 1.5) exitWith {NOTIFY("You're doing it too fast!","red");};
    if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _vehicleLife)) then {
        _vehicleLife = "Default"; //Use Default class if it doesn't exist
        diag_log format ["%1: LifeCfgVehicles class doesn't exist",_vehicle];
    };

    if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};

    [_vid,_pid] remoteExecCall (["fnc_vehicleDelete","TON"] call SOCK_fnc_getRemoteDestination);

    [format ["You sold that vehicle for £%1.",[_sellPrice] call life_fnc_numberText],"green"] call PHX_fnc_notify;
    [_sellPrice, 0, 1, (format["Sold a %1",_displayName])] call PHX_fnc_handleMoney;
    [player, format ["%1 (%2) sold vehicle %3 for %4. Bank Balance: %5 On Hand Balance: %6",profileName,(getPlayerUID player),_displayName,[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

    life_action_delay = time;

};

{ ctrlEnable [_x,true] } forEach [2804,2805,2809,2806];