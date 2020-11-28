/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
#include "..\..\..\script_macros.hpp"

if (life_blacklisted) exitWith { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["Blacklisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };
if ((FETCH_CONST(life_coplevel) isEqualTo 0)) then { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["NotWhitelisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };

PHX_DEFAULT_GEAR = "cop_gear";

player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
[player, "apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];