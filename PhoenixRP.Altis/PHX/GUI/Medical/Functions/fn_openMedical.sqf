/*
	@File: fn_openMedical.sqf
	@Author: Zyn
	@Description: Opens the medical tablet
*/
#include "..\..\..\..\script_macros.hpp"

params [
    ["_unit", objNull, [objNull]]
];

if !(createDialog "RscMedical") exitWith { systemChat "Failed to create dialog..." };
PHX_MedicalUnit = _unit;
private _display = findDisplay 7000;
(_display displayCtrl 7008) ctrlEnable false;

if !(isDowned(PHX_MedicalUnit)) exitWith {NOTIFY("Player is already stable!","red")};
PHX_MedicalPoint = nil;
private _count = 0;
private _damage = 0;

{
	_damage = PHX_MedicalUnit getHitPointDamage _x;
	(_display displayCtrl (7002 + _forEachIndex)) ctrlSetTextColor
	(switch true do {
		case (_damage > 0.9): {[0.9,0,0,1]};
		case (_damage > 0.6): {[0.85,0.4,0,1]};
		case (_damage > 0.3): {[0,0,1,1]};
		default {[1,1,1,1]};
	});
	if (_damage <= 0.3) then {
		_count = _count + 1;
	};
} forEach ["hitHead","hitArms","hitArms","hitBody","hitLegs","hitLegs"];

if (_count isEqualTo 6) then {
	(_display displayCtrl 7008) ctrlEnable true;
};