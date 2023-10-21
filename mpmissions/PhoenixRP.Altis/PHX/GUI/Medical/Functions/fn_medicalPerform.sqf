/*
	@File: fn_medicalPerform.sqf
	@Author: Zyn
	@Description: Allows the medic to perform the action
*/
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgMedical"

params [
	["_action", "", [""]]
];

if (isNil "PHX_MedicalPoint") exitWith {NOTIFY("You must select a body part","red")};
if !(PHX_MedicalUnit isKindOf "Man") exitWith {NOTIFY("You must be looking at the patient","red")};
if !(isDowned(PHX_MedicalUnit)) exitWith {NOTIFY("Player is already stable","red")};
if ((ITEM_VALUE(_action)) < 1) exitWith {NOTIFY("You do not have the required equipment","red")};

private _hp = (format["hit%1",PHX_MedicalPoint]);
private _display = findDisplay 7000;

if !(
    [
        format["Administering %1",_action],
        10,
        []
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

private _threshold = getNumber(CFG >> _action >> "damageThreshold");
private _notification = getText(CFG >> _action >> "notification");
private _name = getText(CFG >> _action >> "name");

if ((_threshold isEqualTo -1) || {(PHX_MedicalUnit getHitPointDamage _hp >= _threshold)}) then {

	[_hp,0,(format["%1 has applied %2 to your %3",(player getVariable ["realname", name player]),_name,(toLower(PHX_MedicalPoint))])] remoteExecCall ["PHX_fnc_medicalPerformClient",PHX_MedicalUnit];
	[_notification,"green"] call PHX_fnc_notify;

} else {

	[_hp,0.95,(format["%1 has incorrectly applied %2 to your %3",(player getVariable ["realname", name player]),_name,(toLower(PHX_MedicalPoint))])] remoteExecCall ["PHX_fnc_medicalPerformClient",PHX_MedicalUnit];
	[(format["You have incorrectly administered %1, this has greatly damaged their %2!",_name,(toLower(PHX_MedicalPoint))]),"red"] call PHX_fnc_notify;
};

[false,_action,1] call life_fnc_handleInv;

//--- Recolours all the tings
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