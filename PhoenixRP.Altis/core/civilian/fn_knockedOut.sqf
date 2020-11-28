#include "..\..\script_macros.hpp"
/*
    File: fn_knockedOut.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts and monitors the knocked out state.
*/
params [
    ["_target",objNull,[objNull]],
    ["_who","",[""]]
];

if (isNull _target || {!(_target isEqualTo player)} || {_who isEqualTo ""}) exitWith {};

life_isknocked = true;

if (!(player getVariable ["Escorting",false])) then {
    detach player;
};

disableUserInput true;
player setUnconscious true;
player setVariable ["isKnockedOut", life_isknocked, true];
closeDialog 0;

private _time = time;

// Blurry effect...
_effectBlur = ppEffectCreate ["DynamicBlur", 300];
_effectBlur ppEffectEnable true;
_effectBlur ppEffectAdjust [2.5];
_effectBlur ppEffectCommit 3;
PHX_effects pushBack [_effectBlur];

[format ["%1 has knocked you out.",_who],"red"] call PHX_fnc_notify;

waitUntil{time - _time >= 10};

life_isknocked = false;
player setUnconscious false;
player setVariable ["isKnockedOut", life_isknocked, true];
disableUserInput false;

player setVariable ["robbed",false,true];

{ppEffectDestroy _x} forEach PHX_effects; // Remove Effects...

player playMoveNow "amovppnemstpsraswrfldnon";