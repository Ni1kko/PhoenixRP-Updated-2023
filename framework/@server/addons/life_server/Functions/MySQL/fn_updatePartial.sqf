/*
    File: fn_updatePartial.sqf

    Author: Bryan "Tonic" Boardwine
    Edited: Jack "Scarso" Farhall

    Description:
    Takes partial data of a player and updates it, this is meant to be
    less network intensive towards data flowing through it for updates.
*/
params [
    ["_uid", "", [""]],
    ["_side", sideUnknown, [civilian]],
    ["_values", [], [[]]],
    ["_mode", -1, [0]],
    ["_flag", "", [""]]
];

if (_uid isEqualTo "" || { _side isEqualTo sideUnknown } || { _values isEqualTo [] } || { _flag isEqualTo "" }) exitWith {};

private _query = "";

switch (_mode) do {
    case 0: {
        _values params [["_value", 0, [0]]];
        _value = [_value] call DB_fnc_numberSafe;
        _query = format ["UPDATE phxclients SET cash='%1' WHERE playerid='%2'", _value, _uid];
    };

    case 1: {
        _values params [["_value", 0, [0]]];
        _value = [_value] call DB_fnc_numberSafe;
        _query = format ["UPDATE phxclients SET bankacc='%1' WHERE playerid='%2'",_value,_uid];
    };

    case 2: {
        _values params [["_value", [], [[]]]];

        for "_i" from 0 to count(_value)-1 do {
            _bool = [(_value select _i) select 1] call DB_fnc_bool;
            _value set[_i,[(_value select _i) select 0,_bool]];
        };

        _value = [_value] call DB_fnc_mresArray;

        _query = format ["UPDATE phxclients SET %3_licenses='%1' WHERE playerid='%2'", _value, _uid, _flag];
    };

    case 3: {
        _values params [["_value", [], [[]]]];
        _query = format ["UPDATE phxclients SET %3='%1' WHERE playerid='%2'", [_value select 0] call DB_fnc_mresArray, _uid, _value select 1];
    };
    
    case 5: {
        _values params [["_value", false, [true]]];
        _query = format ["UPDATE phxclients SET %3arrested='%1' WHERE playerid='%2'", ([_value] call DB_fnc_bool), _uid, (["", "hav_"] select (_side isEqualTo east))];
    };

    case 6: {
        _values params [["_value1", 0, [0]], ["_value2", 0, [0]]];
        _query = format ["UPDATE phxclients SET cash='%1', bankacc='%2' WHERE playerid='%3'", ([_value1] call DB_fnc_numberSafe), ([_value2] call DB_fnc_numberSafe), _uid];
    };

    case 7: {
        _values params [["_value", [], [[]]]];
        [_uid, _side, _value, 0] call TON_fnc_keyManagement;
    };

    // Update Active Perks...
    case 8: {
        _values params [["_value", [], [[]]]];

        _value = [_value] call DB_fnc_mresArray;

        _query = format ["UPDATE phxclients SET %3_perks='%1' WHERE playerid='%2'", _value, _uid, _flag];
    };

    case 9: {
        _values params [["_value", -1, [0]], ["_value2", 0, [0]]];
        _query = format ["UPDATE phxclients SET gangid='%1', ganglevel='%2' WHERE playerid='%3'", 
            ([_value] call DB_fnc_numberSafe), 
            ([_value2] call DB_fnc_numberSafe), 
            _uid
        ];
    };

    case 10: {
        _values params [["_value", [], [[]]]];
        _query = format ["UPDATE phxclients SET achievements='%1' WHERE playerid='%2'", ([_value] call DB_fnc_mresArray), _uid];
    };

    case 11: {
        _values params [["_gear", [], [[]]], ["_col", "", [""]]];
        _query = format["INSERT INTO deathgear (gear, playerid, side) VALUES ('%1','%2','%3')", [_gear select 0] call DB_fnc_mresArray, _uid, _col];
    };
};

if (_query isEqualTo "") exitWith {};

[_query,1] call DB_fnc_asyncCall;