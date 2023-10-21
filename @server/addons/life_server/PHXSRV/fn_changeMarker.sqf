/*
	@File: fn_changeMarker.sqf
	@Author: Jack "Scarso" Farhall
	
	@Description: Changes the colour of a marker (Used for legality of items)
*/
params [
	["_markerName", "", [""]],
	["_newColour", "", [""]]
];

if (_markerName isEqualTo "" || { _newColour isEqualTo "" }) exitWith {};
_markerName setMarkerColor _newColour;