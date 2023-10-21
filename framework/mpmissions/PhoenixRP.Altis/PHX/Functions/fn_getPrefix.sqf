/*
	@File: fn_getPrefix.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the gang / faction prefix / tag for our player...
*/
#include "..\..\script_macros.hpp"

params [
    ["_unit", player, [objNull]]
];

private _prefix = switch true do {
	case (_unit getVariable ["isAdmin", false]): {""};
	case (side _unit isEqualTo west): {"[APC]"};
	case (side _unit isEqualTo independent): {"[NHS]"};
	case (side _unit isEqualTo east): {"[HAVOC]"};
	case (isSO1(_unit)): {"[SO1]"};
	case ((isNil {(group _unit) getVariable "gang_owner"}) || { (isNEW(_unit)) } || { (isLAW(_unit)) } || { (isTAX(_unit)) } || { (isSER(_unit)) } || { (isJUDGE(_unit)) }): {""};
	default {(group _unit) getVariable ["gang_tag", ""]};
};

if !(_prefix isEqualTo "") then { _prefix = format["%1 ", _prefix] };

_prefix