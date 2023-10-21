#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_nitrous.sqf
	@Author: Zyn
	@Description: Increases speed by and takes 1 nitro
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private _speed = speed _vehicle;
if (_speed < 10) exitWith { NOTIFY("You aren't travelling fast enough","red") };

[_vehicle] spawn {
	params ["_vehicle"];
	
    for "_i" from 0 to 99 do {
    	private _vel = velocity _vehicle;
    	private _dir = direction _vehicle;
    	_vehicle setVelocity [(_vel select 0)+(sin _dir*0.5),(_vel select 1)+(cos _dir*0.5),(_vel select 2)];

		sleep 0.1;
	};
};

NOTIFY("Nitrous activated","green");

private _upgrades = (_vehicle getVariable ["vehicle_upgrades",[]]);
_upgrades set [3,((_upgrades select 3) - 1)];

_vehicle setVariable ["vehicle_upgrades",_upgrades,true];
[_vehicle,4] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];

[] call PHX_fnc_hudUpdate