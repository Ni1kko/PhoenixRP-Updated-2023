/*
 *  @File: fn_placeablesPlaceComplete.sqf
 *  @Author: Maximum
 *	@Modified: blackfisch, Zyn
 *
 *  Description:
 *  Handles the main menu for placeables
*/

if (isNil "PHX_barrier_active") exitWith {};

private _currentPos = getPosATL PHX_barrier_active;
detach PHX_barrier_active;
PHX_barrier_active setPos [(getPos PHX_barrier_active select 0), (getPos PHX_barrier_active select 1), 0];
PHX_barrier_active enableSimulationGlobal false;
PHX_barrier_active allowDamage false;
PHX_barrier_placed pushBack PHX_barrier_active;
PHX_barrier_active = nil;
