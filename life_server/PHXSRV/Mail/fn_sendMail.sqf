/*
	@File: fn_sendMail.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Send Mail...
*/

if !(_this params [
	["_from", "", [""]],
	["_to", "", [""]],
	["_type", "", [""]],
	["_content", "", [""]],
	["_quantity", 1, [0]],
	["_isAction", false, [true]]
]) exitWith {};

diag_log _this;

[format["INSERT INTO phxmail (`from`, `to`, `type`, content, quantity, isAuction) VALUES ('%1', '%2', '%3', '%4', '%5', '%6')",
	([_from] call DB_fnc_mresString),
	([_to] call DB_fnc_mresString),
	([_type] call DB_fnc_mresString),
	([_content] call DB_fnc_mresString),
	([_quantity] call DB_fnc_numberSafe),
	([_isAction, 0] call DB_fnc_bool)
], 1] call DB_fnc_asyncCall;