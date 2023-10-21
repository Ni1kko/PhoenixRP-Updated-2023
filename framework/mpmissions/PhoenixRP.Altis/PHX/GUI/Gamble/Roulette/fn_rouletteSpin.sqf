#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_rouletteBet.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Takes bet, spins wheel and pays out
*/

params [
  ["_colour", 1, [0]]
];

private _display = findDisplay 15000;
{ (_display displayCtrl _x) ctrlEnable false; } forEach [15006, 15007, 15008];

private _betAmount = PHX_gambleAmount;
private _control = _display displayCtrl 15005;

playSound "roulette";

//--- Spin the wheel once
for "_i" from 0 to 359 step 3 do {
  _control ctrlSetAngle [_i,0.5,0.5];
  sleep 0.005;
};

private _number = ceil(random 37);

//-- Spin the wheel upto the number
for "_i" from 0 to (round((_number * 9.75) - 10)) step 2 do {
  _control ctrlSetAngle [_i,0.5,0.5];
  sleep 0.01;
};

private _colourMatch = 0;

if (_number in [3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37]) then {
  _colourMatch = 1;
} else {
  if (_number in [2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36]) then {
    _colourMatch = 2;
  } else {
    if (_number isEqualTo 0 || _number isEqualTo 1) then {
      _colourMatch = 3;
    };
  };
};

private _win = 0;

if ((_colour isEqualTo _colourMatch) && _colourMatch != 3) then {
  _win = _betAmount * 2;

  if (HAS_PERK("highRoller")) then {
    _win = _win * 1.1
  };

  [format["You bet £%1 and won £%2",[_betAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
  [player, format ["%1 (%2) Won %3 on a game of Roulette. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
  [_win, 0, 0, "Roulette"] call PHX(handleMoney);
} else {
  if ((_colour isEqualTo _colourMatch) && _colourMatch isEqualTo 3) then {
    _win = _betAmount * 14;

    if (HAS_PERK("highRoller")) then {
      _win = _win * 1.1
    };

    [format["You bet £%1 and won £%2",[_betAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
    [player, format ["%1 (%2) Won %3 on a game of Roulette. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    [_win, 0, 0, "Roulette"] call PHX(handleMoney);
  } else {
    ["You lost! Better luck next time","red"] call PHX(notify);
    [player, format ["%1 (%2) Lost %3 on a game of Roulette. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_betAmount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
  };
};

life_action_inUse = false;

[0] call SOCK_fnc_updatePartial;

ctrlEnable[15001,true];
ctrlEnable[15002,true];