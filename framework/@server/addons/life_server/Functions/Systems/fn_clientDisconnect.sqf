/*
    File: fn_clientDisconnect.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    When a client disconnects this will remove their corpse and
    clean up their storage boxes in their house. Also, saves player infos & position.
*/
#include "\life_server\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
    "",
    ["_uid","",[""]]
];

if (isNull _unit) exitWith {};

if (alive _unit) then {
    {
        _x params [
            ["_corpseUID","",[""]],
            ["_corpse",objNull,[objNull]]
        ];
        if (_corpseUID isEqualTo _uid) exitWith {
            if (isNull _corpse) exitWith {server_corpses deleteAt _forEachIndex};
            [_corpse] remoteExecCall ["life_fnc_corpse",0];
            server_corpses deleteAt _forEachIndex;
        };
    } forEach server_corpses;
};

{deleteVehicle _x} forEach (nearestObjects[_unit,["WeaponHolderSimulated"],5]);
deleteVehicle _unit;