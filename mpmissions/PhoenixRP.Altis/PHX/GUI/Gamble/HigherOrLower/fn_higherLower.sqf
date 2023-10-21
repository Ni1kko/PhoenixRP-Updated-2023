#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_higherLower.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Takes bet, spins compares current to last number, determines if win, pays
*/

#define PICTURE_BASE_IDC 13005

disableSerialization;
ctrlShow [13017,false];

private _bet = ctrlText 13001;
if !([_bet] call LIFE_fnc_isNumber) exitWith { NOTIFY("You must enter a number!","red") };
_bet = parseNumber _bet;

if(CASH < _bet || { _bet < 1 }) exitWith {NOTIFY("You do not have enough cash to play.", "red")};
if(_bet > 1000000) exitWith {NOTIFY("You can not place a bet higher thank £1,000,000.", "red")};
[_bet, 1, 0, "Higher Or Lower"] call PHX(handleMoney);
[player, format ["%1 (%2) placed a %3 bet on Higher or Lower. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_bet] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

private _display = findDisplay 13000;

for "_i" from 0 to 9 do { (_display displayCtrl (PICTURE_BASE_IDC + _i)) ctrlSetText "" }; //Clears the cards

{ (_display displayCtrl _x) ctrlEnable false; } forEach [13001, 13002, 13015, 13016];

for "_i" from 0 to 9 do { 
  (_display displayCtrl (PICTURE_BASE_IDC + _i)) ctrlSetText "data\gamble\higherlower\blank.paa";
  playsound "card";
  sleep 0.5
};

private _number = ceil(random 13);
private _pictureControl = _display displayCtrl PICTURE_BASE_IDC;
_pictureControl ctrlSetText format ["data\gamble\higherlower\card_%1.paa", _number];

PHX_higherLower = 1;
PHX_higherLowerCurrent = _number;
PHX_gambleAmount = _bet;

sleep 0.2;

{ (_display displayCtrl _x) ctrlEnable true; } forEach [13015, 13016];