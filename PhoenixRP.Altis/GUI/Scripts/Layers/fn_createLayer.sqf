/*
	@File: fn_createLayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Creates Rsc layer...
*/

_this params [
	["_layerName", "", [""]],
	["_type", "PLAIN", [""]],
	["_fadeInTime", 0, [0]]
];

if !(isNull (_layerName call PHXUI_fnc_getLayer)) exitWith { false }; // Layer already open...

_layerName cutRsc [_layerName, _type, _fadeInTime];

true