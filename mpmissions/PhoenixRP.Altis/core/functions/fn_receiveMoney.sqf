/*
	@File: fn_receiveMoney.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Receive money...
*/
#include "..\..\script_macros.hpp"
if !(params [
    ["_from",objNull,[objNull]],
    ["_val",0,[0]]
]) exitWith {};

if (isNull _from || { _val <= 0 } || { player isEqualTo _from }) exitWith {};

[format ["%1 has given you £%2.",_from getVariable ["realname",name _from], [_val] call life_fnc_numberText]] spawn PHX(notify);
[_val, 0, 0, (format["Received from %1",(_from getVariable ["realname",name _from])])] call PHX(handleMoney);

[player, format ["%1 (%2) was given %3 from %4 (%5)",profileName,getPlayerUID player,[(parseNumber (_val))] call life_fnc_numberText,_from getVariable ["realname",name _from],getPlayerUID _from], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);