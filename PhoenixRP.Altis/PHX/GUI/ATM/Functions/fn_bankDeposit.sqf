#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_bankDeposit.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out.
*/

params [
    ["_value", (parseNumber(ctrlText 2702)), [0]]
];

// Check to make sure our var is defined...
if (isNil "PHX_Cash" || { !(PHX_Cash isEqualType 0) }) exitWith { NOTIFY("An error occured... Please try again later...","red") };

if (_value < 1) exitWith {};
if !([(_value toFixed 0)] call LIFE_fnc_isNumber) exitWith {NOTIFY("The amount entered isn't a numeric value","red")};
if (_value > CASH) exitWith {NOTIFY("You don't have that much cash on you","red")};

[_value, 1, 0] call PHX(handleMoney);
[_value, 0, 1, "Deposit"] call PHX(handleMoney);

[format ["You have deposited £%1 into your bank account.",[_value] call life_fnc_numberText],"green"] call PHX_fnc_notify;
[] call PHX_fnc_atmMenu;
[6] call DB(updatePartial);

[player, format ["%1 (%2) deposited %3 into their bank. Bank Balance: %4 On Hand Balance: %5",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);