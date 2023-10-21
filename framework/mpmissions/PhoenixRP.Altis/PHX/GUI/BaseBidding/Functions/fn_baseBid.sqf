/*
	@File: fn_baseBid.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens the base bidding...
*/
#include "..\..\..\..\script_macros.hpp"

// Checks...
if (isNil "BASENAME") exitWith {};
if !(PHX_isWaring) exitWith { ["Base Wars must be active before you can bid on one..."] spawn PHX(notify) };
if !(playerSide isEqualTo civilian) exitWith {};
if (isNil {grpPlayer getVariable "gang_id"}) exitWith { ["You must be in a gang to bid on a gang base"] spawn PHX(notify) };
if (isDowned(player) || !alive player) exitWith {["Your not even alive big man"] spawn PHX(notify)};


private _gID = (grpPlayer getVariable "gang_id");
if (BASEID isEqualTo _gID) exitWith { ["Your gang currently has the highest bid on this base"] spawn PHX(notify) };

private _bid = BASEVAL + 1000000;

if((grpPlayer getVariable ["gang_bank", 0]) < _bid) exitWith { ["Your group funds can't afford this purchase!"] spawn PHX(notify) };

private _minBid = BASEVAL + (LIFE_SETTINGS(getArray,"bidLimits") select 1);

if (_bid < _minBid) exitWith { [format["You must bid at least £%1", [_minBid] call LIFE(numberText)]] spawn PHX(notify) };

[BASENAME, _bid, _gID] remoteExecCall (["fnc_addBid", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
closeDialog 0;