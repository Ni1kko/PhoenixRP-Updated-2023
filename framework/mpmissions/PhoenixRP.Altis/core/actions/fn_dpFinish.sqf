#include "..\..\script_macros.hpp"
/*
    File: fn_dpFinish.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Finishes the DP Mission and calculates the money earned based
    on distance between A->B
*/

params [
    ["_dp",objNull,[objNull]]
];

PHX_DoingMission = false;
life_dp_point = nil;
private _dis = round((getPos life_dp_start) distance (getPos _dp));
private _price = round(15 * _dis);

[(format["You have earned £%1 for delivering the package!",[_price] call life_fnc_numberText]),"green"] call PHX_fnc_notify;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;

[_price, 0, 0, "Completed DP Mission"] call PHX(handleMoney);
[player, format ["%1 (%2) completed a delivery mission as was given %3",profileName,getPlayerUID player,[_price] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
[50, "Completing a Delivery Mission"] call PHX_fnc_handleXP;

life_cur_task = nil;