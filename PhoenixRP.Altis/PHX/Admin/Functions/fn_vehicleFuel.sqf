/*
	@File: fn_vehicleFuel.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for refueling or emptying a vehicle...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]], ["_refuel", false, [true]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid","red"); false};
if (isNull objectParent _target) exitWith { NOTIFY("This player is not currently within a vehicle","red"); false};

[(objectParent _target), _refuel] remoteExecCall ["PHX_fnc_setFuel", _target];

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]];

[player, format ["%1 (%2) emptied the fuel of %3 (%4) vehicle",profileName,getPlayerUID player,_target,getPlayerUID _target], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);