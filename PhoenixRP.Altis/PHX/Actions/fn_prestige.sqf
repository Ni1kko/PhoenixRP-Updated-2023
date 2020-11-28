/*
	@File: fn_prestige.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Increases our prestige level...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#include "..\GUI\HUD\macros.hpp"
if !(canSuspend) exitWith { _this spawn PHX(prestige) };

if !(PHX_canPrestige) exitWith {}; // Should never get this anyway...
if (PHX_PrestigeLevel >= (getNumber(missionConfigFile >> "CfgLevels" >> "maxPrestige"))) exitWith { NOTIFY("You're already max prestige.","red") };

private _action =  [
    "Are you sure you want to prestige? This will wipe your Perks, Level and XP.",
	"Prestige Confirmation", "Yes", "No"
] call PHX_fnc_confirmBox;

if (_action) then {
	PHX_canPrestige = false;

	private _side = switch (playerSide) do {case west:{"Police"}; case civilian:{"Civilian"}; case independent:{"Medic"}; case east: {"HAVOC"};};
	{
		SVAR_MNS [(PROF_VARNAME(configName _x)), 0];
	} foreach (format ["'%1' in getArray(_x >> 'side')", _side] configClasses (missionConfigFile >> "CfgProfessions"));

	PHX_Level = 1;
	PHX_XP = 0;
	PHX_Perks = [];

	PHX_PrestigeLevel = PHX_PrestigeLevel + 1;

	[(getPlayerUID player), PHX_PrestigeLevel] remoteExecCall (["fnc_prestigeWipe", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	[] call PHX(hudUpdate);
	
	disableSerialization;
	private _display = findDisplay IDD_TABLET_MAIN;

	(_display displayCtrl IDC_PROG_LVL_CUR) ctrlSetStructuredText parseText format["<t align='center' size='1.7'>%1</t>", PHX_Level];
	(_display displayCtrl IDC_PROG_PRE_CUR) ctrlSetStructuredText parseText format["<t align='center' size='1.7'>%1</t>", PHX_PrestigeLevel];
	ctrlShow [IDC_PROG_PRES_BUTTON, false];

	private _neededXP = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", (PHX_Level + 1)] >> "expRequired");
	LIFEctrl(IDC_LIFE_BAR_XP) progressSetPosition (PHX_XP / _neededXP);
	LIFEctrl(IDC_LIFE_XP_TEXT) ctrlSetStructuredText parseText format["<t align='left'>Level %1</t><t align='center'>%2 / %3</t><t align='right'>Level %4</t>", PHX_Level, [PHX_XP] call life_fnc_numberText, [_neededXP] call life_fnc_numberText, (PHX_Level + 1)];
};