/*
	@File: fn_setGlobalVars.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Literally cancer that I set these systems up like this but whatever...
*/
#include "\life_server\script_macros.hpp"

private _vars = [
	"PHX_curGovernor",
	"PHX_noVotes",
	"PHX_noOptions",
	"PHX_activePolls",
	"PHX_doneResults",
	"PHX_isEnlistmentOpen",
	"PHX_TaxRate",
	"PHX_PaycheckRate",
	"PHX_RevivalRate",
	"PHX_FuelRate",
	"PHX_IllegalItems",
	"PHX_isWaring"
];

{
	missionNamespace setVariable [(_vars select _forEachIndex), _x];
} forEach _this;

["Headless Client", "Global Variables Loaded"] call PHX_fnc_logIt;