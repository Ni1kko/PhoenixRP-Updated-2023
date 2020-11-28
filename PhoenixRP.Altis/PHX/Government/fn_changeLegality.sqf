/*
	@File: fn_changeLegality.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks stuff then calls for the legality of items to be changed...
*/
#include "..\..\script_macros.hpp"

if !(PHX_isPM) exitWith {closeDialog 0; ["You're not allowed to change the legality of items!","red"] spawn PHX(notify)};
if (PHX_Legality isEqualTo []) exitWith {};

private _changed = []; // array of all changed types...

{
	_x params [["_type", "", [""]], ["_idc", 0, [0]]];

	private _isIllegal = (_type in PHX_IllegalItems);
	private _curState = cbChecked CONTROL(4000, _idc);

	if !(_isIllegal isEqualTo _curState) then {
		_changed pushBackUnique [_type, _curState];
	};
} forEach PHX_Legality;

if (_changed isEqualTo []) exitWith {["You've not changed the legality of any items!","red"] spawn PHX(notify)};

[_changed] remoteExec (["fnc_setLegality", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
closeDialog 0;