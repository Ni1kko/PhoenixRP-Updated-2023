/*
    File: fn_vehicleCreate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Answers the query request to create the vehicle in the database.
*/
params [
    ["_uid", "", [""]],
    ["_side", sideUnknown, [west]],
    ["_vehicle", objNull, [objNull, ""]],
    ["_color", -1, [0]],
    ["_active", 1, [0]],
    ["_scrambler",false,[false]],
    ["_plate",-1,[""]]
];

// Error checks
if (_uid isEqualTo "" || { _side isEqualTo sideUnknown }) exitWith {};

private _veh = _vehicle;
private _upgrades = (_veh getVariable ["vehicle_upgrades",[0,0,0,0,[]]]);

if !(_vehicle isEqualType "") then { _vehicle = typeOf _vehicle };

private _type = switch (true) do {
    case (_vehicle isKindOf "Car"): {"Car"};
    case (_vehicle isKindOf "Air"): {"Air"};
    case (_vehicle isKindOf "Ship"): {"Ship"};
};

_side = switch (_side) do {
    case west:{"cop"};
    case civilian: {"civ"};
    case independent: {"med"};
    case east: {"hav"};
    default {"Error"};
};

if (_plate isEqualTo -1) then {
    _plate = str(round(random(1000000)));
};

private _id = ["SELECT id FROM phxcars ORDER BY id DESC LIMIT 1", 2] call DB_fnc_asyncCall;
if !(_id isEqualType [] || { (_id select 0) isEqualType 0 }) then { _id = 0; };
_id = (_id select 0) + 1;

if !(_vehicle isEqualTo "") then {
    [_uid, _side, _type, _vehicle, _color, _plate, _active, _upgrades] call DB_fnc_insertVehicle;
};

if !(_veh isEqualType "") then {
    _veh setVariable ["Scrambler", _scrambler, true];
    _veh setVariable ["dbInfo", [_uid, _plate, _id], true];
};