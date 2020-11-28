#include "..\..\script_macros.hpp"
/*
	@File: fn_ticketGive.sqf
	@Author: Bryan "Tonic" Boardwine
    @Modified: Zyn
	@Description: Cop creates the ticket
*/

params [
    ["_unit",objNull,[objNull]]
];

if (isNull _unit || {!isPlayer _unit} || {(isDowned(_unit))}) exitWith {};

private _value = ["Enter the ticket amount","Confirm","Cancel"] call PHX_fnc_editBox;

if !(_value isEqualType "") exitWith {};
if !([_value] call LIFE_fnc_isNumber) exitWith {["You didn't enter actual number", "red"] call PHX_fnc_notify;};
_value = parseNumber _value;

if (_value > 1000000) exitWith {["Tickets can not exceed £200,000!", "red"] call PHX_fnc_notify;};

[0,format["%1 gave a ticket of £%2 to %3", player getVariable "realname", [_value] call life_fnc_numberText, _unit getVariable ["realname", name _unit]]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
[player,_value] remoteExec ["life_fnc_ticketPrompt", _unit];
closeDialog 0;

[player, format ["%1 (%2) gave a ticket of %3 to %4 (%5).", profileName, getPlayerUID player, [_value] call life_fnc_numberText, _unit getVariable ["realname", name _unit], getPlayerUID _unit], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

player say3D "ticket";

[20, format["Ticketing %1", _unit getVariable ["realname", name _unit]]] call PHX_fnc_handleXP;
