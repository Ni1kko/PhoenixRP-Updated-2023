/*
    File: fn_syncData.sqf
    Author: Bryan "Tonic" Boardwine"

    Description:
    Used for player manual sync to the server.
*/
#include "..\..\script_macros.hpp"
_fnc_scriptName = "Player Synchronization";

if (isNil "life_session_time") then { life_session_time = false };
if (life_session_time) exitWith {["You have already used the sync option, you can only use this feature once every 5 minutes","red"] call PHX_fnc_notify};

[] call SOCK_fnc_updateRequest;

["Syncing player information to the server. Please allow 10 seconds before leaving","cyan"] call PHX_fnc_notify;

[] spawn {
    life_session_time = true;
    sleep (5 * 60);
    life_session_time = false;
};