/*
    File: fn_blindfoldAction.sqf
    Author: Zyn
    Description: Blindfolds a player
*/

params [
    ["_unit",objNull,[objNull]]
];

if (_unit getVariable ["blindfolded",false]) exitWith {
    [player] remoteExecCall ["PHX_fnc_blindfold", _unit];
    [true, "blindfold", 1] call life_fnc_handleInv;
};

[false, "blindfold", 1] call life_fnc_handleInv;
[player] remoteExecCall ["PHX_fnc_blindfold", _unit];
