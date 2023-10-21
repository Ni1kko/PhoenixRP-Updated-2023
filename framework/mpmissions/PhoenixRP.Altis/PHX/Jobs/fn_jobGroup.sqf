/*
	@File: fn_jobGroup.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Groups the player into a group matching the given job parameter...
*/
#include "..\..\script_macros.hpp"
if !(params [["_group", "", [""]]]) exitWith {};

[player] join (createGroup civilian);

private _groupObj = grpNull;
{
  if (!isNil {_x getVariable _group}) exitWith {
    _groupObj = _x;
  };
} forEach allGroups select {!isNil {_x getVariable "isJob"}};

if !(isNull _groupObj) then {
  [player] join _groupObj;
} else {
  _groupObj = group player;
  _groupObj setVariable ["isJob", true, true];
  _groupObj setVariable [_group, true, true];
};

player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];