/*
	@File: fn_handleXP.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Increases and levels the player up...

	@Parameters:
		0 - TYPE: INTGER - DES: The XP to be added...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\HUD\macros.hpp"
params [
	["_xp", 0, [0]],
	["_reason", "Something", [""]]
];

if !(canSuspend) exitWith { _this spawn PHX(handleXP) };

if (player getVariable ["isAdmin", false]) exitWith {};
if (_xp < 1) exitWith {}; // Can't give lower than 1 Xp!
if (_reason isEqualTo "") then { _reason = "Something" };

if (IS_GOAL) then {
	_xp = _xp * 1.5
};

_xp = round(_xp);

PHX_XP = PHX_XP + _xp;

[format["You've gained %1 XP for <t color = '#8A2BE2'>%2</t>", _xp, _reason]] spawn PHX_fnc_notify;

#define MAXLVL (getNumber(missionConfigFile >> "CfgLevels" >> "maxLevel"))

private _level = switch true do {
    case (PHX_Level isEqualTo MAXLVL): { MAXLVL };
    default { (PHX_Level + 1) };
};

if !(isClass (missionConfigFile >> "CfgLevels" >> format["level_%1", _level])) exitWith { ["handleXP", format["Level %1 is not a thing"]] call PHX(logIt); };
private _neededXPFirst = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", _level] >> "expRequired");
private _XP = PHX_XP;
if (isNil "_XP") exitWith { ["handleXP", "XP is Nil"] call PHX(logIt); };

disableSerialization;

// Do we level up???
if (PHX_XP >= _neededXPFirst) then {
	if !(PHX_Level isEqualTo MAXLVL) then {
		_array = [_xp] call PHX_fnc_calculateLevel;
		PHX_Level = _array select 0;
		PHX_XP = _array select 1;

		[format["You are now <t color = '#8A2BE2'>level %1!</t>",PHX_Level]] spawn PHX_fnc_notify;

	} else {
		PHX_canPrestige = true;
	};
};

_level = switch true do {
    case (PHX_Level isEqualTo MAXLVL): { MAXLVL };
    default { (PHX_Level + 1) };
};
private _neededXP = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", _level] >> "expRequired");

if (PHX_XP >= _neededXP) then { PHX_XP = _neededXP; };

// XP Bar Handling...
private _bar = LIFEctrl(IDC_LIFE_BAR_XP);
private _xpPerc = (_XP / _neededXPFirst);

for "_i" from 0 to 1 step 0 do {
	if ((progressPosition _bar) >= _xpPerc || ((progressPosition _bar) >= 1)) exitWith {};
	_bar progressSetPosition ((progressPosition _bar) + 0.005);
	uiSleep 0.001;
};

_bar progressSetPosition (PHX_XP / _neededXP); // Fix it...

LIFEctrl(IDC_LIFE_XP_TEXT) ctrlSetStructuredText parseText format["<t align='left'>Level %1</t><t align='center'>%2 / %3</t><t align='right'>Level %4</t>", PHX_Level, [PHX_XP] call life_fnc_numberText, [_neededXP] call life_fnc_numberText, _level];

[] call SOCK_fnc_updateRequest;
