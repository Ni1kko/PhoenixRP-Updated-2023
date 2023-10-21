/*
    @File: fn_groupByID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Credits to Sig as it's based of unitByUID
*/
if !(params [["_uid", -1, [0]]]) exitWith {objNull};

private _index = allGroups findIf {(_x getVariable ["gang_id", -2]) isEqualTo _uid};
if (_index < 0) exitWith {objNull};

allGroups select _index