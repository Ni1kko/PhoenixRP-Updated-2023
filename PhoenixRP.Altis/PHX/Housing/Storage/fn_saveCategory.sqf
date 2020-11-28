/*
	@File: fn_SaveCategory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Saves our currently selected category...
*/
#include "..\..\..\script_macros.hpp"

private _curCat = house_current;
private _categories = house_categories;

if (_curCat isEqualTo -1 || { _categories isEqualTo [] }) exitWith {};

private _thisCat = _categories select _curCat;

private _newName = ctrlText 11008; 
private _newIco = parseNumber (lbData[11007, (lbCurSel 11007)]);

if (_newName isEqualTo "") exitWith { ["You must enter a name for this category...","red"] spawn PHX(notify) };
if (count (toArray(_newName)) > 14) exitWith { ["You can't have a category name longer then 14 characters","red"] spawn PHX(notify) };

if (((toArray (_newName)) findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ")))}) > -1) exitWith {
    ["You have invalid characters in your organisation name. It can only consist of numbers and letters with an underscore.","red"] spawn PHX(notify);
};

// Update arrays...
_thisCat set [3, _newName];
_thisCat set [4, _newIco];
_categories set [_curCat, _thisCat];

[_newName, _newIco, _curCat, (house getVariable "house_id"), (_thisCat select 5)] remoteExecCall (["fnc_saveCategory", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

[_categories] call PHX(updateCategories);
[format["Your category has been updated..."]] call PHX(notify);