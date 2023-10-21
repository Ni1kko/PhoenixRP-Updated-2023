#include "\life_server\script_macros.hpp"
/*
    File : fn_fetchPlayerHouses.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Fetches all the players houses and sets them up.
*/
params [
    ["_uid","",[""]],
    ["_gangID", -1, [0, ""]]
];

if (_uid isEqualTo "") exitWith {};

private _query = format ["SELECT pid, pos FROM phxhouses WHERE (pid='%1' OR pid='%2') AND world = '%3' AND owned='1'", _uid, _gangID, WORLD];
private _houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
    _pos = call compile format ["%1",_x select 1];
    _house = nearestObject [_pos, "House"];
    _house allowDamage false;
    _return pushBack [_x select 1];
} forEach _houses;

_return