#include "..\..\script_macros.hpp"
/*
    File: fn_fuelLBChange.sqf
    Author: NiiRoZz

    Description:
    Change when slide change. That descripotion
*/
disableSerialization;

private _control = _this select 0;
private _index = _this select 1;

//Fetch some information.
private _className = _control lbData _index;
private _vIndex = _control lbValue _index;
private _vehicle = life_vehicleFuelList select _vindex;
private _vehicleInfo = [_className] call life_fnc_fetchVehInfo;

private _fuel = (fuel _vehicle);
private _fuelTank = (_vehicleInfo select 12);

ctrlShow [20330,true];

(CONTROL(20300,20303)) ctrlSetStructuredText parseText format [
    "<t font='RobotoCondensedLight'>Fuel Capacity: %1L<br/>Current Fuel Amount: %2L</t>",
    _fuelTank,
    round(_fuelTank * _fuel)
];

slidersetRange [20304,(floor(_fuel * _fuelTank)),_fuelTank];
sliderSetPosition[20304,(floor(_fuel * _fuelTank))];

ctrlSetText [20305,format ["Total: £%1",(PHX_FuelRate * ((SliderPosition 20304) - (floor(_fuel * _fuelTank))))]];
true;
