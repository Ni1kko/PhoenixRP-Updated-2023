/*
	@File: fn_updateCategories.sqf
	@Author: Jack "Scarso" Farhall
	@Description: updates the list of categories...
*/
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgHousing" >> worldName
params[["_categories", house_categories, [[]]]];

[] call PHX(wipeElements); // Wipe all created elements...

private _display = findDisplay 11000;
if (isNull _display) exitWith {};

private _scrollView = _display displayCtrl 11006;
private _idc = 11012;

#define INCREMENT_Y 0.15

private _currentY = 0.236;

private _catID = (count _categories);
private _maxCategories = getNumber(CFG >> (typeOf house) >> "storage");

private _crtBnt = [];
if (_maxCategories > _catID) then { _crtBnt = [[-1, -1, -1, "Buy Category", 0]] };

{
	_x params ["_id", "_houseid", "_categoryid", "_title", "_icon"];

	private _button = _display ctrlCreate ["PHX_Craft_Button", _idc, _scrollView];

	_button ctrlSetStructuredText parseText format["<br/><img image='%1' align='center' size='3'/><br/><t align = 'center'>%2</t>",
		((LIFE_SETTINGS(getArray, "categories") select _icon) select 1),
		_title
	];

	_button ctrlSetPosition [
		0.298906 * safezoneW + safezoneX,
		_currentY * safezoneH + safezoneY,
		0.0876563 * safezoneW,
		0.143 * safezoneH
	];
	
	private _func = "_this spawn PHX_fnc_createCategory";
	if !(_categoryid isEqualTo -1) then {
		_func = format["[%1] call PHX_fnc_switchCategory", _categoryid];
	};
	_button ctrlSetEventHandler ["ButtonClick", _func];

	_button ctrlSetFade 0;
	_button ctrlCommit 0;

	_idc = _idc + 1;
	_currentY = _currentY + INCREMENT_Y;
	PHX_createdElements pushBack _button;
} forEach (_crtBnt + _categories);