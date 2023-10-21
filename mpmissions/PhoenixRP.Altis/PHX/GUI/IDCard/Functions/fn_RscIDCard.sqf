/*
	@File: fn_RscIDCard.sqf
	@Author: Jack "Scarso" Farhall
	
	@Description: Creates and sets up the ID Card UI...
*/
#include "..\..\..\..\script_macros.hpp"
if !(params [["_target", objNull, [objNull]]]) exitWith {};
if !(canSuspend) exitWith {_this spawn PHX_fnc_RscIDCard};

private _id = _target getVariable ["idCard", []];

if (_id isEqualTo [] || { !(_id isEqualType []) }) exitWith { NOTIFY("This person does not have an ID","red") };

while {dialog} do { closeDialog 0 }; // Close all dialogs before showing the ID...

createDialog "RscIDCard";

waitUntil { !isNull (findDisplay 2500) };

private _display = findDisplay 2500;

private _nameText = _display displayCtrl 2501;
private _ageText = _display displayCtrl 2502;
private _raceText = _display displayCtrl 2503;
private _IDText = _display displayCtrl 2504;

_id params ["_idN", "_name", "_age", "_gender", "_race", "_isIllegal"];

// Name check (If it's legal force realname...)
if !(_isIllegal) then { _name = _target getVariable ["realname", name _target] };

_nameText ctrlSetStructuredText parseText format["%1", _name];
_ageText ctrlSetStructuredText parseText format["<t align='left'>%1</t><t align='right'>%2</t>", _age, _gender];
_raceText ctrlSetStructuredText parseText format["%1", _race];
_IDText ctrlSetStructuredText parseText format["%1", _idN];