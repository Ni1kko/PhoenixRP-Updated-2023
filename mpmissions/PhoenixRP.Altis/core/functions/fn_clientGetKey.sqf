/*
    File: clientGetKey.sqf
    Author: Bryan "Tonic" Boardwine

*/

params [
    ["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]],
	["_giver",objNull,[objNull]]
];

if (isNil "_unit" || {isNil "_giver"}) exitWith {};

if (player isEqualTo _unit && !(_vehicle in life_vehicles)) then {
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	[(format ["%1 has gave you keys for a %2",(_giver getVariable ["realname", name player]),_name]),"green"] call PHX_fnc_notify;
	life_vehicles pushBack _vehicle;
	[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",2];
};