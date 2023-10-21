/*
	@File: fn_isNearGang.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns if obj is near gang...
*/

_this params [
	["_player", objNull, [objNull]]
];

if (isNull _player) exitWith { false };

(playableUnits findIf { alive _x && { !(_x isEqualTo _player) } && { (_player getVariable ["gang_uid", -2]) isEqualTo (_x getVariable ["gang_uid", -1]) } && { (_player distance _x) <= 20 } }) > -1