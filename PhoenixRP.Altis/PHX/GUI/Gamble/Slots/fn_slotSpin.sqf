#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_slotSpin.sqf
@    Author: Jacob "PapaBear" Tyler
@    Editor: Zyn, Sig
@    Description: Takes bet, spins slots, determines if win, pays
*/

#define PICTURE_BASE_IDC 5771

#define SANDWICH_BASE 600
#define NEIGHBOUR_BASE 800
#define PRECEDING_BASE 1200
#define EQUAL_BASE 3500

disableSerialization;
private _bet = ctrlText 5778;
if !([_bet] call LIFE_fnc_isNumber) exitWith { NOTIFY("You must enter a number!","red") };
_bet = parseNumber _bet;

if(CASH < _bet || { _bet < 1 }) exitWith {NOTIFY("You do not have enough cash to play.", "red")};
if(_bet > 1000000) exitWith {NOTIFY("You can not place a bet higher thank £1,000,000.", "red")};
[_bet, 1, 0, "Slots"] call PHX(handleMoney);
[player, format ["%1 (%2) placed a %3 bet on a Slot Machine. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_bet] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);


life_action_inUse = true;
playsound "slots";

private _display = findDisplay 5780;

{ (_display displayCtrl _x) ctrlEnable false; } forEach [5778, 5782];

for "_i" from 0 to 2 do { (_display displayCtrl (PICTURE_BASE_IDC + _i)) ctrlSetText "data\gamble\slots\slot_empty.paa" };

private _slotTotal = 0;

for "_i" from 0 to 2 do {

  private _number = ceil(random 7);
  private _pictureControl = _display displayCtrl (PICTURE_BASE_IDC + _i);

  _slotTotal = _slotTotal + (_number * ([100, 10, 1] select _i));
  _pictureControl ctrlSetText format ["data\gamble\slots\slot_%1.paa", ["zero", "one", "two", "three", "four", "five", "six", "seven"] select _number];

  sleep .5;

};

private _strTotal = (str _slotTotal) splitString '';

private _toMatch = _strTotal # 0;

// If it's a number that has one on each side (sandwiched by 1's) like 171
private _winnings = if (_toMatch isEqualTo _strTotal # 2 && !(_toMatch isEqualTo _strTotal # 1)) then {
  SANDWICH_BASE + ((parseNumber _toMatch) * (SANDWICH_BASE / 4))
}
else {
  _toMatch = _strTotal # 1;

  // If the number has two ones neighbouring each other (113, 311, 511, 115 etc.)
  if ({_toMatch isEqualTo _x} count [_strTotal # 0, _strTotal # 2] isEqualTo 1) then {
    NEIGHBOUR_BASE + ((parseNumber _toMatch) * (NEIGHBOUR_BASE / 4))
  }
  else {

    _toMatch = _strTotal # 0;

    private _toMatchNum = parseNumber _toMatch;
    // If the 3 digits are 'in order' like 345, 567 etc.
    if (_toMatchNum + 1 isEqualTo (parseNumber (_strTotal # 1)) && _toMatchNum + 2 isEqualTo (parseNumber (_strTotal # 2))) then {
      PRECEDING_BASE + (_toMatchNum * (PRECEDING_BASE / 3))
    }

    else {

      // If all digits are the same
      if (({_x isEqualTo _toMatch} count _strTotal) isEqualTo 3) then {
        EQUAL_BASE + (_toMatchNum * (EQUAL_BASE / 4))
      }

      // If all else fails, default to 0
      else {
        0
      }
    }

  }
};

//multiple winnings by bet amount
private _slotcash = _winnings * ( _bet / 1000 );

if (HAS_PERK("highRoller")) then {
	_slotcash = _slotcash * 1.1
};

[_slotCash, 0, 0, "Slots"] call PHX(handleMoney);

{ (_display displayCtrl _x) ctrlEnable true; } forEach [5778, 5782];
[format ["You bet £%1 and won £%2", [_bet] call life_fnc_numberText, _slotcash call life_fnc_numberText], "cyan"] call PHX(notify);
[player, format ["%1 (%2) won from a slot machine %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_slotCash] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_action_inUse = false;

[0] call SOCK_fnc_updatePartial;
