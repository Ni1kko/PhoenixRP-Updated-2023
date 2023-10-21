/*
	@File: fn_recieveQuery.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Displays the returned query from the server...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
disableSerialization;

private _text = CONTROL(IDD_TABLET_MAIN, IDC_ADMIN_INFO_BOX);

if !(params [
	["_bank", 0, [0]],
	["_cash", 0, [0]],
	["_owner", 0, [0]],
	["_player", objNull, [objNull]],
	["_steamName", "", [""]],
	["_steamID", "", [""]],
	["_side", sideUnknown, [west]]
]) exitWith { _text ctrlSetStructuredText parseText "Query Failed..." };


private _pAttachments = "";
private _sAttachments = "";
private _pItems = ((primaryWeaponItems _player) select { !(_x isEqualTo "") });
private _sItems = ((handgunItems _player) select { !(_x isEqualTo "") });

{
	_pAttachments = _pAttachments + (FETCH_CONFIG2(getText,"CfgWeapons", _x,"displayName")) + " ";
} forEach _pItems;

{
	_sAttachments = _sAttachments + (FETCH_CONFIG2(getText,"CfgWeapons", _x,"displayName")) + " ";
} forEach _sItems;

if !(_pAttachments isEqualTo "") then { _pAttachments = "(" + _pAttachments + ")" };
if !(_sAttachments isEqualTo "") then { _sAttachments = "(" + _sAttachments + ")" };

_text ctrlSetStructuredText parseText format[
	"<t color='#33CC33'><t align='left'>
	<t color='#33CC33'>Server Name: <t color='#ffffff'><a href='https://panel.phoenixrp.co.uk/index.php?page=admin&amp;action=search&amp;search=%3' color='#ffffff'>%1</a><br/>
	<t color='#33CC33'>Steam Name: <t color='#ffffff'>%2<br/>
	<t color='#33CC33'>Steam UID: <t color='#ffffff'>%3<br/><br/>
	<t color='#33CC33'>Cash: <t color='#ffffff'>£%4<br/>
	<t color='#33CC33'>Bank: <t color='#ffffff'>£%5<br/><br/>
	<t color='#33CC33'>Uniform: <t color='#ffffff'>%6<br/>
	<t color='#33CC33'>Headgear: <t color='#ffffff'>%7<br/>
	<t color='#33CC33'>Vest: <t color='#ffffff'>%8<br/>
	<t color='#33CC33'>Backpack: <t color='#ffffff'>%9<br/>
	<t color='#33CC33'>Primary Weapon: <t color='#ffffff'>%10<br/>
	<t color='#33CC33'>Secondary Weapon: <t color='#ffffff'>%11<br/>
		",
	_player getVariable ["realname", name _player],
	_steamName,
	_steamID,
	[_cash] call life_fnc_numberText,
	[_bank] call life_fnc_numberText,
	([
		(FETCH_CONFIG2(getText,"CfgWeapons",uniform _player,"displayName")),
		"None"
	] select ((uniform _player) isEqualTo "")),
	([
		(FETCH_CONFIG2(getText,"CfgWeapons",headgear _player,"displayName")),
		"None"
	] select ((headgear _player) isEqualTo "")),
	([
		(FETCH_CONFIG2(getText,"CfgWeapons",vest _player,"displayName")),
		"None"
	] select ((vest _player) isEqualTo "")),
	([
		(FETCH_CONFIG2(getText,"CfgWeapons",backpack _player,"displayName")),
		"None"
	] select ((backpack _player) isEqualTo "")),
	([
		format["%1 %2", (FETCH_CONFIG2(getText,"CfgWeapons",primaryWeapon _player,"displayName")), _pAttachments],
		"None"
	] select ((primaryWeapon _player) isEqualTo "")),
	([
		format["%1 %2", (FETCH_CONFIG2(getText,"CfgWeapons",handgunWeapon _player,"displayName")), _sAttachments],
		"None"
	] select ((handgunWeapon _player) isEqualTo ""))
];