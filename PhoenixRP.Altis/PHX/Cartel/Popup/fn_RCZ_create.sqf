/*
*   @File: fn_RCZ_create.sqf
*   @Author: Sig
*
*   Description: Creates a zone in a randomized position from
*   the array in the cartel config.
*/

#include "..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCartel" >> "Altis" >> "Popup"

if (!isServer || hasInterface) exitWith {};

private _position = selectRandom (getArray (CFG >> "positions"));
private _radius = getNumber (CFG >> "radius");

private _obj = "Land_HelipadEmpty_F" createVehicle _position;

// -- Yellow zone
private _zoneMarker = createMarker ["PHX_zoneMarker", _position];
_zoneMarker setMarkerShape "ELLIPSE";
_zoneMarker setMarkerBrush "FDIAGONAL";
_zoneMarker setMarkerSize [_radius, _radius];
_zoneMarker setMarkerColor "ColorYellow";

// -- Objective marker
private _objMarker = createMarker ["PHX_objMarker", _position];
_objmarker setMarkerType "mil_marker";
_objMarker setMarkerColor "ColorRed";
_objMarker setMarkerText "Cartel";

_obj setVariable ["PHX_zoneMarkers", [_zoneMarker, _objMarker], true];
missionNameSpace setVariable ["PHX_mainZoneObj", _obj, true];

_obj
