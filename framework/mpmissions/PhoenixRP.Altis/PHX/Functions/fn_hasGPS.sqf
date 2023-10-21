/**
 ** @File: fn_hasGPS.sqf
 ** @Author: Sig
 **
 ** Checks if the given unit has a gps equipped
 **/

#include "..\..\script_macros.hpp"

if (!params [["_unit", objNull, [objNull]]] || isNull _unit) exitWith {};

["ItemGPS", "B_UavTerminal", "O_UavTerminal", "I_UavTerminal"] findIf {_x in (assignedItems _unit)} > -1
