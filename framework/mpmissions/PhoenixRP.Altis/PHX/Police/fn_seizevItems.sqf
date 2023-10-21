#include "..\..\script_macros.hpp"
/*
    File: fn_seizevItemsClient.sqf
    Author: Conner Merlin
    Modified: Zyn
    Description: Action for seizing the items from a player
*/

params [
    ["_unit",objNull,[objNull]]
];

if (isNull _unit || {isNil "_unit"} || {!isPlayer _unit} || {!(isRestrained(_unit))} || {(_unit getVariable ["isAdmin",false])} || {isNil "_unit"}) exitWith {};

private _cop = player getVariable ["realname",name player];

[_unit,_cop] remoteExecCall ["PHX_fnc_seizevItemsClient",_unit];