/*
	@File: fn_getButtons.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the buttons for this interaction...
*/
scopeName "getButtons";
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgInteractions"
if !(params [
	["_menu", "", ["", []]]
]) exitWith { diag_log "No Menu Provided" };

if (life_action_inUse && { PHX_isInterruptable }) exitWith {}; // They have a progress bar going...

private _info = ["Interactions", _menu];

if (_menu isEqualType "") then {
	private _fMenu = format["PHX_fnc_%1", _menu];
	if (isNil _fMenu) exitWith { breakOut "getButtons" };

	_info = [] call (call compile _fMenu);
};

_info params ["_title", "_buttons"];

[_title, _buttons] call PHX(createMenu);