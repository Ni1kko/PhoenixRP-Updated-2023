/*
	@File: fn_RscIDLookup.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to lookup a given ID...
*/
#include "..\..\..\..\script_macros.hpp"
params [
	["_mode", -1, [0]],
	["_id", [], [[]]]
];

if (_mode isEqualTo -1) exitWith {};

switch (_mode) do {
	case 0: {
		createDialog "RscIDLookup";
	};

	case 1: {
		if (isNull (findDisplay 2600)) exitWith {};
		if (_id isEqualTo []) exitWith { ["Error occured while retrieving this ID", "red"] spawn PHX(notify) };

		private _display = findDisplay 2600;

		private _nameText = _display displayCtrl 2601;
		private _ageText = _display displayCtrl 2602;
		private _raceText = _display displayCtrl 2603;
		private _IDText = _display displayCtrl 2604;

		_id params ["_idN", "_name", "_age", "_gender", "_race", "_isIllegal"];

		_nameText ctrlSetStructuredText parseText format["%1", _name];
		_ageText ctrlSetStructuredText parseText format["<t align='left'>%1</t><t align='right'>%2</t>", _age, _gender];
		_raceText ctrlSetStructuredText parseText format["%1", _race];
		_IDText ctrlSetStructuredText parseText format["%1", _idN];

		ctrlEnable[2606, true];
	};

	case 2: {
		ctrlEnable[2606, true];
	};
};