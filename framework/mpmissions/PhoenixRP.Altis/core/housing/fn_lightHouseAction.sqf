#include "..\..\script_macros.hpp"
/*
    File: fn_lightHouseAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Lights up the house.
*/
if !(params [
	["_house", objNull, [objNull]]
]) exitWith {};

if !(_house isKindOf "House_F") exitWith {};

if (isNull (_house getVariable ["lightSource", objNull])) then {
    [_house,true] remoteExecCall ["life_fnc_lightHouse",RCLIENT];
} else {
    [_house,false] remoteExecCall ["life_fnc_lightHouse",RCLIENT];
};