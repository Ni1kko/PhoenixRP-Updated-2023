#include "..\..\script_macros.hpp"
/*
    File: fn_pulloutAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls civilians out of a car if it's stopped.
*/

if (speed cursorObject > 10 || cursorObject getVariable ["locked",false]) exitWith {["You was unable to pull people out as the vehicle was moving too fast","red"] call PHX_fnc_notify;};

private _crew = crew cursorObject;

{
    if !(isDowned(_x)) then {
        _x setVariable ["Escorting",false,true];
        [] remoteExecCall ["life_fnc_pulloutVeh",_x];
    };
} forEach _crew;