/*
	@File: fn_unlockAchievement.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Unlocks the given achievement.
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgAchievements"
if !(params [["_achievement", "", [""]]]) exitWith {};

if !(canSuspend) exitWith {_this spawn PHX(unlockAchievement)};

waitUntil { life_session_completed };

if (player getVariable ["isAdmin",false] || { ACH_UNLOCKED(_achievement) }) exitWith {};

private _thisCfg = (CFG >> _achievement);

private _displayName = (getText(_thisCfg >> "displayName"));
private _rewards = (getArray(_thisCfg >> "rewards"));

private _unlockMessage = [];
_unlockMessage pushBack (getText(_thisCfg >> "unlockMessage"));

if (count(_rewards) > 0) then {
	_unlockMessage pushBack "<br/><t color='#FF8C00'>Rewards:<t color='#c4c4c4'><br/>";
	{
		switch(_x select 0) do {
			case "MONEY": {
				private _amount = _x select 1 select 1;
				[_amount, 0, (_x select 1 select 0), "Achievement Reward", true] call PHX(handleMoney);
				[player, format ["%1 (%2) was given %3 for a achivement. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_amount] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
				_unlockMessage pushBack format["   - £%1<br/>", [_amount] call LIFE(numberText)];
			};
			case "XP": {
				private _xp = _x select 1;
				[_xp, format["Unlocking %1", _displayName]] spawn PHX(handleXP);
				_unlockMessage pushBack format["   - %1 XP<br/>", _xp];
			};
		};
	} forEach _rewards;
	_unlockMessage pushBack "</t></t>";
};

_unlockMessage = _unlockMessage joinString "";	

[format["%1", _unlockMessage], "black", "Achievement Unlocked"] spawn PHX_fnc_notify;
playSound "FD_Finish_F";

PHX_Achievements pushBackUnique _achievement;
[10] call DB(updatePartial);