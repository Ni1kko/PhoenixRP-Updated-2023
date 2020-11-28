/*
	@File: fn_reiveAll.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Revives all dead people...
*/
scopeName "reviveAll";
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if !(canSuspend) exitWith { _this spawn PHX(reviveAll); false breakOut "reviveAll" };

private _action = [
    "Are you sure you want to revive all?",
    "Revive All",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

if (_action) then {
	closeDialog 0;
	{
		[player] remoteExecCall ["PHX_fnc_onRevived", _x];
		sleep 0.01;
	} forEach (playableUnits select {(isDowned(_x))});
	["Admin revived all players!", "cyan"] spawn PHX(notify);
	[player, format ["%1 (%2) revived all players",profileName,getPlayerUID player], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};