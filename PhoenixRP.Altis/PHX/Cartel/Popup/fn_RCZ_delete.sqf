/*
*   @File: fn_RCZ_delete.sqf
*   @Author: Sig
*
*   Description: Deletes a random cartel zone
*/

#include "..\..\..\script_macros.hpp"

if (!params [["_obj", objNull, [objNull]]]) exitWith {};

// -- Since this is remote executed to all clients, the server will delete the zone
// -- and the ui handle will be terminated on client side
if (isServer) then {

  // -- Delete all the markers that are attached to the zone
  {
    deleteMarker _x;
  } forEach (_obj getVariable ["PHX_zoneMarkers", []]);

  // -- Delete the object itself
  deleteVehicle _obj;

  [_obj] remoteExecCall ["PHX_fnc_RCZ_delete", RCLIENT];

} else {

  // -- Terminate the ui handle
  if (!isNull PHX_clientEntryHandle) then {
    terminate PHX_clientEntryHandle
  };
  ["unLoad", _obj] call PHX_fnc_RCZ_ui

}
