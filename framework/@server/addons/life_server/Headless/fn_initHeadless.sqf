/*
	@File: fn_initHeadless.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Starts the functions and shit that headless is going to takeover from the server...
*/
#include "\life_server\script_macros.hpp"
if !(EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 1) exitWith {};

waitUntil {!isNil "life_server_isReady"};
waitUntil {life_server_isReady};

WORLD = (toLower (worldName));

// Get our headless client a database connection... If this fails then we give up...
[] call PHXSRV_fnc_getConnection;

waitUntil { !(isNil "life_sql_id") }; // Check this var for HC cuz life_server_extDB_notLoaded has already been used by live server...
if (life_server_extDB_notLoaded) exitWith {};

// Cleanup...
cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";
[] spawn TON_fnc_cleanup;

// Take over cartel loops...
PHX_CartelLoops = [];
if !(PHX_capZones isEqualTo []) then {
    [] call PHXSRV_fnc_captureLoop;
};

HC_Active = true;
publicVariable "HC_Active";
