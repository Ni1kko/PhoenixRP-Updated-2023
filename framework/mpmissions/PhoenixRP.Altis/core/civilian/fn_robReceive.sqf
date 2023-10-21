#include "..\..\script_macros.hpp"
/*
    File: fn_robReceive.sqf
    Author: Bryan "Tonic" Boardwine

    Description:

*/
params [
    ["_cash",0,[0]],
    ["_victim",objNull,[objNull]],
    ["_robber",objNull,[objNull]]
];

if (_robber isEqualTo _victim) exitWith {};
if (_cash isEqualTo 0) exitWith {NOTIFY("You didn't find any cash","red")};

[_cash, 0, 0, (format["Stole from %1",(_victim getVariable ["realname",name _from])])] call PHX(handleMoney);
[format ["You stole £%1",[_cash] call life_fnc_numberText],"red"] call PHX_fnc_notify;

[player, format ["%1 (%2) robbed %3 from %4 (%5). Bank Balance: %6 On Hand Balance: %7",player getVariable ["realname",name player], getPlayerUID player,[_cash] call life_fnc_numberText,_victim getVariable ["realname",name player], getPlayerUID _victim, [BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);