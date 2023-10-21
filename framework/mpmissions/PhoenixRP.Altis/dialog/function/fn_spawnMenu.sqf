/*
    File: fn_spawnMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the spawn point selection menu.
*/
#include "..\..\script_macros.hpp"
private ["_spCfg","_sp","_ctrl"];
disableSerialization;

if !(canSuspend) exitWith {[] spawn life_fnc_spawnMenu};

[true] call PHX_fnc_initBacking;

if (PHX_ID isEqualType 0 && { !(playerSide isEqualTo east) }) then {
    PHX_idCard_Submitted = false; // Default it...

    createDialog "RscCreateID";

    waitUntil { !(isNull (findDisplay 2000)) }; // Wait for the display...
    private _display = (findDisplay 2000);
    _display displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

    private _realName = name player;

    private _nameInput = (_display displayCtrl 2001);
    ctrlSetText[2001, _realName];
    ctrlEnable [2001, false];

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

    PHX_ID = [
        PHX_UID, // UID / ID... (Used instead of SteamID as it's slightly more user friendly to type for Police)
        _realName, // Name...
        (lbData[2002, lbCurSel 2002]), // Age...
        (lbData[2003, lbCurSel 2003]), // Gender...
        (lbData[2004, lbCurSel 2004]), // Ethinicity
        false // Fake ID (Yes, No)...
    ];

    player setVariable ["idCard", PHX_ID, true];
    [getPlayerUID player, PHX_ID, player] remoteExec (["fnc_insertID", "PHXSRV"] call SOCK_fnc_getRemoteDestination); // Insert my ID...

    closeDialog 0; // Close the UI...
};

if (life_is_arrested) exitWith { [true] call PHX_fnc_respawned };

if (life_firstSpawn) then { player setVariable ["spawning", true, true] };

{ if !(_x getVariable ["isInvisibile", false]) then { _x hideObject false }; true } count (playableUnits select {isPlayer _x && { !(_x isEqualTo player) }});

if (!(createDialog "life_spawn_selection")) exitWith { [] call life_fnc_spawnMenu};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = [playerSide] call life_fnc_spawnPointCfg;

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
    _ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
    _ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
    _ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} forEach _spCfg;

_ctrl lbSetCurSel 0;
_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format ["%2: %1",_sp select 1,"Current Spawn Point"]];