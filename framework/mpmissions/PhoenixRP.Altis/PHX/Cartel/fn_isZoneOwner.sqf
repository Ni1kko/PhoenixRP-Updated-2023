/*
	@File: fn_isZoneOwner.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
params [
	["_zone", objNull, [objNull]],
	["_getOwner", false, [false]],
	["_group", (group player), [grpNull]]
];

private _owner = _zone getVariable ["zOwner", -2];

if (_owner isEqualType 0) then { 
	_group = _group getVariable ["gang_id", -1] 
} else {
	_group = (side _group);
};

if ((_group isEqualTo -1 || _owner isEqualTo -2) && { !_getOwner }) then {false};

[
	_owner isEqualTo _group,
	_owner
] select _getOwner