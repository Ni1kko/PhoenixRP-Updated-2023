/*
	@File: fn_handleGangXP.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Increases and levels the gang up...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgGangs"
params [
	["_xp", 0, [0]],
	["_reason", "Something", [""]]
];

if !(canSuspend) exitWith { _this spawn PHX(handleGangXP) };

private _group = grpPlayer;
		
if (isNil {_group getVariable "gang_owner"}) exitWith {};
if (player getVariable ["isAdmin", false]) exitWith {};

if (_xp < 1) exitWith {}; // Can't give lower than 1 Xp!
if (_reason isEqualTo "") then { _reason = "Something" };

private _curXP = (_group getVariable ["gang_xp", 0]);
private _curLVL = (_group getVariable ["gang_level", 1]);

if (IS_GOAL) then {
	_xp = _xp * 1.5
};

_curXP = _curXP + _xp;

[format["You've gained %1 Gang XP for <t color = '#8A2BE2'>%2</t>", _xp, _reason]] spawn PHX_fnc_notify;

private _reqXP = round((getNumber(CFG >> "baseXP")) * _curLVL) * (getNumber(CFG >> "xpMultiplier"));

if (_curXP >= _reqXP) then {
	if (_curLVL >= (getNumber(CFG >> "maxLevel"))) then {
		_curXP = _reqXP; // We're already maxed out...
	} else {

		for "_i" from 0 to 1 step 0 do {
			_curLVL = _curLVL + 1;

			[format["Your gang is now <t color = '#8A2BE2'>level %1!</t>", _curLVL]] spawn PHX_fnc_notify;

			_curXP = _curXP - _reqXP;

			if (_curXP < 0) then { _curXP = 0 };

			_reqXP = round((getNumber(CFG >> "baseXP")) * _curLVL) * (getNumber(CFG >> "xpMultiplier"));

			if (_curLVL >= (getNumber(CFG >> "maxLevel")) || { _curXP < _reqXP }) exitWith {};
		};

		_group setVariable ["gang_level", _curLVL, true];
		[14, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
	};
};

_group setVariable ["gang_xp", _curXP, true];
[15, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);