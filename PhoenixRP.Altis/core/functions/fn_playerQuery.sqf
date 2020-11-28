/*
    File: playerQuery.sqf
    Author: Bryan "Tonic" Boardwine

*/

params [
    ["_ret",objNull,[objNull]]
];

if (isNull _ret || {isNil "_ret"}) exitWith {};

[PHX_ATMCash,PHX_Cash,owner player,player,profileNameSteam,getPlayerUID player,playerSide] remoteExecCall ["PHX_fnc_recieveQuery",_ret];