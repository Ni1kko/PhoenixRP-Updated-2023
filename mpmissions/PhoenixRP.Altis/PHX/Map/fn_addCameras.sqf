/*
	@File: fn_addCameras.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Meh...
*/
if (isServer) exitWith {};

if !(canSuspend) exitWith {_this spawn PHX_fnc_addCameras};

#define CFG missionConfigFile >> "CfgCameras" >> worldName
if !(params [["_screen", objNull, [objNull]],["_site", "", [""]]]) exitWith {};

if !(isClass (CFG >> _site)) exitWith {};

private _cfg = CFG >> _site;
if !(call compile (getText(_cfg >> "condition"))) exitWith {};

{
	_x params ["_name", "_pos", "_tar", "_con"];
	_screen addAction [
		_name, 
		PHX_fnc_openCCTV, 
		[_site, _forEachIndex],
		7, true, true, "", 
		_con, 
		5
	];
} forEach (getArray(_cfg >> "cameras"));

// Add Close Option...
_screen addAction [
	"Turn Off", 
	PHX_fnc_openCCTV, 
	["close", -1],
	7, true, true, "", 
	"!(isNil ""cctv_camera"")", 
	5
];