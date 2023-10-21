/*
    File: fn_unrestrain.sqf
    Author:

    Description:

*/
#include "..\..\script_macros.hpp"
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit || { !(isRestrained(_unit)) }) exitWith {}; //Error check?

_unit setVariable ["restrained",sideUnknown,true];
_unit setVariable ["Escorting",false,true];
detach _unit;

[0,format["%1 was unrestrained by %2",_unit getVariable ["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast",west];