/*
	@File: fn_setTag.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes our any tag...
*/
#include "..\..\script_macros.hpp"

private _newTag = ["Enter tag","Change Tag","Cancel"] call PHX_fnc_editBox;

private _cntTg = count (toArray(_newTag));
if ((_cntTg < 3 || { _cntTg > 6 }) && { !(_newTag isEqualTo "") }) exitWith { ["Your tag must be between 2 - 7 characters long","red"] spawn PHX(notify) };

if (_newTag in ["[APC]", "[NHS]", "[HAVOC]", "[SO1]", "[CID]", "[HSS]"]) exitWith { ["Your tag can't include blacklisted words","red"] spawn PHX(notify) };

[format["You've change your tag to %1", _newTag],"green"] spawn PHX(notify);

player setVariable ["realname", (format["%1 %2", _newTag, name player]), true];