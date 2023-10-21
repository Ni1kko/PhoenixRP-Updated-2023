#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
/*
    File: fn_hudSetup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Setups the hud for the player?
*/
disableSerialization;

["RscPlayerHUD"] call PHXUI_fnc_createLayer;

[] call PHX_fnc_hudUpdate;

[] spawn
{
    private ["_dam"];
    for "_i" from 0 to 1 step 0 do {
        _dam = damage player;
        _money = CASH;
        waitUntil {!((damage player) isEqualTo _dam) || !(CASH isEqualTo _money)};
        [] call PHX_fnc_hudUpdate;
    };
};

// SETUP XP UI (Initial)...
#define MAXLVL (getNumber(missionConfigFile >> "CfgLevels" >> "maxLevel"))

private _level = switch true do {
    case (PHX_Level isEqualTo MAXLVL): { MAXLVL };
    default { (PHX_Level + 1) };
};

private _neededXP = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", _level] >> "expRequired");

// Progression
LIFEctrl(IDC_LIFE_BAR_XP) progressSetPosition (PHX_XP / _neededXP);

// Text
LIFEctrl(IDC_LIFE_XP_TEXT) ctrlSetStructuredText parseText format["<t align='left'>Level %1</t><t align='center'>%2 / %3</t><t align='right'>Level %4</t>", PHX_Level, [PHX_XP] call life_fnc_numberText, [_neededXP] call life_fnc_numberText, _level];