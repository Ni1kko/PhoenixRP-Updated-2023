/*
	@File: fn_healAll.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Heals all
*/
scopeName "healAll";
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if !(canSuspend) exitWith { _this spawn PHX(healAll); false breakOut "healAll" };

private _action = [
    "Are you sure you want to heal all?",
    "Heal All",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

if (_action) then {
	closeDialog 0;
	{
		[] remoteExecCall ["PHX_fnc_healTarget", _x];
		sleep 0.01;
	} forEach (playableUnits select {!(isDowned(_x))});
	["Admin healed all players!", "cyan"] spawn PHX(notify);
	[player, format ["%1 (%2) healed all players",profileName,getPlayerUID player], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};