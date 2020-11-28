#include "..\..\script_macros.hpp"
/*
    File: fn_pickupMoney.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Picks up money
*/

params [
    ["_money",objNull,[objNull]]
];

private "_value";
if !(_money getVariable ["PHX_realCash",false]) exitWith {[format["%1 attempted to pick up spawned money!", player getVariable ["realname", name player]], "(call life_adminlevel) > 0"] remoteExecCall ["PHX_fnc_hint", -2]; deleteVehicle _money;};
if ((time - life_action_delay) < 1.5) exitWith {["Action Cancelled.", "red"] call PHX_fnc_notify; _money setVariable ["inUse",false,true];};
if (isNull _money || {player distance _money > 3}) exitWith {_money setVariable ["inUse",false,true];};

private _value = (_money getVariable ["item", []]) select 1;

deleteVehicle _money;

// _value = 25000000 min _value;

player playMove "AinvPknlMstpSlayWrflDnon";
[format ["You have picked up £%1", [_value] call life_fnc_numberText], "green"] call PHX(notify);
[_value, 0, 0,"Picked up cash"] call PHX_fnc_handleMoney;
life_action_delay = time;

[player, format ["%1 (%2) picked up %3 from the ground. Bank Balance: %4 On Hand Balance %5", profileName, getPlayerUID player, [_value] call life_fnc_numberText, [BANK] call life_fnc_numberText, [CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
