/*
	@File: fn_handleChat.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles your mum...
*/
#include "\life_server\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
	["_chat", "", [""]],
	["_mode", "add", [""]]
];

if (isNull _unit || { _chat isEqualTo "" }) exitWith {};

if(_mode isEqualTo "add") then {
	(call compile (format["PHX_radio_%1", _chat])) radioChannelAdd [_unit];
} else {
	(call compile (format["PHX_radio_%1", _chat])) radioChannelRemove [_unit];
};