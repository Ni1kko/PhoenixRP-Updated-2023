#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_scratchCard.sqf
@    Author: Zyn
@    Description: Handles a scratchcard
*/

#define BUTTON_BASE 17000

disableSerialization;
params [
  ["_button", 1, [0]]
];

playSound "scratchcard";

//--- Creates the scratch array if it doesn't already exist
if (isNil "PHX_scratchArray") then {
  private _arraySet = [];
  for "_i" from 0 to 8 do {_arraySet pushBack (ceil(random 17));};
  PHX_scratchArray = _arraySet;
};

//--- Gets the array, always initalised, so no need to check
private _array = PHX_scratchArray;

//--- Setting the icon
private _display = findDisplay 17000;
(_display displayCtrl (BUTTON_BASE + _button)) ctrlEnable false;
private _pictureControl = _display displayCtrl (BUTTON_BASE + _button);
_pictureControl ctrlSetText format ["data\gamble\scratchcard\icon_%1.paa", (_array select (_button - 1))];

//--- Getting the total, defaults to 0
private _total = 0;
if(!isNil "PHX_scratchTotal") then {
  _total = PHX_scratchTotal;
};

//--- Checks if all have been scratched and calculates, if not adds 1 to the total
if (_total isEqualTo 8) then {

  private _amountEach = 0;
  private _matched = 0;
  private _win = 0;

  for "_i" from 0 to 17 do {
    _amountEach = {_i isEqualTo _x} count _array;
    if (_amountEach >= 3) then {_matched = _matched + 1;};
  };

  if (_matched > 0) then {
    _win = _matched * 20000;
    [format["Congratulations! You won £%1", [_win] call life_fnc_numberText], "green"] call PHX(notify);
    [_win, 0, 0, "Scratchcard"] call PHX(handleMoney);
    [player, format ["%1 (%2) won from a scratch card %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

    [0] call SOCK_fnc_updatePartial;
  } else {
    ["You lost! Better luck next time!", "red"] call PHX(notify);
  };

} else {
  PHX_scratchTotal = (_total + 1);
};

