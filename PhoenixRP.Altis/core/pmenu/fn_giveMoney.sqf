/*
	@File: fn_giveMoney.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Give money...
*/
#include "..\..\script_macros.hpp"
if !(params[
    ["_unit", objNull, [objNull]]
]) exitWith {};

if !(canSuspend) exitWith { _this spawn LIFE(giveMoney) };

waitUntil { closeDialog 0; !dialog };

if (player getVariable ["isAdmin",false]) exitWith {NOTIFY("You need to use the compensate function when on as admin!","red")};

private _amount = [
    format["How much money do you want to give %1?", _unit getVariable ["realname",name _unit]],
    "Give Money","Cancel"
] call PHX_fnc_editBox;

if !(_amount isEqualType "") exitWith {};
if !([_amount] call LIFE_fnc_isNumber) exitWith { ["The value you're entering must only contain numbers","red"] spawn PHX(notify) };

_amount = parseNumber _amount;

if (CASH <= 0) exitWith { [format["You have no cash on you..."], "red"] spawn PHX(notify) };
if (_amount <= 0 || { _amount > CASH }) exitWith { [format["You can only give someone money between £0 and £%1", [CASH] call LIFE(numberText)],"red"] spawn PHX(notify) };

[format ["You gave £%1 to %2.", [_amount] call life_fnc_numberText, _unit getVariable ["realname",name _unit]]] spawn PHX(notify);
[_amount, 1, 0, (format["Gave to %1",(_unit getVariable ["realname",name _unit])])] call PHX(handleMoney);

[player, _amount] remoteExecCall ["life_fnc_receiveMoney", _unit];

[player, format ["%1 (%2) gave %3 to %4 (%5). Bank Balance: %6 On Hand Balance: %7",profileName,(getPlayerUID player),[_amount] call life_fnc_numberText,_unit getVariable ["realname",name _unit],(getPlayerUID _unit),[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);