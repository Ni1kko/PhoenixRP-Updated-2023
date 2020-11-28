/*
    File: fn_getVehicles.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends a request to query the database information and returns vehicles.
*/
#include "\life_server\script_macros.hpp"
params [
    ["_pid", "", [""]],
    ["_side", sideUnknown, [west]],
    ["_type", "", [""]]
];

private _unit = remoteExecutedOwner;
if (_unit isEqualTo 0) exitWith {};

//Error checks
if (_pid isEqualTo "" || { _side isEqualTo sideUnknown } || { _type isEqualTo "" }) exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu",_unit];
};

_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    case east: {"hav"};
    default {"Error"};
};

if (_side isEqualTo "Error") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu", _unit];
};

private _query = format ["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory, upgrades FROM phxcars WHERE pid='%1' AND alive='1' AND active='0' AND dead ='0' AND side='%2' AND type='%3'",_pid,_side,_type];

private _tickTime = diag_tickTime;
private _queryResult = [_query,2,true] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [[]] remoteExec ["life_fnc_impoundMenu", _unit];
};

{
    _x set [10,([(_x select 10)] call DB_fnc_mresToArray)];
} forEach _queryResult;

[_queryResult] remoteExec ["life_fnc_impoundMenu",_unit];