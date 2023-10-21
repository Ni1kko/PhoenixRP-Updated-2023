#include "..\..\script_macros.hpp"
/*
    File: fn_getDPMission.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Selects a random DP point for a delivery mission.
    Needs to be revised.
*/
params [
    ["_target",objNull,[objNull]]
];
if (isNull _target) exitWith {};

private "_dp";
if (str(_target) in LIFE_SETTINGS(getArray,"delivery_points")) then {
    private _point = LIFE_SETTINGS(getArray,"delivery_points");
    _point deleteAt (_point find (str(_target)));
    _dp = selectRandom _point;
} else {
    _dp = selectRandom (LIFE_SETTINGS(getArray,"delivery_points"));
};

life_dp_start = _target;
PHX_DoingMission = true;

life_dp_point = call compile format ["%1",_dp];
_dp = toUpper((_dp splitString "_") joinString " ");

life_cur_task = player createSimpleTask [format ["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format ["You are to deliver the package to %1.",_dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

[(format["You are to deliver the package to %1",_dp]),"green"] call PHX_fnc_notify;

[] spawn {
    waitUntil {!PHX_DoingMission || !alive player};
    if (!alive player) then {
        life_cur_task setTaskState "Failed";
        player removeSimpleTask life_cur_task;
        ["You failed to deliver the package as you died","red"] call PHX_fnc_notify;
        PHX_DoingMission = false;
        life_dp_point = nil;
    };
};