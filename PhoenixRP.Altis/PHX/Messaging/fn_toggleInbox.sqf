/*
	@File: fn_toggleInbox.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Turns our inbox on or off...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"

private _display = findDisplay 23000;
waitUntil { !(isNull _display) };

private _msgButton = _display displayCtrl IDC_MOBILE_SendButton;
private _inboxButton = _display displayCtrl IDC_MOBILE_INBOX_BUTTON;
private _contactList = _display displayCtrl IDC_MOBILE_LIST;

(_display displayCtrl IDC_MOBILE_MSG_VIEW_BOX) ctrlSetStructuredText parseText "";

if (ctrlShown _msgButton) then {
	ctrlSetText [IDC_MOBILE_SECOND_HEADER, "Messages:"];

	lbClear _contactList;

	{
		_x params ["_title", "_message", "_grid", ["_sender", [], [[]]], "_read"];
		_sender params ["_senderName", "_senderUID"];

		_contactList lbAdd format["%1 | %2", _title, _senderName];
		_contactList lbSetValue [(lbsize _contactList) - 1, _forEachIndex];
		_contactList lbSetPictureRight [(lbsize _contactList) - 1, (["\a3\3den\Data\Attributes\TaskStates\created_ca.paa","\a3\3den\Data\Attributes\TaskStates\succeeded_ca.paa"] select _read)];
	} forEach PHX_myInbox;

	_contactList ctrlSetPosition [safeZoneX + safeZoneW * 0.608279, safeZoneY + safeZoneH * 0.326, safeZoneW * 0.113437, safeZoneH * 0.368];
	_contactList ctrlCommit 0;

	_inboxButton ctrlSetText "Compose New";
	_inboxButton ctrlSetPosition [safeZoneX + safeZoneW * 0.608281, safeZoneY + safeZoneH * 0.72, safeZoneW * 0.113437, safeZoneH * 0.022];
	_inboxButton ctrlCommit 0;

	_contactList ctrlSetEventHandler ["LBSelChanged", "_this call PHX_fnc_handleMessage"];

	ctrlSetText [IDC_MOBILE_INPUT_BOX, ""];

	ctrlShow [IDC_MOBILE_DELETE_BUTTON, true];
	ctrlShow [IDC_MOBILE_MSG_VIEW_BOX, true];
	ctrlEnable [IDC_MOBILE_INPUT_BOX, false];
} else {
	ctrlSetText [IDC_MOBILE_SECOND_HEADER, "Contacts:"];
	_contactList ctrlRemoveAllEventHandlers "LBSelChanged";

	["Mobile"] call PHX(onLoad);
};

{
	ctrlShow [_x, !(ctrlShown (_display displayCtrl _x))];
} forEach [
	IDC_MOBILE_SendButton, 
	IDC_MOBILE_SendAsAdminButton,
	IDC_MOBILE_CHECK_LOCATION,
	IDC_MOBILE_TEXT_LOCATION
];