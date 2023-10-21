#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_blackjackStay.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Handles stay for the blackjack game
*/

#define PICTURE_BASE_DEALER 14012
private _display = findDisplay 14000;
{ (_display displayCtrl _x) ctrlEnable false; } forEach [14005, 14006];

private _dealerArray = PHX_blackjackDealerArray;
private _playerArray = PHX_blackjackPlayerArray;
private _playerTotal = [_playerArray] call PHX_fnc_blackjackTotal;
private _dealerTotalPre = [_dealerArray] call PHX_fnc_blackjackTotal;
private _currentPosPre = count(_dealerArray) - 1;

while {!(_dealerTotalPre > 21) && _dealerTotalPre < 17 && _currentPosPre < 5} do {
	[] call PHX_fnc_blackjackDealerHit;
	_dealerArray = PHX_blackjackDealerArray;
	_dealerTotalPre = [_dealerArray] call PHX_fnc_blackjackTotal;
	_currentPosPre = count(_dealerArray) - 1;
};

private _betAmount = PHX_gambleAmount;

if (HAS_PERK("highRoller")) then {
	_betAmount = _betAmount * 1.1
};

private _currentPos = count(_dealerArray) - 1;
private _dealerArray = PHX_blackjackDealerArray;
private _dealerTotal = [_dealerArray] call PHX_fnc_blackjackTotal;
private _win = 0;

if (_playerTotal isEqualTo 21) then {
	for "_i" from 1 to (_currentPos) do {(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_dealerArray select _i)];};
	_win = (_betAmount * 1.75);
	[format["Blackjack! You bet £%1 and won £%2",[_betAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
	[_win, 0, 0, "Blackjack"] call PHX(handleMoney);
	[player, format ["%1 (%2) Won %3 on a game of Blackjack. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	life_action_inUse = false;
} else {
	if (_playerTotal > _dealerTotal || (_dealerTotal > 21 && _playerTotal <= 21)) then {
		for "_i" from 1 to (_currentPos) do {(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_dealerArray select _i)];};
		_win = (_betAmount * 1.75);
		[format["You bet £%1 and won £%2",[_betAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
		[_win, 0, 0, "Blackjack"] call PHX(handleMoney);		
		life_action_inUse = false;
	} else {
		if (_playerTotal isEqualTo _dealerTotal || (_dealerTotal > 21 && _playerTotal > 21)) then {
			for "_i" from 1 to (_currentPos) do {(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_dealerArray select _i)];};
			NOTIFY("You drew! Your money was returned.","cyan");
			[PHX_gambleAmount, 0, 0, "Blackjack"] call PHX(handleMoney);
			[player, format ["%1 (%2) drew a game on blackjack and %3 was returned to them. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[PHX_gambleAmount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
			life_action_inUse = false;
		} else {
			for "_i" from 1 to (_currentPos) do {(_display displayCtrl (PICTURE_BASE_DEALER + _i)) ctrlSetText format ["data\gamble\blackjack\card_%1.paa", (_dealerArray select _i)];};
			NOTIFY("You lost! Better luck next time!","red");
			[player, format ["%1 (%2) Lost %3 on Blackjack. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[PHX_gambleAmount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
			life_action_inUse = false;
		};
	};
};


ctrlEnable[14001,true];
ctrlEnable[14002,true];