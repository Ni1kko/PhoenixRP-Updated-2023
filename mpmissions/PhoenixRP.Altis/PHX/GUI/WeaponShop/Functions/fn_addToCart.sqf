/*
	@File: fn_addToCart.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\..\..\script_macros.hpp"

private _display = findDisplay 7400;
if (isNull _display) exitWith {}; // wot...

// Get values...
private _cur = tvCurSel 7403;
private _item = tvData[7403, _cur];

if (_item isEqualTo "") exitWith { ["You must select an item to add to your cart first..."] spawn PHX(notify) };

private _cartUI = (_display displayCtrl 7404);

if ((lbSize _cartUI) >= (getNumber(missionConfigFile >> "CfgWeapons" >> "cartMax"))) exitWith { ["Your cart is full..."] spawn PHX(notify) };

_cartUI lbAdd (tvText [7403, _cur]);

private _cartSize = lbSize _cartUI;

_cartUI lbSetData [_cartSize - 1, _item];
_cartUI lbSetPicture [_cartSize - 1, (tvPicture [7403, _cur])];
_cartUI lbSetValue [_cartSize - 1, (tvValue[7403, _cur])];

private _total = 0;

for "_i" from 0 to (_cartSize - 1) do {
	_total = _total + (_cartUI lbValue _i);
};

PHX_CartTotal = _total;
ctrlSetText[7405, format["Total: £%1", [_total] call LIFE(numberText)]];