/*
	@File: fn_renameGang.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Renames our gang...
*/
#include "..\..\script_macros.hpp"

private _group = grpPlayer;

if (isNil {_group getVariable "gang_name"}) exitWith {}; // Wtf, Should never happen...

private _curName = _group getVariable "gang_name";
private _newName = ["Enter new group name","Rename","Cancel"] call PHX_fnc_editBox;

if !(_newName isEqualType "") exitWith {};

if (_newName isEqualTo "") exitWith { ["You must enter a new gang name","red"] spawn PHX(notify) };
if (_curName isEqualTo _newName) exitWith { ["You must change the name to something different","red"] spawn PHX(notify) };
if (count (toArray(_newName)) > 32) exitWith { ["You can't have an organisation name longer then 32 characters","red"] spawn PHX(notify) };

if (((toArray (_newName)) findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ")))}) > -1) exitWith {
    ["You have invalid characters in your organisation name. It can only consist of numbers and letters with an underscore.","red"] spawn PHX(notify);
};

[5, _group, _newName] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

uiSleep 0.3; // Wait before updating the UI...
[24000, "Group"] call PHX(switchApp);