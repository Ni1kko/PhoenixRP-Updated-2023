/*
	@File: fn_switchProgression.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for toggling elements of the "Profile" app...
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
params [
	["_page", "", [""]]
];

// Hide all...
private _progElememts = [
	[IDC_PROG_DONT_LIST, "DonatorSettings"], 
	[IDC_PROG_DONT_RED_TEXT, "DonatorSettings"],
	[IDC_PROG_DONT_RED_SLIDER, "DonatorSettings"],
	[IDC_PROG_DONT_RED_EDIT, "DonatorSettings"],
	[IDC_PROG_DONT_GRE_TEXT, "DonatorSettings"],
	[IDC_PROG_DONT_GRE_SLIDER, "DonatorSettings"],
	[IDC_PROG_DONT_GRE_EDIT, "DonatorSettings"],
	[IDC_PROG_DONT_BLU_TEXT, "DonatorSettings"],
	[IDC_PROG_DONT_BLU_SLIDER, "DonatorSettings"],
	[IDC_PROG_DONT_BLU_EDIT, "DonatorSettings"],
	[IDC_PROG_DONT_SVE_BUT, "DonatorSettings"],
	[IDC_PROG_DONT_NME_TYP, "DonatorSettings"],
	[IDC_PROG_DONATOR_BLOCK, "DonatorSettings"]
];

{ ctrlShow[(_x select 0), ((_x select 1) isEqualTo _page)] } forEach _progElememts;

if (_page isEqualTo "DonatorSettings") then {
	if (PHX_DonatorLevel > 0) then {
		ctrlShow[IDC_PROG_DONATOR_BLOCK, false];
	} else {
		{ ctrlEnable[(_x select 0), false] } forEach (_progElememts select { (_x select 1) isEqualTo _page });
		ctrlEnable[IDC_PROG_DONATOR_BLOCK, true];
	};
};