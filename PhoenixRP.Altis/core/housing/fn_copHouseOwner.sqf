/*
    File: fn_copHouseOwner.sqf
    Author:

    Description:
    Displays the house owner
*/

params [
    ["_house", objNull, [objNull]]
];

if (isNull _house || {!(_house isKindOf "House_F")}) exitWith {};
if (isNil {(_house getVariable "house_owner")}) exitWith {["This house doesn't belong to anyone!","red"] call PHX_fnc_notify};
hint parseText format ["<t color='#FF0000' size='1.7'>House Owner</t><br/>%1",(_house getVariable "house_owner") select 1];

[player, format ["%1 (%2) checked ownership of %3 house.",name player,getPlayerUID player, (_house getVariable "house_owner") select 1], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);