#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_lowerBet.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Lower card, compares previous with current card
*/

#define PICTURE_BASE_IDC 13005

private _display = findDisplay 13000;
{ (_display displayCtrl _x) ctrlEnable false; } forEach [13015, 13016];
ctrlShow [13017,false];

private _currentCardPos = PHX_higherLower;
private _previousNumber = PHX_higherLowerCurrent;

private _currentCard = _display displayCtrl (PICTURE_BASE_IDC + _currentCardPos);

private _number = ceil(random 13);
_currentCard ctrlSetText format ["data\gamble\higherlower\card_%1.paa", _number];

if (_currentCardPos isEqualTo 4 || _currentCardPos isEqualTo 9) then {
	ctrlShow [13017,true];
};

if (_number <= _previousNumber || (_number isEqualTo 1 && 11 <= _previousNumber)) then {
	PHX_higherLower = (_currentCardPos + 1);
	PHX_higherLowerCurrent = _number;
	{ (_display displayCtrl _x) ctrlEnable true; } forEach [13015, 13016];
} else {
	NOTIFY("You lose! Better luck next time!","red");
	ctrlShow [13017,false];
	life_action_inUse = false;
	ctrlEnable[13001,true];
	ctrlEnable[13002,true];
};