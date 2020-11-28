
#include "..\..\script_macros.hpp"
/*
	Author: Maverick Applications
	Desc: Altis Life Shipwreck
*/

if(!isServer) exitWith {};

[] spawn {
		
	sleep 360;
		
	private _positions = getArray(missionConfigFile >> "CfgShipwrecks" >> "Positions");
	private _ship = objNull;
	private _lastCreateTime = time - 360;
	private _radius = getNumber(missionConfigFile >> "CfgShipwrecks" >> "Radius");

	private _createNewWreck = {
		private _position = selectRandom _positions;

		private _marker = createMarker [ "shipwreck_marker", _position ];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerType "mil_marker";
		_marker setMarkerText "Shipwreck";

		_ship = createVehicle ["Land_Wreck_Traw_F", _position, [], _radius, "None"];
		_ship allowDamage false;
		_ship setDamage 0;
		_ship enableSimulationGlobal false;
		_ship setVariable [ "wrecktime", time ];
		_ship setVariable [ "wreckloot", selectRandom(getArray(missionConfigFile >> "CfgShipwrecks" >> "ShipLoot")), true];

		[3, "<t color='#ff0000' size='1.5px'>Shipwreck<br/></t><t color='#ffffff' size='1px'>A sunken ship has been located! It may contain important items and it has been marked on your map!"] remoteExecCall ["life_fnc_broadcast", RCLIENT];
	};

	private _deleteOldWreck = {
		if(!isNull _ship) then {
			[3, "<t color='#ff0000' size='1.5px'>Shipwreck<br/></t><t color='#ffffff' size='1px'>The ship has been successfully looted and has despawned!"] remoteExecCall ["life_fnc_broadcast", RCLIENT];
			sleep 5;
			deleteVehicle _ship;
			deleteMarker "shipwreck_marker";
		};
		_ship = objNull;
		_lastCreateTime = time;
	};

	for "_i" from 0 to 1 step 0 do {
		if(isNull _ship) then {
			if((time - _lastCreateTime) >= (getNumber(missionConfigFile >> "CfgShipwrecks" >> "ShipwreckInterval"))) then {
				[] call _deleteOldWreck;
				[] call _createNewWreck;
				_lastCreateTime = time + (getNumber(missionConfigFile >> "CfgShipwrecks" >> "ShipwreckInterval"));
			};
		} else {
			if((_ship getVariable ["wreckloot", []]) isEqualTo []) then {
				[] call _deleteOldWreck;
			};
		};

		sleep 45;
	};
};
