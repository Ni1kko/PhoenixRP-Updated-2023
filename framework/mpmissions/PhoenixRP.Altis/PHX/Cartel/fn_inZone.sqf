/*
	@File: fn_inZone.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns which cap zone we're in...
*/
scopeName "inZone";
params [["_unit", player, [objNull]]];

{
	if ((vehicle _unit) inArea (format["cartel_%1_CAP", (_x getVariable ["zCFG", ""])])) then {  _forEachIndex breakOut "inZone" };
} forEach PHX_capZones;

false