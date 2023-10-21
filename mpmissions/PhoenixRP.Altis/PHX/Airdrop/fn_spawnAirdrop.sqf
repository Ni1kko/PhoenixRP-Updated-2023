/*
*   @File: fn_airdrop.sqf
*   @Author: Scarso
*   @Credit: [GR]GEORGE F, Sig, Zyn (Cuz I've only really moved code from one file to another)
*
*   Description: Spawns the actual physical airdrop...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgAirdrop"
if !(params [["_position", [], [[]]]]) exitWith {}; // If it defaults, exit it...

private _parachute = createVehicle ["B_parachute_02_F",_position, [], 0, "FLY"];
_parachute setPosATL [getPosATL _parachute select 0, getPosATL _parachute select 1, 1000];
private _airdrop = createVehicle ["O_CargoNet_01_ammo_F", position _parachute, [], 0, 'NONE'];
_airdrop attachTo [_parachute,[0,0,0]];
_airdrop allowDamage false;
_airdrop setVariable["Airdrop", true, true]; // Used for checking if air drops are active...

private _light = "Chemlight_yellow" createVehicle getPos _airdrop;
_light attachTo [_airdrop,[0,0,0]];
private _flare = "SmokeShellYellow" createVehicle getPos _airdrop;
_flare attachTo [_airdrop,[0,0,0]];

_flare = "SmokeShellYellow" createVehicle getPos _airdrop;
_light attachTo [_airdrop,[0,0,0]];
_flare attachTo [_airdrop,[0,0,0]];
clearWeaponCargoGlobal _airdrop;
clearMagazineCargoGlobal _airdrop;
clearItemCargoGlobal _airdrop;
sleep 0.1;

private _class = selectRandom (getArray(CFG >> worldName >> "classes"));

{
	_airdrop addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "weapons"));

{
	_airdrop addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "magazines"));

{
	_airdrop addItemCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "items"));

if ((floor (random 100)) <= (getNumber(CFG >> _class >> "virtualItemChance"))) then {
	private _totalWeight = 0;
	private _items = [];

	{
		_totalWeight = _totalWeight + ((ITEM_WEIGHT((_x select 0))) * (_x select 1));
		_items pushBack [(_x select 0), (_x select 1)];
	} forEach ((getArray(CFG >> _class >> "virtualItems")) select {
		isClass (missionConfigFile >> "CfgItems" >> (_x select 0))
	});

	if !(_items isEqualTo []) then {
		_airdrop setVariable["Trunk", [_items, _totalWeight], true];
	};
};

waitUntil {((((position _airdrop) select 2) < 1) || (isNil "_parachute"))};
detach _airdrop;

_airdrop enableRopeAttach false;

sleep 1200;
deleteVehicle _airdrop;