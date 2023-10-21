/*
	@File: fn_updatePerks.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Updates the active perk ui....
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
#define CFG missionConfigFile >> "CfgPerks"
#define BASE 0.283437
#define BASE_Y 0.646
disableSerialization;

private _display = findDisplay IDD_TABLET_MAIN;

if (isNil "PHX_PerksUI") then { PHX_PerksUI = [] };

{
	ctrlDelete _x;
} forEach PHX_PerksUI;
PHX_PerksUI = [];

private _baseIDC = IDC_TABLET_BASE;

private _xValue = BASE;
private _yValue = ([0.621, BASE_Y] select (!((count PHX_Perks) > 14)));

{
	_baseIDC = _baseIDC + 1;

	private _button = _display ctrlCreate ["Life_RscButtonMenuIcon", _baseIDC];
	_button ctrlSetText (call compile (getText (CFG >> _x >> "picture")));
	_button ctrlSetPosition [_xValue * safezoneW + safezoneX, _yValue * safezoneH + safezoneY, 0.0257812 * safezoneW, 0.044 * safezoneH];
	
	private _function = format["['%1', true] spawn PHX_fnc_changePerks", _x];
	_button ctrlSetEventHandler ["ButtonClick", _function];

	_button ctrlSetTooltip (getText (CFG >> _x >> "displayName"));

	if (_xValue >= 0.685625) then {
		_xValue = BASE;
		_yValue = 0.676;
	} else {
		_xValue = _xValue + 0.030938;
	};
	
	_button ctrlCommit 0;

	PHX_PerksUI pushBack _button;
} forEach PHX_Perks;

(_display displayCtrl IDC_PERK_ACTIVE_TITLE) ctrlSetStructuredText parseText format["Active Perks <t align='right'>(%1/%2)</t>", (count(PHX_Perks)), ([] call PHX(getPerkLimit))];