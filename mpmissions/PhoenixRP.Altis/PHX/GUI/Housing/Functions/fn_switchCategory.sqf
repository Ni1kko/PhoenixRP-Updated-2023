/*
	@File: fn_switchCategory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: updates the list of categories...
*/
#include "..\..\..\..\script_macros.hpp"
if !(params [["_index", -1, [0]]]) exitWith {};

private _categories = house_categories;

private _catCnt = count _categories;

if (_index < -1 || { _index >= _catCnt }) exitWith { ["An error occured..."] spawn PHX(notify) }; // Wot?

private _display = findDisplay 11000;
if (isNull _display) exitWith {};

private _cat = _categories select _index;

_cat params ["_id", "_houseid", "_categoryid", "_title", "_icon", "_storage"];

private _nameInput = _display displayCtrl 11008;
private _icoList = _display displayCtrl 11007;
private _catHeader = _display displayCtrl 11009;

_nameInput ctrlSetText _title;
_catHeader ctrlSetText format["%1's Contents (%3 / %2)", _title, ((LIFE_SETTINGS(getNumber,"categoryStorage")) + ((cursorObject getVariable ["house_upgrades",[]]) select 1)), ([_storage] call PHX(getStorageWeight))];
_icoList lbSetCurSel (_icon - 1);

private _hosList = _display displayCtrl 11002;
lbClear _hosList;

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

		_hosList lbAdd _title;
		if !(_picture isEqualTo "") then { _hosList lbSetPicture [(lbSize _hosList)-1, _picture] };
		_hosList lbSetTooltip [(lbSize _hosList)-1, _title];
		_hosList lbSetData [(lbSize _hosList)-1, _classname];
		_hosList lbSetValue [(lbSize _hosList)-1, _count];
	};
} forEach (_storage select { !((_x select 0) isEqualTo "") });

house_current = _index;