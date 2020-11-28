#include "..\..\..\..\script_macros.hpp"
/*
 *  @File: fn_openTransactions.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  
*/

disableSerialization;

createDialog "RscTransactions";

waitUntil { !isNull (findDisplay 21000) };

private _display = findDisplay 21000;
private _listHeader = _display displayCtrl 21001;
private _itemList = _display displayCtrl 21002;

[_listHeader,_itemList,21003] call PHX(setupFilter);
lnbClear _itemList;
private ["_text","_operation","_in","_out", "_from", "_inF", "_outF"];

{
	
	_x params ["_text", "_operation", "_in", "_out"];

	_inF = _in;
	if (_in isEqualType 0) then {
		_inF = format["£%1",[_in] call LIFE_fnc_numberText]
	};

	_outF = _out;
	if (_out isEqualType 0) then {
		_outF = format["£%1",[_out] call LIFE_fnc_numberText]
	};

	_from = (["Cash","Bank"] select (_operation isEqualTo 1));

	_row = _itemList lnbAddRow [_text,_from,_inF,_outF];
	
	_itemList lnbSetData [[_row, 0], _text];
	_itemList lnbSetValue [[_row, 1], _operation];
	_itemList lnbSetValue [[_row, 2], ([-1,_in] select (_in isEqualType 0))];
	_itemList lnbSetValue [[_row, 3], ([-1,_out] select (_out isEqualType 0))];

} forEach (profileNamespace getVariable ["PHX_Transactions",[]]);

_itemList lnbSetCurSelRow -1;