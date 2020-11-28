/*
	@File: fn_setLoadingStage.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Updates the loading screen ui...
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
params [
	["_text", "", [""]],
	["_perc", 0, [0]]
];

private _display = uiNamespace getVariable ['RscTitleLoading', displayNull];
if (isNull _display) exitWith {};

(_display displayCtrl IDC_LOADING_BAR) progressSetPosition _perc;
(_display displayCtrl IDC_LOADING_TEXT) ctrlSetText _text;

diag_log(_text); //Log each stage