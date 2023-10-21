/*
	@File: fn_enterZone.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgCartel" >> worldName >> "Cartels"

private _obj = [player] call PHX(inZone);
_obj = PHX_capZones select _obj;

_zone = _obj getVariable ["zCFG", ""];

if !(_zone isEqualType "") exitWith {}; // Wtf?
if !(isClass (CFG >> _zone)) exitWith {};

private _zoneCfg = CFG >> _zone;

PHX_fnc_CaptureLoop = [_obj, _zoneCfg] spawn {
	params ["_obj", "_zoneCfg"];

	private _name = getText (_zoneCfg >> "displayName");

	("RscCapture" call BIS_fnc_RscLayer) cutRsc ["RscCapture", "PLAIN", 0]; // Create UI...
	private _ui = uiNamespace getVariable ["RscCapture", displayNull];

	for "_i" from 0 to 1 step 0 do {

		if (isNull _ui) then {
			("RscCapture" call BIS_fnc_RscLayer) cutRsc ["RscCapture", "PLAIN", 0];
			_ui = uiNamespace getVariable ["RscCapture", displayNull];
		};

		private _zoneOwner = [_obj, true] call PHX_fnc_isZoneOwner;
		private _isOwner = [_obj, false] call PHX_fnc_isZoneOwner;
		private _captured = !(_zoneOwner in [-1, -2]) || { _zoneOwner in [west, east] };
		private _contested = count ([format["cartel_%1_CAP", (configName _zoneCfg)], grpPlayer, false, "(!isNil {(group _x) getVariable 'gang_name'} || (side _x) in [west, east])"] call PHX(unitsInZone)) > 0;

		private _progress = _obj getVariable ["zProgress", 0];
		
		private _text = switch true do {
			case (player getVariable ["isAdmin", false]): {"Get out of staff gear to capture"};
			case !(isNull objectParent player): { "Leave the vehicle to capture" };
			case (playerSide isEqualTo civilian && {isNil {grpPlayer getVariable "gang_owner"}}): { "You need to be in a group to capture this zone" };
			case (currentWeapon player isEqualTo "" || { (currentWeapon player) in ["Rangefinder", "Binocular"] }): { "You need a weapon to capture" };
			case (_contested): { format["%1 Is Contested", _name] };
			case (!_isOwner && {_captured}): { format["Neutralizing %1", _name] };
			case (_isOwner && {_captured} && {_progress < 1}): { format["Recapturing %1", _name] };
			case (_isOwner && {_captured}): { format["Defending %1", _name] };
			default { format["Capturing %1", _name] };
		};

		(_ui displayCtrl 50001) progressSetPosition _progress;
		(_ui displayCtrl 50002) ctrlSetText format ["%1%2", floor(_progress * 100), "%"];
		(_ui displayCtrl 50003) ctrlSetText format ["%1", _text];

		uiSleep .1;
	};
};