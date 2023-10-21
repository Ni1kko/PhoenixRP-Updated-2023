/*
	@File: fn_zoneHandle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles when we enter or leave a zone...
*/
#include "..\..\script_macros.hpp"

if (isServer || { playerSide isEqualTo independent }) exitWith {};

PHX_fnc_CaptureLoop = scriptNull;

[] spawn {
	for "_i" from 0 to 1 step 0 do {
		waitUntil {(([player] call PHX(inZone)) isEqualType 0) && { alive player } && { !(isDowned(player)) }};

		[] call PHX(enterZone);

		["You have entered the capture zone.","cyan"] spawn PHX(notify);

		waitUntil {(([player] call PHX(inZone)) isEqualType false) || { !(alive player) } || { isDowned(player) }};

		if !(isNull PHX_fnc_CaptureLoop) then { terminate PHX_fnc_CaptureLoop };
		waitUntil {!isNull PHX_fnc_CaptureLoop};
		"RscCapture" cutFadeOut 0;

		["You have left the capture zone."] spawn PHX(notify);
	};
};