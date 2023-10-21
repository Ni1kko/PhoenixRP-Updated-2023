#include "..\..\script_macros.hpp"
/*
    File: fn_licenseCheck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns the licenses to the cop.
*/
if !(params[["_cop", objNull, [objNull]]]) exitWith {};

private _licenses = "";

{
    if (LICENSE_VALUE(configName _x, "civ")) then {
        _licenses = _licenses + getText(_x >> "displayName") + "<br/>";
    };
} forEach ("getText(_x >> 'side') isEqualTo 'civ'" configClasses (missionConfigFile >> "CfgLicenses"));

if (_licenses isEqualTo "") then { _licenses = "No Licenses" };

[profileName,_licenses] remoteExecCall ["life_fnc_licensesRead",_cop];