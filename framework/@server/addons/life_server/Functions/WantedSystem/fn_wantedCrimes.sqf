#include "\life_server\script_macros.hpp"
/*
    File: fn_wantedCrimes.sqf
    Author: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm

    Description:
    Grabs a list of crimes committed by a person.
*/
disableSerialization;

params [
    ["_ret",objNull,[objNull]],
    ["_criminal",objNull,[objNull]]
];

private _query = format ["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'", getPlayerUID _criminal];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

_ret = owner _ret;

private _type = [_queryResult select 0] call DB_fnc_mresToArray;

private _crimesArr = [];

{
    private _y = _x;

    _crimesArr pushBackUnique [_x, {_x isEqualTo _y} count _type];
} forEach _type;

_queryResult set[0, _crimesArr];

[_queryResult] remoteExecCall ["life_fnc_wantedInfo", _ret];