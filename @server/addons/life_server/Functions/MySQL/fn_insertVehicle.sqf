/*
    File: fn_insertVehicle.sqf

    Author: Bryan "Tonic" Boardwine
    Edited: Jack "Scarso" Farhall

    Description:
    Inserts the vehicle into the database
*/
params [
    "_uid",
    "_side",
    "_type",
    "_className",
    ["_color",-1,[0]],
    ["_plate","",[""]],
    ["_active", 1, [0]],
    ["_upgrades",[0,0,0,0,[]],[]]
];

//Stop bad data being passed.
if (_uid isEqualTo "" || {_side isEqualTo ""} || {_type isEqualTo ""} || {_className isEqualTo ""} || {_color isEqualTo -1} || {_plate isEqualTo ""}) exitWith {};

private _query = format ["INSERT INTO phxcars (side, classname, type, pid, alive, active, inventory, color, plate, gear, damage, upgrades) VALUES ('%1', '%2', '%3', '%4', '1','%7','""[[],0]""', '%5', '%6','""[]""','""[]""', '%8')",_side,_className,_type,_uid,_color,_plate, _active, [_upgrades] call DB_fnc_mresArray];
[_query,1] call DB_fnc_asyncCall;