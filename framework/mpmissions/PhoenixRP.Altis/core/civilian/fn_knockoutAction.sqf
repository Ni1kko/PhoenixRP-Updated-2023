#include "..\..\script_macros.hpp"
/*
    File: fn_knockoutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Knocks out the target.
*/
if !(params [["_target", objNull, [objNull]]]) exitWith {};

//Error checks
if (isNull _target || { !isPlayer _target } || { player distance _target > 4 } || { _target getVariable ["isAdmin",false] } || { [] call PHX_fnc_isSafeZone }) exitWith {};

life_knockout = true;
[player,"AwopPercMstpSgthWrflDnon_End2"] remoteExecCall ["life_fnc_animSync",RCLIENT];
sleep 0.08;
[_target,profileName] remoteExec ["life_fnc_knockedOut",_target];

sleep 3;
life_knockout = false;