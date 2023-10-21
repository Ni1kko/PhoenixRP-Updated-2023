/*
	@File: fn_updateInventory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: updates the list of my inventory...
*/
#include "..\..\..\..\script_macros.hpp"

private _display = findDisplay 11000;
if (isNull _display) exitWith {};

private _invList = _display displayCtrl 11001;
lbClear _invList;

{
	if !(isNil "_x") then {
		scopeName "thisItem";
		_x params ["_classname", "_count"];
		
		private _title = "";
		private _picture = "";

		if (isClass(missionConfigFile >> "CfgItems" >> _classname)) then {
			_title = format["%1 x %2", (M_CONFIG(getText,"CfgItems",_classname,"displayName")), _count];
			_picture = ICON(M_CONFIG(getText,"CfgItems",_classname,"icon"));
		} else {
			private _itemInfo = [_classname] call LIFE(fetchCfgDetails);
			if !(_itemInfo isEqualTo []) exitWith {
				_itemInfo params ["", "_name", "_pic"];
				_title = format["%1 x %2", _name, _count];
				_picture = _pic;
			};
			
			breakOut "thisItem";
		};

		_invList lbAdd _title;
		if !(_picture isEqualTo "") then { _invList lbSetPicture [(lbSize _invList)-1, _picture] };
		_invList lbSetTooltip [(lbSize _invList)-1, _title];
		_invList lbSetData [(lbSize _invList)-1, _classname];
		_invList lbSetValue [(lbSize _invList)-1, _count];
	};
} forEach ([] call PHX(getItems));