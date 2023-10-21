/*
	@File: fn_teleportToVehicle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Does what it says on the tin...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if (_target isEqualTo player) exitWith { NOTIFY("You're unable to teleport to yourself","red"); false};

if (isNull objectParent _target) exitWith { NOTIFY("You can't teleport someone into someone's vehicle when they're not in one","red"); false};
if !(isNull objectParent player) exitWith { NOTIFY("The person you're trying to teleport is in a vehicle so can't be teleported into another one","red"); false};

private _vehicle = (vehicle _target);

if (count (crew _vehicle) >= ((([(typeOf _vehicle)] call LIFE(fetchVehInfo)) select 10) + 1)) exitWith {
	NOTIFY("You can't teleport into this vehicle as it's full","red"); 
	false;
};

player moveInCargo _vehicle;
player moveInGunner _vehicle;

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]];

[player, format ["%1 (%2) joined %1 (%2) vehicle",profileName,(getPlayerUID player),_target getVariable ["realname", name _target], getPlayerUID _target], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);