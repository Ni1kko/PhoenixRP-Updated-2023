/*
	@File: fn_lockHouse.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Closes and locks all the houses doors...
*/
#include "..\..\script_macros.hpp"
if !(params [
	["_house", objNull, [objNull]]
]) exitWith {};

private _numDoors = FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house), "numberOfDoors");
if (_numDoors < 1) exitWith {};

NOTIFY("Locking up house please wait...","cyan");
sleep 3;

for "_i" from 1 to _numDoors do {
    _house animate [format["door_%1_rot",_i],0];
    _house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
};

_house setVariable ["robbed",false,true];

NOTIFY("House has been locked up.","green");