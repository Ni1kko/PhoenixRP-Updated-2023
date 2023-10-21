/*
	@File: fn_unitsInZone.sqf
	@Author: Jack "Scarso" Farhall
	@Credit: Sig 
	@Description:
*/
#include "..\..\script_macros.hpp"
params [
	["_marker", "", [""]],
	["_side", grpNull, [sideEmpty, grpNull]],
	["_include", false, [false]],
	["_specialCond", "true", [""]]
];

private _condition = switch true do {
	case (_side isEqualType sideEmpty): { [ "!(side _x isEqualTo _side)", "(side _x isEqualTo _side)" ] select _include };
	case (_side isEqualType grpNull): { [ "!(group _x isEqualTo _side)", "(group _x isEqualTo _side)" ] select _include };
};

(playableUnits select {
	call compile _specialCond &&
	{call compile _condition} &&
	{_x inArea _marker} &&
	{!(isDowned(_x))} &&
	{!isNull _x} &&
	{alive _x} &&
	{!(_x getVariable ["isAdmin", false])} &&
	{isNull objectParent _x} &&
	{!(currentWeapon _x isEqualTo "")} &&
	{!(currentWeapon _x in ["Rangefinder", "Binocular"])}
})