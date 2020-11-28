/*
*   @File: fn_isKindOf.sqf
*   @Author: Sig
*
*   Checks if the given vehicle is of anything in the given array
*
*   Arguments
*     0 <TYPE: OBJECT> - Vehicle that is being checked
*     1 <TYPE: ARRAY> - Kinds to check for
*
*   Return
*     <TYPE: BOOLEAN> If the vehicle type is in the array
*/

#include "..\..\script_macros.hpp"

params [["_vehicle", objNull, [objNull]], ["_array", ["LandVehicle", "Air", "Ship", "B_Slingload_01_Cargo_F", "B_UAV_01_F"], [[]]]];

_array findIf {_vehicle isKindOf _x} > -1