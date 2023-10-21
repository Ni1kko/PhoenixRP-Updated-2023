/*
	@File: fn_onLoad.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Runs on switch application...
*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

private _playerList = (_display displayCtrl IDC_WANTED_PEOPLE);
lbClear _playerList;

{
    _playerList lbAdd (name _x);
    _playerList lbSetdata [(lbSize _playerList)-1, str(_x)];
} forEach (playableUnits select {
    isPlayer _x && 
    {!((name _x) isEqualTo "")} &&
    {side _x in [independent, civilian]}
});

if(((lbSize _playerList)-1) isEqualTo -1) then {
    _playerList lbAdd "No Citizens...";
    _playerList lbSetData [(lbSize _playerList)-1, "NoCitizens"];
};

private _crimes = LIFE_SETTINGS(getArray,"crimes");

private _crimeList = (_display displayCtrl IDC_WANTED_CRIME_LIST);
lbClear _crimeList;

{
    if !((_x select 3) isEqualTo 1) then {
        _crimeList lbAdd (_x select 0);
        _crimeList lbSetdata [(lbSize _crimeList)-1, (_x select 2)];
        _crimeList lbSetTooltip [(lbSize _crimeList)-1, (_x select 0)];
    };
} forEach _crimes;

if(((lbSize _crimeList)-1) isEqualTo -1) then {
    _crimeList lbAdd "No Crimes...";
    _crimeList lbSetData [(lbSize _crimeList)-1, "NoCrimes"];
};

if (FETCH_CONST(life_coplevel) < 3) then {
    ctrlShow[IDC_WANTED_ADD, false];
    ctrlShow[IDC_WANTED_PARDON, false];
};

lbClear (_display displayCtrl IDC_WANTED_RECORD_LIST); // Wipe Records...

[IDD_TABLET_MAIN, IDC_WANTED_PEOPLE, IDC_WANTED_SEARCH, "setup"] call PHX(searchList);
CONTROL(IDD_TABLET_MAIN, IDC_WANTED_SEARCH) ctrlAddEventHandler ["KeyUp", {[IDD_TABLET_MAIN, IDC_WANTED_PEOPLE, IDC_WANTED_SEARCH, "search"] call PHX(searchList);}];