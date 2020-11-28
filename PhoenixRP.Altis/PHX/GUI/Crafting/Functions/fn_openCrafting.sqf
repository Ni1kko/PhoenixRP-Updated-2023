/*
	@File: fn_openCrafting.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens the crafting mneu...
*/
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgBlueprints"

if (dialog) exitWith {}; // Dialog Already Active...
if !(createDialog "RscCraftingMenu") exitWith { systemChat "Failed to create RscLayer...." };

disableSerialization;

waitUntil { !isNull (findDisplay 8000) }; // Wait until active...
private _display = findDisplay 8000;

PHX_Craftable = nil;

[_display] call PHX(updateList);

(_display displayCtrl 8003) ctrlSetStructuredText parseText format["Select a Blueprint"];

(_display displayCtrl 8002) ctrlAddEventHandler ["KeyUp", {[(findDisplay 8000)] call PHX_fnc_updateList;}];