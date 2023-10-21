/*
*   @File: fn_checkLoadout.sqf
*   @Author: Sig
*
*   Description: Runs multiple tests to check if the given loadout is of getUnitLoadout / setUnitLoadout format
*                This is used to distinguish from old format in loading gear function, to use getUnitLoadout going forward
*
*   Arguments:
*     0 - <TYPE: ARRAY> - Loadout array to be checked
*
*   Return:
*     <TYPE: BOOLEAN> - Whether the loadout is of setUnitLoadout format
*                       Returns if the false check fails, which can then load the loadout the old way
*
*   Example:
*     [getUnitloadout player] call PHX(checkLoadout) // --- True
*
*   Format:
*     0 - <TYPE: ARRAY> - Primary Weapon and its attachments
*     1 - <TYPE: ARRAY> - Launcher and its attachments
*     2 - <TYPE: ARRAY> - Handgun and its attachments
*     3 - <TYPE: ARRAY> - Uniform and whatever is inside it
*     4 - <TYPE: ARRAY> - Vest and whatever is inside it
*     5 - <TYPE: ARRAY> - Backpack and whatever is inside it
*     6 - <TYPE: STRING> - Hat
*     7 - <TYPE: STRING> - Goggles
*     8 - <TYPE: ARRAY> - Rangefinders and all that
*     9 - <TYPE: ARRAY> - GPS and them things
*/
#include "..\..\script_macros.hpp"

if !(params [
  ["_loadout", [], [[""]]]
]) exitWith {false};

_loadout isEqualTypeParams [
  [],
  [],
  [],
  [],
  [],
  [],
  "",
  "",
  [],
  []
]