#include "..\..\script_macros.hpp"
/*
    File: fn_skyDive.sqf
    Author: blaster
    Modified: Rambo6699(Ciaran Langton, Pink (L.27)), demigod, Zyn
    Description: Sky diving...
*/
if (PHX_isSkyDiving) exitWith {};

if (CASH < 5000) exitWith {["Skydiving Costs £5,000!", "red"] call PHX_fnc_notify};
[5000,1,0,"Skydiving Fee"] call PHX_fnc_HandleMoney;
[player, format ["%1 (%2) went sky diving for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[5000] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

PHX_isSkyDiving = true;

cutText ["", "BLACK OUT", 5];
cutText ["Welcome to PhoenixRP Skydiving!", "BLACK FADED"];
life_action_inUse = true;

sleep 3;
cutText ["You're approaching the jump zone. Get ready to jump!", "BLACK FADED"];
private _backpackName = backpack player;
private _backpackItems = backpackItems player;

sleep 1;
removeBackpack player;

for "_i" from 0 to 2 do {
	sleep 1;
	cutText [str(_i), "BLACK FADED"];
};

sleep 1;
cutText ["GO GO GO!", "BLACK FADED"];
player addBackpack "B_Parachute";
player setPos [getPos player select 0, getPos player select 1, 3000];

sleep 1;
titleCut [" ","BLACK IN",3];

sleep 1;

PHX_isSkyDiving = false;

waitUntil {(vehicle player != player)};
waitUntil {isTouchingGround player};
deleteVehicle vehicle player;

sleep 1;
removeBackpack player;

sleep 1;
player addBackpack _backpackName;
clearAllItemsFromBackpack player;

{
	[_x,true,true] call life_fnc_handleItem;
} forEach _backpackItems;

life_action_inUse = false;