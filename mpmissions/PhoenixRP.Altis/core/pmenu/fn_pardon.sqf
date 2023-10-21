/*
    File: fn_pardon.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pardons the selected player.
*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"
disableSerialization;

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

// Getting Player...
if ((lbCurSel IDC_WANTED_PEOPLE) isEqualTo -1) exitWith { ["You've not selected a criminal to pardon.", "red"] spawn PHX_fnc_notify };
private _player = lbData[IDC_WANTED_PEOPLE,(lbCurSel IDC_WANTED_PEOPLE)];
_player = call compile format["%1", _player];

if (isNil "_player") exitWith {};
if (isNull _player) exitWith {};

// Getting Crime...
if ((lbCurSel IDC_WANTED_RECORD_LIST) isEqualTo -1) exitWith { ["You've not selected a crime to pardon.", "red"] spawn PHX_fnc_notify };
private _crime = lbData[IDC_WANTED_RECORD_LIST,(lbCurSel IDC_WANTED_RECORD_LIST)];

if (isNil "_crime" || { _crime isEqualTo "NoRecord" }) exitWith {};

[getPlayerUID _player, _crime, 1, player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);