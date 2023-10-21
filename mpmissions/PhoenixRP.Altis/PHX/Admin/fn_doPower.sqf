/*
	@File: fn_doPower.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Adds and controls all staff powers.
*/
scopeName "fnc_adminPower";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgPowers"
params [
	["_power", "", [""]]
];

if (_power IsEqualTo "") exitWith {};

private _notify = false;

if !(isClass (CFG >> _power)) exitWith { NOTIFY("No such power","red") };

private _thisPower = CFG >> _power;
private _reqLevel = (getNumber (_thisPower >> "reqLevel"));
private _notify = [false,true] select (getNumber (_thisPower >> "notify") isEqualTo 1);
private _msg = (getText (_thisPower >> "message"));

if (FETCH_CONST(life_adminlevel) < _reqLevel) exitWith { [format["You are not a high enough member of staff to use this..."],"red"] call PHX_fnc_notify };
if (!(player getVariable ["isAdmin", false]) && { (getNumber (_thisPower >> "onDuty")) isEqualTo 1 }) exitWith { ["You must be on-duty to use this","red"] call PHX_fnc_notify };
if !([getText(_thisPower >> 'conditions')] call life_fnc_levelCheck) exitWith { NOTIFY("You don't meet the conditions to use this power","red") };

if !((getNumber (_thisPower >> "dialogs")) isEqualTo 1) then { 
	[] spawn {
		while {dialog} do {
			closeDialog 0;
			sleep 0.01;
		};
	}; 
};

if ((getText(_thisPower >> 'function')) isEqualTo "") then { _msg = false; NOTIFY("No such power","red"); };

_msg = (call compile (getText(_thisPower >> 'function')));

if !(_msg isEqualType "") exitWith {};

[_notify, _msg] call PHX(logUsage);