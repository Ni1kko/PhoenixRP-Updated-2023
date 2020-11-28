#include "..\..\..\..\script_macros.hpp"
/*
*  @File: fn_placeableDelete.sqf
*  @Author: Zyn
*
*  Description:
*  Handles deleting a placeable from the menu
*/

if ((lbCurSel 20005) isEqualTo -1) exitWith {};
private _object = call compile format ["%1",CONTROL_DATA(20005)];
private _position = call compile format ["%1",CONTROL_VALUE(20005)];

PHX_barrier_placed deleteAt _position;

deleteVehicle _object;