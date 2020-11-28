/*
    File: fn_searchAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the searching process.
*/
#include "..\..\script_macros.hpp"

params [
    ["_unit",objNull,[objNull]]
];

if (isNull _unit) exitWith {};

if !(
[
    "Searching person",
    5,
    [],
    0.01,
    ""
] call PHX(handleProgress)
) exitWith {};

if (player distance _unit > 5 || {!alive player} || {!alive _unit} || {(isDowned(player))} || {(isDowned(_unit))}) exitWith {NOTIFY("Cannot search that person.","red")};
[player] remoteExecCall ["life_fnc_searchClient",_unit];
life_action_inUse = true;