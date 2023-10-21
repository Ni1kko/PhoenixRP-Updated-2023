/*
    File: fn_medicRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Notifies the medics that someone has requested emergency and prompts them
    if they want to take the request or not.
*/
params [
    ["_caller",objNull,[objNull]]
];

if (isNull _caller) exitWith {}; //Bad data

private _callerName = _caller getVariable ["realname", name _caller];

[format ["%1 is requesting medical assistance.", _callerName]] spawn PHX_fnc_notify;
playSound "HintExpand";

if !(playerSide isEqualTo independent) exitWith {}; // Medics only

// If we're doing an assignment we'll cancel it...
if (PHX_DoingMission && { !PHX_NHS_Responding }) then {
    if ([(position _caller)] call PHX_fnc_isRedZone || !([_caller] call PHX_fnc_inZone isEqualTo false)) exitWith {}; // Stop medics being sent to redzones!
    if (round((position player distance (PHX_Cur_Patrol select 1))) <= 100) exitWith {}; // Don't reassign them so close...
    PHX_NHS_Responding = true; // We're responding!

    // Remove Current Assignment...
    life_cur_task setTaskState "Canceled";
    player removeSimpleTask life_cur_task;

    // Add New Assignmnet...
    life_cur_task = player createSimpleTask [format ["Patrol_%1", _callerName]];
    life_cur_task setSimpleTaskDestination (getPos _caller);
    life_cur_task setSimpleTaskDescription [format ["You are to assist %1", _callerName],"Faction Assignment",""];
    life_cur_task setTaskState "Assigned";
    player setCurrentTask life_cur_task;

    [format["%1 has request assistance and so your responce mission has been reassigned!", _callerName]] spawn PHX_fnc_notify;
    PHX_Cur_Patrol = [_callerName,(getPos _caller)];

    // New Reward
    PHX_Patrol_Reward = round(10 * (round((getPos player) distance (PHX_Cur_Patrol select 1))));
};