/*
	@File: fn_setMessage.sqf
	@Author: Jack "Scarso" Farhall
	@Modified: Zyn
	@Description: Changes our gangs message...
*/
#include "..\..\script_macros.hpp"
params [["_remote", false, [true]]];

private _group = grpPlayer;

if (isNil {_group getVariable "gang_name"}) exitWith {}; // Wtf, Should never happen...

private _newMessage = ["Enter new group message","Confirm","Cancel"] call PHX_fnc_editBox;

private _count = count (toArray(_newMessage));
if (_count > 255) exitWith { ["Your must be less than 255 characters long","red"] spawn PHX(notify) };

[11, _group, _newMessage] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

[format["You've change the group message to %1", _newMessage],"green"] spawn PHX(notify);

[24000, "Group"] call PHX(switchApp);