#include "..\..\script_macros.hpp"
/*
    File: fn_AAN.sqf
    Author: Karel Moricky
    Modified: Jesse "tkcjesse" Schultz
    Description:
    It's showtime!
    Parameter(s):
    _this select 0: STRUCTURED TEXT: Header text
    _this select 1: STRUCTURED TEXT: Bottom text (moving)
    _this select 2: PROFILENAME: Below Header text
*/
params [
	["_header", "", [""]],
	["_line", "", [""]],
	["_sender", "", [""]]
];

if (dialog || { life_settings_enableNewsBroadcast }) exitWith { [_line, "black", _header] spawn PHX(notify) };

disableSerialization;

if (isStreamFriendlyUIEnabled) exitWith {};

30 cutRsc ["rscAAN","plain"];
private _display = uiNamespace getVariable "BIS_AAN";
private _textHeader = _display displayCtrl 3001;
_textHeader ctrlSetStructuredText parseText format ["<t size='2'>%1</t>",_header];
_textHeader ctrlCommit 0;

private _textLine = _display displayCtrl 3002;
_textLine ctrlSetStructuredText parseText format ["                         %1                         %1                         %1                         %1",_line];
_textLine ctrlCommit 0;
private _textLinePos = ctrlPosition _textLine;
_textLinePos set [0,-100];
_textLine ctrlSetPosition _textLinePos;
_textLine ctrlCommit 1500;

private _textClock = _display displayctrl 3003;
_textClock ctrlSetText ([daytime,"HH:MM"] call bis_fnc_timetostring);
_textClock ctrlCommit 0;

sleep 30;
30 cutText ["","plain"];