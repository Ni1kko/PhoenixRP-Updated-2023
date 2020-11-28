/*
	@File: fn_recieveMessage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Recieves & displays the message...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#define CFG missionConfigFile >> "CfgContacts"
params [
	["_header", ["Personal Message", "#FFCC00"], [[]]],
	["_message", "No Message", [""]],
	["_grid", "N/A", [""]],
	["_sender", objNull, [objNull]]
];

_header params [
	["_title", "Personal Message", [""]],
	["_colour", "#FFCC00", [""]]
];

if (isNull _sender || { _message isEqualTo "" }) exitWith {};

if (_colour isEqualTo "") then { _color = "#FFCC00" };

private _senderName = _sender getVariable ["realname", name _sender];
private _senderID = getPlayerUID _sender;

if (_title isEqualTo "Staff Annoucement") then { _senderName = "The Staff Team" };

[format [
	"<t color='%1'><t size='1.5'><t align='center'>%2<br/><br/><t color='#33CC33'><t align='left'><t size='1'>To: <t color='#ffffff'>%3<br/><t color='#33CC33'>From: <t color='#ffffff'>%4<br/><t color='#33CC33'>Location: <t color='#ffffff'>%6<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%5",
	_colour,
	_title,
	"You",
	_senderName,
	_message,
	_grid
]] spawn PHX(notify);

playSound "FD_Timer_F";

PHX_myInbox pushBack [_title, _message, _grid, [_senderName, _senderID], false];

if !(_title isEqualTo "Admin Request") then {
	[player, [_senderID, format ["(%1) %2", _title, _message]], "http://daemon.phoenixrp.co.uk:3000/api/v1/message"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};