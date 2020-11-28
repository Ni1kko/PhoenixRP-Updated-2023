/*
	@File: fn_increaseProfession.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Increases the value of the given profession.

	@Parameters:
		0 - TYPE: STRING - DES: Name of the profession class
		1 - TYPE: INTGER - DES: The amount we're either decreasing or increasing by
		2 - TYPE: INTGER - DES: The chance of increasing our profession
		3 - TYPE: INTGER - DES: 0: Increase 1: Decrease
*/
#include "..\..\script_macros.hpp"
params [
	["_prof", "", [""]],
	["_val", 0, [0]],
	["_chance", 100, [0]],
	["_mode", 0, [0]]
];

if (_prof isEqualTo "" || {_val isEqualTo 0} || {_mode < 0 || _mode > 1} ||{player getVariable ["isAdmin", false]}) exitWith {};
if !(isClass (missionConfigFile >> "CfgProfessions" >> _prof)) exitWith { systemChat "Profession does not exist." };

private _levelUp = false;

// Get Profession Info...
private _displayName = M_CONFIG(getText,"CfgProfessions",_prof,"displayName");
private _maxLevel = M_CONFIG(getNumber,"CfgProfessions",_prof,"maxLevel");
private _curLevel = PROF_LVL(_prof);
private _usePrestigeBonus = M_CONFIG(getNumber,"CfgProfessions",_prof,"allowPrestigeBonus");

if (_curLevel isEqualTo _maxLevel) exitWith { SVAR_MNS [_prof,_maxLevel]; }; // Don't increase our level if we're already maxed out!

// Is our chance good?
if (_chance >= 100) then { _levelUp = true; } else {
	if (HAS_PERK("quickLearner")) then { _chance = _chance + 10 }; // If they have the perk increase the chances by 10%
	if (PHX_prestigeLevel > 0) then { _chance = _chance + (round(10 * PHX_prestigeLevel)) }; // Prestige Bonus...
	if (_chance > 100) then { _chance = 100 }; // Check to ensure it's not over 100% chance...

	if ((floor (random 100)) <= _chance) then {	_levelUp = true; };
};

// If we did get the correct chance of a level change then subtract or add the value.
private _newLevel = 0;
if (_levelUp) then {
	_newLevel = _curLevel;

	switch (_mode) do {
		case 0: {
			// if (_usePrestigeBonus isEqualTo 1 && { PHX_prestigeLevel > 0 }) then { _val = (round(_val * (PHX_prestigeLevel / 2))) };

			_newLevel = _newLevel + _val;
			if (_newLevel >= _maxLevel) then {_newLevel = _maxLevel};
		};
		case 1: {
			_newLevel = _newLevel - _val;
			if (_newLevel <= 0) then {_newLevel = 0};
		};
	};

	SVAR_MNS [_prof,_newLevel]; // Set the variable...
	
	private _lvl = (GVAR_MNS [_prof, _newLevel]);

	[format["Your %1 Profession is now level <t color = '#8A2BE2'>%2</t>", _displayName, _lvl]] spawn PHX_fnc_notify;
	[(2 * _lvl), "Increased a Profession"] call PHX_fnc_handleXP;

	[] call SOCK_fnc_updateRequest; // Force Sync!
};