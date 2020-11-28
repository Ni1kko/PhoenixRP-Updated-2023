/*
    File: fn_gangDisband.sqf
    Author: Bryan "Tonic" Boardwine
    Editor: Jack "Scarso" Farhall
        - Optimisations + Merging gangDisband with gangDisbanded

    Description:
    Prompts the user about disbanding the gang and if the user accepts the gang will be
    disbanded and removed from the database.
*/
#include "..\..\script_macros.hpp"
params [
    ["_remoted", false, [true]],
    ["_group", (grpPlayer), [grpNull]]
];

if (isNull _group) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(gangDisband) };

if (_remoted) then {
    if (PHX_curApp in ["Group", "Create Group"]) then { [23100, "Home"] call PHX_fnc_switchApp };

    // Delete all gang housing... (Just in case)
    {
        [_x, true] call PHX_fnc_gangHousing;
    } forEach life_gang_houses;

    ["The leader has disbanded the group.","red"] spawn PHX(notify);
    [player] joinSilent (createGroup civilian);

    if ((units _group) isEqualTo []) then { deleteGroup _group };
    
    player setVariable ["gang_uid", nil, true];
    [9] call SOCK_fnc_updatePartial;
    
    waitUntil { (isNil { grpPlayer getVariable "gang_owner" }) };

    player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
    life_gangData = [];
} else {
    if !(life_gang_houses isEqualTo []) exitWith { ["You must sell all gang houses before you can disband the gang","red"] spawn PHX(notify) };

    private _action = [
        "You are about to disband the organisation, by disbanding the organisation it will be removed from the database and the organisation will be dropped. <br/><br/> Are you sure you want to disband the organisation? You will not be refunded the price for creating it.",
        "Disband Group",
        "Yes",
        "No"
    ] call PHX_fnc_confirmBox;

    if (_action) then {
        ["Disbanding the group","cyan"] spawn PHX(notify);
        [_group] remoteExec (["fnc_removeGang","TON"] call SOCK_fnc_getRemoteDestination);
        [player, format ["%1 (%2) disbanded their group.",profileName,getPlayerUID player], "https://rcon.phoenixrp.co.uk/api/v1/log/civilian"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    };
};