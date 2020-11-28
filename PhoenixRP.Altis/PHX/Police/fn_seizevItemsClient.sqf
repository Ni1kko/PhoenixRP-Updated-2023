#include "..\..\script_macros.hpp"
/*
    File: fn_seizevItemsClient.sqf
    Author: Conner Merlin
    Modified: Zyn
    Description: Removes the items from the unit
*/

params [
    ["_unit",objNull,[objNull]],
	["_cop","",[""]]
];

private _total = 0;
private _amount = 0;

{
    if ((getNumber(_x >> "illegal") isEqualTo 1)) then {
        _amount = ITEM_VALUE(_x);
        _total = _total + _amount;
        if (_amount > 0) then {
            [false,str(_x),_amount] call life_fnc_handleInv;
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

[0,format["%2 seized %3 worth of illegal items from %1", _unit getVariable ["realname",name _unit], _cop, [_total] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",RCLIENT];