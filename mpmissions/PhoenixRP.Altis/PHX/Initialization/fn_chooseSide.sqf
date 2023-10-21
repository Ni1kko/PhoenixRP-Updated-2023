/*
	@File: fn_chooseSide.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles the choosing of our side... 
*/
#include "..\..\script_macros.hpp"
params [
	["_isUndercover", false, [false]],
	["_levels", [], [[]]]
];

if !(canSuspend) exitWith {_this spawn PHX_fnc_chooseSide};
if (!_isUndercover || { !(playerSide isEqualTo civilian) } || { PHX_SideChosen } || { _levels isEqualTo [] } || { (((_levels select 0) < 1) && ((_levels select 1) < 1)) }) exitWith { PHX_SideChosen = true };

// Set our whitelisting levels...
CONST(life_cidlevel, _levels select 0);
CONST(life_hsslevel, _levels select 1);


"RscTitleLoading" cutFadeOut 0;

sleep 0.5; // Delays to allow for the layers to finish their thing...

createDialog "RscSideSelection";

(findDisplay 54000) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

private _side = ([54200, 54100] select ((_levels select 0) > 0));
ctrlShow [_side, false];

waitUntil { !(PHX_MySide isEqualTo "") }; // Wait for them to choose...
closeDialog 0; // Close the Side Selection...

// Configure my side...
if (PHX_MySide in ["HSS", "CID"]) then {
	player setVariable [("is" + PHX_MySide), true, true];

	[player] join (createGroup civilian);
};

PHX_SideChosen = true; // We've now chosen our path in life...