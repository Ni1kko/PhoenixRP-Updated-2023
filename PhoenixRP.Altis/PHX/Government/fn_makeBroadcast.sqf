/*
	@File: fn_makeBroadcast.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows the Governor to input a message to broadcast...
*/
#include "..\..\script_macros.hpp"

if !(PHX_isPM) exitWith { ["Only the Governor can make broadcasts"] spawn PHX(notify) };
if (isNil "life_broadcastTimer") then { life_broadcastTimer = time };

private _msgCooldown = (60 * 30);

if (life_broadcastTimer isEqualTo 0 || {(time - life_broadcastTimer) > _msgCooldown}) exitWith {
	[
		format["You can make your new broadcast in <t color='#FF0000'>%1</t>", 
			[(_msgCooldown - (time - life_broadcastTimer)), "MM:SS.MS"] call BIS_fnc_secondsToString
		], "black", "Broadcast Delay"
	] spawn PHX(notify);
};

createDialog "RscBroadcast";