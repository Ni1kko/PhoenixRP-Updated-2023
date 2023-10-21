#include "..\..\script_macros.hpp"
/*
    File: fn_medicSiren.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the medic siren sound for other players.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle || {isNil {_vehicle getVariable "siren"}}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["siren",false,true]};
    if (!alive _vehicle || {isNull _vehicle} || {!(_vehicle getVariable "siren")} || {!(_vehicle getVariable "siren")}) exitWith {};
    _vehicle say3D ["medicSiren",500,1]; //Class name specified in description.ext, max distance & pitch
    sleep 5;//Exactly matches the length of the audio file.
    if (!(_vehicle getVariable "siren")) exitWith {};
};
