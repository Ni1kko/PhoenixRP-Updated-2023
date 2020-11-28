/*
	@File: fn_medicalPerformClient.sqf
	@Author: Zyn
	@Description: Remotes the heal onto the player
*/

params [
    ["_hitPoint", "", [""]],
    ["_hp", 0, [0]],
    ["_notification", "", [""]]
];

[_notification,"cyan"] call PHX_fnc_notify;
player setHitPointDamage [_hitPoint,_hp];