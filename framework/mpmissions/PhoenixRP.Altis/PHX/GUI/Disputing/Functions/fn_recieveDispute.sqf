/*
	@File: fn_recieveDispute.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Displays recieved disputes...
*/
#include "..\..\..\..\script_macros.hpp"
if !(params [
	["_dName", "", [""]],
	["_dUID", "", [""]],
	["_rName", "", [""]],
	["_rUID", "", [""]],
	["_reason", "", [""]]
]) exitWith {};

[
	format["You have received a dispute from %1 for %2. They want to speak to you about a previous situation. Please make your way to teamspeak and message them or try contact them in-game.",
		_dName,
		_reason
	],
	"red",
	"Dispute Received"
] spawn PHX(notify);

PHX_Recieved_Disputes pushBack [_dName, _reason];

playSound "Dispute"; // Play Sound...