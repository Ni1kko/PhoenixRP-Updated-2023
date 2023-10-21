#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_higherLowerCashout.sqf
@    Author: Zyn
@    Credit: Sig
@    Description: Cashout if they hit a row
*/

private _currentCardPos = PHX_higherLower;
private _betAmount = PHX_gambleAmount;
private _win = 0;

if (_currentCardPos isEqualTo 5) then {
	_win = (_betAmount * 2);
	if (HAS_PERK("highRoller")) then {_win = _win * 1.1};

	[format["You bet £%1 and won £%2",[PHX_gambleAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
	[player, format ["%1 (%2) Won %3 playing Higher or Lower. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	if (_currentCardPos isEqualTo 10) then {
		_win = (_betAmount * 5);
		if (HAS_PERK("highRoller")) then {_win = _win * 1.1};

		[format["You bet £%1 and won £%2",[PHX_gambleAmount] call life_fnc_numberText,[_win] call life_fnc_numberText],"green"] call PHX(notify);
		[player, format ["%1 (%2) Won %3 playing Higher or Lower. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	};
};

[_win, 0, 0, "Higher Or Lower"] call PHX(handleMoney);
life_action_inUse = false;