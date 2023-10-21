#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleWeightCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for vehicle weight.
*/
params [["_className", "", [""]]];

private _config = missionConfigFile >> "LifeCfgVehicles" >> _className;
if (!isClass (_config)) exitWith {-1};

private _weight = getNumber (_config >> "vItemSpace");
if (isNil "_weight" || {_weight isEqualTo ""}) exitWith {-1};

_weight