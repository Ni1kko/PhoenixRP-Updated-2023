#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/

// This is a headless client.
if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_server\headless\fn_initHeadless.sqf";
};

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
// if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

enableRadio false;
enableSentences false;
enableEnvironment [true, true];
disableRemoteSensors true;
enableCamShake false;

[true] call PHX_fnc_initBacking;
("RscBacking" call PHXUI_fnc_getLayer) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

["RscTitleLoading"] call PHXUI_fnc_createLayer;

[] execVM "PHX\Initialization\fn_Initialization.sqf";