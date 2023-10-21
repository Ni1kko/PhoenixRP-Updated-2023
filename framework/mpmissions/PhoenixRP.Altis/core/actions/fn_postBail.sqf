#include "..\..\script_macros.hpp"
/*
    File: fn_postBail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the player attempts to post bail.
    Needs to be revised.
*/

params [
    ["_unit",objNull,[objNull]]
];

if (life_bail_paid) exitWith {};
if (isNil "life_bail_amount") then {life_bail_amount = 3500;};
if (!life_canpay_bail) exitWith {NOTIFY("You must wait before posting bail!","red")};
if (BANK < life_bail_amount) exitWith {[format ["You do not have £%1 in your bank account to pay bail.",[life_bail_amount] call life_fnc_numberText],"red"] call PHX_fnc_notify;};

[life_bail_amount, 1, 1, "Posted Bail"] call PHX(handleMoney);
[player, format ["%1 (%2) posted bail for %3",profileName,getPlayerUID player,[life_bail_amount] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
life_bail_paid = true;
[0,"%1 has posted bail!",true,[profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];