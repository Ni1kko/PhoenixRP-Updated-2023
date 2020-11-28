/*
	@File: fn_getLayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for checking if layer already exists...
*/

_this params [
	["_layerName", "", [""]]
];

uiNamespace getVariable [_layerName, displayNull]