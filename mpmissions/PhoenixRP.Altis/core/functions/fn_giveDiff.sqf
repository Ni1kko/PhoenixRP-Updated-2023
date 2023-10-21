#include "..\..\script_macros.hpp"
/*
    File: fn_giveDiff.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    ??A?SD?ADS?A
*/

params [
  ["_unit", objNull, [objNull]],
  ["_item", "", [""]],
  ["_val", 0, [0, ""]],
  ["_from", objNull, [objNull]]
];

if (isNull _unit || !(_unit isEqualTo player)) exitWith {};

private _type = (M_CONFIG(getText,"CfgItems",_item,"displayName"));

if (_val isEqualType "") then {_val = parseNumber _val};

if (count _this > 4) then {
    if ([true,_item,_val] call life_fnc_handleInv) then {
        [format ["You tried to give %1 %2 %3 but they couldn't hold that so it was returned.", _from getVariable["realname",name _from],_val, _type], "red"] call PHX(notify);
        [player, format ["%1 (%2) attempted to give %3 (%4) %5 %6.",profileName,getPlayerUID player,_from getVariable ["realname",name _from],getPlayerUID _from,_val, _type], "https://rcon.phoenixrp.co.uk/api/v1/log/item"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    };
} else {
    if ([true,_item,_val] call life_fnc_handleInv) then {
        [format ["%1 returned %2 %3 because they couldn't hold that amount.", _from getVariable["realname",name _from],_val, _type], "red"] call PHX(notify);
    };
};
