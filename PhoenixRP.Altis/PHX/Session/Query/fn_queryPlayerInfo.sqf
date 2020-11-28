/*
	@File: fn_queryPlayerInfo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets ready to query for player info from the server...
*/
#include "..\..\..\script_macros.hpp"

PHX_Data_Complete = false;

["Query Player Info", "Querying Player Data"] call PHX_fnc_logIt;

player remoteExec (["fnc_getPlayerInfo", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

waitUntil { !(isNil "playerData") };

if !((playerData select 1) isEqualTo (getPlayerUID player)) exitWith {
	["Query Player Info", "Failed", "The player id in the data packet doesn't match ours"] call PHX_fnc_logIt;
	["Querying Player Data Failed"] call PHXUI_fnc_loadingFailed;
};

[playerData] call PHX_fnc_handlePlayerInfo;

waitUntil { PHX_Data_Complete };

["Query Player Info", "Player Data Queried & Processed"] call PHX_fnc_logIt;