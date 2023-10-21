#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_blackjackHit.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Handles hit for the blackjack game
*/

#define PICTURE_BASE_PLAYER 14007
#define PICTURE_BASE_DEALER 14012


private _display = findDisplay 14000;
{ (_display displayCtrl _x) ctrlEnable false; } forEach [14005, 14006];

private _dealerArray = PHX_blackjackDealerArray;
private _playerArray = PHX_blackjackPlayerArray;
private _playerTotal = [_playerArray] call PHX_fnc_blackjackTotal;
private _dealerTotal = [_dealerArray] call PHX_fnc_blackjackTotal;

private _currentPos = count(_playerArray) - 1;
private _dealerCurrentPos = count(_dealerArray);
private _currentCardPos = (PICTURE_BASE_PLAYER + (_currentPos + 1));
private _betAmount = PHX_gambleAmount;

if (HAS_PERK("highRoller")) then {
	_betAmount = _betAmount * 1.1
};

if ((_dealerTotal > 21) && _dealerTotal < 17 && _currentPos < 5) then {
	[] call PHX_fnc_blackjackDealerHit;
	_dealerArray = PHX_blackjackDealerArray;
	_dealerTotal = [_dealerArray] call PHX_fnc_blackjackTotal;
	_currentPos = count(_dealerArray) - 1;
};

if(_currentPos isEqualTo 5) exitWith {NOTIFY("You lose! You may only have 5 cards!","red")};

//--- Setting the picture
_playerArray pushBack (ceil(random 13));
PHX_blackjackPlayerArray = _playerArray;
private _pictureControl = _display displayCtrl (_currentCardPos);
_pictureControl ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_playerArray select (_currentPos + 1))];

playsound "card"; //Plays placement sound

//--- Calculation
private _playerTotal = [_playerArray] call PHX_fnc_blackjackTotal;

{ (_display displayCtrl _x) ctrlEnable false; } forEach [14005, 14006]; //Disabling hit / stay button

if (_playerTotal > 21 && _dealerTotal <= 21) then {
	for "_i" from 1 to (_dealerCurrentPos - 1) do {private _card = _dealerArray select _i;(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", _card];};
	NOTIFY("You bust! Better luck next time!","red");
	ctrlEnable[14001,true];
	ctrlEnable[14002,true];
	life_action_inUse = false;
} else {
	if (_playerTotal < 21) then {
		ctrlEnable[14005,true];
		ctrlEnable[14006,true];
	} else {
		if (_playerTotal isEqualTo _dealerTotal || (_playerTotal > 21 && _dealerTotal > 21) && !(_playerTotal isEqualTo 21)) then {
			for "_i" from 1 to (_dealerCurrentPos - 1) do {private _card = _dealerArray select _i;(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", _card];};
			NOTIFY("You drew! Your money was returned.","cyan");
			[_betAmount, 0, 0, "Blackjack"] call PHX(handleMoney);
			[player, format ["%1 (%2) drew a game on blackjack and %3 was returned to them. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_betAmount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
			ctrlEnable[14001,true];
			ctrlEnable[14002,true];
			life_action_inUse = false;
		} else {
			ctrlEnable[14006,true];
		};
	};
};