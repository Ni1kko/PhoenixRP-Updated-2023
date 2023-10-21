#include "..\..\script_macros.hpp"
/*
    File: fn_copSiren.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the cop siren sound for other players.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle || {isNil {_vehicle getVariable "siren"}}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if (!(_vehicle getVariable "siren") || {!alive _vehicle} || {isNull _vehicle}) exitWith {};
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["siren",false,true]};
    _vehicle say3D [(_vehicle getVariable ["sirenType", "policesiren"]),500,1]; //Class name specified in description.ext, max distance & pitch
    sleep 4.51;//Exactly matches the length of the audio file.
    if (!(_vehicle getVariable "siren")) exitWith {};
};
