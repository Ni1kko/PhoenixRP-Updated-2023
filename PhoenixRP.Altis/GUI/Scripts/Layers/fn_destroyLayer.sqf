/*
	@File: fn_destroyLayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Destroys given layer...
*/

_this params [
	["_layerName", "", [""]],
	["_fadeOutTime", 0, [0]]
];

if (isNull (_layerName call PHXUI_fnc_getLayer)) exitWith { false }; // Layer doesn't exist...

_layerName cutFadeOut _fadeOutTime;

uiNamespace setVariable [_layerName, nil];

true