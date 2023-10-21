/*
    File: fn_wantedAddP.sqf
    Author:

    Description:

*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"

if !(playerSide isEqualTo west) exitWith {NOTIFY("Who do you think you are?","red");};
if ((lbCurSel IDC_WANTED_PEOPLE) isEqualTo -1) exitWith {NOTIFY("You must select a citizen.","red");};
if ((lbData [IDC_WANTED_PEOPLE,lbCurSel IDC_WANTED_PEOPLE]) isEqualTo "NoCitizens") exitWith {};
if ((lbCurSel IDC_WANTED_CRIME_LIST) isEqualTo -1) exitWith {NOTIFY("You must select a crime.","red");};
if ((lbData [IDC_WANTED_CRIME_LIST,lbCurSel IDC_WANTED_CRIME_LIST]) isEqualTo "NoCrimes") exitWith {};

// Settings...
private _unit = lbData [IDC_WANTED_PEOPLE,lbCurSel IDC_WANTED_PEOPLE];
_unit = call compile format ["%1",_unit];
private _amount = lbData [IDC_WANTED_CRIME_LIST,lbCurSel IDC_WANTED_CRIME_LIST];

// More Checks...
if (isNil "_unit") exitWith {};
if (isNull _unit || { (side _unit) isEqualTo east }) exitWith {};

[getPlayerUID _unit,_unit getVariable ["realname",name _unit],_amount, 0, true] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);

private _crimeName = _amount;

private _crimesConfig = getArray(missionConfigFile >> "Life_Settings" >> "crimes");
private _index = [_amount,_crimesConfig] call LIFE_fnc_index;

if !(_index isEqualTo -1) then {
    _crimeName = ((_crimesConfig select _index) select 0);
};

[player, format ["%1 (%2) was added to the wanted list for reason %3 by %4 (%5)",_unit getVariable ["realname",name _unit],getPlayerUID _unit,_crimeName,player getVariable ["realname",name player],getplayerUID player], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);