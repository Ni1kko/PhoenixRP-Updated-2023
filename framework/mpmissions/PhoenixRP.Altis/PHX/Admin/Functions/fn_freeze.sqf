/*
	@File: fn_freeze.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Freezes the selected players input...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if (_target isEqualTo player) exitWith { NOTIFY("You're unable to freeze your input.","red"); false};

[player, _msg] remoteExecCall ["life_fnc_freezePlayer", _target];

["You froze / unfroze %1s input",_target getVariable ["realname", name player],"cyan"] call PHX_fnc_notify;

false