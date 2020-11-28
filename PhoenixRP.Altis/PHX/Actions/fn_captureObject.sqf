/*
    File: fn_captureObject.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah blah.
*/
#include "..\..\script_macros.hpp"
scopeName "captureObject";

(_this select 3) params [
    ["_object", "", [""]],
    ["_type", "", [""]],
    ["_marker", "", [""]],
    ["_cooldown", -1, [0]],
    ["_conditions", [], [[]]]
];

_object = call compile _object;

private _id = _object getVariable ["gangID",-4];
private _group = _id call PHX_fnc_groupByID;

if !(_conditions isEqualTo []) then {
    _conditions params [["_condition", "", [""]], ["_feedback", "", [""]]];

    if !(call compile _condition) exitWith { NOTIFY(_feedback, "red"); breakOut "captureObject" };
};

if (_group isEqualTo group player || { (playerSide isEqualTo east) && { _id isEqualTo -3 } }) exitWith {[format["Your organisation already has control over this %1!",_type],"red"] call PHX_fnc_notify};

if ((_object getVariable ["inCapture", false]) isEqualType objNull) then {
    private _capStatus = (_object getVariable "inCapture");

    if !(isNull _capStatus) then {
        NOTIFY("Only one person shall capture at once!","red");
        breakOut "captureObject";
    };
};

if (!isNull _group) then {
    private _gangName = _group getVariable ["gang_name",""];
    _action = [
        format ["This %1 is currently controlled by %2. Are you sure you want to take over their area?",_type,_gangName],
        format["%1 is currently under control",_type],
        "Yes",
        "No"
    ] call PHX_fnc_confirmBox;
};

life_action_inUse = true;
_object setVariable ["inCapture",player,true];

if !(
    [
        format["Capturing %1...",_type],
        180,
        [
            "player distance (_this select 0) < 5", 
            [_object], true, 
            "[""You must remain within 5m of the flag at all times"",""red""] call PHX_fnc_notify;"
        ],
        ([0.01,0.005] select (!isNull _group))
    ] call PHX(handleProgress)
) exitWith { _object setVariable ["inCapture",objNull,true]; life_action_inUse = false; };

life_action_inUse = false;

[format["%1 has been captured",_type],"green"] call PHX_fnc_notify;
[[0,1],format["%1 have taken control of a %2!",(group player) getVariable "gang_name",_type]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
_marker setMarkerText (format["%1 - Captured by %2",_type,(group player) getVariable "gang_name"]);

_object setVariable ["inCapture",objNull,true];
_object setVariable ["gangID",((group player) getVariable ["gang_id",-3]),true];

if (_cooldown > 0) then {
    _object setVariable ["cooldown",true,true];

    [_object, _cooldown] spawn {
        _this params ["_object", "_cooldown"];
        sleep _cooldown;
        _object setVariable ["cooldown",nil,true];
    };
};