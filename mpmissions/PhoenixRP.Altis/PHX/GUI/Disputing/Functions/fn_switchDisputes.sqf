/*
	@File: fn_switchDisputes.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Updates the type of disputes displayed...
*/
#include "..\..\..\..\script_macros.hpp"
params [["_isSent", true, [true]]];

private _list = [PHX_Recieved_Disputes, PHX_Disputes] select (_isSent);

private _dList = CONTROL(9000, 9002);
lbClear _dList;

{
	_dList lbAdd format["%1", _x select 0];
	_dList lbSetData [(lbsize _dList) - 1, (str _x)];
	_dList lbSetTooltip [lbSize(_dList)-1,format["You %3 %1 for (%2)", (_x select 0), (_x select 1), (["disputed", "were disputed by"] select (!_isSent))]];
} forEach _list;