#include "..\..\..\script_macros.hpp"
/*
*   @File: fn_confirmBox.sqf
*   @Author: Sig
*   @Description: Handles the confirm box
*/

params [
    ["_text", "", [""]],
    ["_title", "", [""]],
    ["_buttonOK", "", ["", []]],
    ["_buttonCancel", "", ["", []]],
    ["_icon", "", [""]],
    ["_parentDisplay", findDisplay 46, [displayNull]]
];

uiNameSpace setVariable ["PHX_confirmBox_status", nil];

_buttonOKText = _buttonOK param [0, ""];
_buttonCancelText = _buttonCancel param [0, ""];

private _display = [
    _text,
    _title,
    [_buttonOKText, {uiNameSpace setVariable ["PHX_confirmBox_status", true]}],
    [_buttonCancelText, {uiNameSpace setVariable ["PHX_confirmBox_status", false]}],
    _icon,
    _parentDisplay
] call BIS_fnc_3DENShowMessage;

_display displayAddEventHandler ["KeyDown",{if ((_this select 1) == 1) then {uiNameSpace setVariable ["PHX_confirmBox_status", false]}}];

waitUntil {!isNil {uiNameSpace getVariable "PHX_confirmBox_status"}};

private _res = uiNameSpace getVariable "PHX_confirmBox_status";
_res