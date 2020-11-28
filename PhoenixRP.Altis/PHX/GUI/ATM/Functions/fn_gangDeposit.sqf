#include "..\..\..\..\script_macros.hpp"
/*
    Author: Bryan "Tonic" Boardwine

    Description:
    Deposits money into the players gang bank.
*/

private _value = parseNumber(ctrlText 2702);
private _group = group player;
_group setVariable ["gbank_in_use_by",player,true];

if (player getVariable ["isAdmin",false]) exitWith {NOTIFY("You can't use group bank while on-duty", "red")};
if (_value > 999999) exitWith {["You can't deposit more then £999,999 at a time", "red"] call PHX_fnc_notify};
if (_value < 0) exitWith {};
if !([str(_value)] call LIFE_fnc_isNumber) exitWith {["The amount entered isn't a numeric value", "red"] call PHX_fnc_notify};
if (_value > CASH) exitWith {["You do not have that much cash on you", "red"] call PHX_fnc_notify};
if !((_group getVariable ["gbank_in_use_by",player]) isEqualTo player) exitWith {["You can't withdraw less then £100", "red"] call PHX_fnc_notify};

[_value, 1, 0, "Gang Deposit"] call PHX_fnc_handleMoney;
[1] call SOCK_fnc_updatePartial;

private _funds = GANG_FUNDS;
_funds = _funds + _value;
_group setVariable ["gang_bank",_funds,true];
[1,_group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

[format ["You have deposited £%1 into your group's bank account", [_value] call life_fnc_numberText], "green"] call PHX(notify);
[] call PHX_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
private _gangName = _group getVariable "gang_name";

[player, format ["%1 (%2) deposited %3 into the %7 group bank. Group Bank Balance: %4 Bank Balance: %5 On Hand Balance: %6",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[_funds] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText, _gangName], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
