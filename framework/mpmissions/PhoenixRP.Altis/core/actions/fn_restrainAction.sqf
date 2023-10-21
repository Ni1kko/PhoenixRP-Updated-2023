/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Restrains the target.
*/
scopeName "restrainAction";
#include "..\..\script_macros.hpp"
params [["_unit", cursorObject, [objNull]]];

if (isNull _unit || { !isPlayer _unit } || { player isEqualTo _unit } || { (_unit getVariable ["isAdmin", false]) } || { isRestrained(player) } || { isRestrained(_unit) } || { playerSide isEqualTo independent }) exitWith {};

if (((player distance _unit) > 50) && { (player getVariable ["isAdmin", false]) }) exitWith {};

private _side = playerSide;

if !(player getVariable ["isAdmin", false]) then {
    if ((player distance _unit) > 3) exitWith {breakOut "restrainAction"};
    
    if (playerSide in [east, civilian]) then {

        if (ITEM_VALUE("zipties") < 1 && { !(HAS_PERK("cuffCourtier")) }) then {
            NOTIFY("You don't any zipties!","red");
            breakOut "restrainAction";
        };

        if !(HAS_PERK("cuffCourtier")) then {
            [false,"zipties",1] call life_fnc_handleInv;
        };
    };
} else {
    _side = west; // Force West for admins...
};

_unit setVariable ["playerSurrender",false,true];
_unit setVariable ["restrained",_side,true];
[player] remoteExec ["life_fnc_restrain",_unit];

if !(player getVariable ["isAdmin", false]) then {
    if (playerSide isEqualTo west) then {
        [_unit,"handCuff"] remoteExecCall  ["life_fnc_say3D",RANY];
    } else {
        [_unit,"ziptied"] remoteExecCall  ["life_fnc_say3D",RANY];
    };
    [0,format["%1 was restrained by %2",_unit getVariable ["realname",name _unit],profileName]] remoteExecCall ["life_fnc_broadcast",west];
};