#include "..\..\..\script_macros.hpp"
/*
    File: fn_initMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the medic..
*/

if (life_blacklisted) exitWith { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["Blacklisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };
if ((FETCH_CONST(life_medicLevel)) < 1) exitWith { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["Notwhitelisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };

PHX_DEFAULT_GEAR = "med_gear";

player setVariable ["rank",(FETCH_CONST(life_mediclevel)),true];
[player, "apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
[player, "havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];