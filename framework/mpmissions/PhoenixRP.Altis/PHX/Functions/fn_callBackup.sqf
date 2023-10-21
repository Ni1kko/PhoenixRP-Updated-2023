#include "..\..\script_macros.hpp"
if !(canSuspend) exitWith { _this spawn PHX(callBackup) };

if !(isNil "calledBackup") exitWith { ["You must wait before using your panic again..."] spawn PHX(notify) }; 

_backupTime = 60;  
[player, _backupTime] remoteExecCall ["PHX_fnc_panic", west];

calledBackup = true;
sleep _backupTime + 320;  
calledBackup = nil;

["You can now call for backup again..."] spawn PHX(notify);