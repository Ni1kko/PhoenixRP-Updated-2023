/*
	@File: fn_handleMessage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Either displays or deletes a message in our inbox...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
	["_listBox", controlNull, [controlNull]],
	["_index", -1, [0, ""]],
	["_delete", false, [true]]
];

if (_index isEqualType "") then { _index = (parseNumber(_index)) };

if (isNull _listBox || { _index isEqualTo -1 }) exitWith {};

if (_delete) exitWith {
	PHX_myInbox deleteAt _index;
	lbDelete [IDC_MOBILE_LIST, _index];
};

private _msgInfo = PHX_myInbox select _index;

_msgInfo params ["_title", "_message", "_grid", ["_sender", [], [[]]], "_read"];
_sender params ["_senderName", "_senderUID"];

_msgInfo set [4,true];

CONTROL(IDD_TABLET_MAIN, IDC_MOBILE_MSG_VIEW_BOX) ctrlSetStructuredText parseText format[
	"<t color='#33CC33'><t align='left'><t color='#33CC33'>From: <t color='#ffffff'>%2<br/><t color='#33CC33'>Location: <t color='#ffffff'>%4<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%3",
	_title,
	_senderName,
	_message,
	_grid
];