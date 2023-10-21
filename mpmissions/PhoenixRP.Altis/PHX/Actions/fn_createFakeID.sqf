/*
	@File: fn_createFakeID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to create a fake id card...
*/
#include "..\..\script_macros.hpp"
PHX_idCard_Submitted = false; // Default it...

createDialog "RscCreateID";

waitUntil { !(isNull (findDisplay 2000)) }; // Wait for the display...
private _display = (findDisplay 2000);

private _curName = name player;

private _nameInput = (_display displayCtrl 2001);
ctrlSetText[2001, _curName];

private _ageList = (_display displayCtrl 2002);
lbClear _ageList;
for "_age" from (LIFE_SETTINGS(getArray,"ageLimits") select 0) to (LIFE_SETTINGS(getArray,"ageLimits") select 1) step 1 do { _ageList lbAdd format["%1", _age]; _ageList lbSetData [(lbSize _ageList)-1, str _age]; };

private _genderList = (_display displayCtrl 2003);
lbClear _genderList;
{ _genderList lbAdd format[_x]; _genderList lbSetData [(lbSize _genderList)-1, _x]; } forEach (LIFE_SETTINGS(getArray,"genders"));

private _raceList = (_display displayCtrl 2004);
lbClear _raceList;
{ _raceList lbAdd format[_x]; _raceList lbSetData [(lbSize _raceList)-1, _x]; } forEach (LIFE_SETTINGS(getArray,"races"));

_ageList lbSetCurSel 0; _genderList lbSetCurSel 0; _raceList lbSetCurSel 0;

waitUntil { PHX_idCard_Submitted }; // Wait for them to submit...

_curName = ctrlText 2001;

if ((count _curName) > 24) exitWith {
	["The max length of your name is 24 characters...", "red"] spawn PHX(notify);
	closeDialog 0;
	this call PHX_fnc_createFakeID;
};

if (CASH < 15000) exitWith {
	["You lack the £15,000 required to buy a fake id...", "red"] spawn PHX(notify);
	closeDialog 0;
};
[15000, 1, 0, "Purchased Fake ID"] call PHX_fnc_handleMoney;
[player, format ["%1 (%2) created a fake ID for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[15000] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

PHX_ID = [
	PHX_UID, // UID / ID... (Used instead of SteamID as it's slightly more user friendly to type for Police)
	_curName, // Name...
	(lbData[2002, lbCurSel 2002]), // Age...
	(lbData[2003, lbCurSel 2003]), // Gender...
	(lbData[2004, lbCurSel 2004]), // Ethinicity
	true // Fake ID (Yes, No)...
];

player setVariable ["idCard", PHX_ID, true];
[getPlayerUID player, PHX_ID, player] remoteExec (["fnc_insertID", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

closeDialog 0; // Close the UI...

["Your fake id has been created...", "red"] spawn PHX(notify);