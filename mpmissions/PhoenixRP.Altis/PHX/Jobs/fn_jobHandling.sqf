/*
	@File: fn_jobHandling.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks us into and out of a job...
*/
scopeName "jobHandler";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgJobs"
if !(params ["","","",["_params", [], [[]]]]) exitWith {systemChat str _this};

_params params [["_job", "", [""]], ["_checkin", "false", [""]]];

_checkin = call compile _checkin; // Convert string bool into an actual bool...

if !(isClass (CFG >> _job)) exitWith {systemChat "Job does not exist?"};
if (PHX_isPM) exitWith {};

private _short = (getText(CFG >> _job >> "short"));

[] call LIFE(saveGear);

if (_checkin) then {
	if ((isCID(player)) || 
		{ (isHSS(player)) } ||
		{ (isNEW(player)) } ||
		{ (isLAW(player)) } ||
		{ (isTAX(player)) } ||
		{ (isSER(player)) } || 
		{ (isSO1(player)) } ||
		{ (isJUDGE(player)) }
	) exitWith {NOTIFY("You're already on-duty","red"); breakOut "jobHandler"};

	if ((getNumber(CFG >> _job >> "isGroup")) isEqualTo 1) then {
		if (count life_gangData > 0) then {
			life_gangData = [
				grpPlayer getVariable ["gang_id", -1],
				grpPlayer getVariable ["gang_owner",(getPlayerUID player)],
				grpPlayer getVariable ["gang_name", ""],
				grpPlayer getVariable ["gang_tag", ""],
				grpPlayer getVariable ["gang_maxMembers", 8],
				grpPlayer getVariable ["gang_bank", 0],
				((player getVariable ["gangDetails", [-1, 0]]) select 1),
				grpPlayer getVariable ["gang_tax", 0],
				grpPlayer getVariable ["gang_perks", []],
				grpPlayer getVariable ["gang_level", 1],
				grpPlayer getVariable ["gang_xp", 0],
				grpPlayer getVariable ["gang_ranks", []],
				grpPlayer getVariable ["gang_allies", []],
				grpPlayer getVariable ["gang_members", []]
			];
		};

		[_short] call PHX(jobGroup);
	};
} else {
	if ((getNumber(CFG >> _job >> "isGroup")) isEqualTo 1) then {
		if (!(life_gangData isEqualTo []) && { !(isCID(player)) } && { !(isHSS(player)) }) then {
            [] spawn PHX_fnc_initGang;
        };
	};
};

life_paycheck = [] call PHX_fnc_getPaycheck;
player setVariable [("is" + _short), _checkin, true];
player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
[] call LIFE(loadGear);
[format["You're %2 as a %1", (getText(CFG >> _job >> "title")), (["now on-duty", "no longer on-duty"] select (!_checkin))],"cyan"] call PHX_fnc_notify;