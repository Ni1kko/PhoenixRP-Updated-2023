/*
*   @File: fn_RCZ_client.sqf
*   @Author: Sig
*
*   Description: Handles the capturing of the random cartel zone
*   for the client
*/

#include "..\..\..\script_macros.hpp"

if (!params [["_obj", objNull, [objNull]]]) exitWith {};
if (isNull _obj || playerSide isEqualTo independent) exitWith {};

// -- Get the markers of the zone
PHX_clientEntryHandle = [_obj] spawn {

  params ["_obj"];
  (_obj getVariable ["PHX_zoneMarkers", []]) params [["_capZone", "PHX_zoneMarker", [""]], ["_objMarker", "PHX_objMarker", [""]]];

  for "_i" from 0 to 1 step 0 do {

    // -- Get rid of the ui
    if (isNull _obj) exitWith {["unLoad", _obj] call PHX_fnc_RCZ_ui; terminate _thisScript};

    // -- When the unit enters the zone
    waitUntil {(vehicle player) inArea _capZone && {!(isDowned(player))} && {alive player}};

    ["You have entered the capture zone.", "cyan"] call PHX_fnc_notify;
    ["init", _obj] call PHX_fnc_RCZ_ui;

    // -- When the unit leaves the zone
    waitUntil {!((vehicle player) inArea _capZone) || {(isDowned(player))} || {!alive player}};

    // -- Only notify if they actually left the zone and didnt die
    if !((vehicle player) inArea _capZone) then {
      ["You have left the capture zone.", "red"] call PHX_fnc_notify;
    };

    ["unLoad", _obj] call PHX_fnc_RCZ_ui;

  };

};
