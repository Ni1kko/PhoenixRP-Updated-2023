/*
	@File: fn_vehicleRepair.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Repairs the targets vehicle...
*/
scopeName "vehicleRepair";
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]], ["_isTarget", true, [true]]];

private _target = objNull;
private _vehicle = cursorObject;

if (_isTarget) then {
	_target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

	if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid","red"); false breakOut "vehicleRepair" };
	if (isNull objectParent _target) exitWith { NOTIFY("This player is not currently within a vehicle","red"); false breakOut "vehicleRepair" };

	_vehicle = (vehicle _target);
};

_vehicle setDamage 0;

format[_msg, player getVariable ["realname", name player], _target getVariable ["realname", name _target]]