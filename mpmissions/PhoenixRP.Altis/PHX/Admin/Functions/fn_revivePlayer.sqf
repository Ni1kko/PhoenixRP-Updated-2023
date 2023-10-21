/*
	@File: fn_revivePlayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Revives the target player...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if !(isDowned(_target)) exitWith { NOTIFY("This target is already alive.","red"); false};

[player] remoteExecCall ["PHX_fnc_onRevived", _target];

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]];

[player, format ["%1 (%2) used admin revive on %3",profileName,getPlayerUID player,name _target], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);