#include "..\..\script_macros.hpp"
/*
    File: fn_searchClient.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the player and he returns information back to the player.
*/

params [
    ["_cop",objNull,[objNull]]
];

if (isNull _cop) exitWith {};

private _inv = [];
private _val = 0;
private _var = "";

{
    _var = configName(_x);
    _val = ITEM_VALUE(_var);
    _name = ITEM_NAME(_var);
    if (_val > 0) then {
        _inv pushBack [_name,_val];
        [false,_var,_val] call life_fnc_handleInv;
    };
} forEach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "CfgItems"));

[player,_inv] remoteExecCall ["life_fnc_copSearch",_cop];
