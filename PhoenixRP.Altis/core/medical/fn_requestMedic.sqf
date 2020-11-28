#include "..\..\script_macros.hpp"
/*
    File: fn_requestMedic.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    N/A
*/
if (independent countSide playableUnits > 0) then {
    [player] remoteExecCall ["life_fnc_medicRequest",independent];
} else {
    [player] remoteExecCall ["life_fnc_medicRequest",west];
};

if ([(position player)] call PHX_fnc_isRedZone || {!([player] call PHX_fnc_inZone isEqualTo false)}) exitWith {
    PHX_canRequest = false;
    ((["RscIncapacitated"] call PHXUI_fnc_getLayer) displayCtrl 9005) ctrlSetStructuredText parseText ("<t align='center' size='1'>Your request was ignored as you're in a <t color='#8A2BE2'>Redzone</t></t>");
};

[] spawn {
    PHX_canRequest = false;
    ((["RscIncapacitated"] call PHXUI_fnc_getLayer) displayCtrl 9005) ctrlSetStructuredText parseText ("<t align='center' size='1'>Wait before requesting a medic</t>");
    sleep (2 * 60);
    PHX_canRequest = true;
    ((["RscIncapacitated"] call PHXUI_fnc_getLayer) displayCtrl 9005) ctrlSetStructuredText parseText ("<t align='center' size='1'>Press <t color='#8A2BE2'>Shift + Enter</t> to request a medic</t>");
};
