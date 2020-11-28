#include "..\..\script_macros.hpp"
/*
    File: fn_jail.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Starts the initial process of jailing.
*/

params [
    ["_unit",objNull,[objNull]],
    ["_time", 10, [0]],
    ["_side", sideUnknown, [west]]
];

if (isNull _unit || {!(_unit isEqualTo player)} || {life_is_arrested}) exitWith {};

player setVariable ["restrained",sideUnknown,true];
player setVariable ["Escorting",false,true];

//--- Save the jail marker to the namespace if they are being sent by someone, incase of disconnect / respawn
if !(_side isEqualTo sideUnknown) then {
    missionNameSpace setVariable ["PHX_jailMarker",(["jail_marker","havoc_jail_marker"] select (_side isEqualTo east))];
};

NOTIFY("You have been arrested. If you attempt to respawn or reconnect your time will increase!","cyan");
player setPos (getMarkerPos (missionNameSpace getVariable ["PHX_jailMarker","jail_marker"]));

{
    if (ITEM_VALUE(configName _x) > 0 && (ITEM_ILLEGAL(configName _x))) then {
        [false,_x,(ITEM_VALUE(configName _x))] call life_fnc_handleInv;
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

life_is_arrested = true;
life_jail_time = _time;

life_is_arrested_police = (_side isEqualTo west);
life_is_arrested_havoc = !life_is_arrested_police;

removeAllWeapons player;
{player removeMagazine _x} forEach (magazines player);
removeVest player;
removeBackpack player;
removeAllWeapons player;

if (_side isEqualTo west || { _side isEqualTo civilian }) then {
    player forceAddUniform "U_C_Scientist";
    [] call PHX(playerSkins);
};

[player,_time] remoteExecCall ["life_fnc_jailSys",RSERV];

[] call SOCK_fnc_updateRequest;