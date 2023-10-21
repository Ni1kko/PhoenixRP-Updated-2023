/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks whether or not the vehicle is persistent or temp and sells it.
*/
#include "\life_server\script_macros.hpp"
params [
    ["_vehicle", objNull, [objNull]],
    ["_price",500,[0]]
];

//Error checks
if (isNull _vehicle) exitWith  {
    life_action_inUse = false;
    remoteExecutedOwner publicVariableClient "life_action_inUse";
};

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");

private _dbInfo = _vehicle getVariable ["dbInfo",[]];
if !(_dbInfo isEqualTo []) then {
    _dbInfo params ["_uid", "_plate", "_id"];
    [format ["UPDATE phxcars SET alive='0', dead='1' WHERE id='%1'", [_id] call DB_fnc_numberSafe],1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
life_action_inUse = false;
remoteExecutedOwner publicVariableClient "life_action_inUse";
[2,"You have sold a %1 for £%2.",true,[_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast", remoteExecutedOwner];
[50,"Chopped a vehicle"] remoteExecCall ["PHX_fnc_handleXP", remoteExecutedOwner];

_vehicle setVariable ["vehicleThief",objNull,true];
_vehicle setVariable ["IsBeingChopped",false,true];