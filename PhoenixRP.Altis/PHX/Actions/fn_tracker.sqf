#include "..\..\script_macros.hpp"
/*
    File: fn_tracker.sqf
    Author: Zyn
    Description: Allows players to track their vehicle
*/

params [
    ["_vehicle", objNull, [objNull]]
];

_markerName = format ["%1_gpstracker", _vehicle];
PHX_Trackers pushBack _markerName;
_marker = createMarkerLocal [_markerName, visiblePosition _vehicle];
_marker setMarkerColorLocal "ColorGrey";
_marker setMarkerTypeLocal "mil_triangle";
_marker setMarkerTextLocal (FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName"));
_marker setMarkerDirLocal (getDir _vehicle);
_marker setMarkerPosLocal getPos _vehicle;
for "_i" from 0 to 1 step 0 do {
	if (getMarkerColor _markerName isEqualTo "") exitWith {};
	if !(alive _vehicle) exitWith {deleteMarkerLocal _markerName;};
	_marker setMarkerPosLocal getPos _vehicle;
	_marker setMarkerDirLocal (getDir _vehicle);
	sleep 30;
};