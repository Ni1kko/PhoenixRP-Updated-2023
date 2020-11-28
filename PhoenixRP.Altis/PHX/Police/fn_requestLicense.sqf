/*
	@File: fn_requestLicense.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\script_macros.hpp"
if !(params [["_cop", objNull, [objNull]]]) exitWith {};

private _copName = _cop getVariable ["realname", name _cop];
[format["%1 has request to view your licenses.",_copName]] spawn PHX(notify);

if !(
  [
    format ["%1 has requested to view your licenses...", _copName],
    "License Request",
    "Show Licenses",
    "Refuse"
  ] call PHX_fnc_confirmBox
) exitWith {
  [1,format["%1 refused to show their licenses to you.",profileName]] remoteExecCall ["life_fnc_broadcast", _cop];
  [format["You refused to show your licenses to %1",_copName]] spawn PHX(notify);
};

[1,format["%1 has shown their licenses to you.",profileName]] remoteExecCall ["life_fnc_broadcast", _cop];
[format["You have shown your licenses to %1", _copName]] spawn PHX(notify);
[_cop] call life_fnc_licenseCheck;