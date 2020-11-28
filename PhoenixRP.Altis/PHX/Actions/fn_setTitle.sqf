/*
	@File: fn_setTitle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles changes to our title...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
	["_btn", controlNull, [controlNull]],
	["_title", "", [""]]
];

private _display = findDisplay IDD_TABLET_MAIN;

// Wipe current...
if !(PHX_setTitleButton isEqualTo -1) then {
	private _button = _display displayCtrl PHX_setTitleButton;

	if !(isNull _button) then {
		_button ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='1.5'>%1</t>", "Select"];
		_button ctrlSetBackgroundColor [0,0.3,0,1];
		_button ctrlCommit 0;
	};
	
	PHX_setTitleButton = -1;
};

PHX_Title = _title;

profileNamespace setVariable['titleSel', PHX_Title]; 
player setVariable ['titleSel', PHX_Title, true];

if (PHX_Title isEqualTo "") then {
	["Your title has been removed"] spawn PHX(notify);
} else {
	if !(isNull _btn) then {
		_btn ctrlSetStructuredText parseText format["<t align='center' valign='middle' size='1.5'>%1</t>", "Remove"];
		_btn ctrlSetBackgroundColor [0,0.1,0,0.5];
		_btn ctrlSetEventHandler ["ButtonClick", "[(_this select 0), ''] call PHX_fnc_setTitle"];
		_btn ctrlCommit 0;

		PHX_setTitleButton = ctrlIDC _btn;
	};

	[format["Your title has been set to %1", PHX_Title]] spawn PHX(notify);
};