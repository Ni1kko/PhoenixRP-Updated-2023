/*
 *  @File: fn_placeableCancel.sqf
 *  @Author: Maximum
 *	@Modified: blackfisch, Zyn
 *
 *  Description:
 *  Handles cancelling the current object
*/

if (isNil "PHX_barrier_active") exitWith {};

deleteVehicle PHX_barrier_active;
PHX_barrier_active = ObjNull;
