/*
	@File: fn_wantedGrab.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets ready to grab crimes for someone on the wanted list...
*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"

private _criminal = call compile (lbData [IDC_WANTED_PEOPLE, lbCurSel IDC_WANTED_PEOPLE]);
if (isNil "_criminal") exitWith {};

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

private _list = _display displayCtrl IDC_WANTED_RECORD_LIST;

lbClear _list;
_list lbAdd "Retrieving Records...";
_list lbSetData [(lbSize _list)-1, "NoRecord"];

ctrlEnable [IDC_WANTED_REQUEST, false];

[player, _criminal] remoteExecCall (["fnc_wantedCrimes", "life"] call SOCK_fnc_getRemoteDestination);