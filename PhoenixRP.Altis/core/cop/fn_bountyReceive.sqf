#include "..\..\script_macros.hpp"
/*
    File: fn_bountyReceive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies the player he has received a bounty and gives him the cash.
*/

params [
    ["_val",0,[0]],
    ["_total",0,[0]]
];

[format["You have collected a bounty of £%1 for arresting a criminal.",[_val] call life_fnc_numberText],"green"] call PHX_fnc_notify;
[_val, 0, 1, "Bounty Reward"] call PHX(handleMoney);
[player, format ["%1 (%2) collected a bounty of %3",profileName,getPlayerUID player,[_val] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);