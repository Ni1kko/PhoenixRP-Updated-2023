/*
	@File: fn_enlist.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Enlist ourselves into the election...
*/
scopeName "enlist";
#include "..\..\script_macros.hpp"
disableSerialization;

_display = findDisplay 3100;
if(isNull _display) exitWith {/*systemChat "How'd you even run this script?"*/};

_candidateDes = ctrlText 3107;
_partyData = lbData[3109, lbCurSel 3109];

// Checks...
if ((count _candidateDes) > 64) exitWith {["You're limited to a max of 64 characters in your candidate description...", "red"] spawn PHX(notify)};

if !(HAS_GANG_PERK("Political", (grpPlayer))) then {
	private _price = 300000;
	// Can we even afford this?
	if (_price > BANK) exitWith {["You reqire £300,000 to enlist in the next General Election...", "red"] spawn PHX(notify); breakOut "enlist"};
	[_price, 1, 1, "Enlistment Fee"] call PHX(HandleMoney); // Take my money (From the bank)!
	[player, format ["%1 (%2) paid %3 to elist. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

if (_candidateDes isEqualTo "") then { _candidateDes = "No Description Given..." };

// Let the server handle the rest...
[
	1, (name player), _candidateDes, (getPlayerUID player)
] remoteExecCall (["fnc_addOption", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

closeDialog 0;