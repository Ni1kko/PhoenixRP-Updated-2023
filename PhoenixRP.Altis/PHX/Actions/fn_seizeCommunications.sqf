#include "..\..\script_macros.hpp"
/*
	File: fn_seizeCommunications.sqf
	Description: Removes the communication devices/gps' from a player
*/

{
  if (_x in ["ItemRadio", "ItemGPS", "B_UavTerminal"]) then {
    player unassignItem _x;
    player removeItem _x;
  };
} forEach (assignedItems player + items player);

["Your radio and GPS have been removed! You have to mute your teamspeak and stop communicating with your friends/group mates immediately or you may be punished for metagaming! You can only speak to people through direct communication", "red"] call PHX_fnc_notify;
