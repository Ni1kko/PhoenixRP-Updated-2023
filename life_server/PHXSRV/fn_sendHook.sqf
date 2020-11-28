/*
	@File: fn_sendHook.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Makes Kevin's wishes come true...
*/
private "_result";
params [
	["_player", objNull, [objNull]],
	["_message", "", ["", []]],
	["_target", "https://rcon.phoenixrp.co.uk/api/v1/message",[""]]
];

if (hasInterface) exitWith {}; // ONLY SERVER...
if !(canSuspend) exitWith { _this spawn PHXSRV_fnc_sendHook };
if (_message isEqualTo "") exitWith {}; // WTF??

private _fnc_strFilter = {
	if !(params [["_msg", "", [""]]]) exitWith { "" };

	_msg = toArray _msg;

	{
		private _char = switch true do {
			case (_x isEqualTo 37): {"%25"};
			case (_x isEqualTo 38): {"%26"};
			case (_x isEqualTo 47): {"%2F"};
			case (_x isEqualTo 92): {"%5C"};
			default {_x};
		};

		_msg set [_forEachIndex, _char];
	} forEach _msg;

	(toString _msg)
};

if (_message isEqualType "") then {
	_message = [_message] call _fnc_strFilter;
} else {
	private _str = "";

	{
		_str = _str + ([_x] call _fnc_strFilter);
		
		if (_forEachIndex < ((count _message) - 1)) then {
			_str = _str + "/";	
		};
	} forEach _message;

	_message = _str;
};

private _name = "Unknown";
private _pid = "Unknown";

if !(isNull _player) then {
	_name = (_player getVariable["realname", name _player]);
	_pid = (getPlayerUID _player);
};

_message = format["%1/%2/%3/%4", _target, _pid, _name, _message];

if (isNil "PHX_isSending") then { PHX_isSending = false };
waitUntil { !PHX_isSending };
PHX_isSending = true;

waitUntil {
	if (("url_fetch" callExtension _message) isEqualTo "OK") exitWith {true};
	false
};

waitUntil {
	_result = "url_fetch" callExtension "OK";
	if (_result != "WAIT") exitWith {true};
	false
};

if (_result == "ERROR") exitWith {
	//deal with error here
	diag_log format [
		">>> [url_fetch v2.0] >>> ERROR: %1; ARGUMENTS: %2",
		"url_fetch" callExtension "ERROR",
		_this
	];
	
	PHX_isSending = false;
};

PHX_isSending = false;