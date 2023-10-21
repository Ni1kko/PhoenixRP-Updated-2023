/*
 *  @File: fn_setEdit.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  Sets an edit box based on the amount of a virtual item
 *
 *	Parameters:
 *		0 - TYPE: INT - DES: The IDC from the listbox
 *		1 - TYPE: INT - DES: The edit box IDC to set
*/

#include "..\..\script_macros.hpp"

params [
	["_data", 0, [0]],
	["_edit", 0, [0]]
];

if (_data isEqualTo 0 || {_edit isEqualTo 0}) exitWith {};

ctrlSetText [_edit,str(ITEM_VALUE(CONTROL_DATA(_data)))]