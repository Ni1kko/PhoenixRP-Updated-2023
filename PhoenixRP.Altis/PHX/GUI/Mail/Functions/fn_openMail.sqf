/*
	@File: fn_openMail.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens mail...
*/
#include "..\..\..\..\script_macros.hpp"

if (dialog) exitWith {};
if !(playerSide isEqualTo civilian) exitWith { NOTIFY("Only civilians can view their inbox...", "red") };
if !(canSuspend) exitWith { _this spawn PHX(openMail) };

_this params [
	["_mail", [], [[]]]
];

disableSerialization;

if !(createDialog "RscMail") exitWith { systemChat "Failed to create RscLayer...." };
waitUntil { !isNull (findDisplay 35000) };

private _display = findDisplay 35000;

private _listHeader = _display displayCtrl 35002;
private _itemList = _display displayCtrl 35003;

[_listHeader, _itemList, 35005] call PHX(setupFilter);

lnbClear _itemList;

private ["_row", "_rawContent", "_name"];

{
	_x params ["_id", "_from", "", "_type", "_content", "_quantity"];

	_rawContent = _content;

	_content = switch (_type) do {
		case "Money": {format["£%1", [_content] call LIFE(numberText)]};
		case "Experiance": {format["%1", [_content] call LIFE(numberText)]};
		case "Virtual Item": {format["%1 x %2", ITEM_NAME(_content), [_quantity] call LIFE(numberText)]};
		case "Physical Item": {format["%1 x %2", ([_content] call life_fnc_fetchCfgDetails) select 1, [_quantity] call LIFE(numberText)]};
		case "Vehicle": {format["%1", ([_content] call life_fnc_fetchVehInfo select 3)]};
		default {_content};
	};

	_row = _itemList lnbAddRow [
		_from,
		_type,
		_content
	];

	_itemList lnbSetValue [[_row, 0], _id];
	_itemList lnbSetValue [[_row, 1], _quantity];

	if (_rawContent isEqualType 0) then {
		_itemList lnbSetValue [[_row, 2], _rawContent];
	} else {
		_itemList lnbSetData [[_row, 2], _rawContent];
	};
} forEach _mail;

_itemList lnbSetCurSelRow -1;