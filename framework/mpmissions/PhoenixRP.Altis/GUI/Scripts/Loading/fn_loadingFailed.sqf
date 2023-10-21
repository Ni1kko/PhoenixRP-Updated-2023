/*
	@File: fn_loadingFailed.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Tells us we've failed and kicks us to lobby...
*/

_this params [
	["_reason", "Initilization Failed", [""]]
];

[_reason, 0] call PHX_fnc_setLoadingStage;

[] spawn {
	sleep 5;
	["RscLoading"] call PHXUI_fnc_destroyLayer;
	["SessionFailed", false, true] call BIS_fnc_endMission;
};