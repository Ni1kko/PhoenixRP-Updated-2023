/*
	@File: fn_movesMenu.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Fills the moves menu list from the config.
*/
#include "..\..\..\..\script_macros.hpp"
disableSerialization;

private _moves = [];

{
        _displayName = getText(_x >> "displayName");
        _animation = getText(_x >> "moveAnimation");

        _moves pushBack [_displayName, _animation];
 } foreach ("true" configClasses (missionConfigFile >> "CfgMoves"));

waitUntil {!isNull (findDisplay 2900)};

private _display = findDisplay 2900;
private _list = _display displayCtrl 2902;

lbClear _list;

{
	
	_list lbAdd format["%1", _x select 0];
	_list lbSetdata [(lbSize _list)-1,str(_x select 1)];
} foreach _moves;

if(((lbSize _list)-1) == -1) then {
	_list lbAdd "You have no moves to preform.";
	_list lbSetData [(lbSize _list)-1,str(ObjNull)];
};