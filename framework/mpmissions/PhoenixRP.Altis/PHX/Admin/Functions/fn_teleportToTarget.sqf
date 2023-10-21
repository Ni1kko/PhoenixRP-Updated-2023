/*
	@File: fn_teleportToTarget.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Does what it says on the tin...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if (_target isEqualTo player) exitWith { NOTIFY("You're unable to teleport to yourself.","red"); false};
if !(isNull objectParent player) exitWith { NOTIFY("You can't teleport to someone while you're within a vehicle.","red"); false};
// if !(isNull objectParent _target) exitWith { NOTIFY("You can't teleport someone within a vehicle.","red"); false};

[player, format ["%1 (%2) Teleported To %3 (%4) from position: %7 (Gridref: %8) - To position: %5 (Gridref: %6).",profileName,getPlayerUID player,_target getVariable ["realname",name _target],getPlayerUID _target,getPos player,mapGridPosition player,getPos _target,mapGridPosition _target], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

player setPos (getPos _target);

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]];