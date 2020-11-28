/*
	@File: fn_changeBackground.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes our background option....
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"

if((lbCurSel IDC_SETTINGS_BGDROP) isEqualTo -1) exitWith { ["You must have a background selected!", "red"] spawn PHX_fnc_notify };

private _val = lbData [IDC_SETTINGS_BGDROP, (lbCurSel IDC_SETTINGS_BGDROP)];

profileNamespace setVariable["PHX_BG",_val];
PHX_settings_tabletBackground = _val;

[] spawn PHX(setBackground);