#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_bankWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the players account
*/

params [
    ["_value", (parseNumber(ctrlText 2702)), [0]]
];

// Check to make sure our var is defined...
if (isNil "PHX_ATMCash" || { !(PHX_ATMCash isEqualType 0) }) exitWith { NOTIFY("An error occured... Please try again later...","red") };

if (_value < 0) exitWith {};
if !([(_value toFixed 0)] call LIFE_fnc_isNumber) exitWith {NOTIFY("The amount entered isn't a numeric value","red")};
if (_value > BANK) exitWith {NOTIFY("You don't have that much in your bank account")};
if (_value < 1 && BANK > 20000000) exitWith {NOTIFY("You can't withdraw less then £1","red")};

[_value, 0, 0] call PHX(handleMoney);
[_value, 1, 1, "Withdrawal"] call PHX(handleMoney);
[format ["You have withdrawn £%1 from your bank account",[_value] call life_fnc_numberText],"green"] call PHX_fnc_notify;
[player, format ["%1 (%2) withdrew %3 from their bank. Bank Balance: %4 On Hand Balance: %5",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

[] call PHX_fnc_atmMenu;
[6] call DB(updatePartial);