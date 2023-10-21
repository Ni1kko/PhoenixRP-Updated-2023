#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_blackjack.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Takes bet, hands out cards
*/

#define PICTURE_BASE_PLAYER 14007
#define PICTURE_BASE_DEALER 14012

disableSerialization;
private _bet = ctrlText 14001;
if !([_bet] call LIFE_fnc_isNumber) exitWith { NOTIFY("You must enter a number!","red") };
_bet = parseNumber _bet;

if(CASH < _bet || { _bet < 1 }) exitWith {NOTIFY("You do not have enough cash to play.", "red")};
if(_bet > 1000000) exitWith {NOTIFY("You can not place a bet higher thank £1,000,000.", "red")};
[_bet, 1, 0, "Blackjack"] call PHX(handleMoney);
[player, format ["%1 (%2) placed a %3 bet on blackjack. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_bet] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_action_inUse = true;

private _display = findDisplay 14000;
for "_i" from 0 to 9 do { (_display displayCtrl (PICTURE_BASE_PLAYER + _i)) ctrlSetText "" }; //Clears the cards
{ (_display displayCtrl _x) ctrlEnable false; } forEach [14001, 14002, 14005, 14006];

private _dealerArray = [];
private _playerArray = [];

for "_i" from 0 to 1 do {
	_dealerArray pushBack (ceil(random 13));
};

for "_i" from 0 to 1 do {
	_playerArray pushBack (ceil(random 13));
};

//--- Player first card
private _pictureControl = _display displayCtrl PICTURE_BASE_PLAYER;
_pictureControl ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_playerArray select 0)];
playsound "card";
sleep 1;

//--- Player second card
private _pictureControl2 = _display displayCtrl (PICTURE_BASE_PLAYER + 1);
_pictureControl2 ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_playerArray select 1)];
playsound "card";
sleep 1;

//--- Dealer first card
private _pictureControl3 = _display displayCtrl (PICTURE_BASE_DEALER);
_pictureControl3 ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_dealerArray select 0)];
playsound "card";
sleep 1;

//--- Dealer second card
private _pictureControl4 = _display displayCtrl (PICTURE_BASE_DEALER + 1);
_pictureControl4 ctrlSetText "data\gamble\blackjack\blank.paa"; //Blank for now, gets revealed later
playsound "card";

//--- Calculating the players total
private _playerTotal = [_playerArray] call PHX_fnc_blackjackTotal;

//--- Calculating the dealers total
private _dealerTotal = [_dealerArray] call PHX_fnc_blackjackTotal;

//--- Variables used later
PHX_gambleAmount = _bet;
PHX_blackjackDealerArray = _dealerArray;
PHX_blackjackPlayerArray = _playerArray;
sleep 0.2;

{ (_display displayCtrl _x) ctrlEnable true; } forEach [14005, 14006];

if(_playerTotal isEqualTo 21) then {ctrlEnable[14005,false];}; //Disables hit if they have a blackjack 