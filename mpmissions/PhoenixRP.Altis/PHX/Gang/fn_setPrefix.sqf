/*
	@File: fn_setPrefix.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes our gangs prefix...
*/
#include "..\..\script_macros.hpp"
params [["_remote", false, [true]]];

private _group = grpPlayer;

if (isNil {_group getVariable "gang_name"}) exitWith {}; // Wtf, Should never happen...

private _curTag = _group getVariable "gang_tag";
private _newTag = ["Enter new group tag","Change Tag","Cancel"] call PHX_fnc_editBox;

if (_curTag isEqualTo _newTag) exitWith { ["Your tag can't be the same as the current one","red"] spawn PHX(notify) };

private _cntTg = count (toArray(_newTag));
if ((_cntTg < 3 || { _cntTg > 6 }) && { !(_newTag isEqualTo "") }) exitWith { ["Your tag must be between 2 - 7 characters long","red"] spawn PHX(notify) };

if (_newTag in ["[APC]", "[NHS]", "[HAVOC]", "[SO1]", "[CID]", "[HSS]"]) exitWith { ["Your tag can't include blacklisted words","red"] spawn PHX(notify) };

[6, _group, _newTag] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
_group setVariable ["gang_tag", _newTag, true];

[format["You've change the group tag to %1", _newTag],"green"] spawn PHX(notify);

{
	_x setVariable ["realname", (format["%1 %2", _newTag, name _x]), true]; true
} count (units (_group));

[24000, "Group"] call PHX(switchApp);