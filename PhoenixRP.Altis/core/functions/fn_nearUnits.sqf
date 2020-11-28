/*
    File: fn_nearUnits.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Checks for units near (human units)

    Returns:
    true - Units are near
    false - No units near
*/
#include "..\..\script_macros.hpp"

params [
  ["_factions", [civilian], [sideEmpty, []]],
  ["_position", getPos player, [[]]],
  ["_radius", 30, [0]]
];

// -- Make sure the side is in an array so that the findif command works as expected
if !(_factions isEqualType []) then {
  _factions = [_factions];
};

// -- If any of the nearby players are of the given side, as long as they are not in the same group as the player (that excludes both gang members and the player)
((_position nearEntities [["Man"], _radius]) select {!(group _x isEqualTo group player) && {isPlayer _x}}) findIf {side _x in _factions} > -1
