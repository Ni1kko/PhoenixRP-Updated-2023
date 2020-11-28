#include "..\..\script_macros.hpp"
/*
    File: fn_fuelRefuelCar.sqf
    Author: NiiRoZz

    Description:
    Adds fuel in car.
*/
disableSerialization;

private _className = lbData[20302,(lbCurSel 20302)];
private _index = lbValue[20302,(lbCurSel 20302)];

if (isNil "_className" || _className isEqualTo "") exitWith {
    NOTIFY("Select a vehicle","red");
    life_vehicleFuelList = [];
    life_action_inUse = false;
    closeDialog 0;
};

private _vehicle = life_vehicleFuelList select _index;
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
private _fuelNow = (fuel _vehicle);
private _fuelCost = PHX_FuelRate;

if (HAS_PERK("ecoDriver")) then {
    _fuelCost = _fuelCost / 2; // 50% off...
};

private _fuelTank = (_vehicleInfo select 12);
private _fuelToPut = ((sliderPosition 20304) - (floor(_fuelNow * _fuelTank)));
private _setFuel = _fuelNow + (_fuelToPut / _fuelTank);

if (_fuelToPut isEqualTo 0) exitWith {NOTIFY("No full to put in!","red")};

if (_vehicle distance player > 10 && !(isNull objectParent player)) exitWith {
    NOTIFY("The vehicle is too far or you are in it!","red");
    life_vehicleFuelList = nil;
    life_action_inUse = false;
    closeDialog 0;
};

if !((BANK - (_fuelToPut * _fuelCost)) > 0) exitWith {NOTIFY("Not enough money!","red")};
closeDialog 0;

if !(
[
    format["Refueling %1",(_vehicleInfo select 3)],
    (_fuelToPut / 2)
] call PHX(handleProgress)
) exitWith { life_action_inUse = false; life_vehicleFuelList = nil; closeDialog 0;};

private _totalCost = _fuelToPut * _fuelCost;
[_vehicle,_setFuel] remoteExecCall ["life_fnc_setFuel",_vehicle];
NOTIFY("Refuel complete!","green");

[_totalCost, 1, 0, "Purchased Fuel"] call PHX(handleMoney);
[player, format ["%1 (%2) refueled their vehicle for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_totalCost] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);


life_vehicleFuelList = nil;
life_action_inUse = false;
closeDialog 0;
