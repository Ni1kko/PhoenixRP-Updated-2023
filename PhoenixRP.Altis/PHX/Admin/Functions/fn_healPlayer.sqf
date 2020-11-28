/*
	@File: fn_healPlayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Heals and refills Food/Water for the target on our admin menu...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };
if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};

[] remoteExecCall ["PHX_fnc_healTarget", _target];

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]]