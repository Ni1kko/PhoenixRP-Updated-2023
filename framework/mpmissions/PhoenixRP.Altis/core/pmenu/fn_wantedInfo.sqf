/*
    File: fn_wantedInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls back information about the wanted criminal.
*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"
params [
    ["_data", [], [[]]]
];

disableSerialization;

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

private _list = _display displayCtrl IDC_WANTED_RECORD_LIST;

if (isNil "_data" || { !(_data isEqualType []) } || { _data isEqualTo [] }) exitWith { NOTIFY("Failed to fetch crimes.","red") };

lbClear _list;

private _crimes = _data select 0;
private _crimesList = LIFE_SETTINGS(getArray,"crimes");

{
    _x params ["_crime", "_amount"];

    private _crimeName = _crimesList select (_crimesList findIf { (_x select 2) isEqualTo _crime }) select 0;

    if !(_crimeName isEqualTo "") then {
        _list lbAdd format ["%1 x %2", _crimeName, _amount];
        _list lbSetData [(lbSize _list)-1, _crime];
    };
} forEach _crimes;


if (((lbSize _list)-1) isEqualTo -1) then {
    _list lbAdd "No Record...";
    _list lbSetData [(lbSize _list)-1, "NoRecord"];
};

ctrlEnable [IDC_WANTED_REQUEST, true];