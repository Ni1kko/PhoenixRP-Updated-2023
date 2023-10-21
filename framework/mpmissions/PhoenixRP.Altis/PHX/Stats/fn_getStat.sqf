/*
	@File: fn_getStat.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns value of specificed statistic
*/
#include "..\..\script_macros.hpp"

params [
	["_stat", "Unknown", [""]],
	["_default", 0, [0]]
];

private _idx = (
	PHX_Statistics findIf { (_x select 0) isEqualTo _stat }
);

if (_idx isEqualTo -1) exitWith { _default };

((PHX_Statistics select _idx) select 1)