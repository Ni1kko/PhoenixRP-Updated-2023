/*
    File: fn_updateRequest.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates ALL player information in the database.
    Information gets passed here from the client side file: core\session\fn_updateRequest.sqf
*/
params [
    ["_uid", "", [""]],
    ["_name", "", [""]],
    ["_side", sideUnknown, [civilian]],
    ["_cash",0,[0]],
    ["_bank",0,[0]],
    ["_licenses", [], [[]]],
    ["_gear", [], [[]]],
    ["_stats", [100,100], [[]]],
    ["_professions", [], [[]]],
    ["_level", [], [[]]]
];

//Get to those error checks.
if (_uid isEqualTo "" || { _name isEqualTo "" }) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
private _gearArray = [_gear select 0] call DB_fnc_mresArray;
_stats = [_stats] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
    _bool = [(_licenses select _i) select 1] call DB_fnc_bool;
    _licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;
_professions = [_professions] call DB_fnc_mresArray;

//PLAYTIME
_playtime = [_uid] call TON_fnc_getPlayTime;
_playtime_update = [];
{
    if ((_x select 0) isEqualTo _uid) exitWith
    {
        _playtime_update pushBack [_x select 1];
    };
} forEach TON_fnc_playtime_values_request;
_playtime_update = (_playtime_update select 0) select 0;
switch (_side) do {
    case west: {_playtime_update set[0,_playtime]};
    case civilian: {_playtime_update set[2,_playtime]};
    case independent: {_playtime_update set[1,_playtime]};
    case east: {_playtime_update set[3,_playtime]};
};
_playtime_update = [_playtime_update] call DB_fnc_mresArray;

private _query = switch (_side) do {
    case west: {format ["UPDATE phxclients SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', cop_stats='%6', playtime='%7', cop_professions='%9', level='%10', xp='%11', lastcopseen=NOW() WHERE playerid='%8'",_name,_cash,_bank,_gearArray,_licenses,_stats,_playtime_update,_uid,_professions,[_level select 0] call DB_fnc_numberSafe, [_level select 1] call DB_fnc_numberSafe]};
    case civilian: {format ["UPDATE phxclients SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', %13='%5', civ_arrested_police='%6', civ_stats='%7', playtime='%8', civ_professions='%10', level='%11', xp='%12', jail_time ='%14', civ_arrested_havoc ='%15', lastcivseen=NOW() WHERE playerid='%9'",_name,_cash,_bank,_licenses,_gearArray,[_this select 10] call DB_fnc_bool,_stats,_playtime_update,_uid,_professions,[_level select 0] call DB_fnc_numberSafe, [_level select 1] call DB_fnc_numberSafe, (_gear select 1), [_this select 12] call DB_fnc_numberSafe,[_this select 11] call DB_fnc_bool]};
    case independent: {format ["UPDATE phxclients SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%5', med_stats='%6', playtime='%7', med_professions='%9', level='%10', xp='%11', lastnhsseen=NOW() WHERE playerid='%8'",_name,_cash,_bank,_licenses,_gearArray,_stats,_playtime_update,_uid,_professions,[_level select 0] call DB_fnc_numberSafe, [_level select 1] call DB_fnc_numberSafe]};
    case east: {format ["UPDATE phxclients SET name='%1', cash='%2', bankacc='%3', hav_gear='%4', hav_licenses='%5', hav_stats='%6', playtime='%7', hav_professions='%9', level='%10', xp='%11', hav_arrested='%12', hav_jail_time ='%13', lasthavocseen=NOW() WHERE playerid='%8'",_name,_cash,_bank,_gearArray,_licenses,_stats,_playtime_update,_uid,_professions,[_level select 0] call DB_fnc_numberSafe, [_level select 1] call DB_fnc_numberSafe,[_this select 10] call DB_fnc_bool, [_this select 12] call DB_fnc_numberSafe]};
};

[_query,1] call DB_fnc_asyncCall;