/*
	@File: fn_setBackground.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sets the background to the option we've selected...
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
params [
	["_background", PHX_settings_tabletBackground, [""]]
];

if !(isClass (missionConfigFile >> "CfgBackgrounds" >> _background)) then { 
	PHX_settings_tabletBackground = "default";
	_background = PHX_settings_tabletBackground;
};

private _type = M_CONFIG(getText,"CfgBackgrounds",_background,"type");

disableSerialization;
if(IsNull (findDisplay IDD_TABLET_MAIN)) exitWith {};
private _display = findDisplay IDD_TABLET_MAIN;

private _bg = _display displayCtrl 101;
private _bgI = _display displayCtrl 102;

// If it's -1 we just hide the background element...
if(_type isEqualTo "-1") then {
	_bg ctrlShow false;
	_bgI ctrlShow false;
} else {
	if(_type isEqualTo "Colour") then {
		_value = M_CONFIG(getArray,"CfgBackgrounds",_background,"value");
		_bgI ctrlShow false;
		_bg ctrlShow true;
		_bg ctrlSetBackgroundColor _value;
	} else {
		_value = M_CONFIG(getText,"CfgBackgrounds",_background,"value");
		_bg ctrlShow false;
		_bgI ctrlShow true;
		_bgI ctrlSetText _value;
	};
};