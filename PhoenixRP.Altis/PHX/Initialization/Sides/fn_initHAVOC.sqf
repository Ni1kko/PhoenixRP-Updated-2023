/*
	@File: fn_initHAVOC.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Initialize HAVOC...
*/
#include "..\..\..\script_macros.hpp"

if (life_blacklisted) exitWith { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["Blacklisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };
if ((FETCH_CONST(life_havoclevel) isEqualTo 0)) then { ["RscTitleLoading"] call MNTUI_fnc_destroyLayer; ["NotWhitelisted",false,true] call BIS_fnc_endMission; breakOut "LIFE_INIT" };

PHX_DEFAULT_GEAR = "hav_gear";

player setVariable ["rank",(FETCH_CONST(life_havoclevel)),true];
[player, "havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];