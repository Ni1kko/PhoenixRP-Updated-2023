#include "\life_server\script_macros.hpp"
/*
    File: fn_addHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the players newly bought house in the database.
*/
params [
    ["_uid","",["", 0]],
    ["_house",objNull,[objNull]],
    ["_isGang", false, [true]]
];

if (isNull _house || {_uid isEqualTo ""}) exitWith {};

private _housePos = getPosATL _house;
private _upgrades = [(_house getVariable ["house_upgrades",[0,0,[]]])] call DB_fnc_mresArray;

if (_uid isEqualType 0) then { _uid = [_uid] call DB_fnc_numberSafe };

private _query = format ["INSERT INTO phxhouses (pid, pos, owned, world, gang, rent_paid, upgrades) VALUES('%1', '%2', '1', '%3', '%4', CURDATE(), '%5')", _uid, _housePos, WORLD, ([_isGang, 0] call DB_fnc_bool), _upgrades];
if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log format ["Query: %1",_query];
};

[_query,1] call DB_fnc_asyncCall;

uiSleep 0.3;

_query = format ["SELECT id FROM phxhouses WHERE pos='%1' AND pid='%2' AND world = '%3' AND owned='1'", _housePos, _uid, WORLD];
_queryResult = [_query,2] call DB_fnc_asyncCall;

_house setVariable ["house_id",(_queryResult select 0),true];
[_house, 0] call PHXSRV_fnc_insertCategory;