#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_gangWithdraw.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Withdraws money from the gang bank.
*/

private _value = parseNumber(ctrlText 2702);
private _funds = GANG_FUNDS;
private _group = group player;
_group setVariable ["gbank_in_use_by",player,true];

if !(playerSide isEqualTo civilian) exitWith {};
if (player getVariable ["isAdmin",false]) exitWith {NOTIFY("You can't use group bank while on-duty", "red")};
if !(STEAMID isEqualTo (_group getVariable "gang_owner")) exitWith {["Only group leaders can withdraw group funds!", "red"] call PHX_fnc_notify};
if (_value > 999999) exitWith {["You can't withdraw more than £999,999", "red"] call PHX_fnc_notify};
if (_value < 0) exitWith {["You can't withdraw less than £0", "red"] call PHX_fnc_notify};
if !([str(_value)] call LIFE_fnc_isNumber) exitWith {["The amount entered isn't a numeric value", "red"] call PHX_fnc_notify};
if (_value > _funds) exitWith {["You don't have that much in your group bank account!", "red"] call PHX_fnc_notify};
if (_val < 100 && _funds > 20000000) exitWith {["You can't withdraw less then £100", "red"] call PHX_fnc_notify};
if !((_group getVariable ["gbank_in_use_by",player]) isEqualTo player) exitWith {["Someone is already trying to withdraw from your gang", "red"] call PHX_fnc_notify};

_funds = _funds - _value;
[_value, 0, 0, "Gang Withdrawal"] call PHX_fnc_handleMoney;
_group setVariable ["gang_bank",_funds,true];
[1,_group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

[format ["You have withdrawn £%1 from your group", [_value] call life_fnc_numberText], "green"] call PHX(notify);
[] call PHX_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
private _gangName = _group getVariable "gang_name";

[player, format ["%1 (%2) withdrew %3 from the %7 group bank. Group Bank Balance: %4 Bank Balance: %5 On Hand Balance: %6",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,[_funds] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText, _gangName], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

