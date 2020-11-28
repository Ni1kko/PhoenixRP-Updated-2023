/*
    File: fn_receiveItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Receive an item from a player.
*/
#include "..\..\script_macros.hpp"
params [
  ["_unit", objNull, [objNull]],
  ["_val", 0, [0, ""]],
  ["_item", "", [""]],
  ["_from", objNull, [objNull]]
];

if (isNull _unit || !(_unit isEqualTo player)) exitWith {};

if (_val isEqualType "") then {_val = parseNumber _val};

private _diff = [_item,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if (!(_diff isEqualTo _val)) then {
    if ([true,_item,_diff] call life_fnc_handleInv) then {
        [format ["%1 has gave you %2 but you can only hold %3 so %4 was returned back.", _from getVariable ["realname",name _from],_val,_diff,(_val - _diff)]] call PHX(notify);
        [_from,_item,str(_val - _diff),_unit] remoteExecCall ["life_fnc_giveDiff",_from];
    } else {
        [_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
    };
} else {
    if ([true,_item,_val] call life_fnc_handleInv) then {
        private _type = M_CONFIG(getText,"CfgItems",_item,"displayName");
        [format ["%1 has gave you %2 %3.", _from getVariable ["realname",name _from],_val,(_type)], "green"] call PHX(notify);
        [player, format ["%1 (%2) was given %3 %4 by %5 (%6).",profileName,getPlayerUID player,_val,(_type),_from getVariable ["realname",name _from],getPlayerUID _from], "https://rcon.phoenixrp.co.uk/api/v1/log/item"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    } else {
        [_from,_item,_val,_unit,false] remoteExecCall ["life_fnc_giveDiff",_from];
    };
};
