/*
	@File: fn_gangList.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for updating the list of gang releated...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
if !(params[["_listBox", controlNull, [controlNull]], ["_list", [], [[]]]]) exitWith {};

_listbox ctrlEnable false;
lbClear _listbox;

_list params ["_elements", "_isUnits"];

if (_elements isEqualTo []) then {
	_listBox lbAdd format["No options available"];
	_listBox lbSetData [(lbSize _listBox)-1, ""];
} else {
	private _ranks = (grpPlayer getVariable "gang_ranks");
	
	{
		private _title = format["%1", (_x select 0)];
		private _unit = objNull;
		private _rank = "Recruit";
		private _rankNum = (_x select 2);

		if (_isUnits) then {
			_unit = [(_x select 1)] call PHX(unitByUID);

			_rank = (_ranks select _rankNum) select 0;

			_title = format["%1 - (%2)", _title, _rank];
		};

		_listBox lbAdd _title;
		_listBox lbSetData [(lbSize _listBox)-1, str _x];
		
		// Offline colouring...
		if (_isUnits && { isNull _unit }) then {
			_listBox lbSetColor [(lbSize _listBox) - 1, [0.4, 0.4, 0.4, 1]];
			_listbox lbSetValue [(lbSize _listbox) - 1, 1];
		} else {
			_listbox lbSetValue [(lbSize _listbox) - 1, 0];
		};
	} foreach _elements;

	lbSortByValue _listbox;
};

_listbox ctrlEnable true;