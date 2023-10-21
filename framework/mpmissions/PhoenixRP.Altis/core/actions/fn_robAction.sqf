#include "..\..\script_macros.hpp"
/*
    File: fn_robAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the robbing process?
*/

params [
    ["_target",objNull,[objNull]]
];

if (isNull _target || {!isPlayer _target}) exitWith {};

[player] remoteExecCall ["life_fnc_robPerson",_target];