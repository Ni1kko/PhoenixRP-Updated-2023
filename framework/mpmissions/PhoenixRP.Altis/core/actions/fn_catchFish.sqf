/*
*   @File: fn_catchFish.sqf
*   @Author: Bryan "Tonic" Boardwine
*     - Redone by Sig
*
*   Description: Catches a fishy boi
*/
#include "..\..\script_macros.hpp"

if (!params [["_fish", objNull, [objNull]]] || isNull _fish) exitWith {};

if (!(_fish isKindOf "Fish_Base_F") && {!(typeOf(_fish) isEqualTo "Turtle_F")}) exitWith {};

private _zones = (getArray(missionConfigFile >> "CfgSettings" >> "turtle_markers"));
if ((typeOf(_fish) isEqualTo "Turtle_F") && {((_zones findIf { ((getMarkerPos _x) distance (getPos player)) <= 250 }) isEqualTo -1)}) exitWith { ["You must be within a designated fishing zone","red"] spawn PHX_fnc_notify };

private _realName = ((typeOf _fish) splitString "_") # 0;

if ([true, _realName + "_raw", 1] call life_fnc_handleInv) then {
    deleteVehicle _fish;
    [format ["You caught a %1", _realName], "green"] spawn PHX(notify);
};
