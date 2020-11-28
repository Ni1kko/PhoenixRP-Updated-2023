#include "..\..\script_macros.hpp"

if !(canSuspend) exitWith { _this spawn PHX(panic) };

params [
	["_player", objNull, [objNull]],
	["_deleteTime", 60, [0]]
];

if (isNull _player || { !(playerSide isEqualTo west) }) exitWith {};

_backupmsg = createMarkerLocal [("_backupmsg" + (_player getVariable["realname",name _player])), getPos _player];
_backupmsg setMarkerTypeLocal "mil_warning";
_backupmsg setMarkerColorLocal "colorRed";
_backupmsg setMarkerTextLocal format ["%1", _player getVariable["realname",name _player]];

[_player, "backup"] remoteExecCall ["life_fnc_say3D",0];

[format["%1 Requested Urgent Backup at their location marked on the map!",_player getVariable["realname",name _player]]] spawn PHX(notify);
uiSleep _deleteTime;
deleteMarkerLocal _backupmsg;