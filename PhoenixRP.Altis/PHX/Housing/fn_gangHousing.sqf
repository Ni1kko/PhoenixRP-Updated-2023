/*
	@File: fn_gangHousing.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Remote Exec'd when the owner buys or sells a house...
*/
#include "..\..\script_macros.hpp"
params [
	["_house", objNull, [objNull]],
	["_sold", false, [true]]
];

private _group = grpPlayer;

if (isNull _house || { isNil {_house getVariable "uid"}} || { isNil {_group getVariable "gang_owner"}}) exitWith {};
if (!((player getVariable ["gang_uid", -1]) isEqualTo ((_house getVariable "house_owner") select 0)) || { (_group getVariable "gang_owner") isEqualTo (getPlayerUID player) }) exitWith {};

if (_sold) then {
	[_house, 1] call PHX(houseMarker);

	private _keyIndex = life_vehicles find _house;
	if !(_keyIndex isEqualTo -1) then {
		life_vehicles deleteAt _keyIndex;
	};

	_keyIndex = life_gang_houses find _house;
	if !(_keyIndex isEqualTo -1) then {
		life_gang_houses deleteAt _keyIndex;
	};
} else {
	[_house] call PHX(houseMarker);

	life_vehicles pushBack _house;
	life_gang_houses pushBack _house;
};