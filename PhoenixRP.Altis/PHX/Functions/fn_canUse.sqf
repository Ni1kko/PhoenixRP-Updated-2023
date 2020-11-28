/*
	@File: fn_canUse.sqf
  
	@Author: Jack "Scarso" Farhall
	@Credit: Sig - Based upon his script...
  
	@Description: Returns whether or not we're able to perform a certain action...
*/
#include "..\..\script_macros.hpp"
params [
	["_midAction", false, [false]], 
	["_cantMove", false, [false]],
	["_inVehicle", false, [false]]
];

(life_action_inUse && !_midAction) ||
{ life_interrupted && _midAction && _cantMove } ||
{ !_inVehicle && (!isNull (objectParent player)) } ||
{ isDowned(player) || !alive player } ||
{ isRestrained(player) } ||
{ player getVariable ["playerSurrender", false] } ||
{ player getVariable ["isTazed", false] } ||
{ player getVariable ["isKnockedOut", false] }