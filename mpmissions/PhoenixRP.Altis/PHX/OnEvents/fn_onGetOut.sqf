/*
	@File: fn_onGetOut.sqf
	@Author: Zyn
  @Editor: Jack "Scarso" Farhall (Clean up and seatbelt...)
	@Description: Handles processes when a player exits a vehicle...
*/
#include "..\..\script_macros.hpp"

params [
  ["_unit", objNull, [objNull]],
  ["_position", "", [""]],
  ["_vehicle", objNull, [objNull]],
  ["_turret", [], [[]]]
];

if (isNull _unit || { isNull _vehicle }) exitWith {};

if (local _vehicle && { isNull driver _vehicle } && { isEngineOn _vehicle }) then {
  _vehicle engineOn false;
};

player setVariable ["seatbelt", nil, true];
[] call PHX_fnc_hudUpdate;

setCurrentChannel 5;

if (cameraView isEqualTo "GUNNER" || { !((goggles player) in (LIFE_SETTINGS(getArray,"fullnightvision"))) } ) exitWith {};

switch (currentVisionMode player) do {
    case 0: { player action ["nvGogglesOff", player] };
    case 1: { player action ["nvGoggles", player] };
};