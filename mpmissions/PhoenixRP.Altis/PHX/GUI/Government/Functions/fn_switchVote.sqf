/*
	@File: fn_switchVote.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes our selected vote on the ballot...
*/
#include "..\..\..\..\script_macros.hpp"
params [
	["_vote", []],
	["_IDC", 0]
];

_vote params ["_optionID", "_voteUID", "_pollID"];

if ((getPlayerUID player) isEqualTo _voteUID) exitWith {
	CONTROL(3000, _IDC) cbSetChecked false; // Uncheck me...
	["You're unable to vote for yourself", "red"] spawn PHX(notify);
};

PHX_vote = [_optionID, _pollID];

// Uncheck me daddy...
{
	if !(_x isEqualTo _IDC) then {
		CONTROL(3000,_x) cbSetChecked false;
	};
} forEach PHX_checkIDC;

ctrlEnable[3005, true];