#include "..\..\script_macros.hpp"
/*
    File: fn_surrender.sqf
    Author:

    Description: Causes player to put their hands on their head.
*/
if ( (isRestrained(player)) || {player getVariable ["Escorting",false]} || {player getVariable ["isDragging",false]} || {vehicle player != player} || {speed player > 1 } ) exitWith {};

if (player getVariable ["playerSurrender",false]) then {
    player setVariable ["playerSurrender",false,true];
} else {
    player setVariable ["playerSurrender",true,true];
};

while {player getVariable ["playerSurrender",false]} do {
    player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
    if (!alive player || !(isNull objectParent player) || isDowned(player)) then { player setVariable ["playerSurrender",false,true]; };
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
