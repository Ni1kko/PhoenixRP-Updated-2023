#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_rouletteBet.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Takes bet, spins wheel and pays out
*/

disableSerialization;

private _bet = ctrlText 15001;
if !([_bet] call LIFE_fnc_isNumber) exitWith { NOTIFY("You must enter a number!","red") };
_bet = parseNumber _bet;

if(CASH < _bet || { _bet < 1 }) exitWith {NOTIFY("You do not have enough cash to play.", "red")};
if(_bet > 100000) exitWith {NOTIFY("You can not place a bet higher than £100,000.", "red")};
[_bet, 1, 0, "Roulette"] call PHX(handleMoney);
[player, format ["%1 (%2) placed a %3 bet on Roulette. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_bet] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_action_inUse = true;

private _display = findDisplay 15000;
{ (_display displayCtrl _x) ctrlEnable false; } forEach [15001, 15002];

private _control = _display displayCtrl 15005;
_control ctrlSetAngle [0,0.5,0.5];

PHX_gambleAmount = _bet;

{ (_display displayCtrl _x) ctrlEnable true; } forEach [15006, 15007, 15008];

[0] call SOCK_fnc_updatePartial;
