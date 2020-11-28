#include "..\..\script_macros.hpp"
/*
    File: fn_restrain.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the client.
*/

params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};

//Monitor excessive restrainment
[] spawn {
    private "_time";
    for "_i" from 0 to 1 step 0 do {
        _time = time;
        waitUntil {(time - _time) > (5 * 60)};

        if !(isRestrained(player)) exitWith {};
        if (!([(player getVariable ["restrained",sideUnknown]),getPos player,30] call life_fnc_nearUnits) && { (isRestrained(player)) } && { isNull objectParent player }) exitWith {
            player setVariable ["restrained",sideUnknown,true];
            player setVariable ["Escorting",false,true];
            detach player;
            NOTIFY("You have been released automatically for excessive restrainment time.","cyan");
        };
    };
};

[format["You have been restrained by %1",_unit getVariable ["realname",name _unit]],"cyan"] call PHX_fnc_notify;

life_disable_getIn = true;
life_disable_getOut = false;

private _vehicle = vehicle player;

while {(isRestrained(player))} do {
    if (isNull objectParent player) then {
        player playMove "AmovPercMstpSnonWnonDnon_Ease";
    };

    _vehicle = vehicle player;
    waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(isRestrained(player)) || (vehicle player != _vehicle)};

    if (!alive player || {(isDowned(player))}) exitWith {
        player setVariable ["restrained",sideUnknown,true];
        player setVariable ["Escorting",false,true];
        detach player;
    };

    if (!alive _unit) then {
        player setVariable ["Escorting",false,true];
        detach player;
    };

    if (!(isNull objectParent player) && {life_disable_getIn}) then {
        player action["eject",vehicle player];
    };

    if (!(isNull objectParent player) && {!(vehicle player isEqualTo _vehicle)}) then {
        _vehicle = vehicle player;
    };

    if (isNull objectParent player && {life_disable_getOut}) then {
        player moveInCargo _vehicle;
    };

    if (!(isNull objectParent player) && {life_disable_getOut} && {(driver (vehicle player) isEqualTo player)}) then {
        player action["eject",vehicle player];
        player moveInCargo _vehicle;
    };

    if (!(isNull objectParent player) && {life_disable_getOut}) then {
        _turrets = [[-1]] + allTurrets _vehicle;
        {
            if (_vehicle turretUnit [_x select 0] isEqualTo player) then {
                player action["eject",vehicle player];
                sleep 1;
                player moveInCargo _vehicle;
            };
        }forEach _turrets;
    };
};

//disableUserInput false;

if (alive player) then {
    player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
    player setVariable ["Escorting",false,true];
    detach player;
};