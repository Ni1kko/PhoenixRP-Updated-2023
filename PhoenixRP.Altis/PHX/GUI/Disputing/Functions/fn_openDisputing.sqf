/*
	@File: fn_openDisputing.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens the disputing UI...
*/
#include "..\..\..\..\script_macros.hpp"

if !(canSuspend) exitWith { _this spawn PHX(openDisputing) };

if (dialog) exitWith {};

createDialog "RscDisputing";

waitUntil { !(isNull (findDisplay 9000)) };

private _display = findDisplay 9000;
ctrlEnable [9004,false];

private _pList = (_display displayCtrl 9001);
lbClear _pList;

{
	_pList lbAdd format["%1", _x getVariable ["realname", name _x]];
	_pList lbSetData [(lbsize _pList) - 1, (str _x)];
	_pList lbSetPicture [(lbSize _pList) - 1, (switch true do {
		case (side _x isEqualTo west): {"\a3\3den\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa"};
		case (side _x isEqualTo independent): {"\a3\3den\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa"};
		case (side _x isEqualTo east): {"\a3\3den\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa"};
		default {"\a3\3den\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"};
	})];
} forEach (allPlayers select { 
	!(_x isEqualTo player)
});

lbSort _pList;

[9000, 9001, 9006, "setup"] call PHX(searchList);
true call PHX(switchDisputes);