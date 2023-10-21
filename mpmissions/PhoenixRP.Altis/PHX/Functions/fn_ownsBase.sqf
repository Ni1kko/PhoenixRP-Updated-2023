/*
*  @File: fn_ownsBase.sqf
*  @Author: Sig
*
*  Description: Checks if the given unit or group is the owner
*  of the given gang base
*
*  Arguments:
*    0: STRING - Config name of gang base (Config_Gangs.hpp)
*    1: OBJECT / GROUP - Object or group that is being checked
*
*  Return:
*    BOOLEAN - Whether or not they are the owner
*/
#include "..\..\script_macros.hpp"
params [["_base", "", [""]], ["_group", group player, [grpNull, objNull]]];

if (_base isEqualTo "" || {isNull _group} || {PHX_isWaring}) exitWith {false};
if (_group isEqualType objNull) then {_group = group _group};

(_group getVariable ["gang_id", -1]) isEqualTo (missionNameSpace getVariable [format ["PHX_base_%1", _base], -2])