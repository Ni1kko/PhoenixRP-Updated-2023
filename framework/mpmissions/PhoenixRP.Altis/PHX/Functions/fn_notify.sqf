/*
    @File: fn_notify.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Replacement for ArmA's "Hint" System...
*/
#define COLOUR_CFG missionConfigFile >> "CfgColours"
#define BASE_IDC 100000
#define Y_OFFSET 0.01
params [
    ["_message", "", [""]],
	["_colour", "black", [""]],
	["_title", "Notification", [""]]
];

if !(hasInterface) exitWith {};
if !(canSuspend) exitWith { _this spawn PHX_fnc_notify };

if (isNil "PHX_Notifications") then { PHX_Notifications = [] };

waitUntil { isNil "notifying"};
notifying = true;

_colour = [
	[0, 0, 0, 1],
	(getArray(COLOUR_CFG >> _colour >> "rgba"))
] select (isClass (COLOUR_CFG >> _colour));

disableSerialization;

private _display = findDisplay 46;
private _thisMsg = [];

private _text = _display ctrlCreate ["Life_RscStructuredText", -1];
_text ctrlSetPosition [1 * safezoneW + safezoneX, 0.17 * safezoneH + safezoneY, 0.149531 * safezoneW, 0.01];
_text ctrlCommit 0;
_text ctrlSetBackgroundColor [0,0,0,0.6];
_text ctrlSetFade 1;
_text ctrlSetStructuredText parseText format["<t>%1</t><br/><t size='0.9' color='#c4c4c4'>%2</t>", _title, _message];
private _height = (ctrlTextHeight _text);
_text ctrlSetPosition [1 * safezoneW + safezoneX, 0.17 * safezoneH + safezoneY, 0.149531 * safezoneW, _height];
_text ctrlCommit 0;

private _bar = _display ctrlCreate ["Life_RscBackground", -1];
_bar ctrlSetBackgroundColor _colour;
_bar ctrlSetFade 1;
_bar ctrlSetPosition [0.994843 * safezoneW + safezoneX, 0.17 * safezoneH + safezoneY, 0.00315625 * safezoneW, _height];
_bar ctrlCommit 0;

_thisMsg pushBack _text;
_thisMsg pushBack _bar;

_thisMsg spawn {
	params ["_text", "_bar"];
	disableSerialization;

	// Slide in...
	private _pos = ctrlPosition _text;
	_pos set [0, ((1 - 0.154531) * safezoneW + safezoneX)];
	_text ctrlSetPosition _pos;
	_text ctrlCommit 0.25;
	_pos = ctrlPosition _bar;
	_pos set [0, ((0.996043 - 0.154531) * safezoneW + safezoneX)];
	_bar ctrlSetPosition _pos;
	_bar ctrlCommit 0.25;

	{ _x ctrlSetFade 0 } forEach _this;
	{ _x ctrlCommit 0.125 } forEach _this;

	if !(PHX_settings_notify) then {
		playSound "FD_Timer_F";
	};

	uiSleep 5;

	// Fade out...
	{ _x ctrlSetFade 1 } forEach _this;
	{ _x ctrlCommit 0.5 } forEach _this;
	uiSleep 1.5;
	{ ctrlDelete _x } forEach _this;
};

private _offsetY = ((ctrlPosition _text) # 3) + Y_OFFSET;
if ((count PHX_Notifications) > 0) then {
	{	
		_x params ["_text", "_bar"];
		if (isNull _text) then {
			PHX_Notifications deleteAt _forEachIndex;
		} else {
			disableSerialization;

			private _posBackground = ctrlPosition _text;
			private _posBar = ctrlPosition _bar;
			private _newPosY = (_posBackground # 1) + _offsetY;
			_text ctrlSetPosition [(_posBackground # 0), _newPosY];
			_text ctrlCommit 0.5;
			_bar ctrlSetPosition [(_posBar # 0), _newPosY];
			_bar ctrlCommit 0.5;
		};
	} forEach PHX_Notifications;
};

PHX_Notifications pushBack _thisMsg;

uiSleep 0.75;
notifying = nil;