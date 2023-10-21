/*
	@File: fn_setDonatorSettings.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sets our donator settings...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"

ctrlEnable[IDC_PROG_DONT_SVE_BUT, false];

if (PHX_DonatorLevel < 1) exitWith { ["This is a sponsor only feature..."] call PHX(notify) };

if !(canSuspend) exitWith { _this spawn PHX(setDonatorSettings) };

private _changeMessage = ["Your profile settings have been updated.<br/><t color='#FF8C00'>Settings:<t color='#c4c4c4'><br/>"];

private _redText = ctrlText IDC_PROG_DONT_RED_EDIT;
private _greText = ctrlText IDC_PROG_DONT_GRE_EDIT;
private _bluText = ctrlText IDC_PROG_DONT_BLU_EDIT;

private _rgbChange = [
	(parseNumber(_redText) / 100),
	(parseNumber(_greText) / 100),
	(parseNumber(_bluText) / 100),
	1
];

private _curSel = CONTROL_DATA(IDC_PROG_DONT_NME_TYP);
if (_curSel isEqualTo "") exitWith { ["You must select a name colour type"] call PHX(notify) };

if (playerSide isEqualTo civilian) then {
	private _iconList = CONTROL(IDD_TABLET_MAIN,IDC_PROG_DONT_LIST);
	private _curIcon = _iconList tvData (tvCurSel _iconList);

	if !(isClass (missionConfigFile >> "CfgDonatorIcons" >> _curIcon)) then {_curIcon = false};

	if (_curIcon isEqualType "") then {
		_changeMessage pushBack format["   - Personal Icon is set to %1<br/>", (getText(missionConfigFile >> "CfgDonatorIcons" >> _curIcon >> "displayName"))];

		PHX_iconSel = _curIcon;
	} else {
		if !(PHX_iconSel isEqualTo "") then {
			_changeMessage pushBack format["   - Personal Icon Removed<br/>"];
			PHX_iconSel = "";
		};
	};
	
	profileNamespace setVariable["iconSel", PHX_iconSel];
	player setVariable ["iconSel", PHX_iconSel, true];
};

_changeMessage pushBack format["   - Name colour is set to %1<br/>", _curSel];
_changeMessage pushBack format["   - RGB Value [%1, %2, %3]<br/>", _redText, _greText, _bluText];

PHX_NameColour = ([_curSel, _rgbChange] select (_curSel isEqualTo "Custom RGB"));
profileNamespace setVariable["nameColour", PHX_NameColour];
player setVariable ["nameColour", PHX_NameColour, true];

private _notify = [(_changeMessage joinString "")] spawn PHX(notify);
waitUntil { scriptDone _notify };

ctrlEnable[IDC_PROG_DONT_SVE_BUT, true];