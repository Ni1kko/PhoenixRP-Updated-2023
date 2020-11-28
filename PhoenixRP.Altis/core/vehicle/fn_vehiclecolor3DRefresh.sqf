/*
    File: fn_vehiclecolor3DRefresh.sqf
    Author: Jawshy
    Modified : NiiRoZz

    Description:
    Called when a new selection is made in the rsc box and paint the vehicle with the color selected
*/
params [
    ["_display", 2100, [0]],
    ["_index", 2102, [0]],
    ["_RGB", false, [true, []]]
];

disableSerialization;

_display = findDisplay _display;
_colorIndex = lbValue[_index,(lbCurSel _index)];

if (isNull life_3dPreview_object) exitWith {};

[life_3dPreview_object,_colorIndex,_RGB] call life_fnc_colorVehicle;