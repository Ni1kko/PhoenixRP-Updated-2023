/*
	@File: fn_notifyPollStatus.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Conner's gay...
*/
#include "..\..\script_macros.hpp"

{
	_x params ["_type", "_msg"];

	private _array = missionNameSpace getVariable [format["PHX_%1", _type], []];

	{
		_x params ["_title"];

		[
			format[_msg, _title],
			"black",
			"Polling Update"
		] spawn PHX(notify);
	} forEach _array;
} forEach [
	["activePolls", "The polling stations are currently open with a vote for the %1"], 
	["noVotes", "The poll on %1 had no votes so failed"], 
	["noOptions", "The planned polling for %1 has been cancelled as no options were available..."]
];