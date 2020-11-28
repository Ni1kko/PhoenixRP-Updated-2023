/*
    File: fn_initHouses.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the players houses, mainly throwing down markers.
*/
#include "..\..\script_macros.hpp"
params [
    ["_houses", [], [[]]]
];

if (_houses isEqualTo [] || { (isCID(player)) } || { (isHSS(player)) }) exitWith {}; //Nothing to do.

{
    _house = nearestObject [(parseSimpleArray (_x select 0)), "House"];

    if (isNil { _house getVariable "house_owner" }) exitWith {}; // Double check...

    (_house getVariable "house_owner") params ["_id", "_name", "_isGang"];

    private _houseID = (getPlayerUID player);

    if (_isGang) then {
        _houseID = (player getVariable ["gang_uid", -1]);
        life_gang_houses pushBack _house;
    } else {
        life_houses pushBack _house;
    };
    
    if (isNil { _house getVariable "uid" }) then {
        _house setVariable ["uid", format["%1-%2", _houseID, _forEachIndex], true];
    };

    [_house] call PHX(houseMarker);
} forEach _houses;