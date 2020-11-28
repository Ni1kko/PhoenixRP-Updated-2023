#include "..\..\script_macros.hpp"
/*
* File: robberyMarker.sqf
* Author: Zyn
*
* Description: Handles robbery markers for the houses
*/

params [
    ["_house",ObjNull,[ObjNull]]
];

private _marker = format["house_%1",(_house getVariable "uid")];
_marker setMarkerColorLocal "ColorRed";

sleep 180;

_marker setMarkerColorLocal (["colorBLUFOR", "ColorIndependent"] select ((_house getVariable ["house_owner", []]) select 2));