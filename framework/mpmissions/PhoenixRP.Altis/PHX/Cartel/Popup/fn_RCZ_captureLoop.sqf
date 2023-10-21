/*
*   @File: fn_RCZ_captureLoop.sqf
*   @Author: Sig
*
*   Description: Monitors the random cartel zone and checks for players in the zone,
*   and then handles the progress / capturing of the zone
*
*   Arguments
*     0 <TYPE: OBJECT> - Zone (empty helipad) that is being monitored
*
*   Return: Nothing
*/


#include "..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCartel" >> "Altis" >> "Popup"

if (!params [["_obj", objNull, [objNull]]]) exitWith {};

private _waitTime = (getNumber (CFG >> ["below70CapTime", "captureTimeInSeconds"] select (ONLINE(civilian) >= 70))) / 100;

(_obj getVariable ["PHX_zoneMarkers", []]) params ["_capZone", "_objMarker"];


for "_i" from 0 to 1 step 0 do {

  sleep _waitTime;
  private _progress = _obj getVariable ["PHX_progress", 0];

  private _domGroup = (([_capZone, independent, false, "_x call PHX_fnc_hasGroup"] call PHX(unitsInZone)) apply {group _x}) param [0, grpNull, [grpNull]];


  // -- If there are any groups at all inside the zone
  if (!isNull _domGroup) then {


    // -- If only members of that group is in the zone
    if (count ([_capZone, _domGroup, false, "_x call PHX_fnc_hasGroup"] call PHX(unitsInZone)) isEqualTo 0) then {

      switch true do {

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // -- When the zone is captured
        case (_progress >= 1): {

          _objMarker setMarkerText format ["Cartel - %1", switch (side _domGroup) do {case west: {"Neutralized APC"}; case east: {"Neutralized HAVOC"}; default {"Captured"};}];
          _obj setVariable ["PHX_zoneCaptured", true, true];

          private _units = [_capZone, _domGroup, true] call PHX(unitsInZone);

          // -- Get the payout, if there are less civilians than 70 the max pay will be lower
          private _payOut = getArray (CFG >> "payOutRange");
          _payOut = [_payOut # 0, (_payOut # 0) + ((_payOut # 0) * .2),  _payOut # 1];

          if (ONLINE(civilian) < 60) then {
            private _below70 = getNumber (CFG >> "below70MaxPay");

            _payOut set [1, (_payOut # 1) min _below70];
            _payOut set [2, _below70];

          };

          _payOut = round random _payOut;

          // -- Give the money to a random person in the zone
          private _reciever = selectRandom _units;

          if (side _reciever isEqualTo civilian) then {
            {
              [_payOut] remoteExecCall ["PHX_fnc_RCZ_capturedClient", _x];
            } forEach _units;
          };

          [2, "You have succesfully captured the cartel!"] remoteExecCall ["life_fnc_broadcast", _units];

          // -- Wait 30 seconds before the zone is deleted
          [_thisScript, _obj] spawn {
            terminate (_this # 0);

            // 10% chance an airdrop will spawn at this cartel...
            if (10 > (floor random 100)) then {
              [3, format ["<t color='#ff0000' size='1.5px'>Cartel Airdrop<br/></t><t color='#ffffff' size='1px'>An airdrop has spawned at a recently captured cartel capture zone! The location is still marked on your map."]] remoteExecCall ["life_fnc_broadcast", -2];
              private _handle = [(getPos (_this # 1))] spawn PHX_fnc_spawnAirdrop;
              waitUntil {scriptDone _handle};
            };

            sleep 30;
            private _handle = (_this # 1) getVariable ["PHX_spawnHandle", scriptNull];
            if (!isNull _handle) then {
              terminate _handle;
            };
          };

        };

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // -- When the zone is being captured
        default {

          _obj setVariable ["PHX_progress", _progress + 0.01, true];
          _objMarker setMarkerText format ["Cartel (%1%2)", round(_progress * 100), "%"];

        };

      };

    };

  };

};
