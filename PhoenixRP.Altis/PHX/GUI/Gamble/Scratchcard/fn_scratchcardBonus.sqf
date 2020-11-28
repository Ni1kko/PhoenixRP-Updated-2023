#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_scratchCard.sqf
@    Author: Zyn
@    Description: Handles bonus for scratchcards
*/

private _display = findDisplay 17000;
(_display displayCtrl 17010) ctrlEnable false;

playSound "scratchcard";

private _number = (ceil(random 17));
private _pictureControl = _display displayCtrl 17010;
_pictureControl ctrlSetText format ["data\gamble\scratchcard\icon_%1.paa", _number];

if (_number isEqualTo 17) then {
	private _win = 100000;
	[format["Congratulations! You won £%1", [_win] call life_fnc_numberText], "green"] call PHX(notify);
	[_win, 0, 0, "Scratchcard"] call PHX(handleMoney);
	[player, format ["%1 (%2) won from a scratch card bonus %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_win] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	["You lost! Better luck next time!", "red"] call PHX(notify);
};
