#include "..\..\script_macros.hpp"
/*
    File: fn_garageRefund.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    I don't know?
*/
params ["_price", "_unit"];

if !(_unit isEqualTo player) exitWith {};

[_price, 0, 1, "Garage Fee Refund"] call PHX(handleMoney);

[player, format ["%1 (%2) was refunded %3 for their car not spawning.",profileName,getPlayerUID player,[_price] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);