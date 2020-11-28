#include "..\..\script_macros.hpp"
/*
    File: fn_colorVehicle.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Reskins the vehicle.
*/
params [
    ["_vehicle",objNull,[objNull]],
    ["_index",-1,[0]],
    ["_RGB", false, [true, []]]
];

private _className = typeOf _vehicle;

if (isNull _vehicle || {!alive _vehicle} || {_index isEqualTo -1}) exitWith {};

//Does the vehicle already have random styles? Halt till it's set.
if (local _vehicle) then {
    private _colorIndex = 1;
    if (_className isEqualTo "C_Offroad_01_F") then {_colorIndex = 3};
    _vehicle setVariable ["color",_colorIndex,true];
};

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _className)) then {
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
    _className = "Default"; //Use Default class if it doesn't exist
};

if (_RGB isEqualType [] && { _className != "Default" }) exitWith {
    if !((count _RGB) isEqualTo 4) exitWith {}; // We don't have the correct amount of values...

    _vehicle setObjectTextureGlobal [0, 
        format["#(argb,8,8,3)color(%1,%2,%3,%4)",
            _RGB select 0, // Red
            _RGB select 1, // Green
            _RGB select 2, // Blue
            _RGB select 3 // Alpha
        ]
    ];

    _vehicle setVariable ["Life_VEH_color", -1, true]; // -1 means RGB...
    _vehicle setVariable ["Vehicle_RGB", _RGB, true]; // We may need this...
};

private _textures = (M_CONFIG(getArray,"LifeCfgVehicles",_className,"textures"));
if (_textures isEqualTo []) exitWith {};

_vehicle setVariable ["Life_VEH_color",_index,true];

{_vehicle setObjectTextureGlobal [_forEachIndex,_x]} forEach ((_textures select _index) param [2,[]]);