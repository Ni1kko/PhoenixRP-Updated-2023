/*
	@File: fn_AANBroadcast.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks our inputs then broadcasts our AAN banner...
*/
#include "..\..\..\..\script_macros.hpp"
disableSerialization;

private _display = findDisplay 9000;
if (isNull _display) exitWith { ["Something went wrong..."] spawn PHX(notify) };

private _broadcastHeader = ctrlText (_display displayCtrl 9001);
private _broadcastMessage = ctrlText (_display displayCtrl 9002);

closeDialog 0;

private _arHeader = toArray (_broadcastHeader);
private _allowedLength = 60;

if ((count(_arHeader)) > _allowedLength) exitWith { [format["The header can be no longer than %1 characters", _allowedLength]] spawn PHX(notify) };

if ((_arHeader findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ")))}) > -1) exitWith {
    ["The header can only contain letters and numbers!"] spawn PHX(notify);
};

[_broadcastHeader, _broadcastMessage, profileName] remoteExec ['life_fnc_AAN', -2];
life_broadcastTimer = time;