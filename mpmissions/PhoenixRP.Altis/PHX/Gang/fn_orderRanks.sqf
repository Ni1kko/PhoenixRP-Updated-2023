/*
	@File: fn_orderRanks.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes, It's shitty and unoptimised but I don't give a fuck
*/
#include "..\..\script_macros.hpp"

private _group = grpPlayer;

private _mArr = [];
private _sM = []; // Sorted Members
private _rArr = [];

{	
	private _i = _x;
	private _newVal = _forEachIndex;

	{
		_x set [2, _newVal];
		_mArr pushBack _x;

		[10, _group, [(_x select 1), _newVal]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

		_sM pushBackUnique (_x select 1); // Shit way of ensuring we don't do someone twice...

		// Update their info if they're on the server...
		private _unit = (_x select 1) call PHX(unitByUID);

		if !(isNull _unit) then {
			_unit setVariable ["gangDetails", [(_group getVariable "gang_id"), _newVal], true];
		};
	} forEach ((_group getVariable "gang_members") select { (_x select 2) isEqualTo (_i select 1) && { !((_x select 1) in _sM) } });
	
	_i set [1, _newVal];
	_rArr pushBack _i;

	[11, _group, _i] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
} forEach (_group getVariable "gang_ranks");

_group setVariable ["gang_ranks", _rArr, true];
_group setVariable ["gang_members", _mArr, true];