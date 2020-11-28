/*
*   @File: fn_capturedClient.sqf
*   @Author: Sig
*
*   Description: Fires whenever the random cartel is catpured, to a random unit
*   in the zone.
*
*   Arguments:
*     0 <TYPE: NUMBER> - Amount of money the client recieves
*/

#include "..\..\..\script_macros.hpp"

if (!params [["_money", 0, [0]]]) exitWith {};

// -- Log it
[player, format ["%1 (%2) Captured a cartel and recieved a %3 payout", name player, getPlayerUID player, [_money] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

// -- Give them the money in cash
[_money, 0, 0, "Captured Cartel"] call PHX(handleMoney);
["Prof_Capturing",1,50] call PHX(increaseProfession);

// -- Notify them that they are now rich lads
[format ["You have recieved £%1 for capturing the cartel!", [_money] call life_fnc_numberText]] call PHX(notify);
