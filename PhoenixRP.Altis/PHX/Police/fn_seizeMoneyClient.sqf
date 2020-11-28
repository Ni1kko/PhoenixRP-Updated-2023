#include "..\..\script_macros.hpp"
/*
    File: fn_seizeMoneyClient.sqf
    Author: Conner Merlin
    Description: Sets players money to £0
*/
params [
    ["_unit",objNull,[objNull]],
    ["_cop",objNull,[objNull]]
];

if (isNull _unit && _unit != player) exitWith {};

[format["Seized %1 from %2!",[CASH] call LIFE_fnc_numberText,(_unit getVariable ["realname",name _unit])],"green"] remoteExec ["PHX_fnc_notify",_cop];
[CASH, 1, 0, "Seized"] call PHX_fnc_handleMoney;

[format["All your cash has been placed into Police Evidence by %1!",(_cop getVariable ["realname",name _cop])],"red"] call PHX_fnc_notify;

[player, format ["%1 (%2) had their money (%5) seized by %3 (%4). Bank Balance: %6 On Hand Balance: %7",profileName,getPlayerUID player,(_cop getVariable ["realname",name _cop]),getPlayerUID _cop,[CASH] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
