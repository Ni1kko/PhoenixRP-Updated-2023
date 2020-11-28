/*
*   @File: fn_airdrop.sqf
*   @Author: Zyn
*   @Credit: [GR]GEORGE F, Sig
*
*   Description: Initalises random airdrops
*/
#include "..\..\script_macros.hpp"
if (!isServer || hasInterface) exitWith {};

if ((getNumber(missionConfigFile >> "CfgAirdrop" >> "enable_airdrop")) isEqualTo 0) exitWith {};

_this spawn {
	private _position = selectRandom(getArray(missionConfigFile >> "CfgAirdrop" >> worldName >> "positions"));
	private _radius = getNumber (missionConfigFile >> "CfgAirdrop" >> "radius");
	private _civilians = getNumber (missionConfigFile >> "CfgAirdrop" >> "civilians");
	private _notifyTime = getNumber (missionConfigFile >> "CfgAirdrop" >> "sleepTime");
	private _spawnInterval = getNumber (missionConfigFile >> "CfgAirdrop" >> "spawnInterval");

	if(isNil "PHX_Airdrop_Spawned") then { PHX_Airdrop_Spawned = false; }; // Fix var not being declared...
	if(PHX_Airdrop_Spawned) exitWith {};

	// Wait for players to reach required numbers...
	waitUntil {ONLINE(civilian) >= _civilians};

	for "_i" from 0 to 1 step 0 do {
		if(PHX_Airdrop_Spawned) exitWith {}; // Stop spawning more than one
		PHX_Airdrop_Spawned = true;

		sleep _spawnInterval;
		[3, "<t color='#ff0000' size='1.5px'>Airdrop<br/></t><t color='#ffffff' size='1px'>A helicopter is dropping supplies! The location will be marked on your map in 10 minutes."] remoteExecCall ["life_fnc_broadcast", RCLIENT];
		sleep _notifyTime;
		[3, "<t color='#ff0000' size='1.5px'>Airdrop<br/></t><t color='#ffffff' size='1px'>A helicopter is dropping supplies! The location will be marked on your map in 5 minutes."] remoteExecCall ["life_fnc_broadcast", RCLIENT];
		sleep _notifyTime;
		[3, format ["<t color='#ff0000' size='1.5px'>Airdrop<br/></t><t color='#ffffff' size='1px'>The supplies have been dropped! The location has been marked on your map."]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
		sleep 1;

		private _marker = createMarker ["airdrop_marker", _position];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerBrush "FDIAGONAL";
		_marker setMarkerSize [_radius, _radius];
		_marker setMarkerColor "ColorYellow";

		private _markerText = createMarker ["airdrop_boxmarkertext", _position];
		_markerText setMarkerColor "ColorRed";
		_markerText setMarkerText "Airdrop";
		_markerText setMarkerType "mil_marker";

		// Actually handle the airdrop...
		private _handle = [_position] spawn PHX_fnc_spawnAirdrop;
		waitUntil {scriptDone _handle};

		deleteMarker _marker;
		deleteMarker _markerText;
	};
};