#include "..\..\script_macros.hpp"
/*
 *  @File: fn_ownsHideout.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  Sees if the gang owns the hideout
*/

params [
    ["_object", "", [""]]
];

_object = call compile _object;

private _group = (_object getVariable ["gangID",0]) call PHX_fnc_groupByID;
private _return = false;

if (_group isEqualTo grpPlayer) then {
	_return = true;
};

_return