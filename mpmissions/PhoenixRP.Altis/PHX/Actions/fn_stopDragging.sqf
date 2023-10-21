#include "..\..\script_macros.hpp"
/*
    File: fn_stopDragging.sqf
    Author: Conner Merlin
    Description:
    Detaches player(_unit) from the Dragging(player) and sets them back down.
*/

private _unit = player getVariable ["draggingPlayer",objNull];
if (isNull _unit) then {_unit = cursorTarget;}; //Emergency fallback.
if (isNull _unit) exitWith {}; //Target not found even after using cursorTarget.
if !(_unit getVariable ["Dragging",false]) exitWith {}; //He's not being Dragged.

detach _unit;
_unit setVariable ["Dragging",false,true];
player setVariable ["draggingPlayer",nil];
player setVariable ["isDragging",false];