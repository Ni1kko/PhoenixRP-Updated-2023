/*
    File: fn_radar.sqf
    Author: Silly Aussie kid named Jaydon

    Description:
    Looks like weird but radar?
*/

#include "..\..\script_macros.hpp"

if (isNull objectParent player || {!(playerSide isEqualTo west || (isCID(player)))}) exitWith {};

// -- Delay so it can only be pressed every 2 seconds
if ((time - life_action_delay) < 2) exitWith {};
life_action_delay = time;

// -- Play the ANPR sound to any nearby players, broadcasted from the players vehicle
[vehicle player, "anpr"] remoteExecCall ["life_fnc_say3D", -2];

private _cars = (nearestObjects [vehicle player, ["Car"], 100]) select {!(vehicle player isEqualTo _x) && {alive _x}};

// -- No nearby vehicles,
if (_cars isEqualTo []) exitWith {};

private _vehicle = _cars param [0, objNull];
if (isNull _vehicle) exitWith {};

// -- Check if someone in the vehicle does not have their seatbelt on.
private _seatbelt = ({!(_x getVariable ["seatbelt", false])} count (crew (_vehicle)));

private _seatbeltstatus = "OFF"; 
private _colour = "#bc0d0d";
if (_seatbelt < 1) then { _seatbeltstatus = "ON"; _colour = "#f9f2f2"; };

private _plate = getPlateNumber _vehicle;

private _speed = round speed _vehicle;

private _info = format ["<t color='#316dff' size='1.5' align='center'>ANPR</t><br/><t color='#119b0c' size='1px' align='center'>Speed:</t><t color='%2' size='1' align='center'> %1 km/h</t><br/><t color='#119b0c' size='1px' align='center'>Seatbelts: </t><t color='%4' size='1' align='center'>%3</t>", _speed, ["#bc0d0d", "#f9f2f2"] select (_speed < 120), _seatbeltstatus, _colour];

private _addition = switch (true) do {
  // "Scrambled Plates" Perk Check....
  case (_vehicle getVariable ["scrambler",false]) : {
    format ["<br/><t color='#119b0c' size='1px' align='center'>Registration:</t><t color='#ff0008' size='1' align='center'> Unreadable</t>"];
  };
  // HAVOC Vehicles...
  case (_vehicle getVariable ["ishavocVehicle",false]) : {
    format ["<br/><t color='#119b0c' size='1px' align='center'>Registration:</t><t color='#ff0008' size='1' align='center'> Foreign Plates</t>"];
  };
  // Defualt...
  default {
      [
        format [
          "<br/><t color='#119b0c' size='1px' align='center'>Registration:</t><t color='#f9f2f2' size='1' align='center'> %1</t>",
          _plate
        ],
        "<br/><t color='#119b0c' size='1px' align='center'>Registration:</t><t color='#f9f2f2' size='1' align='center'> Unregistered!</t>"
      ] select (_plate isEqualTo "")
  };
};
_info = _info + _addition; // Build Format...
PHX_Last_ANPR = _plate;

// -- Hint the info
[format ["<t color='#316dff' size='1.5' align='center'>ANPR</t><br/><t color='#f9f2f2' size='1' align='center'>Requesting DVLA Information....</t>"], "blue"] spawn PHX(notify);
sleep 1;
[_info, "green"] spawn PHX(notify);