/*
*   @File: fn_RCZ_init.sqf
*   @Author: Sig
*
*   Description: Initalises random spawn cartels (RCZ = Random Cartel Zones)
*/

#include "..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCartel" >> "Altis" >> "Popup"

if (!isServer || hasInterface) exitWith {};

_this spawn {

  // -- Define all the times based on if debugmode is enabled or not
  private _sleepTime = getNumber (CFG >> "spawnInterval");
  private _deleteTimer = getNumber (CFG >> "deleteTimer");
  private _minUnits = 40;
  private _notifyTime = 5 * 60;

  for "_i" from 0 to 1 step 0 do {

    // -- First sleep for the time it takes to spawn,
    // -- and then wait until there are enough players on for the zone to spawn
    sleep _sleepTime;
    waitUntil {ONLINE(civilian) >= _minUnits};

    // -- Notify five and ten minutes before spawning
    [3, "<t color='#ff0000' size='1.5px'>Cartel<br/></t><t color='#ffffff' size='1px'>A cartel capture zone is spawning! The location will be marked on your map in 10 minutes."] remoteExecCall ["life_fnc_broadcast", RCLIENT];
    sleep _notifyTime;
    [3, "<t color='#ff0000' size='1.5px'>Cartel<br/></t><t color='#ffffff' size='1px'>A cartel capture zone is spawning! The location will be marked on your map in 5 minutes."] remoteExecCall ["life_fnc_broadcast", RCLIENT];
    sleep _notifyTime;

    // -- Handle the zone and call the capture loop,
    // -- is spawned so that it can be terminated whenever the zone is captured
    private _obj = [] call PHX_fnc_RCZ_create;
    [_obj] remoteExecCall ["PHX_fnc_RCZ_client", RCLIENT, true];
    [3, format ["<t color='#ff0000' size='1.5px'>Cartel<br/></t><t color='#ffffff' size='1px'>The cartel capture zone has spawned! The location has been marked on your map."]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

    private _handle = [_obj, _deleteTimer] spawn {

      params ["_obj", "_time"];

      // -- Spawn the capture loop, and then sleep the delete time. If the zone is captured,
      // -- this handle will be terminated and the delete function will be ran
      _obj setVariable ["PHX_capHandle", _obj spawn PHX_fnc_RCZ_captureLoop];
      sleep _time;

      // -- Finally make sure no units are in the zone
      waitUntil {(count ([(_obj getVariable ["PHX_zoneMarkers", []] param [0, "", [""]]), independent, false, "_x call PHX_fnc_hasGroup"] call PHX(unitsInZone))) isEqualTo 0};

    };

    _obj setVariable ["PHX_spawnHandle", _handle];
    // -- Using waituntil and spawn so that the handle can be terminated when
    // -- the zone is captured
    waitUntil {scriptDone _handle};
    [_obj] call PHX_fnc_RCZ_delete;

    // -- Notify everyone that the zone has despawned / captured
    private _message = ["Nobody captured the zone, a new one will appear soon", "The cartel has been captured, a new one will appear soon!"] select (_obj getVariable ["PHX_zoneCaptured", false]);
    [3, format ["<t color='#ff0000' size='1.5px'>Cartel<br/></t><t color='#ffffff' size='1px'>%1</t>", _message]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

    // -- Terminate the capture loop if the zone timed out
    private _capHandle = _obj getVariable ["PHX_capHandle", scriptNull];
    if (!isNull _capHandle) then {
      terminate _capHandle
    };

  };

};
