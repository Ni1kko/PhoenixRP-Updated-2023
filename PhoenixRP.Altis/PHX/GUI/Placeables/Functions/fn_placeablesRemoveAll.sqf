/*
 *  @File: fn_placeablesRemoveAll.sqf
 *  @Author: Maximum
 *	@Modified: blackfisch, Zyn
 *
 *  Description:
 *  Deletes all active placeables
*/

{
	deleteVehicle _x;
} forEach (PHX_barrier_placed);

PHX_barrier_placed = [];