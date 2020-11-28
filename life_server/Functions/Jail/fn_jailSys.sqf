#include "\life_server\script_macros.hpp"
/*
    File: fn_jailSys.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I forget?
*/
params [
    ["_unit",objNull,[objNull]],
    ["_time", 10, [0]]
];

if (isNull _unit) exitWith {};

private _ret = [_unit] call life_fnc_wantedPerson;
[_ret,_time] remoteExec ["life_fnc_jailMe", remoteExecutedOwner];