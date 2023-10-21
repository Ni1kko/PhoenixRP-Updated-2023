#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_blackjackHit.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Handles the dealers hit for the blackjack game
*/

#define PICTURE_BASE_DEALER 14012
private _display = findDisplay 14000;

private _dealerArray = PHX_blackjackDealerArray;
private _playerArray = PHX_blackjackPlayerArray;

_dealerArray pushBack (ceil(random 13));
PHX_blackjackDealerArray = _dealerArray;

private _currentPos = count(_dealerArray) - 1;
private _dealerTotal = [_dealerArray] call PHX_fnc_blackjackTotal;
private _playerTotal = [_playerArray] call PHX_fnc_blackjackTotal;

private _pictureControl = _display displayCtrl (PICTURE_BASE_DEALER + _currentPos);
_pictureControl ctrlSetText "data\gamble\blackjack\blank.paa";

playsound "card"; //Plays placement sound

sleep 0.5; //Waits before doing more cards

if (!(_dealerTotal < 21) && _dealerTotal < 17 && _currentPos < 5) then {[] call PHX_fnc_blackjackDealerHit;}; //Card will go 1 for 1 until the player has held