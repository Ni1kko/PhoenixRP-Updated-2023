/*
	@File: fn_enteranceText.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Slides text from the top of the screen to notify the user they've entered a zone...
*/
#include "..\..\..\..\script_macros.hpp"

if !(canSuspend) exitWith { _this spawn PHX(enteranceText) };

params [
	["_message", "<t align='center'>You've entered a <t color='#cc0001'>Combat Zone</t></t>", [""]]
];

private _display = findDisplay 46;

if (isNull _display || _message isEqualTo "") exitWith {};

private _text = _display ctrlCreate ["Life_RscStructuredText", -1];
_text ctrlSetPosition [
	0 * safezoneW + safezoneX,
	-0.5 * safezoneH + safezoneY,
	1 * safezoneW,
	0.022 * safezoneH
];
_text ctrlSetStructuredText parseText format["%1", _message];
_text ctrlCommit 0;

_text ctrlSetPosition [
	0 * safezoneW + safezoneX,
	0.025 * safezoneH + safezoneY
];

_text ctrlCommit 1;
sleep 3;

_text ctrlSetPosition [
	0 * safezoneW + safezoneX,
	-0.5 * safezoneH + safezoneY
];

_text ctrlCommit 1;
sleep 1;

ctrlDelete _text;