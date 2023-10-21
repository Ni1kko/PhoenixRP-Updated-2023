#include "..\..\script_macros.hpp"
/*
    File: fn_dragAction.sqf
    Author: Conner Merlin

    Description: Attaches the desired person(_unit) to the player(player) and "escorts them".
*/

params [
    ["_unit", objNull, [objNull]]
];

if (!isNull (player getVariable ["draggingPlayer",objNull])) exitWith {};
if (isNil "_unit" || {isNull _unit} || {!isPlayer _unit}) exitWith {};
if (player distance _unit > 3) exitWith {};

//--- Dragging Animation
player playaction "grabDrag";

//--- Stops people getting in vehicles
life_disable_getIn = true;

//--- Attach the player
_unit attachTo [player, [0.1,1.1,0]];
_unit setVariable ["Dragging", true, true];

player setVariable ["draggingPlayer", _unit];
player setVariable ["isDragging", true];

draggingActionId = player addAction ["Stop Dragging", {player removeAction (_this select 2); [] call PHX(stopDragging);}];
player reveal _unit;

[_unit] spawn {
    params [
        ["_unit", objNull, [objNull]]
    ];
    waitUntil {!(_unit getVariable ["Dragging",false])};
    player setVariable ["draggingPlayer",nil];
    player setVariable ["isDragging",false];
    if (!isNil "draggingActionId") then {player removeAction draggingActionId};

    //--- Stop dragging animation
    player switchMove "";
	life_disable_getIn = false;
};
