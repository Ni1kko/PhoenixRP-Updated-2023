/*
	@File: fn_setStat.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Increments value of specificed statistic
*/
#include "..\..\script_macros.hpp"

params [
	["_stat", "Unknown", [""]],
	["_change", 1, [0]]
];

if (_stat isEqualTo "" || _change < 1) exitWith {};

private _idx = (
	PHX_Statistics findIf { (_x select 0) isEqualTo _stat }
);

if (_idx isEqualTo -1) then {
	PHX_Statistics pushBack [_stat, _change];
	_idx = ((count PHX_Statistics) - 1);
} else {
	PHX_Statistics set[_idx, [_stat, ((PHX_Statistics select _idx) select 1) + _change]];
};

if (_stat in ["kills", "deaths", "headshots"] && { !(isNil "PHXCombatUI") }) then {
	[true] call PHX(combatZone);
};

[(getPlayerUID player), playerSide, _stat, ((PHX_Statistics select _idx) select 1)] remoteExecCall (["fnc_saveStat", "PHXSRV"] call SOCK_fnc_getRemoteDestination);