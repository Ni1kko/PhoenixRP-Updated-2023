/*
	@File: fn_queryPlayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Queries the server for information about our player...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
disableSerialization;

if !(isNil "admin_query_ip") exitWith {NOTIFY("Wait for the active query to end.","red")};

private _text = CONTROL(IDD_TABLET_MAIN, IDC_ADMIN_INFO_BOX);
private _unit = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (isNull _unit || { isNil "_unit" }) exitWith {
	_text ctrlSetStructuredText parseText "Player no longer exists?";
};

[player] remoteExecCall ["LIFE_fnc_playerQuery", _unit];
_text ctrlSetStructuredText parseText "Querying...";