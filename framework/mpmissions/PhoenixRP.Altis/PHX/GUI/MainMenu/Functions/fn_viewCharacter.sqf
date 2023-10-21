/*
	@File: fn_viewCharacter.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Switchs our UI to the character view...
*/
#include "..\..\..\..\script_macros.hpp"

// Check to see if the main menu is even enabled...
if !(LIFE_SETTINGS(getNumber,"mainMenu_enabled") isEqualTo 1) exitWith {}; // Fail safe...

// Display Check...
private _display = findDisplay 1500;
if (isNull _display) exitWith {};

// Rename Escape Button...
private _returnButton = _display displayCtrl 1506;
_returnButton ctrlSetText "Back";

// Fade out useless buttons...
{
	private _ctrl = CONTROL(1500, _x);

	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0.5;
} forEach [
	1501, 1502, 1503, 1504, 1505
];

// Update Camera Focus...
PHX_Camera camSetFocus [50,0];
PHX_Camera camCommit 0.5;

// Setup Handlers...
private _downIndex = _display displayAddEventHandler ["MouseButtonDown", { if (_this select 1 isEqualTo 0) then { PHX_isMouseMoving = true }; }];
private _upIndex = _display displayAddEventHandler ["MouseButtonUp", { if (_this select 1 isEqualTo 0) then { PHX_isMouseMoving = false }; }];

private _movingIndex = _display displayAddEventHandler["MouseMoving",{
	if (PHX_isMouseMoving) then {
		params ["","_x"];
		PHX_Mannequin setDir ((getDir PHX_Mannequin) - (_x * 5));
	};
}];

// Pushback for returning function...
PHX_MouseHandlerIndexes pushBack _downIndex;
PHX_MouseHandlerIndexes pushBack _upIndex;
PHX_MouseHandlerIndexes pushBack _movingIndex;

// Rebind Escape Button...
_returnButton ctrlSetEventHandler["ButtonClick", "
	private _display = findDisplay 1500;
	if (isNull _display) exitWith {};

	_display displayRemoveEventHandler[""MouseButtonDown"", (PHX_MouseHandlerIndexes select 0)];
	_display displayRemoveEventHandler[""MouseButtonUp"", (PHX_MouseHandlerIndexes select 1)];
	_display displayRemoveEventHandler[""MouseMoving"", (PHX_MouseHandlerIndexes select 2)];
	PHX_MouseHandlerIndexes = [];

	PHX_Mannequin setDir PHX_Mannequin_Dir;

	private _returnButton = _display displayCtrl 1506;
	_returnButton ctrlSetText ""Exit"";
	_returnButton ctrlSetEventHandler[""ButtonClick"", ""['Aborted',true,false] spawn BIS_fnc_endMission;""];

	{
		private _ctrl = _display displayCtrl _x;

		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 0.5;
	} forEach [
		1501, 1502, 1503, 1504, 1505
	];
	
	PHX_Camera camSetFocus [100,1];
	PHX_Camera camCommit 0.5;
"];