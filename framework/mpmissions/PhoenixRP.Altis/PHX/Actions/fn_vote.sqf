/*
	@File: fn_vote.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Cast our vote in this election...
*/
#include "..\..\script_macros.hpp"

[PHX_vote, player] remoteExecCall (["fnc_addVote", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
closeDialog 0;